import 'package:bookly/core/utils/api_services.dart';
import 'package:bookly/core/utils/functions/save_box.dart';
import 'package:bookly/core/utils/functions/save_newest_books.dart';
import 'package:bookly/features/home/data/models/book_model/test.dart';
import 'package:bookly/features/home/domain/entities/book_entity.dart';
import 'package:bookly/main.dart';

abstract class HomeRemoteDataSource {
  // abstract class : حدد بس
  // clean art course :
  Future<List<BookEntity>> fetchFeaturedBooks({int pageNumber = 0});
  // left right : 2 types : left مشكله : right : صح : الrequest :
  Future<List<BookEntity>> fetchNewestBooks();

  // تعديل مكان واحد :
}

class HomeRemoteDataSourceImpl extends HomeRemoteDataSource {
  final ApiServices apiServices;

  HomeRemoteDataSourceImpl(this.apiServices);

  // clean art :
  @override
  Future<List<BookEntity>> fetchFeaturedBooks({int pageNumber = 0}) async {
    var data = await apiServices.get(
      // edit endpoint add start index : clean art course :
      endPoint:
          'volumes?Filtering=free-ebooks&q=programming&startIndex=${pageNumber * 10}',
    );

    List<BookEntity> books = getBooksList(data);
    // clean :

    // save local database

    saveBooksData(books, kFeaturedBox);

    return books;
  }

  @override
  Future<List<BookEntity>> fetchNewestBooks() async {
    var data = await apiServices.get(
      endPoint: 'volumes?Filtering=free-ebooks&Sorting=newset&q=programming',
    );

    List<BookEntity> books = getBooksList(data);

    // clean :
    saveNewsetData(books, kNewsetBox);

    return books;
  }

  // art معماريه :

  List<BookEntity> getBooksList(Map<String, dynamic> data) {
    List<BookEntity> books = [];

    // طبيعي : اي book model هو book entity represent data  :

    for (var bookMap in data['items']) {
      books.add(BookModel.fromJson(bookMap));
    }
    return books;
  }
}
