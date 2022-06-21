import 'package:event_hunter/models/event_model.dart';
import 'package:dio/dio.dart';

class EventAPI {
  static Future<List> getEventFromAPI({
    required String nama,
    required String kota,
  }) async {
    Response responseCoba = await Dio().get(
      'http://10.0.2.2:8000/api/events',
      queryParameters: {
        'nama': nama,
        'kota': kota,
      },
    );
    print(responseCoba.data["url"]);
    if (responseCoba.statusCode == 200) {
      List<dynamic> events = responseCoba.data!["events"].map((e) {
        return EventModel.fromJson(e) as EventModel;
      }).toList();

      List<EventModel> realakun = [];
      for (var element in events) {
        realakun.add(EventModel.fromDynamic(element));
      }

      return realakun;
    }

    throw Exception();
  }
}
