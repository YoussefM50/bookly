import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/repos/home_repo.dart';
import 'best_seller_states.dart';

class BestSellerBooksCubit extends Cubit<BestSellerBooksStates> {
  BestSellerBooksCubit(this.homeRepo) : super(BestSellerBooksInitialState());

  final HomeRepo homeRepo;

  Future<void> fetchBestSellerBooks() async {
    emit(BestSellerBooksLoadingState());
    var result = await homeRepo.fetchNewestBooks();

    return result.fold((failure) {
      emit(BestSellerBooksErrorState(failure.errorMessage));
    }, (books) {
      emit(BestSellerBooksSuccessState(books));
    });
  }
}
