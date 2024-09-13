import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class YoutubeScreen extends StatefulWidget {
  final String videoId;
  const YoutubeScreen({super.key, required this.videoId});

  @override
  State<YoutubeScreen> createState() => _YoutubeScreenState();
}

class _YoutubeScreenState extends State<YoutubeScreen> {
  late YoutubePlayerController controller;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    // SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);
    controller = YoutubePlayerController(initialVideoId: widget.videoId);
    controller.toggleFullScreenMode();
    controller.play();
    controller.addListener(() {
      if (!controller.value.isFullScreen) {
        SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
            overlays: [SystemUiOverlay.bottom, SystemUiOverlay.top]);
      } else {
        SystemChrome.setEnabledSystemUIMode(
          SystemUiMode.immersive,
          // overlays: [SystemUiOverlay.bottom, SystemUiOverlay.top]
        );
      }
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    controller.toggleFullScreenMode();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: [SystemUiOverlay.bottom, SystemUiOverlay.top]);
    // controller.pause();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Center(
          child: YoutubePlayer(
            aspectRatio: MediaQuery.of(context).size.height /
                MediaQuery.of(context).size.width,
            controller: controller,
            showVideoProgressIndicator: true,
            onReady: () {
              // SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
              //     overlays: []);
              controller.play();
              // controller.toggleFullScreenMode();
            },
            bottomActions: [
              Expanded(child: Container()),
              InkWell(
                onTap: () async {
                  // SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
                  //     overlays: [
                  //       SystemUiOverlay.bottom,
                  //       SystemUiOverlay.top
                  //     ]);
                  // controller.pause();
                  // controller.toggleFullScreenMode();
                  Navigator.pop(context);
                },
                child: const Icon(
                  Icons.fullscreen_exit,
                  color: Color(0xfff56b56),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
