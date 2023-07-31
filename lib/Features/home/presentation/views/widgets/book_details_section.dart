import 'package:bookly/Features/home/data/models/book_model/book_model.dart';
import 'package:flutter/material.dart';

import '../../../../../Core/utils/styles.dart';
import 'book_rating_best_seller.dart';
import 'button_action.dart';
import 'custom_listview_item.dart';

class BookDetailsSection extends StatelessWidget {
  const BookDetailsSection({super.key, required this.bookModel});

  final BookModel bookModel;

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: width * .2),
          child: CustomListViewItem(
            imageUrl: bookModel.volumeInfo.imageLinks?.thumbnail ??
                'https://www.google.com/images/branding/googlelogo/1x/googlelogo_color_272x92dp.png',
          ),
        ),
        const SizedBox(
          height: 43,
        ),
        Text(bookModel.volumeInfo.title!, style: Styles.textstyle30),
        const SizedBox(
          height: 6,
        ),
        Opacity(
          opacity: .7,
          child: Text(
            bookModel.volumeInfo.authors![0],
            style: Styles.textstyle18.copyWith(
              fontStyle: FontStyle.italic,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        const SizedBox(
          height: 18,
        ),
        BookRating(
          mainAxisAlignment: MainAxisAlignment.center,
          rating: bookModel.volumeInfo.averageRating?? 0,
          count: bookModel.volumeInfo.ratingsCount ?? 0,
        ),
        const SizedBox(
          height: 37,
        ),
         ButtonAction(
          bookModel: bookModel,
         ),
      ],
    );
  }
}
