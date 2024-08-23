import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:toktik/domain/entities/video_post.dart';
import 'package:toktik/presentation/widgets/shared/video_buttons.dart';
import 'package:toktik/presentation/widgets/video/fullscreen_player.dart';

class VideoScrollableView extends StatelessWidget {
  final List<VideoPost> videos;
  const VideoScrollableView({super.key, required this.videos});

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.vertical,
        itemCount: videos.length,
        itemBuilder: (context, index) {
          final videoPost = videos[index];

          return Stack(
            children: [
              SizedBox.expand(
                child: FullscreenPlayer(
                  videoUrl: videoPost.videoUrl,
                  caption: videoPost.caption,
                ),
              ),
              Positioned(
                  bottom: 40,
                  right: 20,
                  child: VideoButtons(videoPost: videoPost))
            ],
          );
        });
  }
}
