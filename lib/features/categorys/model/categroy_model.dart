class CategroyModel {

String slug;
String name;
String url;

CategroyModel({
  required this.slug,
  required this.name,
  required this.url,
});

factory CategroyModel.fromdata(Map<String, dynamic> json) {
  return CategroyModel(
    slug: json['slug'],
    name: json['name'],
    url: json['url'],
  );
}

}

