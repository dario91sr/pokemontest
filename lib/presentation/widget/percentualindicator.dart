import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class PercentualIndicator extends StatefulWidget {
  double value;
  PercentualIndicator({super.key, required this.value});

  @override
  State<PercentualIndicator> createState() => _PercentualIndicatorState();
}

class _PercentualIndicatorState extends State<PercentualIndicator> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    avanza();
  }

  avanza() async {
    var val = widget.value * 250 / 100;
    for (var i = 0; i < val; i++) {
      Future.delayed(const Duration(milliseconds: 500), () {
        widthCont = i.toDouble();

        setState(() {
          // Here you can write your code for open new view
        });
      });
    }
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    widthCont = 0.0;
  }

  var colore = Colors.green;
  double widthCont = 0;
  @override
  Widget build(BuildContext context) {
    //colore = Colors.red;
    var val = widget.value / 100;
    return Stack(alignment: AlignmentDirectional.center, children: [
      Container(
        decoration: BoxDecoration(
            color: Color.fromARGB(255, 51, 95, 0),
            borderRadius: BorderRadius.circular(15),
            border: Border.all()),
        width: 250,
        height: 35,
      ),
      Positioned(
        left: 0,
        child: AnimatedContainer(
          duration: Duration(seconds: 5),
          decoration: BoxDecoration(
              color: colore,
              borderRadius: BorderRadius.circular(15),
              border: Border.all()),
          width: widthCont,
          height: 35,
        ),
      ),
      Text(widget.value.toString())
    ]);
  }
}
