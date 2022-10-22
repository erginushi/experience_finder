import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:image_viewer/image_viewer.dart';
import 'package:latlong2/latlong.dart' as latLng;

class AddExperience extends StatefulWidget {
  const AddExperience({
    super.key,
  });

  @override
  State<AddExperience> createState() => _AddExperienceState();
}

class _AddExperienceState extends State<AddExperience> {
  @override
  Widget build(BuildContext context) {
    double sw = MediaQuery.of(context).size.width;
    TextEditingController nameController = new TextEditingController();
    TextEditingController descriptionController = new TextEditingController();

    return Container(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 48),
        child: SingleChildScrollView(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Add your experience",
                  style: TextStyle(fontSize: 24),
                ),
                SizedBox(
                  height: 40,
                ),
                Text('Name'),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: TextField(
                    controller: nameController,
                    decoration: InputDecoration(
                      hintText: 'Add name',
                      border: new OutlineInputBorder(
                          borderSide: new BorderSide(color: Colors.teal)),
                    ),
                    maxLines: 1,
                  ),
                ),
                SizedBox(
                  height: 12,
                ),
                Text('Description'),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: TextField(
                    controller: descriptionController,
                    decoration: InputDecoration(
                      hintText: 'Add description',
                      border: new OutlineInputBorder(
                          borderSide: new BorderSide(color: Colors.teal)),
                    ),
                    maxLines: 4,
                  ),
                ),
                SizedBox(
                  height: 12,
                ),
                Text('Location'),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 12.0),
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
                SizedBox(
                  height: 24,
                ),
                Text('Pictures'),
                SizedBox(
                  height: 8,
                ),
                Wrap(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 4, vertical: 0),
                      child: TextButton(
                        onPressed: () => {},
                        child: Container(
                          width: 50,
                          height: 50,
                          child: Icon(Icons.add_a_photo),
                        ),
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 24,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                        style: TextButton.styleFrom(
                            backgroundColor: Colors.grey[350],
                            foregroundColor: Colors.white),
                        onPressed: () => {
                              nameController.text = "",
                              descriptionController.text = "",
                            },
                        child: Text("Clear")),
                    SizedBox(
                      width: 12,
                    ),
                    TextButton(
                        style: TextButton.styleFrom(
                            backgroundColor: Color.fromRGBO(33, 150, 243, 1),
                            foregroundColor: Colors.white),
                        onPressed: () => {},
                        child: Text("Submit"))
                  ],
                )
              ]),
        ),
      ),
    );
  }
}
