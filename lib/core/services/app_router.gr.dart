// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'app_router.dart';

/// generated route for
/// [BookPage]
class BookRoute extends PageRouteInfo<BookRouteArgs> {
  BookRoute({required String bookId, Key? key, List<PageRouteInfo>? children})
      : super(
          BookRoute.name,
          args: BookRouteArgs(bookId: bookId, key: key),
          initialChildren: children,
        );

  static const String name = 'BookRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<BookRouteArgs>();
      return BookPage(bookId: args.bookId, key: args.key);
    },
  );
}

class BookRouteArgs {
  const BookRouteArgs({required this.bookId, this.key});

  final String bookId;

  final Key? key;

  @override
  String toString() {
    return 'BookRouteArgs{bookId: $bookId, key: $key}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! BookRouteArgs) return false;
    return bookId == other.bookId && key == other.key;
  }

  @override
  int get hashCode => bookId.hashCode ^ key.hashCode;
}

/// generated route for
/// [HomePage]
class HomeRoute extends PageRouteInfo<void> {
  const HomeRoute({List<PageRouteInfo>? children})
      : super(HomeRoute.name, initialChildren: children);

  static const String name = 'HomeRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const HomePage();
    },
  );
}

/// generated route for
/// [LoadingPage]
class LoadingRoute extends PageRouteInfo<void> {
  const LoadingRoute({List<PageRouteInfo>? children})
      : super(LoadingRoute.name, initialChildren: children);

  static const String name = 'LoadingRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const LoadingPage();
    },
  );
}

/// generated route for
/// [LogInPage]
class LogInRoute extends PageRouteInfo<void> {
  const LogInRoute({List<PageRouteInfo>? children})
      : super(LogInRoute.name, initialChildren: children);

  static const String name = 'LogInRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const LogInPage();
    },
  );
}

/// generated route for
/// [MainPage]
class MainRoute extends PageRouteInfo<void> {
  const MainRoute({List<PageRouteInfo>? children})
      : super(MainRoute.name, initialChildren: children);

  static const String name = 'MainRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const MainPage();
    },
  );
}

/// generated route for
/// [ProfilePage]
class ProfileRoute extends PageRouteInfo<void> {
  const ProfileRoute({List<PageRouteInfo>? children})
      : super(ProfileRoute.name, initialChildren: children);

  static const String name = 'ProfileRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const ProfilePage();
    },
  );
}

/// generated route for
/// [SettingsPage]
class SettingsRoute extends PageRouteInfo<void> {
  const SettingsRoute({List<PageRouteInfo>? children})
      : super(SettingsRoute.name, initialChildren: children);

  static const String name = 'SettingsRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const SettingsPage();
    },
  );
}

/// generated route for
/// [TechnicalWorkPage]
class TechnicalWorkRoute extends PageRouteInfo<void> {
  const TechnicalWorkRoute({List<PageRouteInfo>? children})
      : super(TechnicalWorkRoute.name, initialChildren: children);

  static const String name = 'TechnicalWorkRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const TechnicalWorkPage();
    },
  );
}

/// generated route for
/// [UpdateAvailablePage]
class UpdateAvailableRoute extends PageRouteInfo<void> {
  const UpdateAvailableRoute({List<PageRouteInfo>? children})
      : super(UpdateAvailableRoute.name, initialChildren: children);

  static const String name = 'UpdateAvailableRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const UpdateAvailablePage();
    },
  );
}
