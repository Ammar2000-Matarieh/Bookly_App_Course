import 'package:bookly/bookly_app.dart';
import 'package:bookly/core/utils/service_locator.dart';
import 'package:bookly/features/home/domain/entities/book_entity.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

// void main() async {
// const kFeaturedBox = 'featured_box';
//   setupServiceLocator();
//   runApp(const BooklyApp());

//   Hive.registerAdapter(BookEntityAdapter());

//   await Hive.openBox(kFeaturedBox);

//   // init box
// }
const kFeaturedBox = 'featured_box';
const kNewsetBox = 'featured_box';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // ✅ initialize Hive
  await Hive.initFlutter();

  // ✅ register adapters
  Hive.registerAdapter(BookEntityAdapter());

  // ✅ open box before runApp
  await Hive.openBox<BookEntity>(kFeaturedBox);
  await Hive.openBox<BookEntity>(kNewsetBox);

  // ✅ setup DI
  setupServiceLocator();

  runApp(const BooklyApp());
}


// pagination:  loading : success ما تبعت كل ال data مره وحده:  very important : 