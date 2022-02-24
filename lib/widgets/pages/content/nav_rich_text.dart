import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '/globals.dart' as globals;
import '../../../providers/dot_navigation_notifier.dart';

class NavRichText extends StatefulWidget {
  const NavRichText({
    Key? key,
    this.indexTop,
    this.indexBottom,
    required this.images,
    required this.text,
  })  : assert(indexTop != null || indexBottom != null),
        super(key: key);

  final int? indexTop;
  final int? indexBottom;
  final String text;
  final List<Widget> images;

  @override
  State<NavRichText> createState() => _NavRichTextState();
}

class _NavRichTextState extends State<NavRichText> {
  @override
  Widget build(BuildContext context) {
    final navNotifier = Provider.of<DotNavigationNotifier>(context);
    return LayoutBuilder(builder: (context, constraints) {
      var buttonsStart = constraints.maxWidth / 10;
      double buttonSize = buttonsStart;
      var imagesStartTop = constraints.maxHeight / 9;
      var imagesStartLeft = buttonsStart + buttonSize + 10;
      var imagesHeight = constraints.maxHeight / 4;
      var imagesWidth = constraints.maxWidth - imagesStartLeft * 2;
      return Stack(
        children: [
          if (widget.indexBottom != null)
            Positioned(
              top: constraints.maxHeight / 2,
              left: buttonsStart,
              child: FloatingActionButton(
                  backgroundColor: globals.headerColor,
                  onPressed: () =>
                      changeEducationPage(navNotifier, widget.indexBottom!),
                  child: const Icon(
                    Icons.keyboard_arrow_left,
                  )),
            ),
          Positioned(
            top: imagesStartTop,
            left: imagesStartLeft,
            child: SizedBox(
              width: imagesWidth,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ...widget.images.map((w) {
                    double imagePadding = 20 / widget.images.length;
                    return Padding(
                      padding: EdgeInsetsDirectional.all(imagePadding),
                      child: SizedBox(
                          width: (imagesWidth / widget.images.length) -
                              imagePadding * 2 * widget.images.length,
                          height: imagesHeight,
                          child: w),
                    );
                  })
                ],
              ),
            ),
          ),
          Positioned(
            top: imagesStartTop + imagesHeight + imagesStartTop,
            left: imagesStartLeft,
            child: SizedBox(
              width: imagesWidth,
              child: Text(
                widget.text,
                textAlign: TextAlign.center,
                style: globals.bodyTextStyle(context),
              ),
            ),
          ),
          if (widget.indexTop != null)
            Positioned(
              top: constraints.maxHeight / 2,
              right: buttonsStart,
              child: FloatingActionButton(
                  backgroundColor: globals.headerColor,
                  onPressed: () =>
                      changeEducationPage(navNotifier, widget.indexTop!),
                  child: const Icon(Icons.keyboard_arrow_right)),
            ),
        ],
      );
    });
  }

  void changeEducationPage(DotNavigationNotifier navNotifier, int index) {
    navNotifier.index = index;
  }
}
