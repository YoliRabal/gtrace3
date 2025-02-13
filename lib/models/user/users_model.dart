class UsersModel {

  //GENERAL
  String id;
  String email;

  //DATA
  String name;
  String bio;
  String image;

  //LISTS
  List<dynamic> tokens;

  //CHECKS
  bool tutorial;
  bool isAdmin;
  bool onboarding;
  bool emailVerified;

  UsersModel({
    this.id = "",
    this.name = "",
    this.bio = "",
    this.email = "",
    this.image = "",
    this.tokens = const [],
    this.tutorial = false,
    this.isAdmin = false,
    this.onboarding = false,
    this.emailVerified = false,
  }
      )


  factory UsersModel.fromJson(Map<String, dynamic> json) => UsersModel(
    id: json["id"] ?? "",
    name: json["name"] ?? "Invitado",
    bio: json["bio"] ?? "",
    email: json["email"] ?? "",
    image: json["image"] ?? "",
    isAdmin: json["isAdmin"] ?? false,
    tokens: json["tokens"] ?? [],
    tutorial: json["tutorial"] ?? false,
    onboarding: json["onboarding"] ?? false,
    emailVerified: json["emailverified"] ?? false,
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "bio": bio,
    "email": email,
    "image": image,
    "tokens": tokens,
    "tutorial": tutorial,
    "isAdmin": isAdmin,
    "onboarding": onboarding,
    "emailverified": emailVerified,
  };
}
