import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class ExperienceScreen extends StatefulWidget {
  const ExperienceScreen({super.key});

  @override
  State<ExperienceScreen> createState() => _ExperienceScreenState();
}

class _ExperienceScreenState extends State<ExperienceScreen> {
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
              children: [
                Image.network(
                    'https://albania360.com/wp-content/uploads/2022/06/286705471_5226925277344994_9150394650843000115_n-e1655302581295.jpg'),
                Positioned(
                  child: IconButton(
                      onPressed: onPressed,
                      icon: const Icon(Icons.favorite_border_outlined)),
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
