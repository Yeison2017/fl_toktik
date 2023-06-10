import 'package:fl_toktik/config/theme/app_theme.dart';
import 'package:fl_toktik/infrastructure/datasources/local_video_datasource_impl.dart';
import 'package:fl_toktik/infrastructure/repositories/video_posts_repository_impl.dart';
import 'package:fl_toktik/presentation/providers/discover_provider.dart';
import 'package:fl_toktik/presentation/screens/discover/discover_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final videoPostReposity =
        VideoPostsRepositoryImpl(videosDatasource: LocalVideoDatasource());

    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
            create: (_) => DiscoverProvider(videosRepository: videoPostReposity)
              ..loadNextPage())
      ],
      child: MaterialApp(
          title: 'TokTik',
          debugShowCheckedModeBanner: false,
          theme: AppTheme().getTheme(),
          home: const DiscoverScreen()),
    );
  }
}
