import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';
import 'package:testproject_redstonz/Colors/colors.dart';

class ScreenInternetSpeedTest extends StatelessWidget {
  ScreenInternetSpeedTest({Key? key}) : super(key: key);
  double downloadRate = 0;
  double uploadRate = 0;
  String downloadProgress = '0';
  String uploadProgress = '0';
  double displayRate = 0;
  String displayRateTxt = '0.0';
  double displayPer = 0;
  String unitText = 'Mb/s';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const Drawer(),
      // appBar: AppBar(),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: SfRadialGauge(
                animationDuration: 3000,
                enableLoadingAnimation: true,
                title: const GaugeTitle(
                  text: 'Internet Speed',
                  textStyle: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                ),
                axes: <RadialAxis>[
                  RadialAxis(
                      minimum: 0,
                      maximum: 150,
                      axisLabelStyle: const GaugeTextStyle(
                        color: Colors.pink,
                      ),
                      ranges: <GaugeRange>[
                        GaugeRange(startValue: 0, endValue: 50, color: gaugeRange1, startWidth: 10, endWidth: 10),
                        GaugeRange(startValue: 50, endValue: 100, color: gaugeRange2, startWidth: 10, endWidth: 10),
                        GaugeRange(startValue: 100, endValue: 150, color: gaugeRange1, startWidth: 10, endWidth: 10)
                      ],
                      pointers: <GaugePointer>[
                        NeedlePointer(
                          value: 0,
                          enableAnimation: true,
                          needleColor: needleCol,
                        )
                      ],
                      annotations: <GaugeAnnotation>[
                        GaugeAnnotation(
                          widget: Container(
                            child: Text(
                              30.toStringAsFixed(2) + ' ' + unitText,
                              style: const TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                          ),
                          angle: 90,
                          positionFactor: 0.5,
                        )
                      ])
                ]),
          ),
        ),
      ),
    );
  }
}
