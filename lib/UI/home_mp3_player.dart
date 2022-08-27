import 'dart:math';
import 'dart:ui';
import 'package:flame/game.dart';
import 'package:flame/components.dart';
import 'package:flame/effects.dart';
import 'package:flame_mp3/Components/magic_flame.dart';
import 'package:flame_mp3/UI/home_mp3_player.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart' hide Gradient;
import 'package:flame/layers.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int pageNumber = 0;

  @override
  Widget build(BuildContext context) {
    print('pageNumber: $pageNumber');
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          SizedBox(
            height: double.infinity,
            width: MediaQuery.of(context).size.width,
            child: Transform.translate(
              offset: Offset(0, -200),
              child: GameWidget(
                game: MagicFlame(pageNumber),
              ),
            ),
          ),
          Container(
            color: Colors.transparent,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: PageView.builder(
                    onPageChanged: (page) {
                      setState(() {
                        pageNumber = page;
                      });
                      debugPrint('page: $page');
                    },
                    itemBuilder: ((context, index) {
                      return Container(
                        child: Center(
                          child: Container(
                            width: MediaQuery.of(context).size.width / 1.5,
                            height: 200,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Image.asset(
                              'assets/song_image.jpg',
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                      );
                    }),
                  ),
                ),
                Expanded(
                  child: Container(
                    padding: EdgeInsets.fromLTRB(30, 30, 30, 30),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Song Name',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 25,
                          ),
                        ),
                        SizedBox(height: 20),
                        Text(
                          'Song Album',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                            fontSize: 20,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 28.0),
                          child: SliderTheme(
                            data: SliderThemeData.fromPrimaryColors(
                              primaryColor: Colors.white,
                              primaryColorDark: Colors.white,
                              primaryColorLight: Colors.white,
                              valueIndicatorTextStyle: TextStyle(),
                            ),
                            child: Slider(
                              min: 0.0,
                              max: 1.toDouble() + 1.0,
                              value: 0,
                              onChanged: (value) {},
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              IconButton(
                                onPressed: () {},
                                icon: Icon(
                                  Icons.fast_rewind,
                                  color: Colors.white,
                                  size: 50,
                                ),
                              ),
                              IconButton(
                                onPressed: () {},
                                icon: Icon(
                                  Icons.play_circle_filled_outlined,
                                  color: Colors.white,
                                  size: 50,
                                ),
                              ),
                              IconButton(
                                onPressed: () {},
                                icon: Icon(
                                  Icons.fast_forward_sharp,
                                  color: Colors.white,
                                  size: 50,
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
