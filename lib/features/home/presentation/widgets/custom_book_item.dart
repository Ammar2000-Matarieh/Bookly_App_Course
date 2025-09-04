import 'package:bookly/core/utils/app_routers.dart';
import 'package:bookly/core/widgets/custom_error_widget.dart';
import 'package:bookly/core/widgets/custom_loading_indicator.dart';
import 'package:bookly/features/home/presentation/manager/featured_books_cubit/featured_book_cubit.dart';
import 'package:bookly/features/home/presentation/widgets/custom_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class FeaturedBooksListView extends StatefulWidget {
  const FeaturedBooksListView({super.key});

  @override
  State<FeaturedBooksListView> createState() => _FeaturedBooksListViewState();
}

class _FeaturedBooksListViewState extends State<FeaturedBooksListView> {
  late final ScrollController _scrollController;
  var nextPage = 1;
  var isLoading = false;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _scrollController.addListener(_scrollListener);
  }

  // add :

  // len
  void _scrollListener() async {
    var currentPosition = _scrollController.position.pixels;
    var maxScroll = _scrollController.position.maxScrollExtent;
    if (currentPosition >= 0.7 * maxScroll) {
      if (!isLoading) {
        isLoading = true;
        await BlocProvider.of<FeaturedBookCubit>(
          context,
        ).fetchFeatured(pageNumber: nextPage++);
        isLoading = false;
      }
      // هون بنعمل trigger اكثر من مره مش سليم :
      // لما يخلص ال request : الاول :
      // nextPage++;
    }
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();

    _scrollController.dispose();
  }

  // pagination : loading
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FeaturedBookCubit, FeaturedBookState>(
      builder: (context, state) {
        if (state is FeaturedBookSuccess) {
          return SizedBox(
            height: MediaQuery.of(context).size.height * .3,
            child: ListView.builder(
              controller: _scrollController,
              physics: BouncingScrollPhysics(),
              itemCount: state.books.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) => Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: GestureDetector(
                  onTap: () {
                    GoRouter.of(context).push(
                      AppRouters.kBookDetailsView,
                      extra: state.books[index],
                    );
                  },
                  child: CustomBookImage(
                    imageUrl:
                        state.books[index].volumeInfo.imageLinks?.thumbnail ??
                        "",
                  ),
                ),
              ),
            ),
          );
        } else if (state is FeaturedBookFailure) {
          return CustomErrorWidget(errorMessage: state.errMessage);
        } else {
          return CustomLoadingIndicator();
        }
      },
    );
  }
}
