import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/cupertino.dart';
import 'weather.dart';

class AudioSetter {
  final player = AudioPlayer();

  String Url = "";

  void urlGetter(weather) {
    switch (weather) {
      case 'Sunny':
        Url =
            'https://soundspunos.com/uploads/files/2022-03/1648207671_1643388742_street-general-ambience.mp3';
        break;
      case 'Clear':
        Url =
            'https://cdn.videvo.net/videvo_files/audio/premium/audio0138/watermarked/NightAmbienceCalm%20PE011801_preview.mp3';
        break;
      case 'Light rain shower':
      case 'Light rain':
        Url =
            'https://soundspunos.com/uploads/files/2023-04/1681646525_1618382132_15-rainroof.mp3';
        break;
      case 'Moderate or heavy rain shower':
        Url =
            'https://soundspunos.com/uploads/files/2023-04/1681646483_1618382397_nature_rain_falling_on_verandah_roof_15467.mp3';
        break;
      case 'Patchy light rain with thunder':
        Url =
            'https://soundspunos.com/uploads/files/2023-04/1681646542_1618382227_nature_rain_light_metal_roof_thunderstorm_approach.mp3';
        break;
      case 'Moderate or heavy rain with thunder':
        Url =
            'https://www.shockwave-sound.com/sound-effects/rain-sounds/thunderrain.wav';
        break;
      default:
        Url =
            'https://soundspunos.com/uploads/files/2023-01/1673880349_1568010368_3cd0b5f205bde97.mp3';
    }
  }

  void playAudio() async {
    await player.play(
      UrlSource(Url),
    );
  }
}
