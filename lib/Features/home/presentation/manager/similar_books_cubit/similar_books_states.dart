import 'package:bookly/Features/home/data/models/book_model/book_model.dart';
import 'package:equatable/equatable.dart';

abstract class SimilarBooksStates extends Equatable {
  const SimilarBooksStates();

  @override
  List<Object> get props => [];
}

class SimilarBooksInitialState extends SimilarBooksStates {}

class SimilarBooksLoadingState extends SimilarBooksStates {}

class SimilarBooksErrorState extends SimilarBooksStates {
  final String errorMessage;

  const SimilarBooksErrorState(this.errorMessage);
}

class SimilarBooksSuccessState extends SimilarBooksStates {
  final List<BookModel> books;

  const SimilarBooksSuccessState(this.books);
}
