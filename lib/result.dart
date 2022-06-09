import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:untitled2/main.dart';


class Result extends StatefulWidget{
  Result({Key? key, required this.bmi}) : super(key: key);
  double bmi = height;

  @override
  State<Result> createState() => _ResultState();
}

class _ResultState extends State<Result> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Result"),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Your BMI is${widget.bmi}"),
            GestureDetector(
              onTap: (){
                Navigator.pop(context);
              },
              child: Center(
                child: Container(
                  color: Colors.red,
                  height: 75,
                  width: 200,
                  child: Center(child: Text("Recalculate")),
                ),
              ),
            ),
            RatingBar.builder(
              initialRating: 3,
              minRating: 1,
              direction: Axis.horizontal,
              allowHalfRating: true,
              itemCount: 5,
              itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
              itemBuilder: (context, _) => Icon(
                Icons.star,
                color: Colors.amber,
              ),
              onRatingUpdate: (rating){
                print(rating);

              },
            )
          ],
        )
    );
  }
}