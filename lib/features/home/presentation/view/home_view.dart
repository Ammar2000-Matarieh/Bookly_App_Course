import 'package:bookly/features/home/presentation/view/widgets/home_view_body.dart';
import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: HomeViewBody());
  }
}

/// عندما اريد استدعاء function في بدايه اي شاشه في خيارين اما تحويل الي state full or bloc provider ..name of method : ///

// view model is equal == controller when use MVVM or MVC : 

// mvvm <=> bloc same 1 : 