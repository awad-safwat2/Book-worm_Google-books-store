import '../../../../../core/utils/font_styels.dart';
import '../../../domain/entities/searched_book_entity.dart';
import '../../manager/history_cubit/history_cubit.dart';
import '../../manager/search_cubit/search_cubit.dart';
import 'history_body_bloc_builder.dart';
import 'search_result_list_item.dart';
import 'search_result_list_section.dart';
import 'search_view_body_bloc_consumer.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SearchViewBody extends StatelessWidget {
  const SearchViewBody({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    var historyCubit = BlocProvider.of<HistoryCubit>(context);
    var searchCubit = BlocProvider.of<SearchCubit>(context);
    return SafeArea(
        bottom: false,
        child: Padding(
          padding: const EdgeInsets.only(left: 15, top: 20, right: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextField(
                controller: searchCubit.textEditingController,
                onChanged: (value) {
                  if (value.isEmpty) {
                    historyCubit.fecthHistory();
                  } else {
                    searchCubit.fullBooks.clear();
                    searchCubit.fetchSearchedBooks(value);
                  }
                },
                onSubmitted: (value) {
                  if (value.isEmpty) {
                    historyCubit.fecthHistory();
                  } else {
                    searchCubit.fullBooks.clear();
                    searchCubit.fetchSearchedBooks(value);
                  }
                },
                decoration: InputDecoration(
                  hintText: "Search",
                  suffixIcon: const Icon(
                    FontAwesomeIcons.magnifyingGlass,
                    size: 25,
                  ),
                  enabledBorder: myInputBorder(context),
                  focusedBorder: myInputBorder(context),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                'Search Result',
                style: Styels.textStyle18,
              ),
              const SizedBox(
                height: 20,
              ),
              const SearchViewBodyBlocBuilder(),
            ],
          ),
        ));
  }

  OutlineInputBorder myInputBorder(BuildContext context) {
    return OutlineInputBorder(
      borderSide: BorderSide(
        color: MediaQuery.of(context).platformBrightness == Brightness.dark
            ? Colors.white
            : Colors.black,
      ),
      borderRadius: const BorderRadius.all(
        Radius.circular(10),
      ),
    );
  }
}
