import 'package:fl_toktik/domain/entities/video_post.dart';

abstract class VideoPostRepository {
  Future<List<VideoPost>> getFavoriteVideosByUser(String useID);
  Future<List<VideoPost>> getTrendingVideosByPage(int page);
}
