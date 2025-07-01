// repo patterns :
// not way to impl :
import 'package:bookly/core/errors/failures.dart';
import 'package:bookly/core/utils/api_services.dart';
import 'package:bookly/features/home/data/models/book_model/book_model.dart';
import 'package:bookly/features/home/data/repos/home_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

// dart z pub dev very important handel error :
// left and right :

class HomeRepoImpl implements HomeRepo {
  final ApiServices apiServices;

  HomeRepoImpl(this.apiServices);

  @override
  Future<Either<Failure, List<BookModel>>> fetchNewSetBooks() async {
    try {
      var data = await apiServices.get(
        endPoint:
            'volumes?Filtering=free-ebook&Sorting=newest &q=subject:Programming',
      );

      List<BookModel> books = [];

      for (var item in data['items']) {
        books.add(BookModel.fromJson(item));
      }
      // right side :
      return right(books);
    } catch (e) {
      // very important :
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }
      // e.to String مسج مش صحيح :
      return left(ServerFailure("Error Data Fetch from Server "));
    }
  }

  @override
  Future<Either<Failure, List<BookModel>>> fetchFeaturedBooks() async {
    try {
      var data = await apiServices.get(
        endPoint: 'volumes?Filtering=free-ebook&q=subject:Programming',
      );

      List<BookModel> books = [];

      for (var item in data['items']) {
        books.add(BookModel.fromJson(item));
      }
      // right side :
      return right(books);
    } catch (e) {
      // very important :
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }
      // e.to String مسج مش صحيح :
      return left(ServerFailure("Error Data Fetch from Server "));
    }
  }
}
