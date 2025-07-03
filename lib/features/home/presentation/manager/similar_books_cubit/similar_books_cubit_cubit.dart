import 'package:bookly/features/home/data/models/book_model/book_model.dart';
import 'package:bookly/features/home/data/repos/home_repo_impl.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'similar_books_cubit_state.dart';

class SimilarBooksCubitCubit extends Cubit<SimilarBooksCubitState> {
  SimilarBooksCubitCubit(this.homeRepoImpl) : super(SimilarBooksCubitInitial());

  final HomeRepoImpl homeRepoImpl;

  Future<void> fetchSimilarBooks({required String categories}) async {
    emit(SimilarBooksCubitLoading());

    var result = await homeRepoImpl.fetchSimilarBooks(categories: categories);

    result.fold(
      (failure) {
        emit(SimilarBooksCubitFailure(failure.errMessage));
      },
      (books) {
        emit(SimilarBooksCubitSuccess(books: books));
      },
    );
  }
}
