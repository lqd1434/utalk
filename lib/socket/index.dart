import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:myapp/getx/getx_state.dart';
import 'package:myapp/modules/message.dart';
import 'package:myapp/utils/event_bus_event.dart';
import 'package:myapp/utils/event_manage.dart';
import 'package:myapp/utils/save_login_data.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;
import 'package:socket_io_client/socket_io_client.dart';

Future<Function> useSocket(int userId) async {
  Logger logger = Logger();
  final GetxState getX = Get.find();
  return () {
    IO.Socket socket;
    if (getX.socket.value != null) {
      logger.i('连接已存在');
      socket = getX.socket.value;
      getX.socket.value.connect();
    } else {
      var url = 'ws://47.103.211.10:8080?userId=$userId';
      socket = IO.io(url, OptionBuilder().setTransports(['websocket']).build());
      socket.connect();
    }
    socket.on('connect', (d) {
      getX.setSocket(socket);
      EventManager.getInstance().eventBus!.fire(StringEvent('connect'));
    });

    //获取在线用户列表
    socket.on('activeGroupUser', (data) {
      //保存到getx中
      getX.addOnlineUser(data);
    });

    //私聊信息
    socket.on('message', (res) {
      // localNotifications.show();
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
  if (getX.socket.value != null) {
    final socket = getX.socket.value as Socket;
    socket.emit('message', message);
  } else {
    final userId = int.parse(await getSharedData('id'));
    final conn = await useSocket(userId);
    conn();
    sendMessage(message);
  }
}
