import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myapp/components/block_btn.dart';
import 'package:myapp/components/cell.dart';
import 'package:myapp/getx/getx_state.dart';
import 'package:myapp/utils/save_login_data.dart';
import 'package:socket_io_client/socket_io_client.dart';

class Setting extends StatefulWidget {
  const Setting({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => SettingStatePage();
}

class SettingStatePage extends State<Setting> {
  final GetxState getX = Get.find();
  _logout(){
    final Socket socket = getX.socket.value;
    socket.dispose();
    getX.clearSocket();
    removeAllSharedData();
    Get.toNamed('/auth');
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading:GestureDetector(
          onTap: (){Get.offNamed('/home');},
          child:  const Icon(Icons.arrow_back_ios),
        ),
        title: const Text('设置中心'),
        centerTitle: true,
      ),
      body: ListView(
        children:[
          const SizedBox(height: 10,),
           const Padding(padding: EdgeInsets.only(left: 10),
             child: Text('账号',style: TextStyle(fontSize: 17)),
           ),
           const Divider(),
           const ListTile(
            title: Cell(
              title: Text('切换账号',style: TextStyle(fontSize: 22),),
                icon: Icon(Icons.account_circle,size: 26,)),
            ),
          const ListTile(
            title: Cell(
                title: Text('绑定手机',style: TextStyle(fontSize: 22),),
                icon: Icon(Icons.call,size: 26,)),
          ),
          const ListTile(
            title: Cell(
                title: Text('账号安全',style: TextStyle(fontSize: 22),),
                icon: Icon(Icons.security,size: 26,)),
          ),
          const SizedBox(height: 10,),
          const Padding(padding:  EdgeInsets.only(left: 10),
            child: Text('系统',style: TextStyle(fontSize: 17)),
          ),
          const Divider(),
          const ListTile(
            title: Cell(
                title: Text('声音设置',style: TextStyle(fontSize: 22),),
                icon: Icon(Icons.volume_up,size: 26,)),
          ),
          const ListTile(
            title: Cell(
                title: Text('隐私设置',style: TextStyle(fontSize: 22),),
                icon: Icon(Icons.beenhere,size: 26,)),
          ),
          const ListTile(
            title: Cell(
                title: Text('用户协议',style: TextStyle(fontSize: 22),),
                icon: Icon(Icons.article,size: 26,)),
          ),
          const ListTile(
            title: Cell(
                title: Text('关于我们',style: TextStyle(fontSize: 22),),
                icon: Icon(Icons.person,size: 26,)),
          ),
          const ListTile(
            title: Cell(
                title: Text('清除缓存',style: TextStyle(fontSize: 22),),
                icon: Icon(Icons.delete,size: 26,)),
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 20,vertical: 30),
            child: BlockButton(
              text: const Text("退出登录", style: TextStyle(color: Colors.white, fontSize: 25)),
              gradient: const LinearGradient(colors: [
                Colors.black,
                Colors.black,
              ]),
              handlePress: _logout,
            ),
          ),
        ]
      ),
    );
  }
}
