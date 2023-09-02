import 'package:flutter/material.dart';
import 'package:movies/src/src.dart';

class VideoProvider with ChangeNotifier {
  final _service = VideoService();
  final Map<int, List<Video>> _video = {};

  Future<List<Video>> getVideo({required int movieId}) async {
    if (_video.containsKey(movieId)) return _video[movieId]!;
    final videos = await _service.getVideos(movieId);
    if (videos.results!.isNotEmpty) {
      _video[movieId] = videos.results!.sublist(0, 2);
      return videos.results!.sublist(0, 2);
    }
    return [];
  }
}
