import 'package:blur/blur.dart';
import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';
import '../models/post_model.dart';
import '../utils/utils.dart';
import 'likes.dart';

class PostCard extends StatefulWidget {
  const PostCard({super.key, required this.post});

  final PostModel post;

  @override
  State<PostCard> createState() => _PostCardState();
}

class _PostCardState extends State<PostCard> {

  int likes = 0;
  String title = '';
  String body = '';

  @override
  void initState() {
    super.initState();
    title = widget.post.title;
    body = widget.post.body;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(32),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: Utils.circularBordRad16,
        border: Border.all(color: Colors.black38, width: 1),
        boxShadow: const [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 8,
            spreadRadius: 2,
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              Text(
                title,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Divider(
                height: 32,
                color: Colors.deepPurple.shade100,
              ),
              Blur(
                blur: likes < 0 ? 2.5 : 0,
                blurColor: Colors.white,
                child: Text(
                  body,
                  style: const TextStyle(
                    fontSize: 16,
                  ),
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Material(
                color: Colors.transparent,
                child: InkWell(
                  borderRadius: Utils.circularBordRad16,
                  onTap: () {
                    Share.share('Title: $title\nBody: $body\nLikes: $likes');
                  },
                  child: Container(
                    padding: const EdgeInsets.all(14),
                    decoration: BoxDecoration(
                      color: Colors.deepPurpleAccent.withOpacity(0.15),
                      borderRadius: Utils.circularBordRad16,
                    ),
                    child: const Icon(Icons.send),
                  ),
                ),
              ),
              Likes(likes: likes, increment: inc, decrement: dec,),
            ],
          ),
        ],
      ),
    );
  }

  void inc() {
    setState(() {
      likes++;
    });
  }

  void dec() {
    setState(() {
      likes--;
    });
  }
}