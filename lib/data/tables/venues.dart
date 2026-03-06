import 'package:drift/drift.dart';

class Venues extends Table {
  // @override
  // String get tableName => 'venues';

  IntColumn get id => integer().autoIncrement()();

  // final int id;
  // final String name;
  // final String cidade;
  // final String estado;
  // final String? bairro;
  // final String denominacao;
}
