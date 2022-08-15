import 'package:social/models/user_model.dart';

class Post {
  final String ownerId;
  final String title;
  final String url;
  final DateTime createdDate;
  final List<UserModel>? likedUsers;
  Post({
    required this.ownerId,
    required this.title,
    required this.url,
    required this.createdDate,
    this.likedUsers,
  });
}
