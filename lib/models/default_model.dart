class DefaultModel {
  DefaultModel({
    this.image_profile = "",
  });

  String image_profile;

  // Constructor from JSON
  factory DefaultModel.fromJson(Map<String, dynamic> json) {
    return DefaultModel(
      image_profile: json["image_profile"] ?? "",
    );
  }

  // Method to convert to JSON
  Map<String, dynamic> toJson() {
    return {
      "image_profile": image_profile,
    };
  }
}