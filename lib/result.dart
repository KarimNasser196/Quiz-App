import 'package:flutter/material.dart';
import 'main.dart';

class Result extends StatelessWidget {
  const Result(this.holder, this.resultScore, {Key? key}) : super(key: key);

  final Function() holder;
  final int resultScore;

  String get resultPhrase {
    String resultText = '';
    if (resultScore ==3) {
      resultText = 'You are awesome,all answers true';
    } else if (resultScore ==2) {
      resultText = 'Pretty likable!,you got 2 answers true';
    } else if (resultScore ==1) {
      resultText = 'not good,you got 1 answers true';
    } else {
      resultText = 'You are so bad!,zero answer true';
    }

    return resultText;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Done!',
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
              color: isSwitched == false ? Colors.black : Colors.white,
            ),
          ),
          SizedBox(height: 10,),
          Text(
            'Total Score = $resultScore',
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
              color: isSwitched == false ? Colors.black : Colors.white,
            ),
          ),
          Text(
            resultPhrase,textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,

              color: isSwitched == false ? Colors.black : Colors.white,
            ),
          ),
          SizedBox(height: 10,),
          TextButton(
            onPressed: holder,
            child: const Text(
              'Restart The Quiz',
              style: TextStyle(
                fontSize: 30,
                //fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
