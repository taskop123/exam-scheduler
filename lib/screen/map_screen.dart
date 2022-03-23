import 'package:examscheduler/screen/search_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_osm_plugin/flutter_osm_plugin.dart';

class MapScreen extends StatefulWidget {
  static const routeName = '/map';

  final Function? _setLocation;

  const MapScreen(this._setLocation, {Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  ValueNotifier<GeoPoint?> notifier = ValueNotifier(null);

  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ValueListenableBuilder<GeoPoint?>(
            valueListenable: notifier,
            builder: (ctx, p, child) {
              return Center(
                child: Text(
                  p != null? "Success" : "",
                  textAlign: TextAlign.center,
                ),
              );
            },
          ),
          Column(
            children: [
              ElevatedButton(
                onPressed: () async {
                  var p = await Navigator.pushNamed(context, SearchScreen.routeName);
                  if (p != null) {
                    notifier.value = p as GeoPoint;
                    widget._setLocation!(notifier.value);
                  }
                },
                child: const Text("Pick Address"),
              ),
            ],
          ),
        ],
      );
  }
}