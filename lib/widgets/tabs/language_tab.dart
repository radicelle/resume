import 'package:flutter/material.dart';

class LanguageTab extends StatelessWidget {
  const LanguageTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      var imageWidth = constraints.maxWidth / 2;
      var imageHeight = constraints.maxHeight / 1.01;
      var sizeCondition = imageWidth < imageHeight;
      var realImageSize = sizeCondition ? imageWidth : imageHeight;
      return Row(
        children: [
          Expanded(
              child: Column(
            children: [
              Expanded(child: Container()),
              const ListTile(
                title: Text('French'),
                subtitle: Text('Mother tongue'),
              ),
              Expanded(child: Container()),
              const ListTile(
                title: Text('English'),
                subtitle: Text('Fluent: 830 TOEIC'),
              ),
              Expanded(child: Container()),
            ],
          )),
          ClipRRect(
            borderRadius: BorderRadius.circular(200),
            child: Stack(
              children: [
                Container(
                  color: Colors.blue,
                  child: SizedBox(
                    width: realImageSize,
                    height: realImageSize,
                    child: Image.asset(
                      'europe_cropped.png',
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                Positioned(
                    top: realImageSize / 1.50,
                    left: realImageSize / 4,
                    child: const Icon(
                      Icons.flag_circle,
                      color: Colors.white,
                    )),
                Positioned(
                    top: realImageSize / 2,
                    left: realImageSize / 4.5,
                    child: const Icon(
                      Icons.flag_circle,
                      color: Colors.white,
                    )),
                Positioned(
                    top: realImageSize / 1.75,
                    left: realImageSize / 2.5,
                    child: const Icon(
                      Icons.flag_circle,
                      color: Colors.white,
                    )),
                Positioned(
                    bottom: realImageSize / 7,
                    left: realImageSize / 2,
                    child: const Icon(
                      Icons.flag_circle,
                      color: Colors.white,
                    ))
              ],
            ),
          ),
          Expanded(
              child: Column(
            children: [
              Expanded(child: Container()),
              const ListTile(
                title: Text(
                  'Italien',
                  textAlign: TextAlign.right,
                ),
                subtitle: Text(
                  'Fluent: 1 year and a half living in italy',
                  textAlign: TextAlign.right,
                ),
              ),
              Expanded(child: Container()),
              const ListTile(
                title: Text('German', textAlign: TextAlign.right),
                subtitle: Text(
                    'Beginner: 6 month internship + 8 years scholarship',
                    textAlign: TextAlign.right),
              ),
              Expanded(child: Container()),
            ],
          ))
        ],
      );
    });
  }
}