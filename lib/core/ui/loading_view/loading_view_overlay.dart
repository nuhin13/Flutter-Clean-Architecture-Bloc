import 'package:flutter/material.dart';

import 'loading_view.dart';

class OverLayLoadingView extends StatelessWidget {

  final Widget? mainChild;
  final bool? isLoading;

  const OverLayLoadingView({
    Key? key,
    required this.mainChild,
    required this.isLoading,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        mainChild!,
        isLoading! ?
        const Opacity(
          opacity: 0.5,
          child: ModalBarrier(dismissible: false, color: Colors.black,),
        ) : Container(),
         Center(
          child: isLoading! ? const LoadingView(): Container(),
        ),
      ],
    );
  }
}