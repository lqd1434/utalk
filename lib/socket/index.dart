import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:myapp/getx/getx_state.dart';
import 'package:myapp/modules/message.dart';
import 'package:myapp/utils/local_notification.dart';
import 'package:myapp/utils/save_login_data.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;
import 'package:socket_io_client/socket_io_client.dart';

Future<Function> useSocket(int userId, String userName) async {
  Logger logger = Logger();
  final GetxState getX = Get.find();
  final MyLocalNotifications localNotifications = MyLocalNotifications();

  return () {
    IO.Socket socket;
    if (getX.socket.value != null) {
      logger.i('连接已存在');
      socket = getX.socket.value;
      getX.socket.value.connect();
    } else {
      socket = IO.io('ws://47.103.211.10:8080?userId=$userId&userName=$userName',
          OptionBuilder().setTransports(['websocket']).build());
      socket.connect();
    }
    socket.on('connect', (d) {
      getX.setSocket(socket);
    });

    //获取在线用户列表
    socket.on('activeGroupUser', (data) {
      //保存到getx中
      logger.i(data);
    });

    //私聊信息
    socket.on('message', (res) {
      localNotifications.show();
      // BotToast.showSimpleNotification(title: res);
      logger.i('收到消息' + res);
    });

    //服务端通知
    socket.on('info', (res) {
      logger.i('收到服务端通知' + res);
    });

    socket.onDisconnect((data) => {logger.i('关闭连接' + data)});

    //错误处理
    socket.onError((data) {
      logger.e(data);
    });
  };
}

void sendMessage(MessageBody message) async {
  final GetxState getX = Get.find();
  final userName = await getSharedData('name');
  final userId = int.parse(await getSharedData('id'));
  final state = await getConnState();
  final conn = await useSocket(userId, userName);
  if (getX.socket.value != null) {
    final socket = getX.socket.value as Socket;
    socket.emit('message', message);
  } else {
    conn();
    sendMessage(message);
  }
}

getConnState() async {
  final userName = await getSharedData('name');
  final userId = int.parse(await getSharedData('id'));
  return {'userId': userId, 'userName': userName};
}
