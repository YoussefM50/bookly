import 'package:flutter/material.dart';

class SearchResultsListView extends StatelessWidget {
  const SearchResultsListView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        return const Text('data');
        // return const BestSellerListViewItem();
      },
      itemCount: 10,
      physics: const BouncingScrollPhysics(),
    );
  }
}
