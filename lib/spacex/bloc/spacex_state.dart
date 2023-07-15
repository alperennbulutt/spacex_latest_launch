part of 'spacex_bloc.dart';

abstract class SpacexState extends Equatable {
  const SpacexState();

  @override
  List<Object> get props => [];
}

class SpacexInitial extends SpacexState {}

class SpacexLoading extends SpacexState {}

class SpacexLoadingFailed extends SpacexState {
  final String message;

  const SpacexLoadingFailed(this.message);

  @override
  List<Object> get props => [message];
}

class SpacexLoaded extends SpacexState {
  final SpaceXModel spacexModel;

  const SpacexLoaded(this.spacexModel);

  @override
  List<Object> get props => [spacexModel];
}
