import '../../../../core/utils/functions.dart';
import '../../../auth/presentation/manager/sign_in-cubit/sign_in_cubit.dart';
import '../../../auth/presentation/views/widgets/user_not_signed_in_view.dart';
import '../../../home/domain/entities/book_entity.dart';
import '../manager/get_my_books_cubit/get_my_books_cubit.dart';
import 'my_books_list_item_g_detector.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyBooksViewBlocConsumer extends StatelessWidget {
  const MyBooksViewBlocConsumer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<GetMyBooksCubit, GetMyBooksState>(
      builder: (context, state) {
        if (state is GetMyBooksCubitFailure) {
          return Center(
            child: Text(state.faluer.massege),
          );
        } else if (state is GetMyBooksCubitSuccess ||
            state is GetMyBooksCubitPaginationLoading ||
            state is GetMyBooksCubitPaginationfaluer) {
          return ListView.builder(
            controller: BlocProvider.of<GetMyBooksCubit>(context)
                .getMyBooksScrollController,
            itemCount: BlocProvider.of<GetMyBooksCubit>(context).booklst.length,
            itemBuilder: (context, index) {
              BookEntity book =
                  BlocProvider.of<GetMyBooksCubit>(context).booklst[index];
              return MyBooksListItemsGDetector(book: book);
            },
          );
        } else if (state is GetMyBooksCubitUserNotSigned) {
          return UserNotSignedView(
            onPressed: () {
              BlocProvider.of<GetMyBooksCubit>(context).getMyBooks();
            },
          );
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
      listener: (context, state) async {
        if (state is GetMyBooksCubitNotAuthorized) {
          BlocProvider.of<GetMyBooksCubit>(context).justEmitLoading();
          await BlocProvider.of<SignInCubit>(context)
              .signInGoogle()
              .then((value) {
            BlocProvider.of<GetMyBooksCubit>(context).getMyBooks(
                pageNumber:
                    BlocProvider.of<GetMyBooksCubit>(context).pageNumber);
          });
        }
        if (state is GetMyBooksCubitUserNotSigned) {
          return await showSignInDialog(context);
        }
        if (state is GetMyBooksCubitSuccess) {
          if (context.mounted) {
            BlocProvider.of<GetMyBooksCubit>(context)
                .getMyBooksScrollControllerSetUp(context);
            BlocProvider.of<GetMyBooksCubit>(context).pageNumber++;
          }
        }
        if (state is GetMyBooksCubitPaginationfaluer) {
          showToast(state.faluer.massege);
        }
      },
    );
  }
}
