import 'package:json_annotation/json_annotation.dart';
part 'post_model.g.dart';

typedef Json = Map<String, dynamic>;

@JsonSerializable()
class PostModel {
  int userId;
  int id;
  String title;
  String body;

  PostModel({
    required this.userId,
    required this.id,
    required this.title,
    required this.body
  });

  factory PostModel.fromJson(Json map) => _$PostModelFromJson(map);
  Json toJson() => _$PostModelToJson(this);
}