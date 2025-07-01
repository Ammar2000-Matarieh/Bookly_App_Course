import 'package:bookly/features/home/data/models/book_model/book_model.dart';
import 'package:bookly/features/home/data/repos/home_repo_impl.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'featured_book_state.dart';

class FeaturedBookCubit extends Cubit<FeaturedBookState> {
  FeaturedBookCubit(this.homeRepoImpl) : super(FeaturedBookInitial());

  final HomeRepoImpl homeRepoImpl;

  Future<void> fetchFeatured() async {
    emit(FeaturedBookLoading());

    var result = await homeRepoImpl.fetchFeaturedBooks();

    result.fold(
      (failure) {
        emit(FeaturedBookFailure(failure.errMessage));
      },
      (books) {
        emit(FeaturedBookSuccess(books));
      },
    );
  }
}
