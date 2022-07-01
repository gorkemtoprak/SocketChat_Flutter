import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:socket_chat/core/enums/server_status_enums.dart';
import 'package:socket_chat/models/user_model.dart';
import 'package:socket_chat/views/user/user_view_model.dart';

import '../../core/utils/constants.dart';
import '../../services/auth_service.dart';
import '../../services/chat_service.dart';
import '../../services/socket_services.dart';
import '../chat/chat_view.dart';
import '../login/login_view.dart';

class UserView extends StatefulWidget {
  const UserView({Key? key}) : super(key: key);

  @override
  State<UserView> createState() => _UserViewState();
}

class _UserViewState extends State<UserView> with UserViewModel {
  final RefreshController _refreshController =
      RefreshController(initialRefresh: false);

  List<UserModel>? users;

  @override
  void initState() {
    getAllUsers();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final authService = Provider.of<AuthService>(context);
    final socketService = Provider.of<SocketService>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          authService.user.name!,
          style: const TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w600,
          ),
        ),
        elevation: 0,
        backgroundColor: Constants.bgGreyColor,
        leading: IconButton(
          onPressed: () {
            // showAlert(context, 'Are You Sure?',
            //     'Do you really want to leave the application?');
            Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => LoginView(),
                ));
            socketService.disconnect();
            AuthService.deleteToken();
          },
          icon: const Icon(
            Icons.exit_to_app_sharp,
            color: Colors.black,
          ),
        ),
        actions: [
          Container(
            margin: const EdgeInsets.only(right: 10),
            child: socketService.serverStatus == Status.online
                ? Icon(
                    Icons.check_circle,
                    color: Colors.green[400],
                  )
                : Icon(
                    Icons.wifi_off_outlined,
                    color: Colors.red[400],
                  ),
          ),
        ],
      ),
      backgroundColor: Constants.bgGreyColor,
      body: SmartRefresher(
        controller: _refreshController,
        enablePullDown: true,
        onRefresh: getAllUsers,
        header: WaterDropHeader(
          complete: const Icon(
            Icons.check,
            color: Colors.transparent,
          ),
          waterDropColor: Colors.blue.shade400,
        ),
        child: ListView.separated(
          physics: const BouncingScrollPhysics(),
          shrinkWrap: true,
          separatorBuilder: (context, index) => const Divider(),
          itemCount: users!.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(
                users![index].name ?? '',
                style: const TextStyle(
                  fontWeight: FontWeight.w600,
                ),
              ),
              subtitle: Text(
                users![index].email ?? '',
                style: const TextStyle(
                  color: Constants.greyishBrown,
                ),
              ),
              leading: CircleAvatar(
                backgroundColor: Colors.blue[100],
                child: Text(
                  users![index].name!.substring(0, 2).toUpperCase(),
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              trailing: Container(
                width: 10,
                height: 10,
                decoration: BoxDecoration(
                  color: Colors.green[300],
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
              onTap: () {
                final chatService =
                    Provider.of<ChatService>(context, listen: false);
                chatService.user = users![index];
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ChatView(),
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }

  getAllUsers() async {
    users = await getUsers();
    setState(() {});
    _refreshController.refreshCompleted();
  }
}
