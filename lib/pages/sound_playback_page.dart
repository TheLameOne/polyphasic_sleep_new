import 'package:flutter/material.dart';
import 'package:polyphasic_sleep_new/components/neu_box.dart';
import 'package:polyphasic_sleep_new/models/sound_provider.dart';
import 'package:provider/provider.dart';

class SoundPlaybackPage extends StatelessWidget {
  const SoundPlaybackPage({super.key});

  String formatTime(Duration duration) {
    String twoDigitSeconds =
        duration.inSeconds.remainder(60).toString().padLeft(2, '0');
    String formattedTime = "${duration.inMinutes}:$twoDigitSeconds";

    return formattedTime;
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<SoundProvider>(builder: (context, value, child) {
      //get playlist
      final songlist = value.songlist;
      //get current sound index
      final currentSound = songlist[value.currentSoundIndex ?? 0];

      // UI
      return Scaffold(
        appBar: AppBar(
            title: Center(
          child: Padding(
            padding: const EdgeInsets.only(right: 40.0),
            child: Text("S O U N D S",
                style: TextStyle(
                    color: Theme.of(context).colorScheme.inverseSurface,
                    fontSize: 20)),
          ),
        )),
        backgroundColor: Theme.of(context).colorScheme.surface,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(left: 25, right: 25, bottom: 25),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // app bar

                // album artwork
                NeuBox(
                    child: Column(
                  children: [
                    // image
                    ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.asset(currentSound.albumArtImagePath),
                    ),
                    // song and artist name
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                currentSound.songName,
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 20),
                              ),
                              Text(currentSound.artistName),
                            ],
                          )
                        ],
                      ),
                    )
                    // heart icon
                  ],
                )),
                const SizedBox(height: 25),
                // song duration progress
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          // start time
                          Text(formatTime(value.currentDuration)),
                          // shuffle icon
                          const Icon(Icons.shuffle),
                          // repeat icon
                          const Icon(Icons.repeat),
                          // end time
                          Text(formatTime(value.totalduration)),
                        ],
                      ),
                    ),
                    SliderTheme(
                      data: SliderTheme.of(context).copyWith(
                        thumbShape: const RoundSliderThumbShape(
                          enabledThumbRadius: 0,
                        ),
                        inactiveTrackColor: Colors.grey.shade400,
                      ),
                      child: Slider(
                        min: 0,
                        max: value.totalduration.inSeconds.toDouble(),
                        value: value.currentDuration.inSeconds.toDouble(),
                        activeColor: Colors.green,
                        onChanged: (double double) {},
                        onChangeEnd: (double double) {
                          value.seek(Duration(seconds: double.toInt()));
                        },
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 25),
                // playback controls
                Row(
                  children: [
                    // skip previous
                    Expanded(
                      child: GestureDetector(
                        onTap: value.playPreviousSong,
                        child: NeuBox(
                          child: Icon(Icons.skip_previous),
                        ),
                      ),
                    ),
                    const SizedBox(width: 25),
                    // play pause
                    Expanded(
                      flex: 2,
                      child: GestureDetector(
                        onTap: value.pauseOrResume,
                        child: NeuBox(
                          child: Icon(
                              value.isPlaying ? Icons.pause : Icons.play_arrow),
                        ),
                      ),
                    ),
                    const SizedBox(width: 25),
                    // skip forward
                    Expanded(
                      child: GestureDetector(
                        onTap: value.playNextSong,
                        child: NeuBox(
                          child: Icon(Icons.skip_next),
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      );
    });
  }
}
