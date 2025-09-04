part of 'featured_book_cubit.dart';

abstract class FeaturedBookState extends Equatable {
  const FeaturedBookState();

  @override
  List<Object> get props => [];
}

class FeaturedBookInitial extends FeaturedBookState {}

class FeaturedBookLoading extends FeaturedBookState {}

// new states :
class FeaturedBookPagination extends FeaturedBookState {}

class FeaturedBookPaginationFailure extends FeaturedBookState {
  final String errMessage;

  const FeaturedBookPaginationFailure(this.errMessage);
}

class FeaturedBookFailure extends FeaturedBookState {
  final String errMessage;

  const FeaturedBookFailure(this.errMessage);
}

class FeaturedBookSuccess extends FeaturedBookState {
  final List<BookModel> books;
  // final List<BookEntity> books;

  const FeaturedBookSuccess(this.books);
}
