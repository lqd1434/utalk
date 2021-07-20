import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class LeftBorderText extends StatefulWidget {
  final String title;
  final Color? titleColor;
  final String subtitle;
  final Color? subtitleColor;
  final Icon? preIcon;
  final Color? barColor;

  const LeftBorderText(
      {Key? key,
      required this.title,
      required this.subtitle,
      this.titleColor,
      this.subtitleColor,
      this.preIcon,
      this.barColor})
      : super(key: key);

  @override
  State<StatefulWidget> createState() => LeftBorderTextStatePage();
}

class LeftBorderTextStatePage extends State<LeftBorderText> {
  @override
  Widget build(BuildContext context) {
    return Container(
        alignment: Alignment.centerLeft,
        padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
        child: Row(
          children: [
            Container(
              width: 3,
              height: 55,
              alignment: Alignment.centerRight,
              margin: const EdgeInsets.fromLTRB(15, 20, 10, 10),
              decoration:
                  BoxDecoration(color: widget.barColor, borderRadius: BorderRadius.circular(2.0)),
            ),
            Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Container(
                height: 20,
                margin: const EdgeInsets.only(bottom: 5),
                alignment: Alignment.centerLeft,
                child: Text(widget.subtitle,
                    style: TextStyle(fontSize: 15, color: widget.subtitleColor)),
              ),
              Container(
                alignment: Alignment.centerLeft,
                child: Row(
                  children: [
                    widget.preIcon ?? const SizedBox(),
                    Text(widget.title, style: TextStyle(fontSize: 20, color: widget.titleColor))
                  ],
                ),
              ),
            ]),
          ],
        ));
  }
}

class PercentData extends StatefulWidget {
  final Color? progressBarColor;
  final Color? backgroundColor;
  final double percent;
  final String title;

  const PercentData(
      {Key? key,
      this.progressBarColor,
      this.percent = 0.0,
      this.backgroundColor,
      required this.title})
      : super(key: key);

  @override
  State<StatefulWidget> createState() => PercentDataStatePage();
}

class PercentDataStatePage extends State<PercentData> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 70.0,
      alignment: Alignment.centerLeft,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 8, bottom: 3),
            child: Text(widget.title, style: TextStyle(fontSize: 14)),
          ),
          LinearPercentIndicator(
            width: 65.0,
            lineHeight: 6.0,
            percent: widget.percent,
            backgroundColor: widget.backgroundColor,
            progressColor: widget.progressBarColor,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8, top: 3),
            child: Text('${widget.percent}分', style: const TextStyle(fontSize: 14)),
          )
        ],
      ),
    );
  }
}
