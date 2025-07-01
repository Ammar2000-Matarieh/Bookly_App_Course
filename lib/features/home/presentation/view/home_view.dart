import 'package:bookly/features/home/presentation/view/manger/featured_books_cubit/featured_book_cubit.dart';
import 'package:bookly/features/home/presentation/view/widgets/home_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  void initState() {
    BlocProvider.of<FeaturedBookCubit>(context).fetchFeatured();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: HomeViewBody());
  }
}

/// عندما اريد استدعاء function في بدايه اي شاشه في خيارين اما تحويل الي state full or bloc provider ..name of method : ///

// view model is equal == controller when use MVVM or MVC : 

// mvvm <=> bloc same 1 : 