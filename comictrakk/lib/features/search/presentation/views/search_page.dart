import 'package:comictrakk/core/constants/app_assets.dart';
import 'package:comictrakk/core/models/series/series_preview.dart';
import 'package:comictrakk/core/widgets/custom_separator.dart';
import 'package:comictrakk/features/search/presentation/cubit/search_cubit.dart';
import 'package:comictrakk/features/search/presentation/cubit/search_state.dart';
import 'package:comictrakk/features/search/presentation/widgets/series_preview_list_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});
  
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SearchCubit(),
      child: SearchView(),
    );
  }
}

class SearchView extends StatelessWidget {
  final _controller = TextEditingController(text: "Spider Noir");

  SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            getSearchBox(context),
            BlocBuilder<SearchCubit, SearchState>(
                builder: (context, state) {
                  if(state is SearchInitial) return getIdleLogo();
                  if(state is SearchLoading) return getLoadingIndicator();
                  if(state is SearchLoaded) return getSeriesList(state.results);
                  if(state is SearchError) return Text("something went wrong");

                  return Text("the bad guys did something very bad to the app, try closing it");
                })
          ],
        )
      )
    );
  }

  Row getSearchBox(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 8,
          child: TextField(
            controller: _controller,
            decoration: InputDecoration(
              hintText: "Search series, arcs, characters..."
            ),
          ),
        ),
        Expanded(
          flex: 2,
          child: IconButton(
            icon: Icon(Icons.search),
            onPressed: () => (context.read<SearchCubit>().search(_controller.text)),
          )
        )
      ],
    );
  }

  Expanded getIdleLogo(){
    return Expanded(
        child: SvgPicture.asset(
          AppAssets.batmanLogo,
          width: 110,
          height: 110,
          fit: BoxFit.contain,
        )
    );
  }

  Center getLoadingIndicator(){
    return Center(child: CircularProgressIndicator());
  }

  Expanded getSeriesList(List<SeriesPreview> seriesPreviews){
    return Expanded(
        child: ListView.separated(
        padding: const EdgeInsets.all(8),
        itemCount: seriesPreviews.length,
        itemBuilder: (BuildContext context, int index) {
          return SeriesPreviewListItem(seriesPreview: seriesPreviews[index]);
        },
        separatorBuilder: (context, index) => CustomSeparator()
      )
    );
  }
}