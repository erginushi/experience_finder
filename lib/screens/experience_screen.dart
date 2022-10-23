import 'dart:ui';

import 'package:epxerience_finder/components/reviews.dart';
import 'package:epxerience_finder/components/your_comment.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart' as latLng;
import 'package:photo_view/photo_view.dart';
import 'package:carousel_slider/carousel_slider.dart';

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
    print(widget.data);
    double sw = MediaQuery.of(context).size.width;
    double sh = MediaQuery.of(context).size.height;
    return Container(
      color: Colors.white,
      child: SingleChildScrollView(
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Hero(
                tag: widget.data['id'],
                child: Container(
                  child: Stack(
                    clipBehavior: Clip.none,
                    alignment: Alignment.topLeft,
                    children: [
                      Stack(
                        clipBehavior: Clip.antiAlias,
                        alignment: Alignment.bottomRight,
                        children: [
                          CarouselSlider(
                            options: CarouselOptions(),
                            items: [
                              for (var i = 0;
                                  i < widget.data['image'].length;
                                  i++)
                                Builder(
                                  builder: (BuildContext context) {
                                    return Image.network(
                                      widget.data['image'][i],
                                      fit: BoxFit.cover,
                                    );
                                  },
                                )
                            ],
                          ),
                          TextButton(
                            style: ButtonStyle(
                              overlayColor:
                                  MaterialStateProperty.all(Colors.transparent),
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
                                  width: 30.0,
                                  height: 30.0,
                                  decoration: new BoxDecoration(
                                      color: Colors.grey.shade200
                                          .withOpacity(0.5)),
                                  child: new Center(
                                    child: new Icon(
                                      favourited
                                          ? Icons.favorite
                                          : Icons.favorite_border,
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
                          style: ButtonStyle(
                            overlayColor:
                                MaterialStateProperty.all(Colors.transparent),
                          ),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: new ClipRRect(
                            borderRadius: BorderRadius.all(Radius.circular(60)),
                            child: new BackdropFilter(
                              filter: new ImageFilter.blur(
                                  sigmaX: 10.0, sigmaY: 10.0),
                              child: new Container(
                                width: 30.0,
                                height: 30.0,
                                decoration: new BoxDecoration(
                                    color:
                                        Colors.grey.shade200.withOpacity(0.5)),
                                child: new Center(
                                  child: new Icon(
                                    Icons.arrow_back,
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
                padding: const EdgeInsets.only(
                    left: 24, top: 16, right: 24, bottom: 4),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Tags',
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 18)),
                      Row(
                        children: [
                          for (var i = 0; i < widget.data['tags'].length; i++)
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Chip(
                                  backgroundColor: Colors.blueAccent,
                                  label: Text(
                                    widget.data['tags'][i],
                                    style: TextStyle(color: Colors.white),
                                  )),
                            )
                        ],
                      )
                    ]),
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
                      options:
                          MapOptions(center: latLng.LatLng(41.3275, 19.8187)),
                      children: [
                        MarkerLayer(
                          markers: [
                            Marker(
                              width: 80.0,
                              height: 80.0,
                              point: latLng.LatLng(41.3275, 19.8187),
                              builder: (ctx) => Container(
                                child: FlutterLogo(),
                              ),
                            ),
                          ],
                        ),
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
              Reviews(),
              SizedBox(
                height: 40,
              )
            ]),
      ),
    );
  }

  void onPressed() {}
}
