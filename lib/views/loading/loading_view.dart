import 'package:flutter/material.dart';
import 'package:socket_chat/core/utils/constants.dart';
import 'package:socket_chat/views/loading/loading_view_model.dart';

class LoadingView extends StatelessWidget with LoadingViewModel {
  const LoadingView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Constants.bgGreyColor,
      body: FutureBuilder(
        future: checkLoadingState(context),
        builder: (context, snapshot) {
          return const Center(
            child: Text('Please Wait...'),
          );
        },
      ),
    );
  }
}
