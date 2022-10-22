import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class ExperienceScreen extends StatefulWidget {
  const ExperienceScreen({super.key});

  @override
  State<ExperienceScreen> createState() => _ExperienceScreenState();
}

class _ExperienceScreenState extends State<ExperienceScreen> {
  bool favourited = false;
  @override
  Widget build(BuildContext context) {
    double sw = MediaQuery.of(context).size.width;
    double sh = MediaQuery.of(context).size.height;
    return SingleChildScrollView(
      child: SizedBox(
        height: sh,
        child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
          Container(
            child: Stack(
              clipBehavior: Clip.antiAlias,
              alignment: Alignment.bottomRight,
              children: [
                Image.network(
                    'https://albania360.com/wp-content/uploads/2022/06/286705471_5226925277344994_9150394650843000115_n-e1655302581295.jpg'),
                Transform.translate(
                  child: TextButton(
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
                      borderRadius: BorderRadius.all(Radius.circular(60)),
                      child: new BackdropFilter(
                        filter:
                            new ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
                        child: new Container(
                          width: 60.0,
                          height: 60.0,
                          decoration: new BoxDecoration(
                              color: Colors.grey.shade200.withOpacity(0.5)),
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
                  ),
                  offset: Offset(-20, 30),
                )
              ],
            ),
          ),
        ]),
      ),
    );
  }

  void onPressed() {}
}
