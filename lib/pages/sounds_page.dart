import 'package:flutter/material.dart';
import 'package:polyphasic_sleep_new/models/sound_model.dart';
import 'package:polyphasic_sleep_new/models/sound_provider.dart';
import 'package:polyphasic_sleep_new/pages/sound_playback_page.dart';
import 'package:provider/provider.dart';

class SoundsPage extends StatefulWidget {
  const SoundsPage({super.key});

  @override
  State<SoundsPage> createState() => _SoundsPageState();
}

class _SoundsPageState extends State<SoundsPage> {
  late final dynamic songlistProvider;
  @override
  void initState() {
    super.initState();
    songlistProvider = Provider.of<SoundProvider>(context, listen: false);
  }

  void goToSound(int soundIndex) {
    songlistProvider.currentSoundIndex = soundIndex;
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => const SoundPlaybackPage()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Center(
        child: Padding(
          padding: const EdgeInsets.only(right: 40.0),
          child: Text("P L A Y L I S T",
              style: TextStyle(
                  color: Theme.of(context).colorScheme.inverseSurface,
                  fontSize: 20)),
        ),
      )),
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: Consumer<SoundProvider>(builder: (context, value, child) {
        final List<Sound> songlist = value.songlist;
        return ListView.builder(
            itemCount: songlist.length,
            itemBuilder: (context, index) {
              final Sound sound = songlist[index];
              return ListTile(
                title: Text(sound.songName),
                subtitle: Text(sound.artistName),
                leading: Image.asset(sound.albumArtImagePath),
                onTap: () => goToSound(index),
              );
            });
      }),
    );
  }
}
