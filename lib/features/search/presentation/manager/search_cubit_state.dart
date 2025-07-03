part of 'search_cubit_cubit.dart';

sealed class SearchCubitState extends Equatable {
  const SearchCubitState();

  @override
  List<Object> get props => [];
}

class SearchCubitInitial extends SearchCubitState {}

class SearchCubitLoading extends SearchCubitState {}

class SearchCubitFailure extends SearchCubitState {
  final String errorMessage;

  const SearchCubitFailure(this.errorMessage);
}

class SearchCubitSuccess extends SearchCubitState {
  final List<BookModel> books;

  const SearchCubitSuccess(this.books);
}
