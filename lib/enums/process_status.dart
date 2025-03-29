enum ProcessStatus {
  loading,
  success,
  nextPage
}

extension XProcessStatus on ProcessStatus {
  bool get isLoading => this == ProcessStatus.loading;
  bool get isSuccess => this == ProcessStatus.success;
  bool get isNextPage => this == ProcessStatus.nextPage;
}