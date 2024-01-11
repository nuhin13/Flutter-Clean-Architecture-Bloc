class Instruction {
  final String title;
  final String description;
  final String image;

  Instruction({
    required this.title,
    required this.description,
    required this.image,
  });

  Map<String, dynamic> toJson() => {
        'title': title,
        'description': description,
        'image': image,
      };
}
