import 'package:bookly/core/utils/api_services.dart';
import 'package:bookly/features/home/data/repos/home_repo_impl.dart';
import 'package:bookly/features/home/presentation/manger/featured_books_cubit/featured_book_cubit.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

// dependency injection :
// single Ton Pattern. :
final getIt = GetIt.instance;

void setupServiceLocator() {
  getIt.registerSingleton<ApiServices>(ApiServices((Dio())));
  //
  getIt.registerSingleton<HomeRepoImpl>(HomeRepoImpl(getIt.get<ApiServices>()));
  //
  // cubit :
  // bloc provider just not get it :
  getIt.registerSingleton<FeaturedBookCubit>(
    FeaturedBookCubit(getIt.get<HomeRepoImpl>()),
  );
}

// get It :

// very important :
