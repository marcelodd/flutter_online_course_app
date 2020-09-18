import 'package:flutter/material.dart';
import 'package:text_extension/text_extension.dart';
import 'package:percent_indicator/percent_indicator.dart';

class CardRecentClassWidget extends StatelessWidget {
  final String category;

  final String title;

  final String subtitle;

  final IconData icon;

  final Color color;

  final double progress;

  const CardRecentClassWidget(
      {Key key,
      this.category,
      this.title,
      this.subtitle,
      this.icon,
      this.color,
      this.progress})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(25)),
      child: Row(
        children: [
          Container(
            height: 70,
            width: 70,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
            ),
            child: Stack(
              children: [
                ClipRRect(
                  child: Image.asset(
                    'assets/images/bg1.png',
                    height: 70,
                    width: 70,
                    fit: BoxFit.fill,
                  ),
                  borderRadius: BorderRadius.circular(50),
                ),
                Container(
                    decoration: BoxDecoration(
                        color: color.withOpacity(0.6),
                        borderRadius: BorderRadius.circular(50))),
                Center(
                  child: Icon(
                    icon,
                    color: Colors.white,
                    size: 35,
                  ),
                )
              ],
            ),
          ),
          SizedBox(
            width: 10,
          ),
          FittedBox(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(category).bold().setColor(color),
                Text(title).bold().setColor(Colors.black54),
                Text(subtitle).light().setColor(Colors.grey)
              ],
            ),
          ),
          Spacer(),
          CircularPercentIndicator(
            radius: 60.0,
            lineWidth: 5.0,
            percent: progress / 100.00,
            center:  Text("${progress.toStringAsFixed(0)}").medium(),
            progressColor: color,
          ),
        ],
      ),
    );
  }
}
