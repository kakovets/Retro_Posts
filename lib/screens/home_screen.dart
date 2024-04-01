import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import '../models/post_model.dart';
import '../services/posts_api.dart';
import '../utils/bezier_painter.dart';
import '../widgets/post_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  late PostsApi apiService;
  late Future<List<PostModel>> futureData;

  String pageProgress = '1 / 100';

  @override
  void initState() {
    super.initState();
    apiService = PostsApi(Dio(BaseOptions(
      contentType: 'application/json',
    )));
    futureData = apiService.getPosts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text(
          pageProgress,
          style: const TextStyle(
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.deepPurpleAccent,
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: _reloadData,
            icon: const Icon(
              Icons.refresh,
              color: Colors.white,
            ),
          )
        ],
      ),
      body: Stack(
        children: [
          CustomPaint(
            size: MediaQuery.of(context).size,
            painter: BezierCurvePainter(),
          ),
          FutureBuilder(
            future: futureData,
            builder: (context, snapshot) {
              if (snapshot.connectionState != ConnectionState.done) {
                return const Center(
                  child: CircularProgressIndicator(
                    color: Colors.white,
                  ),
                );
              } else {
                if (!snapshot.hasData) {
                  return const Center(
                    child: Text('sori, vsyo propalo', textAlign: TextAlign.center,),
                  );
                }
                final List<PostModel> posts = snapshot.data!;
                return PageView.builder(
                  itemCount: posts.length,
                  onPageChanged: (page) {
                    setState(() {
                      pageProgress = '${page + 1} / ${posts.length}';
                    });
                  },
                  itemBuilder: (context, index) {
                    return PostCard(post: posts[index],);
                  },
                );
              }
            },
          ),
        ],
      ),
    );
  }

  void _reloadData() {
    setState(() {
      pageProgress = '1 / 100';
      futureData = apiService.getPosts();
    });
  }
}