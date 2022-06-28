// ignore_for_file: use_build_context_synchronously

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:socket_chat/views/login/login_view_model.dart';
import 'package:socket_chat/views/register/register_view.dart';

import '../../core/utils/constants.dart';
import '../../services/auth_service.dart';
import '../../services/socket_services.dart';
import '../../shared/custom_alert_message.dart';
import '../../shared/custom_button.dart';
import '../../shared/custom_text_form_field.dart';
import '../../shared/socket_chat_logo_title.dart';
import '../chat/chat_view.dart';

class LoginView extends StatelessWidget with LoginViewModel {
  LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final authService = Provider.of<AuthService>(context);
    final socketService = Provider.of<SocketService>(context);
    return Scaffold(
      backgroundColor: Constants.bgGreyColor,
      body: Padding(
        padding: customPadding(),
        child: Column(
          children: [
            const LogoTitle(
              title: 'SocketChat',
            ),
            const SizedBox(height: 40),
            CustomTextFormField(
              onSaved: (text) {},
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please do not leave your email blank.';
                }
                return value;
              },
              textController: emailController,
              hintText: 'Email',
              icon: const Icon(
                Icons.perm_identity_outlined,
                color: Colors.white,
              ),
              obscureText: false,
              textCapitalization: TextCapitalization.none,
            ),
            const SizedBox(height: 20),
            CustomTextFormField(
              onSaved: (text) {},
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please do not leave your password blank.';
                }
                return value;
              },
              textController: passwordController,
              icon: const Icon(
                Icons.lock_open,
                color: Colors.white,
              ),
              hintText: 'Password',
              obscureText: true,
              textCapitalization: TextCapitalization.none,
            ),
            const SizedBox(height: 30),
            CustomElevatedButton(
              onTap: () async {
                final res = await authService.login(
                  emailController.text,
                  passwordController.text,
                );
                if (res) {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const ChatView(),
                      ));
                  // AutoRouter.of(context).replaceNamed('/chat');
                  socketService.connect();
                } else {
                  showAlert(context, 'Error', 'Incorrect Email or Password');
                }
              },
              title: 'Login',
              isHaveIcon: false,
              iconData: Icons.create,
              color: Constants.mainColor,
              titleColor: Colors.white,
              height: 40,
              width: screenWidth(context) / 3.5,
            ),
            const SizedBox(
              height: 30,
            ),
            InkWell(
              onTap: () {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => RegisterView(),
                    ));
              },
              child: const Text(
                'Create a new account',
                style: TextStyle(
                  fontSize: 16,
                  color: Constants.softBlue,
                  height: 1.5,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
