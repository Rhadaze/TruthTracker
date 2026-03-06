class Venue {
  final int id;
  final String name;
  final String cidade;
  final String estado;
  final String? bairro;
  final String denominacao;

  Venue({
    required this.id,
    required this.name,
    required this.cidade,
    required this.estado,
    this.bairro,
    required this.denominacao,
  });
}
