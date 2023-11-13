import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:ebank/src/core/data/index.dart';
import 'package:ebank/src/core/providers/index.dart';

final userRepositoryProvider = Provider<UserRepository>((ref) {
  final datasource = ref.read(localDatasourceProvider);
  return UserRepository(datasource);
});
