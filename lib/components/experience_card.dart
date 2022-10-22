import 'package:epxerience_finder/screens/experience_screen.dart';
import 'package:flutter/material.dart';
import 'dart:ui';

class ExperinceCard extends StatefulWidget {
  final String heroTag;
  final String image;
  final String name;
  final String distance;
  final String reviews;
  bool favourite;
  ExperinceCard({
    Key? key,
    required this.heroTag,
    required this.image,
    required this.name,
    required this.distance,
    required this.reviews,
    required this.favourite,
  }) : super(key: key);

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
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: NetworkImage(widget.image),
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
                        widget.favourite = !widget.favourite;
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
                              widget.favourite
                                  ? Icons.favorite
                                  : Icons.favorite_border,
                              color: widget.favourite
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
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            widget.name,
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          const VerticalDivider(
                            color: Colors.black,
                          ),
                          Text(
                            widget.distance,
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          const VerticalDivider(
                            color: Colors.black,
                          ),
                          Text(
                            widget.distance,
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
