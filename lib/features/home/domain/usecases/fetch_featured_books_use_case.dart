import 'package:bookly/core/errors/failures_app.dart';
import 'package:bookly/core/usecase/use_case.dart';
import 'package:bookly/features/home/domain/entities/book_entity.dart';
import 'package:bookly/features/home/domain/repo/home_repo.dart';
import 'package:dartz/dartz.dart';

// change data type from NoParam to Int : param ?
class FetchFeaturedBooksUseCase extends UseCase<List<BookEntity>, int> {
  //NoParam
  final HomeRepoNew homeRepo;

  FetchFeaturedBooksUseCase(this.homeRepo);
  @override
  Future<Either<FailuresApp, List<BookEntity>>> call([
    int pageNumber = 0,
  ]) async {
    // ممكن يكون null. : null ممكن :
    return await homeRepo.fetchFeaturedBooks(pageNumber: pageNumber);
  }

  // final HomeRepoNew homeRepo;

  // وراثه من abstract class :

  // FetchFeaturedBooksUseCase(this.homeRepo);

  // Future<Either<FailuresApp, List<BookEntity>>> call() {
  // check permission :
  //   return homeRepo.fetchFeaturedBooks();
  // }
}

// abstract class UseCase<Type, Param> {
//   // any data type : استقبلها ب Type : and Param :
//   Future<Either<FailuresApp, Type>> call([Param param]);
// }

// optional




// موضوع مهم جدا : 