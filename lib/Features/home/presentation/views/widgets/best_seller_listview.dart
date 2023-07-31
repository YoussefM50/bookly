import 'package:bookly/Core/utils/widgets/custom_error.dart';
import 'package:bookly/Core/utils/widgets/custom_loading_indicator.dart';
import 'package:bookly/Features/home/presentation/manager/best_seller_cubit/best_seller_cubit.dart';
import 'package:bookly/Features/home/presentation/manager/best_seller_cubit/best_seller_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'best_seller_listview_item.dart';

class BestSellerListView extends StatelessWidget {
  const BestSellerListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BestSellerBooksCubit, BestSellerBooksStates>(
      builder: (context, state) {
        if (state is BestSellerBooksSuccessState) {
          return ListView.builder(
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
                child: BestSellerListViewItem(
                 bookModel: state.books[index],
                ),
              );
            },
            itemCount: state.books.length,
            physics: const NeverScrollableScrollPhysics(),
          );
        } else if (state is BestSellerBooksErrorState) {
          return CustomError(errorMessage: state.errorMessage);
        } else {
          return const CustomLoadingIndicator();
        }
      },
    );
  }
}
