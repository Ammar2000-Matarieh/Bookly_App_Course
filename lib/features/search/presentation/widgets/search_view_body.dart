import 'package:bookly/core/utils/styles.dart';
import 'package:bookly/features/search/presentation/widgets/custom_list_view_search.dart';
import 'package:bookly/features/search/presentation/widgets/custom_search_text_filed.dart';
import 'package:flutter/material.dart';

class SearchViewBody extends StatelessWidget {
  const SearchViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Column(
        children: [
          CustomSearchTextFiled(),
          SizedBox(height: 16),
          Text("Search Result ", style: Styles.textStyle18),
          SizedBox(height: 16),

          Expanded(child: SearchResultListView()),
        ],
      ),
    );
  }
}
