import 'package:bloc/bloc.dart';
import 'package:test_app/features/loading_page/repository/loading_page_repository.dart';

part 'loading_page_event.dart';
part 'loading_page_state.dart';

class LoadingPageBloc extends Bloc<LoadingPageEvent, LoadingPageState> {
  LoadingPageBloc({required final ILoadingPageRepository loadingPageRepository})
      : _loadingPageRepository = loadingPageRepository,
        super(LoadingPageState()) {
    on<LoadingPageEventInit>(_init);
  }

    final ILoadingPageRepository _loadingPageRepository;

    Future<void> _init(LoadingPageEventInit event, Emitter<LoadingPageState> emit) async {
      await _loadingPageRepository.getHealthCheck();
    }
}
