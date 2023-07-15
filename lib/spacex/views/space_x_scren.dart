import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spacex_latest_launch/constant/constants.dart';
import 'package:spacex_latest_launch/spacex/bloc/spacex_bloc.dart';

class SpacexScreen extends StatelessWidget {
  static const String Route = '/';
  const SpacexScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: kBackgroundColor,
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
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [
                Card(
                  color: kCardBackgroundColor,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ListTile(
                      title: Text(
                        state.spacexModel.name!,
                        style: kTitleTextStyle,
                      ),
                      trailing: state.spacexModel.links!.patch!.small != null
                          ? Image.network(
                              state.spacexModel.links!.patch!.small!)
                          : const CircularProgressIndicator(),
                    ),
                  ),
                ),

                SizedBox(
                  height: height * 0.01,
                ),

                // url luncher ve sliver eklenecek!!

                Card(
                    color: kCardBackgroundColor,
                    child: Column(
                      children: [
                        Text(
                          kWikipediaText + state.spacexModel.links!.wikipedia!,
                          style: kTitleTextStyle,
                        ),
                      ],
                    )),

                Spacer(),
              ],
            );
          }
          return Text("Something went wrong");
        },
      ),
    );
  }
}
