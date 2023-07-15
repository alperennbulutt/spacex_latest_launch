import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:spacex_latest_launch/spacex/models/space_x_model.dart';

import '../resources/spacex_repository.dart';

part 'spacex_event.dart';
part 'spacex_state.dart';

class SpacexBloc extends Bloc<SpacexEvent, SpacexState> {
  final SpacexService _spacexService;
  SpacexBloc(this._spacexService) : super(SpacexInitial()) {
    on<LoadApiEvent>((event, emit) async {
      emit(SpacexLoading());
      try {
        final activity = await _spacexService.getSpacexData();
        emit(
          SpacexLoaded(
            spaceXModelFromJson(activity),
          ),
        );
      } catch (e) {
        emit(
          SpacexLoadingFailed(e.toString()),
        );
      }
    });
  }
}
