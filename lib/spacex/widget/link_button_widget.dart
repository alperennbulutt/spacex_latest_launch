import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spacex_latest_launch/constant/constants.dart';
import 'package:spacex_latest_launch/spacex/bloc/spacex_bloc.dart';
import 'package:spacex_latest_launch/spacex/resources/url_launcher.dart';

class LinkButtonWidget extends StatelessWidget {
  LinkButtonWidget({
    Key? key,
    required this.title,
    required this.url,
  }) : super(key: key);

  final String title;
  final String url;

  final UrlLauncher urlLauncher = UrlLauncher();

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return BlocBuilder<SpacexBloc, SpacexState>(
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
          return TextButton(
              onPressed: () {
                urlLauncher.launchUrl(url);
              },
              child: Row(
                children: [
                  Container(
                    width: width * 0.2,
                    child: Text(
                      title,
                      style: kDetailBodyImportantInfoTextStyle,
                    ),
                  ),
                  Flexible(
                    child: Text(
                      url,
                      style: kDetailBodyLinkTextStyle,
                    ),
                  ),
                ],
              ));
        }
        return Text("Something went wrong");
      },
    );
  }
}
