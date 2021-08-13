import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myapp/components/block_btn.dart';
import 'package:myapp/components/cell.dart';
import 'package:myapp/getx/getx_state.dart';
import 'package:myapp/utils/hex_color.dart';
import 'package:myapp/utils/save_login_data.dart';
import 'package:socket_io_client/socket_io_client.dart';

import 'change_account.dart';

class Setting extends StatefulWidget {
  const Setting({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => SettingStatePage();
}

class SettingStatePage extends State<Setting> {
  final GetxState getX = Get.find();

  _logout() {
    final Socket socket = getX.socket.value;
    socket.dispose();
    getX.clearSocket();
    removeAllSharedData();
    Get.toNamed('/auth');
  }

  Future<String> showChangeAccount(BuildContext context) async {
    String? name = await showDialog<String>(
        context: context,
        builder: (BuildContext context) {
          return SimpleDialog(
              title: const Text("账号:"),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20))
              children: const[AccountRow()]);
        }
    );
    print(name);
    return name ?? '';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () {
            Get.offNamed('/home');
          },
          child: const Icon(Icons.arrow_back_ios),
        ),
        title: const Text('设置中心'),
        centerTitle: true,
      ),
      body: ListView(padding: EdgeInsets.zero, children: [
        const SizedBox(
          height: 10,
        ),
        const Padding(
          padding: EdgeInsets.only(left: 20),
          child: Text('账号', style: TextStyle(fontSize: 17)),
        ),
        const Divider(),
        ListTile(
          title: Cell(
              onTap: () {
                showChangeAccount(context);
              },
              title: const Text(
                '切换账号',
                style: TextStyle(fontSize: 22),
              ),
              icon: Icon(Icons.account_circle, color: HexColor('#6778D1'))),
        ),
        ListTile(
          title: Cell(
              title: const Text(
                '绑定手机',
                style: TextStyle(fontSize: 22),
              ),
              icon: Icon(Icons.phone_iphone, color: HexColor('#00E3E4'))),
        ),
        ListTile(
          title: Cell(
              title: const Text(
                '账号安全',
                style: TextStyle(fontSize: 22),
              ),
              icon: Icon(Icons.lock, color: HexColor('#F73C3C'))),
        ),
        const SizedBox(
          height: 10,
        ),
        const Padding(
          padding: EdgeInsets.only(left: 20),
          child: Text('系统', style: TextStyle(fontSize: 17)),
        ),
        const Divider(),
        ListTile(
          title: Cell(
              title: const Text(
                '声音设置',
                style: TextStyle(fontSize: 22),
              ),
              icon: Icon(Icons.volume_up, color: HexColor('#B36DF9'))),
        ),
        ListTile(
          title: Cell(
              title: const Text(
                '隐私设置',
                style: TextStyle(fontSize: 22),
              ),
              icon: Icon(Icons.admin_panel_settings, color: HexColor('#F88584'))),
        ),
        ListTile(
          title: Cell(
              title: const Text(
                '用户协议',
                style: TextStyle(fontSize: 22),
              ),
              icon: Icon(Icons.receipt_long, color: HexColor('#3296FA'))),
        ),
        ListTile(
          title: Cell(
              title: const Text(
                '关于我们',
                style: TextStyle(fontSize: 22),
              ),
              icon: Icon(Icons.favorite, color: HexColor('#FC95FC'))),
        ),
        ListTile(
          title: Cell(
              title: const Text(
                '清除缓存',
                style: TextStyle(fontSize: 22),
              ),
              icon: Icon(Icons.autorenew, color: HexColor('#999999'))),
        ),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
          child: BlockButton(
            text: const Text("退出登录", style: TextStyle(color: Colors.white, fontSize: 25)),
            gradient: const LinearGradient(colors: [
              Colors.black,
              Colors.black,
            ]),
            handlePress: _logout,
          ),
        ),
      ]),
    );
  }
}
