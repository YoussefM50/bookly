import 'package:bookly/Core/utils/app_routes.dart';
import 'package:bookly/Core/utils/service_locator.dart';
import 'package:bookly/Features/home/data/repos/home_repo_implementaion.dart';
import 'package:bookly/Features/home/presentation/manager/best_seller_cubit/best_seller_cubit.dart';
import 'package:bookly/Features/home/presentation/manager/featured_list_cubit/featured_list_cubit.dart';
import 'package:bookly/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  setup();
  runApp(const BooklyApp());
}

class BooklyApp extends StatelessWidget {
  const BooklyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (context) =>
                FeaturedBooksCubit(getIt.get<HomeRepoImplementation>())
                  ..fetchFeaturedBooks()),
        BlocProvider(
            create: (context) =>
                BestSellerBooksCubit(getIt.get<HomeRepoImplementation>())..fetchBestSellerBooks()),
      ],
      child: MaterialApp.router(
        routerConfig: AppRoutes.router,
        debugShowCheckedModeBanner: false,
        theme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: kPrimaryColor,
          textTheme:
              GoogleFonts.montserratTextTheme(ThemeData.dark().textTheme),
        ),
      ),
    );
  }
}
