import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:image_viewer/image_viewer.dart';

class ReviewModal extends StatefulWidget {
  final dynamic data;
  final bool disabled;
  const ReviewModal({super.key, this.data, required this.disabled});

  @override
  State<ReviewModal> createState() => _ReviewModalState();
}

class _ReviewModalState extends State<ReviewModal> {
  @override
  Widget build(BuildContext context) {
    dynamic data = widget.data;
    bool disabled = widget.disabled;

    return Container(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 48),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Hero(
                tag: data['user_pic'],
                child: Row(
                  children: [
                    ClipRRect(
                        borderRadius: BorderRadius.all(Radius.circular(60)),
                        child: Container(
                          width: 40,
                          height: 40,
                          child: Image.network(
                            data['user_pic'],
                            fit: BoxFit.cover,
                          ),
                        )),
                    SizedBox(
                      width: 8,
                    ),
                    Text(data['name'])
                  ],
                ),
              ),
              SizedBox(
                height: 40,
              ),
              Text('Comment'),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: TextField(
                  enabled: !disabled,
                  controller: new TextEditingController(text: data['review']),
                  decoration: InputDecoration(
                    hintText: 'Add comment',
                    border: new OutlineInputBorder(
                        borderSide: new BorderSide(color: Colors.teal)),
                  ),
                  maxLines: 4,
                ),
              ),
              SizedBox(
                height: 8,
              ),
              RatingBar.builder(
                ignoreGestures: disabled,
                initialRating: data['stars'],
                minRating: 1,
                direction: Axis.horizontal,
                allowHalfRating: true,
                itemCount: 5,
                itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                itemBuilder: (context, _) => Icon(
                  Icons.stars_outlined,
                  color: Colors.amber,
                ),
                onRatingUpdate: (rating) {
                  print(rating);
                },
              ),
              SizedBox(
                height: 8,
              ),
              Text('Pros'),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: TextField(
                  enabled: !disabled,
                  controller: new TextEditingController(text: data['pros']),
                  decoration: InputDecoration(
                    hintText: 'Add pros',
                    border: new OutlineInputBorder(
                        borderSide: new BorderSide(color: Colors.teal)),
                  ),
                  maxLines: 2,
                ),
              ),
              SizedBox(
                height: 24,
              ),
              Text('Cons'),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: TextField(
                  enabled: !disabled,
                  controller: new TextEditingController(text: data['cons']),
                  decoration: InputDecoration(
                    hintText: 'Add cons',
                    border: new OutlineInputBorder(
                        borderSide: new BorderSide(color: Colors.teal)),
                  ),
                  maxLines: 2,
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
                  for (var i = 0; i < data['images'].length; i++)
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 4, vertical: 0),
                      child: TextButton(
                        onPressed: () => ImageViewer.showImageSlider(
                            images: data['images'], startingPosition: i),
                        child: Container(
                          width: 50,
                          height: 50,
                          child: Image.network(
                            data['images'][i],
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                  !disabled
                      ? Padding(
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
                      : Container(),
                ],
              ),
              SizedBox(
                height: 24,
              ),
              !disabled
                  ? Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        TextButton(
                            style: TextButton.styleFrom(
                                backgroundColor: Colors.grey[350],
                                foregroundColor: Colors.white),
                            onPressed: () => {Navigator.pop(context)},
                            child: Text("Cancel")),
                        SizedBox(
                          width: 12,
                        ),
                        TextButton(
                            style: TextButton.styleFrom(
                                backgroundColor:
                                    Color.fromRGBO(33, 150, 243, 1),
                                foregroundColor: Colors.white),
                            onPressed: () => {},
                            child: Text("Submit"))
                      ],
                    )
                  : Container(),
            ]),
      ),
    );
  }
}
