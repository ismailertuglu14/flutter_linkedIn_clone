class UserModel {
  final String name;
  final String lastName;
  final String email;
  final String password;
  final String bio;
  final String? photo;
  List<String>? following;
  List<String>? followers;

  UserModel(
      {required this.name,
      required this.lastName,
      required this.email,
      required this.password,
      required this.photo,
      required this.bio,
      this.following,
      this.followers});

  Map<String, dynamic> toJson() => {
        'name': name,
        'lastName': lastName,
        'email': email,
        'password': password,
        'bio': bio,
        'photo': photo ?? '',
        'following': following ?? [],
        'followers': followers ?? [],
      };
  factory UserModel.fromJson(Map<String, dynamic> data) {
    return UserModel(
        name: data['name'],
        lastName: data['lastName'],
        email: data['email'],
        password: data['password'],
        photo: data['photo'],
        bio: data['bio']);
  }
}
