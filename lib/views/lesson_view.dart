import 'package:dog_license_application/constants/theme_constants.dart';
import 'package:dog_license_application/cubits/lessons_cubit/lessons_cubit.dart';
import 'package:dog_license_application/extensions/string_extensions.dart';
import 'package:dog_license_application/generated/l10n.dart';
import 'package:dog_license_application/models/response/lesson_response_model.dart';
import 'package:dog_license_application/widgets/quiz_component.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class LessonView extends StatefulWidget {
  static const String id = "/LessonView";
  const LessonView({super.key});

  @override
  State<LessonView> createState() => _LessonViewState();
}

class _LessonViewState extends State<LessonView> {
  late final YoutubePlayerController _controller;
  bool _isFullScreen = false;
  final EdgeInsets _defaultPadding = const EdgeInsets.symmetric(horizontal: 16.0);

  @override
  void initState() {
    super.initState();
    var lesson = Get.arguments['lesson'] as LessonResponseModel;

    _controller = YoutubePlayerController(
      initialVideoId: lesson.video.extractVideoId(),
      flags: const YoutubePlayerFlags(
        enableCaption: false,
        hideThumbnail: true,
        autoPlay: false,
        mute: false,
      ),
    );
    _controller.addListener(_handleFullScreenToggle);
  }

  void _handleFullScreenToggle() {
    if (_controller.value.isFullScreen != _isFullScreen) {
      _controller.pause();
      setState(() {
        _isFullScreen = _controller.value.isFullScreen;
      });
    }
  }

  @override
  void dispose() {
    _controller.removeListener(_handleFullScreenToggle);
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var unitId = Get.arguments['unitId'] as int;
    var lesson = Get.arguments['lesson'] as LessonResponseModel;

    return BlocBuilder<LessonsCubit, LessonsState>(
      buildWhen: (previous, current) => previous.isLoading != current.isLoading,
      builder: (context, state) {
        final isLoading = state.isLoading;

        return ModalProgressHUD(
          inAsyncCall: isLoading,
          child: Scaffold(
            appBar: _isFullScreen ? null : AppBar(title: Text(S.of(context).lesson_view__title)),
            body: SingleChildScrollView(
              child: Center(
                child: Padding(
                  padding: _isFullScreen ? EdgeInsets.zero : _defaultPadding,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      if (!_isFullScreen) const SizedBox(height: 15),
                      if (!_isFullScreen) LessonTitleComponent(lesson: lesson),
                      if (!_isFullScreen && lesson.content.isNotEmpty)
                        LessonContentComponent(lesson: lesson),
                      if (lesson.video.isNotEmpty)
                        VideoComponent(controller: _controller, isFullScreen: _isFullScreen),
                      if (!_isFullScreen) QuizComponent(unitId: unitId, lesson: lesson),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

class LessonTitleComponent extends StatelessWidget {
  const LessonTitleComponent({
    super.key,
    required this.lesson,
  });

  final LessonResponseModel lesson;

  @override
  Widget build(BuildContext context) {
    return Text(
      lesson.name,
      style: const TextStyle(
        fontSize: 24,
        color: kPrimaryColor,
        fontStyle: FontStyle.italic,
      ),
    );
  }
}

class LessonContentComponent extends StatelessWidget {
  const LessonContentComponent({
    super.key,
    required this.lesson,
  });

  final LessonResponseModel lesson;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 15.0),
      child: Column(
        children: [
          Text(lesson.content),
          const Divider(),
        ],
      ),
    );
  }
}

class VideoComponent extends StatelessWidget {
  const VideoComponent({
    super.key,
    required YoutubePlayerController controller,
    required bool isFullScreen,
  })  : _controller = controller,
        _isFullScreen = isFullScreen;

  final YoutubePlayerController _controller;
  final bool _isFullScreen;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 15.0),
      child: YoutubePlayerBuilder(
        player: YoutubePlayer(controller: _controller),
        builder: (context, player) {
          player.marginAll(0);
          var width = MediaQuery.of(context).size.width;
          var height = _isFullScreen ? width * 9 / 22 : width * 9 / 16;
          return SizedBox(
            height: height,
            width: width,
            child: player,
          );
        },
      ),
    );
  }
}
