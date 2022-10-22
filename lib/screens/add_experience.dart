import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:image_viewer/image_viewer.dart';
import 'package:latlong2/latlong.dart' as latLng;
import 'package:textfield_tags/textfield_tags.dart';

class AddExperience extends StatefulWidget {
  const AddExperience({
    super.key,
  });

  @override
  State<AddExperience> createState() => _AddExperienceState();
}

class _AddExperienceState extends State<AddExperience> {
  TextfieldTagsController _controller = TextfieldTagsController();

  @override
  Widget build(BuildContext context) {
    double sw = MediaQuery.of(context).size.width;
    double _distanceToField = MediaQuery.of(context).size.width;
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
                Text('Tags'),
                Container(
                  child: TextFieldTags(
                    textfieldTagsController: _controller,
                    initialTags: const [],
                    textSeparators: const [' ', ','],
                    letterCase: LetterCase.normal,
                    // validator: (String tag) {
                    //   if (tag == 'php') {
                    //     return 'No, please just no';
                    //   } else if (_controller?.getTags != null ? _controller.getTags.contains(tag):false) {
                    //     return 'you already entered that';
                    //   }
                    //   return null;
                    // },
                    inputfieldBuilder:
                        (context, tec, fn, error, onChanged, onSubmitted) {
                      return ((context, sc, tags, onTagDelete) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(vertical: 16.0),
                          child: TextField(
                            controller: tec,
                            focusNode: fn,
                            decoration: InputDecoration(
                              isDense: true,
                              border: const OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.blueAccent,
                                  width: 3.0,
                                ),
                              ),
                              focusedBorder: const OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.blueAccent,
                                  width: 3.0,
                                ),
                              ),
                              hintText: _controller.hasTags
                                  ? ''
                                  : "Add tags like activity type, etc.",
                              errorText: error,
                              prefixIconConstraints: BoxConstraints(
                                  maxWidth: _distanceToField * 0.74),
                              prefixIcon: tags.isNotEmpty
                                  ? SingleChildScrollView(
                                      controller: sc,
                                      scrollDirection: Axis.horizontal,
                                      child: Row(
                                          children: tags.map((String tag) {
                                        return Container(
                                          decoration: const BoxDecoration(
                                            borderRadius: BorderRadius.all(
                                              Radius.circular(20.0),
                                            ),
                                            color: Colors.blueAccent,
                                          ),
                                          margin: const EdgeInsets.symmetric(
                                              horizontal: 5.0),
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 10.0, vertical: 5.0),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              InkWell(
                                                child: Text(
                                                  '#$tag',
                                                  style: const TextStyle(
                                                      color: Colors.white),
                                                ),
                                                onTap: () {
                                                  print("$tag selected");
                                                },
                                              ),
                                              const SizedBox(width: 4.0),
                                              InkWell(
                                                child: const Icon(
                                                  Icons.cancel,
                                                  size: 14.0,
                                                  color: Color.fromARGB(
                                                      255, 233, 233, 233),
                                                ),
                                                onTap: () {
                                                  onTagDelete(tag);
                                                },
                                              )
                                            ],
                                          ),
                                        );
                                      }).toList()),
                                    )
                                  : null,
                            ),
                            onChanged: onChanged,
                            onSubmitted: onSubmitted,
                          ),
                        );
                      });
                    },
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
                              _controller.clearTags()
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
