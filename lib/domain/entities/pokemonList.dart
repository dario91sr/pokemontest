class PokemonList {
  final int id;
  final String name;

  PokemonList({required this.id, required this.name});

  factory PokemonList.fromJson(Map<String, dynamic> json) {
    final name = json['name'];
    final url = json['url'] as String;
    final id = int.parse(url.split('/')[6]);

    return PokemonList(id: id, name: name);
  }
}
