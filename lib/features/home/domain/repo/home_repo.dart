import 'package:bookly/core/errors/failures_app.dart';
import 'package:bookly/features/home/domain/entities/book_entity.dart';
import 'package:dartz/dartz.dart';

abstract class HomeRepoNew {
  // ايش الي رح يحصل :
  // ما بدي impl ايش بتعمل :
  //oop :
  Future<Either<FailuresApp, List<BookEntity>>> fetchFeaturedBooks({
    int pageNumber = 0,
  });
  // left right : 2 types : left مشكله : right : صح : الrequest :
  Future<Either<FailuresApp, List<BookEntity>>> fetchNewestBooks();
}
