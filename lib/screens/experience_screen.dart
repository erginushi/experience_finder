import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_map/flutter_map.dart';

class ExperienceScreen extends StatefulWidget {
  final dynamic data;
  const ExperienceScreen({super.key, this.data});

  @override
  State<ExperienceScreen> createState() => _ExperienceScreenState();
}

class _ExperienceScreenState extends State<ExperienceScreen> {
  bool favourited = false;
  @override
  Widget build(BuildContext context) {
    double sw = MediaQuery.of(context).size.width;
    double sh = MediaQuery.of(context).size.height;
    return Container(
      color: Colors.white,
      child: SingleChildScrollView(
        child: SizedBox(
          height: sh,
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Hero(
                  tag: widget.data['id'],
                  child: Container(
                    child: Stack(
                      clipBehavior: Clip.antiAlias,
                      alignment: Alignment.topLeft,
                      children: [
                        Stack(
                          clipBehavior: Clip.antiAlias,
                          alignment: Alignment.bottomRight,
                          children: [
                            Image.network(
                                'https://albania360.com/wp-content/uploads/2022/06/286705471_5226925277344994_9150394650843000115_n-e1655302581295.jpg'),
                            TextButton(
                              style: ButtonStyle(
                                overlayColor: MaterialStateProperty.all(
                                    Colors.transparent),
                              ),
                              onPressed: () {
                                setState(() {
                                  favourited = !favourited;
                                });
                              },
                              child: new ClipRRect(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(60)),
                                child: new BackdropFilter(
                                  filter: new ImageFilter.blur(
                                      sigmaX: 10.0, sigmaY: 10.0),
                                  child: new Container(
                                    width: 60.0,
                                    height: 60.0,
                                    decoration: new BoxDecoration(
                                        color: Colors.grey.shade200
                                            .withOpacity(0.5)),
                                    child: new Center(
                                      child: new Icon(
                                        favourited
                                            ? Icons.favorite
                                            : Icons.favorite_border,
                                        size: 33,
                                        color: favourited
                                            ? Colors.redAccent
                                            : Color.fromRGBO(0, 0, 0, 0.6),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 40, left: 8),
                          child: TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: new ClipRRect(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(60)),
                              child: new BackdropFilter(
                                filter: new ImageFilter.blur(
                                    sigmaX: 10.0, sigmaY: 10.0),
                                child: new Container(
                                  width: 50.0,
                                  height: 50.0,
                                  decoration: new BoxDecoration(
                                      color: Colors.grey.shade200
                                          .withOpacity(0.5)),
                                  child: new Center(
                                    child: new Icon(
                                      Icons.arrow_back,
                                      size: 33,
                                      color: Color.fromRGBO(0, 0, 0, 0.6),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      left: 24, top: 16, right: 24, bottom: 4),
                  child: Text(
                    'Petrela ZIP LINE',
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 18),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      left: 24, top: 4, right: 24, bottom: 4),
                  child: Text(
                    "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type",
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.normal,
                        fontSize: 18),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(8)),
                    child: Container(
                      width: sw,
                      height: 200,
                      child: FlutterMap(
                        mapController: MapController(),
                        options: MapOptions(),
                        children: [
                          TileLayer(
                            urlTemplate:
                                'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                            userAgentPackageName: 'com.example.app',
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      left: 24, top: 16, right: 24, bottom: 4),
                  child: Text(
                    'Reviews and photos',
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 18),
                  ),
                ),
              ]),
        ),
      ),
    );
  }

  void onPressed() {}
}
