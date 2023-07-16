import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spacex_latest_launch/constant/constants.dart';
import 'package:spacex_latest_launch/spacex/bloc/spacex_bloc.dart';
import 'package:spacex_latest_launch/spacex/widget/info_text_widget.dart';
import 'package:spacex_latest_launch/spacex/widget/link_button_widget.dart';

class SpacexScreen extends StatelessWidget {
  static const String Route = '/';
  SpacexScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: BlocBuilder<SpacexBloc, SpacexState>(
        builder: (context, state) {
          if (state is SpacexInitial) {
            return const Text("Initial Text");
          }
          if (state is SpacexLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is SpacexLoaded) {
            return RefreshIndicator(
              onRefresh: () async {
                BlocProvider.of<SpacexBloc>(context).add(LoadApiEvent());
              },
              child: ListView.builder(
                itemCount: 1,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return Container(
                    width: width,
                    height: height,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        // Name and image
                        Card(
                          color: kCardBackgroundColor,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: ListTile(
                              title: Text(
                                state.spacexModel.name!,
                                style: kTitleTextStyle,
                              ),
                              trailing: state.spacexModel.links!.patch!.small !=
                                      null
                                  ? Image.network(
                                      state.spacexModel.links!.patch!.small!)
                                  : const CircularProgressIndicator(),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: height * 0.01,
                        ),

                        // Details
                        Card(
                            color: kCardBackgroundColor,
                            child: Padding(
                              padding: EdgeInsets.only(
                                  left: width * 0.02, right: width * 0.02),
                              child: Column(
                                children: [
                                  SizedBox(
                                    height: height * 0.01,
                                  ),
                                  // details title
                                  const Text(
                                    kDetailsText,
                                    style: kTitleTextStyle,
                                  ),

                                  infoWidget(
                                      title: "",
                                      value: state.spacexModel.details == null
                                          ? "No details available :("
                                          : state.spacexModel.details!),

                                  // flight number
                                  infoWidget(
                                      title: kFlightNumberText,
                                      value: state.spacexModel.flightNumber
                                          .toString()),

                                  // date utc
                                  infoWidget(
                                      title: kDateText,
                                      value: state.spacexModel.dateUtc!
                                          .toString()),

                                  // wikipedia link
                                  LinkButtonWidget(
                                      title: kWikipediaText,
                                      url: state.spacexModel.links!.wikipedia!),

                                  // youtube link
                                  LinkButtonWidget(
                                      title: kYoutubeText,
                                      url: state.spacexModel.links!.webcast!),

                                  // reddit link
                                  LinkButtonWidget(
                                      title: kRedditText,
                                      url: state
                                          .spacexModel.links!.reddit!.launch!),
                                ],
                              ),
                            )),
                        Spacer(),
                      ],
                    ),
                  );
                },
              ),
            );
          }
          return Text("Something went wrong");
        },
      ),
    );
  }
}
