import 'package:epxerience_finder/components/others_comment.dart';
import 'package:epxerience_finder/components/your_comment.dart';
import 'package:epxerience_finder/utils/dummy.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class Reviews extends StatefulWidget {
  const Reviews({super.key});

  @override
  State<Reviews> createState() => _ReviewsState();
}

class _ReviewsState extends State<Reviews> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        YourComment(),
        Column(
          children: dummyReviews.map((e) => OthersComment(data: e)).toList(),
        )
      ],
    );
  }
}
