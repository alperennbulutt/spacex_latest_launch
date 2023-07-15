import 'package:spacex_latest_launch/rest/api_helpers/api_base_helpers.dart';
import 'package:spacex_latest_launch/constant/api_constants.dart'
    as appConstant;

class SpacexService {
  getSpacexData() async {
    final response = await ApiBaseHelper().get(appConstant.BASE_URL);
    return response;
  }
}
