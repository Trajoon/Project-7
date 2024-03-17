import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:projcet_cv/data/data_layer.dart';
import 'package:projcet_cv/service/supabase_services.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:get_it/get_it.dart';
import 'package:get_storage/get_storage.dart';

databaseConfig() async {
  await dotenv.load(fileName: ".env");
  await Supabase.initialize(
      url: dotenv.env["url"]!, anonKey: dotenv.env["anoneKey"]!);
}

Future<void> setup() async {
  await GetStorage.init();
  GetIt.instance;
  GetIt.I.registerSingleton<HomeData>(HomeData());
  GetIt.I.registerSingleton<Database>(Database());
}
