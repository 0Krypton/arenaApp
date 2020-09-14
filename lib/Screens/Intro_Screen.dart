import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class IntroScreen extends StatefulWidget {
  static const id = 'Intro_Screen';

  @override
  _IntroScreenState createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  static bool isPlay = false;

  List<SliderContainer> pages = [
    SliderContainer(
      data: SliderData(
        isPlay: isPlay,
        color: Color(0xFFff7070),
        arenaColor: Colors.white,
        animationAsset: 'assets/play_controller.flr',
        animation: "play",
        isShowSkip: false,
        topSubTitle: 'Play Game',
        mediumSubTitle: 'To Earn Money',
        bellowSubTitle: 'And Enjoy Your Time',
      ),
    ),
    SliderContainer(
      data: SliderData(
        isPlay: isPlay,
        color: Colors.white,
        arenaColor: Colors.black,
        animationAsset: 'assets/flare_best.flr',
        animation: "go",
        isShowSkip: false,
        topSubTitle: 'Select It',
        mediumSubTitle: 'Get It',
        bellowSubTitle: 'Secure',
      ),
    ),
    SliderContainer(
      data: SliderData(
        isPlay: isPlay,
        color: Color(0xFFda5b4f),
        arenaColor: Colors.white,
        animationAsset: 'assets/create_tournument.flr',
        animation: "lunch",
        isShowSkip: true,
        topSubTitle: 'Create',
        mediumSubTitle: 'Your Own',
        bellowSubTitle: 'Lobby',
      ),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container()
        // LiquidSwipe(
        //   initialPage: 0,
        //   pages: pages,
        //   enableLoop: false,
        //   waveType: WaveType.liquidReveal,
        //   positionSlideIcon: 0.5,
        //   fullTransitionValue: 400,
        // ),
      ),
    );
  }
}

class SliderData {
  SliderData(
      {this.animation,
      this.color,
      this.isPlay,
      this.isShowSkip,
      this.animationAsset,
      this.arenaColor,
      this.bellowSubTitle,
      this.mediumSubTitle,
      this.topSubTitle});

  bool isPlay;
  final Color color;
  final Color arenaColor;
  final String animationAsset;
  final String animation;
  final bool isShowSkip;
  final String topSubTitle;
  final String mediumSubTitle;
  final String bellowSubTitle;

  void pageChange() {
    isPlay = !isPlay;
  }
}

class SliderContainer extends StatelessWidget {
  const SliderContainer({Key key, this.data}) : super(key: key);

  final SliderData data;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      color: data.color,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Expanded(
            flex: 1,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    'Arena',
                    style: GoogleFonts.playfairDisplay(
                      fontSize: 22.0,
                      fontWeight: FontWeight.bold,
                      color: data.arenaColor,
                    ),
                  ),
                  data.isShowSkip
                      ? InkWell(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Text(
                            'Skip',
                            style: GoogleFonts.playfairDisplay(
                              fontSize: 22.0,
                              fontWeight: FontWeight.bold,
                              color: data.arenaColor,
                            ),
                          ),
                        )
                      : Container(),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 7,
            child: Container(
              height: 400,
              width: 400,
              child: FlareActor(
                data.animationAsset,
                animation: data.animation,
                isPaused: data.isPlay,
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    data.topSubTitle,
                    style: GoogleFonts.playfairDisplay(
                        fontSize: 25.0,
                        color: data.arenaColor,
                        fontWeight: FontWeight.w900),
                  ),
                  Text(
                    data.mediumSubTitle,
                    style: GoogleFonts.playfairDisplay(
                        fontSize: 15.0,
                        color: data.arenaColor,
                        fontWeight: FontWeight.w900),
                  ),
                  Text(
                    data.bellowSubTitle,
                    style: GoogleFonts.playfairDisplay(
                        fontSize: 20.0,
                        color: data.arenaColor,
                        fontWeight: FontWeight.w900),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
