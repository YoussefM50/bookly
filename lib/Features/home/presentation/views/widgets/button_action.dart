import 'package:bookly/Core/utils/functions/launch_url.dart';
import 'package:bookly/Features/home/data/models/book_model/book_model.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../../Core/utils/widgets/custom_button.dart';

class ButtonAction extends StatelessWidget {
  const ButtonAction({super.key, required this.bookModel});

  final BookModel bookModel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Row(
        children: [
          Expanded(
            child: CustomButton(
                onPressed: () {},
                backgroundColor: Colors.white,
                buttonText: '19.99 €',
                textColor: Colors.black,
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(16),
                    bottomLeft: Radius.circular(16))),
          ),
          Expanded(
            child: CustomButton(
                onPressed: () {
                  launchCustomUr(context, bookModel.volumeInfo.previewLink!);
                },
                buttonText: getText(bookModel),
                backgroundColor: const Color(0xffEF8262),
                textColor: Colors.white,
                borderRadius: const BorderRadius.only(
                    topRight: Radius.circular(16),
                    bottomRight: Radius.circular(16))),
          ),
        ],
      ),
    );
  }
}

 String getText(BookModel bookModel) {
    if (bookModel.volumeInfo.previewLink == null) {
      return 'Not Avaliable';
    } else {
      return 'Preview';
    }
  }
