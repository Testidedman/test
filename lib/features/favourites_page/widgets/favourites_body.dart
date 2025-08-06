import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_app/features/favourites_page/bloc/favourites_page_bloc.dart';

class FavouritesBody extends StatefulWidget {
  const FavouritesBody({super.key});

  @override
  State<FavouritesBody> createState() => _FavouritesBodyState();
}

class _FavouritesBodyState extends State<FavouritesBody> {
  @override
  void initState() {
    super.initState();
    // Load favourites when widget is first built
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<FavouritesPageBloc>().add(LoadFavouritesEvent());
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FavouritesPageBloc, FavouritesPageState>(
      builder: (context, state) {
        if (state.isLoading) {
          return const Center(
            child: CircularProgressIndicator(
              color: Colors.white,
            ),
          );
        }

        if (state.favourites.isEmpty) {
          return const Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.favorite_border,
                  size: 64,
                  color: Colors.white54,
                ),
                SizedBox(height: 16),
                Text(
                  'No favourites yet',
                  style: TextStyle(
                    color: Colors.white54,
                    fontSize: 18,
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  'Your favourite items will appear here',
                  style: TextStyle(
                    color: Colors.white38,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          );
        }

        return ListView.builder(
          padding: const EdgeInsets.all(16),
          itemCount: state.favourites.length,
          itemBuilder: (context, index) {
            final book = state.favourites[index];
            return Card(
              color: const Color(0xff2A3643),
              margin: const EdgeInsets.only(bottom: 12),
              child: ListTile(
                leading: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.network(
                    book.profilePicture,
                    width: 50,
                    height: 70,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      return Container(
                        width: 50,
                        height: 70,
                        color: Colors.grey[600],
                        child: const Icon(
                          Icons.book,
                          color: Colors.white,
                        ),
                      );
                    },
                  ),
                ),
                title: Text(
                  book.title,
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (book.author != null)
                      Text(
                        book.author!,
                        style: const TextStyle(
                          color: Colors.white70,
                        ),
                      ),
                    Text(
                      '${book.year} • ${book.pages} стр.',
                      style: const TextStyle(
                        color: Colors.white54,
                      ),
                    ),
                    if (book.averageRating != null)
                      Row(
                        children: [
                          const Icon(
                            Icons.star,
                            color: Colors.amber,
                            size: 16,
                          ),
                          const SizedBox(width: 4),
                          Text(
                            book.averageRating!.toStringAsFixed(1),
                            style: const TextStyle(
                              color: Colors.white70,
                            ),
                          ),
                        ],
                      ),
                  ],
                ),
                trailing: IconButton(
                  icon: const Icon(
                    Icons.favorite,
                    color: Colors.red,
                  ),
                  onPressed: () {
                    context.read<FavouritesPageBloc>().add(
                      RemoveFromFavouritesEvent(bookId: book.id),
                    );
                  },
                ),
              ),
            );
          },
        );
      },
    );
  }
}
