import 'package:fl_toktik/domain/datasources/video_post_datasource.dart';
import 'package:fl_toktik/domain/entities/video_post.dart';
import 'package:fl_toktik/infrastructure/models/local_video_mode.dart';
import 'package:fl_toktik/shared/data/local_video_posts.dart';

class LocalVideoDatasource implements VideoPostDatasource {
  @override
  Future<List<VideoPost>> getFavoriteVideosByUser(String useID) {
    throw UnimplementedError();
  }

  @override
  Future<List<VideoPost>> getTrendingVideosByPage(int page) async {
    await Future.delayed(const Duration(seconds: 2));

    final List<VideoPost> newVideos = videoPosts
        .map(
          (video) => LocalVideoModel.fromJson(video).toVideoPostEntity(),
        )
        .toList();

    return newVideos;
  }
}
