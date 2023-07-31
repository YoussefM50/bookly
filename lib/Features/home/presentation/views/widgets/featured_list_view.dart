import 'package:bookly/Core/utils/widgets/custom_error.dart';
import 'package:bookly/Core/utils/widgets/custom_loading_indicator.dart';
import 'package:bookly/Features/home/presentation/manager/featured_list_cubit/featured_list_cubit.dart';
import 'package:bookly/Features/home/presentation/manager/featured_list_cubit/featured_list_states.dart';
import 'package:bookly/Features/home/presentation/views/widgets/custom_listview_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../../Core/utils/app_routes.dart';

class FeaturedListView extends StatelessWidget {
  const FeaturedListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FeaturedBooksCubit, FeaturedBooksStates>(
      builder: (context, state) {
        if (state is FeaturedBooksSuccessState) {
          return SizedBox(
            height: MediaQuery.of(context).size.height * .3,
            child: ListView.builder(
                itemCount: state.books.length,
                physics: const BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                       GoRouter.of(context)
                          .push(AppRoutes.kBookDeatailsView, extra: state.books[index]);
                    },
                    child: CustomListViewItem(
                      imageUrl:
                          state.books[index].volumeInfo.imageLinks?.thumbnail ??
                              '',
                    ),
                  );
                }),
          );
        } else if (state is FeaturedBooksErrorState) {
          return CustomError(errorMessage: state.errorMessage);
        } else {
          return const CustomLoadingIndicator();
        }
      },
    );
  }
}
