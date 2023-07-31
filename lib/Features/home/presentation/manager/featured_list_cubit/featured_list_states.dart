import 'package:bookly/Features/home/data/models/book_model/book_model.dart';
import 'package:equatable/equatable.dart';

abstract class FeaturedBooksStates extends Equatable {
  const FeaturedBooksStates();

  @override
  List<Object> get props => [];
}

class FeaturedBooksInitialState extends FeaturedBooksStates {}

class FeaturedBooksLoadingState extends FeaturedBooksStates {}

class FeaturedBooksErrorState extends FeaturedBooksStates {
  final String errorMessage;

  const FeaturedBooksErrorState(this.errorMessage);
}

class FeaturedBooksSuccessState extends FeaturedBooksStates {
  final List<BookModel> books;

const  FeaturedBooksSuccessState(this.books);
}
