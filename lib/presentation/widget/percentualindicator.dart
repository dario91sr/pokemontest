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
  final _key = GlobalKey();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) {
        size = _key.currentContext?.size?.width ?? 100.0;
        print(size);
        avanza();
      }
    });
  }

  avanza() async {
    var val = widget.value * size / 100;
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

  var size;
  var colore = Colors.green;
  double widthCont = 0;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: Stack(
          key: _key,
          alignment: AlignmentDirectional.centerStart,
          children: [
            Container(
              decoration: BoxDecoration(
                  color: Color.fromARGB(255, 51, 95, 0),
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all()),
              width: size,
              height: 30,
            ),
            AnimatedContainer(
              duration: const Duration(seconds: 1),
              decoration: BoxDecoration(
                color: colore,
                borderRadius: BorderRadius.circular(15),
              ),
              width: widthCont,
              height: 28,
            ),
          ]),
    );
  }
}
