class Destination {
  final String title;
  final String city;
  final String country;
  final String description;
  final String likes;
  final String image;

  Destination({
    required this.title,
    required this.city,
    required this.country,
    required this.description,
    required this.likes,
    required this.image,
  });

  factory Destination.fromJson(Map<String, dynamic> json) {
    return Destination(
      title: json['title'],
      city: json['city'],
      country: json['country'],
      description: json['description'],
      likes: json['likes'],
      image: json['image'],
    );
  }
}
