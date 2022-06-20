import 'package:flutter/material.dart';
import 'package:socket_chat/core/utils/constants.dart';
import 'package:socket_chat/shared/socket_chat_logo_title.dart';
import 'package:socket_chat/views/login/login_view.dart';
import 'package:socket_chat/views/register/register_view_model.dart';

import '../../shared/custom_button.dart';
import '../../shared/custom_text_form_field.dart';

class RegisterView extends StatelessWidget with RegisterViewModel {
  RegisterView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                  return 'Please do not leave your name blank.';
                }
                return value;
              },
              textController: nameController,
              hintText: 'Name-Surname',
              icon: const Icon(
                Icons.perm_identity_outlined,
                color: Colors.white,
              ),
              obscureText: false,
              textCapitalization: TextCapitalization.sentences,
            ),
            const SizedBox(height: 20),
            CustomTextFormField(
              onSaved: (text) {},
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please do not leave your email blank.';
                }
                return value;
              },
              textController: emailController,
              icon: const Icon(
                Icons.mail_outline,
                color: Colors.white,
              ),
              hintText: 'Email',
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
            const SizedBox(height: 20),
            CustomTextFormField(
              onSaved: (text) {},
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please do not leave your password blank.';
                }
                return value;
              },
              // textController: passwordController,
              icon: const Icon(
                Icons.lock_open,
                color: Colors.white,
              ),
              hintText: 'Password-Again',
              obscureText: true,
              textCapitalization: TextCapitalization.none,
            ),
            const SizedBox(height: 30),
            CustomElevatedButton(
              onTap: () {
                socketService.connect();
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => LoginView(),
                    ));
              },
              title: 'Create a New User',
              isHaveIcon: false,
              iconData: Icons.create,
              color: Constants.mainColor,
              titleColor: Colors.white,
              height: 40,
              width: screenWidth(context) / 2,
            ),
          ],
        ),
      ),
    );
  }
}
