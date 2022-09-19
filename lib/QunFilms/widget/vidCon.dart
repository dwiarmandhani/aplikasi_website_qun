import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:video_player/video_player.dart';

late VideoPlayerController _controller;
late String _videoUrl;

class VidCon extends StatefulWidget {
  const VidCon({Key? key, required this.videoUrl}) : super(key: key);

  final String videoUrl;

  @override
  State<VidCon> createState() => _VidConState();
}

class _VidConState extends State<VidCon> {
  void initState() {
    super.initState();
    _controller = VideoPlayerController.network(widget.videoUrl)
      ..initialize().then((_) {
        // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
        setState(() {});
      });
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
