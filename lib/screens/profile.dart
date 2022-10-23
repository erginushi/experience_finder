import 'package:epxerience_finder/components/experience_card.dart';
import 'package:flutter/material.dart';

import '../utils/dummy.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  dynamic experienceCardsData = dummyData;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.width * 0.5,
              child: const Center(
                child: CircleAvatar(
                  backgroundImage:
                      NetworkImage('https://picsum.photos/536/354'),
                  maxRadius: 60,
                ),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.width * 0.1,
              child: const Center(
                child: Text(
                  'Ergi Nushi',
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.width * 0.11,
              child: IntrinsicHeight(
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(8)),
                    border: Border.all(color: Colors.black54),
                  ),
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: const [
                      Text(
                        '15 posts',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      VerticalDivider(
                        color: Colors.black,
                      ),
                      Text(
                        '25 reviews',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      VerticalDivider(
                        color: Colors.black,
                      ),
                      Text(
                        '4.5 rating',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.width * 0.1,
              child: const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Your latest posts',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Hero(
                tag: experienceCardsData[0]['id'],
                child: ExperinceCard(
                  data: experienceCardsData[0],
                  deletable: true,
                  heroTag: experienceCardsData[0]['id'],
                  image: experienceCardsData[0]['image'],
                  name: experienceCardsData[0]['name'],
                  distance: experienceCardsData[0]['distance'],
                  reviews: experienceCardsData[0]['reviews'],
                  favourite: experienceCardsData[0]['favourite'],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Hero(
                tag: experienceCardsData[1]['id'],
                child: ExperinceCard(
                  data: experienceCardsData[1],
                  deletable: true,
                  heroTag: experienceCardsData[1]['id'],
                  image: experienceCardsData[1]['image'],
                  name: experienceCardsData[1]['name'],
                  distance: experienceCardsData[1]['distance'],
                  reviews: experienceCardsData[1]['reviews'],
                  favourite: experienceCardsData[1]['favourite'],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Hero(
                tag: 'tag_3',
                child: ExperinceCard(
                  data: experienceCardsData[0],
                  deletable: true,
                  heroTag: 'tag_3',
                  image: experienceCardsData[0]['image'],
                  name: experienceCardsData[0]['name'],
                  distance: experienceCardsData[0]['distance'],
                  reviews: experienceCardsData[0]['reviews'],
                  favourite: experienceCardsData[0]['favourite'],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
