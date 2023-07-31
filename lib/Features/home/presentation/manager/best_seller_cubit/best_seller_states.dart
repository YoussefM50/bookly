import 'package:equatable/equatable.dart';

import '../../../data/models/book_model/book_model.dart';

abstract class BestSellerBooksStates extends Equatable {
  const BestSellerBooksStates();

  @override
  List<Object> get props => [];
}

class BestSellerBooksInitialState extends BestSellerBooksStates {}

class BestSellerBooksLoadingState extends BestSellerBooksStates {}

class BestSellerBooksErrorState extends BestSellerBooksStates {
  final String errorMessage;

  const BestSellerBooksErrorState(this.errorMessage);
}

class BestSellerBooksSuccessState extends BestSellerBooksStates {
  final List<BookModel> books;

  const BestSellerBooksSuccessState(this.books);
}
