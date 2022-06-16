import 'dart:developer';
import 'package:file_selector/file_selector.dart';
import 'package:url_launcher/url_launcher.dart';

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher_string.dart';

void main() {
  runApp(VideoApp());
}

class VideoApp extends StatefulWidget {
  @override
  _VideoAppState createState() => _VideoAppState();
}

class _VideoAppState extends State<VideoApp> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Video Demo',
      home: Scaffold(
        body: Container(
          child: TextButton(
              onPressed: () async {
                final XTypeGroup typeGroup = XTypeGroup(
                  label: 'images',
                  extensions: <String>['mp4'],
                );
                final XFile? file =
                    await openFile(acceptedTypeGroups: <XTypeGroup>[typeGroup]);
                log('file $file');
                if (file != null) {
                  launchUrlString('file:${file.path}');
                }
              },
              child: const Text('打开视频文件')),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () async {
            launchUrlString('file:/Users/ryanaltair/Downloads/bee.mp4');
          },
          child: const Icon(
            Icons.play_arrow,
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}
