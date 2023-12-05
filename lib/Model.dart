class Model {
  String distance='';
  String name = '';
  String image= '';
  String position='';
  String velocity= '';
  String description= '';

  Model({
    required this.image,
    required this.position,
    required this.name,
    required this.distance,
    required this.description,
    required this.velocity
  });



  Model.fromJson(Map<String, dynamic> json) {
    description = json['description'];
    position = json['position'];
    image = json['image'];
    velocity = json['velocity'];
    name = json['name'];
    distance = json['distance'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['position'] = position;
    data['name'] = name;
    data['velocity'] = velocity;
    data['distance'] = distance;
    data['description'] = description;
    data['image'] = image;
    return data;
  }
  @override
  String toString() {
    return '{'
        'position: $position,'
        ' name: $name, '
        'image: $image,'
        ' velocity: $velocity,'
        ' distance: $distance,'
        ' description: $description}';
  }
  static List<Model> parseList(List value) {
    List<Model> listdata = value.map((e) => Model.fromJson(e)).toList();
    return listdata;
  }
}