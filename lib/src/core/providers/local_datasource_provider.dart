import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ebank/src/core/data/datasource/index.dart';

final localDatasourceProvider = Provider<LocalDataSource>((ref) {
  return LocalDataSource();
});
