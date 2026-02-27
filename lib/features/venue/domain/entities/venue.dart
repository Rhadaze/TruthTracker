class Venue {
  final String name;
  final String cidade;
  final String estado;
  final String? bairro;
  final String denominacao;

  Venue({
    required this.name,
    required this.cidade,
    required this.estado,
    this.bairro,
    required this.denominacao,
  });
}
