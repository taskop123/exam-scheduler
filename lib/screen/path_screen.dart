import 'package:flutter/material.dart';
import 'package:flutter_osm_plugin/flutter_osm_plugin.dart';

import '../model/exam_class.dart';

class PathScreen extends StatefulWidget {
  static const routeName = "/path";

  const PathScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => PathScreenState();
}

class PathScreenState extends State<PathScreen>
    with AutomaticKeepAliveClientMixin {
  late MapController controller;

  @override
  @mustCallSuper
  Widget build(BuildContext context) {
    super.build(context);
    final arguments = (ModalRoute.of(context)?.settings.arguments ??
        <String, dynamic>{}) as Map;

    GeoPoint location = arguments['location'];

    controller = MapController(
      initMapWithUserPosition: true,
    );

    void drawMultiRoads() async {
      GeoPoint currPosition = await controller.myLocation();

      final configs = [
        MultiRoadConfiguration(
          startPoint: currPosition,
          destinationPoint: location,
        ),
      ];
      controller.drawMultipleRoad(
        configs,
        commonRoadOption: const MultiRoadOption(
          roadType: RoadType.car,
          roadColor: Colors.red,
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text("Path"),
      ),
      body: OSMFlutter(
        controller: controller,
        initZoom: 14,
        stepZoom: 2,
        onMapIsReady: (isReady) {
          drawMultiRoads();
        },
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
        trackMyPosition: true,
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
