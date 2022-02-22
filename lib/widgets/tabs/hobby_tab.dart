import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HobbyTab extends StatelessWidget {
  const HobbyTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      var imageWidth = constraints.maxWidth / 4;
      var imageHeight = constraints.maxHeight / 4;
      return Stack(
        children: [
          Positioned(
            child: Padding(
              padding: EdgeInsets.only(top: imageHeight / 40),
              child: Image.asset(
                'assets/girl.png',
                width: imageWidth,
                height: imageHeight,
              ),
            ),
            top: 0,
            left: 0,
          ),
          Positioned(
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(top: imageHeight / 40),
                  child: Image.asset(
                    'assets/haies2.jpg',
                    width: imageWidth * 2,
                    height: imageHeight,
                  ),
                ),
                Row(
                  children: const [
                    Text('Photography '),
                    Icon(Icons.photo_camera)
                  ],
                ),
                Padding(
                  padding: EdgeInsets.only(top: imageHeight / 40),
                  child: Row(
                    children: const [
                      Text('Ghibli/Japan animation '),
                      Icon(Icons.local_movies)
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: imageHeight / 40),
                  child: Row(
                    children: const [
                      Text('Video games '),
                      Icon(Icons.videogame_asset_rounded)
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: imageHeight / 40),
                  child: Row(
                    children: const [
                      Text('Crafts/DIY '),
                      Icon(FontAwesomeIcons.toolbox)
                    ],
                  ),
                )
              ],
            ),
            top: 0,
            right: 0,
          ),
          Positioned(
            child: Padding(
              padding: EdgeInsets.only(bottom: imageHeight / 40),
              child: Image.asset(
                'assets/cat.png',
                width: imageWidth,
                height: imageHeight,
              ),
            ),
            right: 0,
            bottom: 0,
          ),
          Positioned(
            child: Column(
              children: [
                Image.asset(
                  'assets/semis.jpg',
                  width: imageWidth * 2,
                  height: imageHeight * 0.75,
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: imageHeight / 40),
                  child: const Text('Grow organic food'),
                )
              ],
            ),
            left: 0,
            bottom: 0,
          ),
          Positioned(
            child: Align(
              alignment: Alignment.center,
              child: SizedBox(
                width: constraints.maxWidth,
                height: constraints.maxHeight / 2,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      children: [
                        Image.asset(
                          'assets/velo.png',
                          width: imageWidth * 2,
                          height: imageHeight,
                        ),
                        Row(
                          children: const [
                            Icon(Icons.directions_bike_outlined),
                            Icon(FontAwesomeIcons.trophy)
                          ],
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: imageHeight / 20),
                          child: Row(
                            children: const [
                              Text('Apnea/Fin swim '),
                              Icon(Icons.bubble_chart_outlined)
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: imageHeight / 20),
                          child: Row(
                            children: const [
                              Text('Running '),
                              Icon(Icons.directions_run)
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: imageHeight / 20),
                          child: Row(
                            children: const [
                              Text('Hiking '),
                              Icon(Icons.directions_walk)
                            ],
                          ),
                        )
                      ],
                    ),
                    Column(
                      children: [
                        Expanded(child: Container()),
                        Image.asset(
                          'assets/science.gif',
                          width: imageWidth * 2,
                          height: imageHeight * 0.75,
                        ),
                        const Text(
                          "Zetetic included",
                          textAlign: TextAlign.center,
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      );
    });
  }
}
