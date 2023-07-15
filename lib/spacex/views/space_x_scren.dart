import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spacex_latest_launch/spacex/bloc/spacex_bloc.dart';

class SpacexScreen extends StatelessWidget {
  static const String Route = '/';
  const SpacexScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Spacex Screen"),
      ),
      body: BlocBuilder<SpacexBloc, SpacexState>(
        builder: (context, state) {
          if (state is SpacexInitial) {
            return Text("Initial Text");
          }
          if (state is SpacexLoading) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is SpacexLoaded) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Text(
                    state.spacexModel.name!,
                  ),
                  // Text(
                  //   state.spacexModel.type,
                  // ),
                  // Text(
                  //   state.spacexModel.participants.toString(),
                  // ),
                  // ElevatedButton(
                  //   onPressed: () {
                  //     context.read<BoredBloc>().add(LoadApiEvent());
                  //   },
                  //   child: Text("Load New Activity"),
                  // ),
                ],
              ),
            );
          }
          return Text("Failed");
        },
      ),
    );
  }
}
