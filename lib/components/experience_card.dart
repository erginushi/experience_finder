import 'package:epxerience_finder/screens/experience_screen.dart';
import 'package:flutter/material.dart';
import 'dart:ui';

class ExperinceCard extends StatefulWidget {
  final String heroTag;
  const ExperinceCard({Key? key, required this.heroTag}) : super(key: key);

  @override
  _ExperinceCardState createState() => _ExperinceCardState();
}

class _ExperinceCardState extends State<ExperinceCard> {
  bool favourited = false;
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ExperienceScreen(
              data: {"id": widget.heroTag},
            ),
          ),
        );
      },
      style: TextButton.styleFrom(
        padding: EdgeInsets.zero,
        foregroundColor: Colors.black,
      ),
      child: Container(
        height: 200,
        decoration: const BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: NetworkImage(
                'https://albania360.com/wp-content/uploads/2022/06/286705471_5226925277344994_9150394650843000115_n-e1655302581295.jpg'),
          ),
          borderRadius: BorderRadius.all(Radius.circular(8)),
        ),
        child: Padding(
          padding: const EdgeInsets.all(5),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ClipRRect(
                    borderRadius: const BorderRadius.all(Radius.circular(8)),
                    child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 5, vertical: 2),
                        decoration: BoxDecoration(
                            color: Colors.grey.shade200.withOpacity(0.5)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            const Icon(
                              Icons.stars_outlined,
                              color: Color.fromRGBO(255, 215, 0, 1),
                            ),
                            Text(
                              '4.8',
                              style: TextStyle(
                                  color: Colors.black.withOpacity(0.6)),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  TextButton(
                    style: TextButton.styleFrom(
                      minimumSize: Size.zero,
                      padding: EdgeInsets.zero,
                      // backgroundColor: Colors.red,
                    ),
                    onPressed: () {
                      setState(() {
                        favourited = !favourited;
                      });
                    },
                    child: ClipRRect(
                      borderRadius: BorderRadius.all(Radius.circular(60)),
                      child: BackdropFilter(
                        filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
                        child: Container(
                          decoration: BoxDecoration(
                              color: Colors.grey.shade200.withOpacity(0.5)),
                          padding: EdgeInsets.all(5),
                          child: Center(
                            child: Icon(
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
                  ),
                ],
              ),
              ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(8)),
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
                  child: IntrinsicHeight(
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.grey.shade200.withOpacity(0.5)),
                      padding: EdgeInsets.symmetric(vertical: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: const [
                          Text(
                            'Petrela ZIP LINE',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          VerticalDivider(
                            color: Colors.black,
                          ),
                          Text(
                            '5 KM',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          VerticalDivider(
                            color: Colors.black,
                          ),
                          Text(
                            '15 reviews',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
