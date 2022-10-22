import 'package:epxerience_finder/components/review_modal.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

class OthersComment extends StatefulWidget {
  final dynamic data;
  const OthersComment({super.key, this.data});

  @override
  State<OthersComment> createState() => _OthersCommentState();
}

class _OthersCommentState extends State<OthersComment> {
  @override
  Widget build(BuildContext context) {
    dynamic data = widget.data;
    dynamic images = data['images'];

    return Padding(
      padding: const EdgeInsets.only(left: 24, right: 24, top: 8, bottom: 8),
      child: InkWell(
        onTap: () => {
          showCupertinoModalBottomSheet(
            context: context,
            builder: (context) => SingleChildScrollView(
              controller: ModalScrollController.of(context),
              child: ReviewModal(
                data: data,
                disabled: true,
              ),
            ),
          )
        },
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(8)),
              border: Border.all(
                color: Colors.black,
                width: 1,
              )),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Hero(
                  tag: data['user_pic'],
                  child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 8),
                          child: ClipRRect(
                            borderRadius: BorderRadius.all(Radius.circular(60)),
                            child: Image.network(
                              data['user_pic'],
                              width: 30,
                              height: 30,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Expanded(
                            child: Row(
                          children: [
                            Text(data['name']),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(children: <Widget>[
                                for (var i = 0; i < data['stars']; i++)
                                  Icon(
                                    Icons.stars_outlined,
                                    size: 14,
                                  )
                              ]),
                            )
                          ],
                        ))
                      ]),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum. Why do we use it? It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for 'lorem ipsum' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).",
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                Row(children: [
                  Row(children: [
                    for (var i = 0; i < data['images'].length; i++)
                      if (i < 4)
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 4, vertical: 0),
                          child: Image.network(
                            data['images'][i],
                            width: 40,
                            height: 40,
                            fit: BoxFit.cover,
                          ),
                        )
                  ]),
                  TextButton(
                      style: TextButton.styleFrom(
                          minimumSize: Size.zero,
                          foregroundColor: Colors.white,
                          padding: EdgeInsets.zero),
                      onPressed: () => {},
                      child: Container(
                          width: 40,
                          height: 40,
                          color: Color.fromRGBO(0, 0, 0, 0.6),
                          child: Center(
                              child: Text("+" +
                                  (data['images'].length - 4).toString()))))
                ]),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
