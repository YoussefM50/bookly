import 'package:bookly/Core/utils/styles.dart';
import 'package:bookly/Features/search/presentation/views/widgets/search_results_list_view.dart';
import 'package:flutter/material.dart';
import 'custom_search_text_field.dart';

class SearchViewBody extends StatelessWidget {
  const SearchViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          CustomSearchTextField(),
          SizedBox(
            height: 16,
          ),
          Text(
            'Results',
            style: Styles.textstyle16,
          ),
          SizedBox(
            height: 16,
          ),
          Expanded(child: SearchResultsListView()),
        ],
      ),
    );
  }
}
