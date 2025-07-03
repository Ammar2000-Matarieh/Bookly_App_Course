import 'package:bookly/core/errors/failures.dart';
import 'package:bookly/core/utils/api_services.dart';
import 'package:bookly/features/home/data/models/book_model/book_model.dart';
import 'package:bookly/features/search/data/repos/search_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class SearchRepoImpl implements SearchRepo {
  final ApiServices apiServices;

  SearchRepoImpl({required this.apiServices});
  @override
  Future<Either<Failure, List<BookModel>>> searchBooksFeatures() async {
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
