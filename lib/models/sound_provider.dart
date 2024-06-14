import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:polyphasic_sleep_new/models/sound_model.dart';

class SoundProvider extends ChangeNotifier {
  final List<Sound> _songlist = [
    Sound(
        artistName: "Echo Vibes",
        songName: "Whispers in the Rain",
        albumArtImagePath: "assets/sounds/images/image1.jpg",
        audioPath: "sounds/music/sound1.mp3"),
    Sound(
        artistName: "Starlit Sirens",
        songName: "Galactic Serenade",
        albumArtImagePath: "assets/sounds/images/image2.jpg",
        audioPath: "sounds/music/sound2.mp3"),
    Sound(
        artistName: "Neon Mirage",
        songName: "Electric Dreams",
        albumArtImagePath: "assets/sounds/images/image3.jpg",
        audioPath: "sounds/music/sound3.mp3"),
    Sound(
        artistName: "Velvet Horizon",
        songName: "Sunset Reverie",
        albumArtImagePath: "assets/sounds/images/image4.jpg",
        audioPath: "sounds/music/sound4.mp3"),
    Sound(
        artistName: "Crimson Moon",
        songName: "Midnight Symphony",
        albumArtImagePath: "assets/sounds/images/image5.jpg",
        audioPath: "sounds/music/sound5.mp3"),
    Sound(
        artistName: "Aurora Blaze",
        songName: "Frozen Fire",
        albumArtImagePath: "assets/sounds/images/image6.jpg",
        audioPath: "sounds/music/sound6.mp3"),
    Sound(
        artistName: "Jade Cascade",
        songName: "Emerald Waters",
        albumArtImagePath: "assets/sounds/images/image7.jpg",
        audioPath: "sounds/music/sound7.mp3"),
    Sound(
        artistName: "Silver Lining",
        songName: "Cloudburst Melody",
        albumArtImagePath: "assets/sounds/images/image8.jpg",
        audioPath: "sounds/music/sound8.mp3"),
    Sound(
        artistName: "Mystic Echo",
        songName: "Enchanted Shadows",
        albumArtImagePath: "assets/sounds/images/image9.jpg",
        audioPath: "sounds/music/sound9.mp3"),
    Sound(
        artistName: "Radiant Pulse",
        songName: "Heartbeat of the Universe",
        albumArtImagePath: "assets/sounds/images/image10.jpg",
        audioPath: "sounds/music/sound10.mp3"),
    Sound(
        artistName: "Golden Eclipse",
        songName: "Solar Flare",
        albumArtImagePath: "assets/sounds/images/image11.jpg",
        audioPath: "sounds/music/sound11.mp3"),
    Sound(
        artistName: "Celestial Drift",
        songName: "Stellar Winds",
        albumArtImagePath: "assets/sounds/images/image12.jpg",
        audioPath: "sounds/music/sound12.mp3"),
    Sound(
        artistName: "Phantom Chords",
        songName: "Haunted Harmony",
        albumArtImagePath: "assets/sounds/images/image13.jpg",
        audioPath: "sounds/music/sound13.mp3"),
    Sound(
        artistName: "Dreamcatcher",
        songName: "Lucid Voyage",
        albumArtImagePath: "assets/sounds/images/image14.jpg",
        audioPath: "sounds/music/sound14.mp3")
  ];

  int? _currentSoundIndex;

  // SOUND PLAYER
  //  audio player
  final AudioPlayer _audioPlayer = AudioPlayer();
  //  durations
  Duration _currentDuration = Duration.zero;
  Duration _totalDuration = Duration.zero;

  // constructor
  SoundProvider() {
    listenToDuration();
  }

  // initially not playing
  bool _isPlaying = false;

  // play song
  void play() async {
    final String path = _songlist[_currentSoundIndex!].audioPath;
    await _audioPlayer.stop();
    await _audioPlayer.play(AssetSource(path));
    // print(path);
    _isPlaying = true;
    notifyListeners();
  }

  // pause song
  void pause() async {
    await _audioPlayer.pause();
    _isPlaying = false;
    notifyListeners();
  }

  // resume

  void resume() async {
    await _audioPlayer.resume();
    _isPlaying = true;
    notifyListeners();
  }

  // pause or resume
  void pauseOrResume() async {
    if (_isPlaying) {
      pause();
    } else {
      resume();
    }
    notifyListeners();
  }

  // seek
  void seek(Duration position) async {
    await _audioPlayer.seek(position);
  }

  // play next

  void playNextSong() {
    if (_currentSoundIndex != null) {
      if (_currentSoundIndex! < _songlist.length - 1) {
        currentSoundIndex = _currentSoundIndex! + 1;
      } else {
        currentSoundIndex = 0;
      }
    }
  }

  // play prev
  void playPreviousSong() async {
    if (_currentDuration.inSeconds > 2) {
      seek(Duration.zero);
    } else {
      if (_currentSoundIndex! > 0) {
        currentSoundIndex = _currentSoundIndex! - 1;
      } else {
        currentSoundIndex = _songlist.length - 1;
      }
    }
  }

  // listen to duration
  void listenToDuration() {
    _audioPlayer.onDurationChanged.listen((newDuration) {
      _totalDuration = newDuration;
      notifyListeners();
    });
    _audioPlayer.onPositionChanged.listen((newPosition) {
      _currentDuration = newPosition;
      notifyListeners();
    });
    _audioPlayer.onPlayerComplete.listen((event) {
      playNextSong();
      // _totalDuration = newDuration;
      // notifyListeners();
    });
  }

  // dispose

  List<Sound> get songlist => _songlist;
  int? get currentSoundIndex => _currentSoundIndex;
  bool get isPlaying => _isPlaying;
  Duration get currentDuration => _currentDuration;
  Duration get totalduration => _totalDuration;

  set currentSoundIndex(int? newIndex) {
    _currentSoundIndex = newIndex;

    if (newIndex != null) {
      play();
    }
    notifyListeners();
  }
}
