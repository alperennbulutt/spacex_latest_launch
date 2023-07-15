import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../spacex/bloc/spacex_bloc.dart';
import '../spacex/resources/spacex_repository.dart';
import '../spacex/views/space_x_scren.dart';

class AppRouter {
  late SpacexBloc _spacexBloc;

  AppRouter(SpacexService _spacexService) {
    _spacexBloc = SpacexBloc(_spacexService);
  }
  Route onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case SpacexScreen.Route:
        return MaterialPageRoute(
          builder: (_) => BlocProvider.value(
            value: _spacexBloc
              ..add(
                LoadApiEvent(),
              ),
            child: const SpacexScreen(),
          ),
        );

      default:
        return MaterialPageRoute(
          builder: (_) => BlocProvider.value(
            value: _spacexBloc
              ..add(
                LoadApiEvent(),
              ),
            child: const SpacexScreen(),
          ),
        );
    }
  }

  void dispose() {
    _spacexBloc.close();
  }
}
