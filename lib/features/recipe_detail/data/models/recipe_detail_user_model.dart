class RecipeDetailUserModel {
  final int id;
  final String profilePhoto, userName, firsName, lastName;

  RecipeDetailUserModel({
    required this.id,
    required this.profilePhoto,
    required this.userName,
    required this.firsName,
    required this.lastName,
  });

  factory RecipeDetailUserModel.fromJson(Map<String, dynamic> json) {
    return RecipeDetailUserModel(
      id: json['id'],
      profilePhoto: json['profilePhoto'],
      userName: json['userName'],
      firsName: json['firsName'],
      lastName: json['lastName'],
    );
  }
}
