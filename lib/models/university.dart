class University {
  final String name;
  final String country;
  final String website;

  University({
    required this.name,
    required this.country,
    required this.website,
  });

  factory University.fromJson(Map<String, dynamic> json) {
    return University(
      name: json['name'],
      country: json['country'],
      website: (json['web_pages'] as List).first,
    );
  }
}
