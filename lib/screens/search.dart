import 'package:epxerience_finder/utils/dummy.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:textfield_tags/textfield_tags.dart';
import '../components/experience_card.dart';

class Search extends StatefulWidget {
  const Search({Key? key}) : super(key: key);

  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  TextfieldTagsController _controller = TextfieldTagsController();

  dynamic experienceCardsData = dummyData;

  @override
  Widget build(BuildContext context) {
    double _distanceToField = MediaQuery.of(context).size.width;
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.03,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.1,
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
                              : "Search for location, activity type, etc.",
                          errorText: error,
                          prefixIconConstraints:
                              BoxConstraints(maxWidth: _distanceToField * 0.74),
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
            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Suggested for you',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.3,
              child: ListView.separated(
                itemCount: 2,
                physics: BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                separatorBuilder: (BuildContext context, int index) {
                  return const SizedBox(
                    width: 30,
                  );
                },
                itemBuilder: (BuildContext context, int index) {
                  return Hero(
                    tag: experienceCardsData[index]['id'],
                    child: ExperinceCard(
                      data: experienceCardsData[index],
                      deletable: true,
                      heroTag: experienceCardsData[index]['id'],
                      image: experienceCardsData[index]['image'],
                      name: experienceCardsData[index]['name'],
                      distance: experienceCardsData[index]['distance'],
                      reviews: experienceCardsData[index]['reviews'],
                      favourite: experienceCardsData[index]['favourite'],
                    ),
                  );
                },
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.1,
              child: Row(
                children: const [
                  Text(
                    'Search results',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            for (var index = 0; index < experienceCardsData.length; index++)
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.3,
                child: Hero(
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
                ),
              ),
          ],
        ),
      ),
    );
  }
}
