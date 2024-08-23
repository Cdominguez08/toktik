import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:toktik/config/helpers/human_formats.dart';
import 'package:toktik/domain/entities/video_post.dart';

class VideoButtons extends StatelessWidget {
  final VideoPost videoPost;
  const VideoButtons({super.key, required this.videoPost});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _CustomButton(
          iconData: Icons.favorite,
          color: Colors.red,
          value: videoPost.likes,
        ),
        const SizedBox(
          height: 16.0,
        ),
        _CustomButton(
          iconData: Icons.remove_red_eye_rounded,
          value: videoPost.views,
        ),
        const SizedBox(
          height: 16.0,
        ),
        SpinPerfect(
            infinite: true,
            duration: const Duration(seconds: 5),
            child: const _CustomButton(
                value: 0, iconData: Icons.play_circle_outline))
      ],
    );
  }
}

class _CustomButton extends StatelessWidget {
  final int value;
  final IconData iconData;
  final Color? color;

  const _CustomButton({required this.value, required this.iconData, color})
      : color = color ?? Colors.white;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        IconButton(
          onPressed: () {},
          icon: Icon(
            iconData,
            size: 32,
          ),
          color: color,
        ),
        if (value > 0) Text(HumanFormats.humanReadableNumber(value.toDouble()))
      ],
    );
  }
}
