
import 'package:flutter/material.dart';

import '../../../../../core/utils/launch_url.dart';
import '../../../../../core/widgets/custom_button.dart';
import '../../../data/models/book_model/book_model.dart';
class BooksAction extends StatelessWidget {
  const BooksAction({super.key, required this.bookModel});

  final BookModel bookModel;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Row(
        children: [
          const Expanded(
              child: CustomButton(
                text: 'Free',
                backgroundColor: Colors.white,
                textColor: Colors.black,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(16),
                  bottomLeft: Radius.circular(16),
                ),
              )),
          Expanded(
              child: CustomButton(
                onPressed: () {
                  //    bookModel.accessInfo!.pdf?.acsTokenLink?
                  launchCustomUrl(
                    context,
                    bookModel.accessInfo?.pdf?.acsTokenLink,
                  );

                },
                fontSize: 16,
                text: getText(bookModel),
                backgroundColor: const Color(0xffEF8262),
                textColor: Colors.white,
                borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(16),
                  bottomRight: Radius.circular(16),
                ),
              )),
        ],
      ),
    );
  }

  String getText(BookModel bookModel) {
    if (bookModel.accessInfo!.pdf == null) {
      return 'Not Available';
    } else {
      return 'Download';
    }
  }
}