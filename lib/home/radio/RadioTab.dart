import 'dart:convert';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:islamy2022/home/radio/radioitem.dart';
import 'package:islamy2022/main.dart';
import 'package:islamy2022/model/RadioResponse.dart';

class RadioTab extends StatefulWidget {
  @override
  State<RadioTab> createState() => _RadioTabState();
}

class _RadioTabState extends State<RadioTab> {
  @override
  late Future<RadioResponse> radioResponse;
  late AudioPlayer audioPlayer;

  play(String url) async {
    int result = await audioPlayer.play(url);
  }

  pause() async {
    await audioPlayer.pause();
  }

  @override
  void initState() {
    super.initState();
    radioResponse = fetchRadio();
    audioPlayer = AudioPlayer();
  }

  Widget build(BuildContext context) {
    return FutureBuilder<RadioResponse>(
        future: radioResponse,
        builder: (context, snapShot) {
          if (snapShot.hasData) {
            return Column(
              children: [
                Image.asset('assets/images/radiologo.png'),
                Expanded(
                    child: ListView.builder(
                        physics: PageScrollPhysics(),
                        scrollDirection: Axis.horizontal,
                        itemCount: snapShot.data!.radios!.length,
                        itemBuilder: (context, index) {
                          return (radioitem(
                              snapShot.data!.radios![index], play, pause));
                        })),
              ],
            );
          } else if (snapShot.hasError) {
            return Center(
              child: IconButton(
                  onPressed: () {
                    radioResponse = fetchRadio();
                  },
                  icon: Icon(
                    Icons.refresh,
                    color: Mythemedata.primaryColor,
                  )),
            );
          } else {
            return Center(
              child: CircularProgressIndicator(
                color: Mythemedata.primaryColor,
              ),
            );
          }
        });
  }

  Future<RadioResponse> fetchRadio() async {
    final response = await http
        .get(Uri.parse('http://api.mp3quran.net/radios/radio_arabic.json'));

    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      return RadioResponse.fromJson(
          jsonDecode(utf8.decode(response.bodyBytes)));
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load Radio');
    }
  }
}
