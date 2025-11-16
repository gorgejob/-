import 'package:flutter/services.dart';
import 'package:audio_service/audio_service.dart';
import 'package:audio_session/audio_session.dart';
import 'package:projucts_helper/path.dart';
import 'dart:io';
import 'package:path_provider/path_provider.dart';

Future<Uri> _assetToFileUri(String assetPath) async {
  final byteData = await rootBundle.load(assetPath);
  final tempDir = await getTemporaryDirectory();
  final file = File('${tempDir.path}/${assetPath.split('/').last}');
  await file.writeAsBytes(byteData.buffer.asUint8List());
  return file.uri;
}

// كلاس للتحكم في الصوت والخلفية
class AudioPlayerHandler extends BaseAudioHandler {
  final _player = AudioPlayer();

  AudioPlayerHandler() {
    _init();
  }

  Future<void> _init() async {
    // إعداد الجلسة الصوتية
    final session = await AudioSession.instance;
    await session.configure(const AudioSessionConfiguration.music());

    // تحديث حالة التشغيل للإشعار
    _player.playbackEventStream.map(_transformEvent).pipe(playbackState);

    // لما تتغير الأغنية أو يتم تحميل ملف جديد
    _player.playerStateStream.listen((state) {
      if (state.processingState == ProcessingState.completed) {
        skipToNext();
      }
    });
  }

  // ✅ هنا نحدد المعلومات اللي هتظهر في الإشعار
  Future<void> setUrl(String path, String title) async {
    // نحمل الملف
    try {
      debugPrint("gorge Say: loading");
      await _player.setAsset(path);
      debugPrint("gorge Say: done");
    } catch (E, S) {
      debugPrint("gorge Say: ${E.runtimeType} - ${E.toString()}");
      debugPrint("STACK TRACE:\n$S");
    }

    final arturi = await _assetToFileUri("assets/gorge3.jpg");
    // نحدث بيانات الأغنية اللي هتظهر في الإشعار
    mediaItem.add(
      MediaItem(
        id: path,
        album: varibles.NameProjuct,
        title: title,
        duration: _player.duration,
        artUri: arturi,
      ),
    );
  }

  // 🧠 نحول حالة المشغل إلى حالة الإشعار
  PlaybackState _transformEvent(PlaybackEvent event) {
    return PlaybackState(
      controls: [
        MediaControl.skipToPrevious,
        _player.playing ? MediaControl.pause : MediaControl.play,
        MediaControl.skipToNext,
      ],
      androidCompactActionIndices: const [0, 1, 2],
      systemActions: const {
        MediaAction.seek,
        MediaAction.seekForward,
        MediaAction.seekBackward,
      },
      playing: _player.playing,
      processingState: {
        ProcessingState.idle: AudioProcessingState.idle,
        ProcessingState.loading: AudioProcessingState.loading,
        ProcessingState.buffering: AudioProcessingState.buffering,
        ProcessingState.ready: AudioProcessingState.ready,
        ProcessingState.completed: AudioProcessingState.completed,
      }[_player.processingState]!,
      updatePosition: _player.position,
      bufferedPosition: _player.bufferedPosition,
      speed: _player.speed,
      queueIndex: event.currentIndex,
    );
  }

  // 🎧 دوال التحكم في الصوت
  @override
  Future<void> play() => _player.play();

  @override
  Future<void> pause() => _player.pause();

  @override
  Future<void> stop() async {
    await _player.stop();
    return super.stop();
  }

  @override
  Future<void> seek(Duration position) => _player.seek(position);

  @override
  Future<void> skipToNext() async {
    // هنا ممكن تحط دالة nextSong من plyer.dart
    if (_player.position.inSeconds.toDouble() == _player.duration) {
      playere.nextSong();
    } else {
      _player.seek(_player.duration);
    }
  }

  @override
  Future<void> skipToPrevious() async {
    if (_player.position.inSeconds.toDouble() == 0) {
      playere.backSong();
    } else {
      _player.seek(Duration.zero);
    }
  }

  // 🧩 getter لتسهيل الوصول إلى المشغل
  AudioPlayer get player => _player;
  Stream<Duration> get positionStream => _player.positionStream;
  Stream<PlayerState> get playerStateStream => _player.playerStateStream;
  Duration? get duration => _player.duration;
}
