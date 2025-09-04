// import 'package:bookly/core/errors/failures.dart';
// import 'package:bookly/core/errors/failures_app.dart';
// import 'package:bookly/features/home/data/data_sources/home_local_data_source.dart';
// import 'package:bookly/features/home/data/data_sources/home_remote_data_source.dart';
// import 'package:bookly/features/home/data/models/book_model/book_model.dart';
// import 'package:bookly/features/home/data/repos/home_repo.dart';
// import 'package:dartz/dartz.dart';

// المفروض اجيب البيانات المكيشه :
// cache :

// local اهم :

// class HomeRepoTestImpl extends HomeRepo {
//   final HomeRemoteDataSource homeRemoteDataSource;
//   final HomeLocalDataSource homeLocalDataSource;

//   HomeRepoTestImpl({
//     required this.homeRemoteDataSource,
//     required this.homeLocalDataSource,
//   });

//   @override
//   Future<Either<Failure, List<BookEntity>>> fetchFeaturedBooks() async {
//     try {

//       var bookList = homeLocalDataSource.fetchFeaturedBooks();
//       if(bookList.isNotEmpty ) {
//      return Right(bookList),
// }
//
//       var books = await homeRemoteDataSource.fetchFeaturedBooks();

//       return Right(books);
//     } catch (e) {
//       if(e is DioError) {
// return left(ServerFailure(message: )); //
// }

// return left(ServerFailure(e.toString()))

//     }
//   }

//   @override
//   Future<Either<Failure, List<BookModel>>> fetchNewSetBooks() async {
//     try {
// تحديد الانواع مهم :
// List<BookEntity> books;
//        books = homeLocalDataSource.fetchNewSetBooks();
//       if(books.isNotEmpty ) {
//      return Right(books),
// }
//
//        books = await homeRemoteDataSource.fetchNewSetBooks();

//       return Right(books);
//     } catch (e) {
//       if(e is DioError) {
// return left(ServerFailure(message: )); //
// }

// return left(ServerFailure(e.toString()))

//     }
// }

//   @override
//   Future<Either<Failure, List<BookModel>>> fetchSimilarBooks({
//     required String categories,
//   }) {
//     // TODO: implement fetchSimilarBooks
//     throw UnimplementedError();
//   }
// }
