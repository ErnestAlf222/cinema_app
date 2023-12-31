import 'package:cinemapedia/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cinemapedia/presentation/providers/providers.dart';
import 'package:go_router/go_router.dart';


class FavoritesView extends ConsumerStatefulWidget {
  const FavoritesView({super.key});

  @override
  FavoritesViewState createState() => FavoritesViewState();
}

class FavoritesViewState extends ConsumerState<FavoritesView> with AutomaticKeepAliveClientMixin {

  bool isLastPage = false;
  bool isLoading = false;

  @override
  void initState() {
    super.initState();

    loadNextPage();

  }

  void loadNextPage() async {

    if ( isLoading || isLastPage ) return;
    isLoading = true;

    final movies = await ref.read(favoriteMoviesProvider.notifier).loadNextPage();
    isLoading = false;

    if ( movies.isEmpty ) {
      isLastPage = true;
    }

  }


  @override
  Widget build(BuildContext context) {
    super.build(context);

    final favoriteMovies = ref.watch(favoriteMoviesProvider).values.toList();


    if ( favoriteMovies.isEmpty ) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
         children: [

            const Icon(Icons.video_camera_back_sharp, size: 250, color: Color(0xffB7FF63),),
            const Text('Ohh no!!', style: TextStyle( fontSize: 30, color: Color(0xffB7FF63)),),
            const SizedBox(height: 20),

            const Text('No tienes películas favoritas', style: TextStyle( fontSize: 20, color:  Color(0xffB7FF63)),),

            const SizedBox(height: 20),
            FilledButton.tonal(onPressed: () => context.go('/home/0'), 
              child: const Text('Empieza a buscar'))

          ],
        ),
      );
    }




    return Scaffold(
      body: MovieMasonry(
        loadNextPage: loadNextPage,
        movies: favoriteMovies
      )
    );
  }
  
  @override
  bool get wantKeepAlive => true;
}