import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class YourComment extends StatefulWidget {
  const YourComment({super.key});

  @override
  State<YourComment> createState() => _YourCommentState();
}

class _YourCommentState extends State<YourComment> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 24, right: 24, top: 8, bottom: 8),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(8)),
            border: Border.all(
              color: Colors.black,
              width: 1,
            )),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 8),
                child: ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(60)),
                  child: Image.network(
                    'https://picsum.photos/536/354',
                    width: 30,
                    height: 30,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Expanded(child: Text('Ergi Nushi')),
              TextButton(
                  style: TextButton.styleFrom(
                      foregroundColor: Color.fromRGBO(0, 0, 0, 0.6)),
                  onPressed: () => {},
                  child: Row(
                    children: [Text('Add'), Icon(Icons.add_box_outlined)],
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
