import 'package:bookly/features/home/data/models/book_model/book_model.dart';
import 'package:bookly/features/search/data/repos/search_repo_impl.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'search_cubit_state.dart';

class SearchCubitCubit extends Cubit<SearchCubitState> {
  SearchCubitCubit(this.searchRepoImpl) : super(SearchCubitInitial());

  final SearchRepoImpl searchRepoImpl;

  Future<void> fetchBooksSearch() async {
    emit(SearchCubitLoading());

    var result = await searchRepoImpl.searchBooksFeatures();

    result.fold(
      (failure) {
        emit(SearchCubitFailure(failure.errMessage));
      },
      (books) {
        emit(SearchCubitSuccess(books));
      },
    );
  }
}
