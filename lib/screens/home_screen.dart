import 'package:epxerience_finder/utils/dummy.dart';
import 'package:flutter/material.dart';

import '../components/experience_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  dynamic experienceCardsData = dummyData;
  @override
  void initState() {
    print(experienceCardsData);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      child: Column(
        children: [
          Expanded(
            flex: 2,
            child: Row(
              children: [
                const Text(
                  'Tirana, ',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
                Text(
                  'Albania',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black.withOpacity(0.6),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 1,
            child: Row(
              children: const [
                Text(
                  'Experiences near you',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 20,
            child: ListView.separated(
              shrinkWrap: true,
              padding: EdgeInsets.symmetric(vertical: 10),
              separatorBuilder: (BuildContext context, int index) {
                return const SizedBox(
                  height: 30,
                );
              },
              itemBuilder: (BuildContext context, int index) {
                // print(experienceCardsData[index]['id']);
                return Hero(
                  tag: experienceCardsData[index]['id'],
                  child: ExperinceCard(
                    data: experienceCardsData[index],
                    deletable: false,
                    heroTag: experienceCardsData[index]['id'],
                    image: experienceCardsData[index]['image'],
                    name: experienceCardsData[index]['name'],
                    distance: experienceCardsData[index]['distance'],
                    reviews: experienceCardsData[index]['reviews'],
                    favourite: experienceCardsData[index]['favourite'],
                  ),
                );
              },
              itemCount: experienceCardsData.length,
            ),
          ),
        ],
      ),
    );
  }
}
