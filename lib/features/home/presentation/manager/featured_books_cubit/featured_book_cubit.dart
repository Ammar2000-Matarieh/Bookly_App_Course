import 'package:bookly/features/home/data/models/book_model/book_model.dart';
import 'package:bookly/features/home/data/repos/home_repo_impl.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'featured_book_state.dart';

class FeaturedBookCubit extends Cubit<FeaturedBookState> {
  FeaturedBookCubit(this.homeRepoImpl) : super(FeaturedBookInitial());

  final HomeRepoImpl homeRepoImpl;
  // clean arc : courses :
  Future<void> fetchFeatured({int pageNumber = 0}) async {
    // clean art :
    if (pageNumber == 0) {
      emit(FeaturedBookLoading());
    } else {
      emit(FeaturedBookPagination());
    }

    var result = await homeRepoImpl.fetchFeaturedBooks(pageNumber: pageNumber);

    // fold :
    result.fold(
      (failure) {
        // clean :
        if (pageNumber == 0) {
          emit(FeaturedBookFailure(failure.errMessage));
        } else {
          emit(FeaturedBookPaginationFailure(failure.errMessage));
        }
      },
      (books) {
        emit(FeaturedBookSuccess(books));
      },
    );
  }
}
