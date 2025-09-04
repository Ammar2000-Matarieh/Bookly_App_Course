import 'package:bookly/core/utils/service_locator.dart';
import 'package:bookly/features/home/data/repos/home_repo_impl.dart';
import 'package:bookly/features/home/presentation/manager/featured_books_cubit/featured_book_cubit.dart';
import 'package:bookly/features/home/presentation/manager/newset_books_cubit/newest_books_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/single_child_widget.dart';

List<SingleChildWidget> blocProviders = [
  BlocProvider(
    create: (context) => FeaturedBookCubit(getIt.get<HomeRepoImpl>()),
  ),

  BlocProvider(
    create: (context) => NewestBooksCubit(getIt.get<HomeRepoImpl>()),
  ),
];

// service locator :
// get it :
