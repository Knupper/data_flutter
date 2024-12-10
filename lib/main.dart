import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_schulung/data/data_sources/advice_remote_data_source.dart';
import 'package:flutter_schulung/data/repositories/advice_repo_impl.dart';
import 'package:flutter_schulung/domain/repositories/advice_repo.dart';
import 'package:flutter_schulung/my_app.dart';
import 'package:http/http.dart';

void main() {
  runApp(RepositoryProvider<AdviceRepo>(
    create: (context) => AdviceRepoImpl(
      dataSource: AdviceRestDataSource(
        client: Client(),
      ),
    ),
    child: const MyApp(),
  ));
}
