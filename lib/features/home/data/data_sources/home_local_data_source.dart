import 'package:bookly/features/home/domain/entities/book_entity.dart';
import 'package:bookly/main.dart';
import 'package:hive/hive.dart';

abstract class HomeLocalDataSource {
  // abstract class : حدد بس

  List<BookEntity> fetchFeaturedBooks({int pageNumber = 0});
  // left right : 2 types : left مشكله : right : صح : الrequest :
  List<BookEntity> fetchNewestBooks();

  // local data not remote :
  // hive :

  // sql relation :

  // entity : ابسط مش زي model :

  // تعديل مكان واحد :
}

class HomeLocalDataSourceImpl extends HomeLocalDataSource {
  @override
  List<BookEntity> fetchFeaturedBooks({int pageNumber = 0}) {
    int startIndex = pageNumber * 10;
    int endIndex = (pageNumber + 1) * 10;

    var box = Hive.box<BookEntity>(kFeaturedBox);
    int len = box.values.length;
    // check range :
    if (startIndex >= len || endIndex > len) {
      return []; // ممكن يجيب 5 مثلا :
    }
    // clean art : sublist :
    return box.values.toList().sublist(startIndex, endIndex);
    // Iterable => collections :
  }

  @override
  List<BookEntity> fetchNewestBooks() {
    var box = Hive.box<BookEntity>(kNewsetBox);
    return box.values.toList();
  }
}
