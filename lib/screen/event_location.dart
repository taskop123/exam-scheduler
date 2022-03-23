import 'package:flutter/material.dart';
import 'package:flutter_osm_plugin/flutter_osm_plugin.dart';

import '../model/exam_class.dart';

class EventLocationScreen extends StatefulWidget {
  static const routeName = "/location";

  const EventLocationScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => EventLocationScreenState();
}

class EventLocationScreenState extends State<EventLocationScreen>
    with AutomaticKeepAliveClientMixin {
  late MapController controller;

  @override
  @mustCallSuper
  Widget build(BuildContext context) {
    final arguments = (ModalRoute.of(context)?.settings.arguments ??
        <String, dynamic>{}) as Map;

    GeoPoint location = arguments['location'];

    controller = MapController(
      initMapWithUserPosition: false,
      initPosition: location,
    );

    super.build(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Event Location"),
      ),
      body: OSMFlutter(
        controller: controller,
        initZoom: 14,
        stepZoom: 2,
        staticPoints: [
          StaticPositionGeoPoint(
              location.toString(),
              const MarkerIcon(
                icon: Icon(
                  Icons.location_on,
                  color: Colors.blue,
                  size: 120,
                ),
              ),
              [location])
        ],
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
