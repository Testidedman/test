enum Marketplace {
  googlePlay,
  ruStore,
}

extension ParseMarketplaceToString on Marketplace {
  /// Конвертирует enum в String
  /// Добавляет нижнее подчёркивание между словами и убирает заглавные буквы
  /* Пример: googlePlay -> google_play */
  String get enumToString {
    final marketplace = toString().split('.').last;
    final RegExp exp = RegExp(r'(?<=[a-z])[A-Z]');
    return marketplace
        .replaceAllMapped(
          exp,
          (Match m) => ('_${m.group(0)!}'),
        )
        .toLowerCase();
  }
}
