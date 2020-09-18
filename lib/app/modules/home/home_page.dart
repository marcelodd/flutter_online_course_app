import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:online_course_app/app/app_config.dart';
import 'package:online_course_app/app/modules/home/card_course_widget.dart';
import 'package:online_course_app/app/modules/home/card_recent_class_widget.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'home_controller.dart';
import 'package:text_extension/text_extension.dart';

class HomePage extends StatefulWidget {
  final String title;

  const HomePage({Key key, this.title = "Home"}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends ModularState<HomePage, HomeController> {
  final pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      body: PageView(
        controller: pageController,
        children: [tab1(), tab2()],
      ),
      bottomNavigationBar: Container(
        color: bgColor,
        height: 70,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Observer(
              builder: (_) => IconButton(
                onPressed: () {
                  controller.setPage(1);
                  pageController.jumpToPage(0);
                },
                icon: Icon(
                  Icons.home,
                  color: controller.page == 1 ? purple : purpleLight,
                  size: 30,
                ),
              ),
            ),
            Observer(
              builder: (_) => IconButton(
                onPressed: () {
                  controller.setPage(2);
                  pageController.jumpToPage(1);
                },
                icon: Icon(
                  Icons.insert_chart,
                  color: controller.page == 2 ? purple : purpleLight,
                  size: 30,
                ),
              ),
            ),
            Observer(
              builder: (_) => IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.calendar_today,
                  color: controller.page == 3 ? purple : purpleLight,
                  size: 30,
                ),
              ),
            ),
            Observer(
              builder: (_) => IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.person,
                  color: controller.page == 4 ? purple : purpleLight,
                  size: 30,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget tab1() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 30, horizontal: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text('Hi, ').light().setFontSize(18),
              Text('Marcelo!').medium().setFontSize(18),
              Spacer(),
              IconButton(
                icon: Icon(Icons.search),
                onPressed: () {},
              ),
              IconButton(
                icon: Icon(Icons.more_vert),
                onPressed: () {},
              )
            ],
          ),
          widget01(),
          SizedBox(
            height: 20,
          ),
          Row(
            children: [
              Text('Popular').bold().setFontSize(24),
              Spacer(),
              Text('View all').blue().medium()
            ],
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                CardCourseWidget(
                  color: Colors.blueAccent,
                  icon: Icons.palette,
                  title: 'Designig System Developer',
                ),
                CardCourseWidget(
                  color: Colors.pink,
                  icon: Icons.people,
                  title: 'Grow Your Community',
                ),
                CardCourseWidget(
                  color: Colors.deepPurple,
                  icon: Icons.record_voice_over,
                  title: 'Basic Public Speaking',
                )
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Text('Recent Class').bold().setFontSize(24),
          SizedBox(
            height: 20,
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  CardRecentClassWidget(
                    category: 'DESIGN',
                    title: 'Designig System Developer',
                    color: Colors.blueAccent,
                    icon: Icons.palette,
                    subtitle: '12 Chapter',
                    progress: 80.0,
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  CardRecentClassWidget(
                    category: 'DEVELOPMENT',
                    title: 'Grow Your Community',
                    color: Colors.pink,
                    icon: Icons.people,
                    subtitle: '12 Chapter',
                    progress: 50.0,
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget tab2() {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(vertical: 30, horizontal: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              IconButton(
                icon: Icon(Icons.search),
                onPressed: () {},
              ),
              Text('Search...').light().setFontSize(12),
              Spacer(),
              IconButton(
                icon: Icon(Icons.more_vert),
                onPressed: () {},
              )
            ],
          ),
          widget01(),
          SizedBox(
            height: 20,
          ),
          Container(
            height: 140,
            padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(25)),
            child: Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Average Score')
                        .bold()
                        .setColor(Colors.black45)
                        .setFontSize(22),
                    Text('74.18').bold().setColor(purple).setFontSize(30),
                    Text('in 30 days')
                        .light()
                        .setColor(purpleLight)
                        .setFontSize(14)
                  ],
                ),
                Spacer(),
                CircularPercentIndicator(
                  radius: 90.0,
                  lineWidth: 12.0,
                  percent: 84.0 / 100.00,
                  center: Text("84%").medium().setColor(purple),
                  progressColor: purple,
                ),
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            height: 120,
            padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(25)),
            child: Row(
              children: [
                SizedBox(
                  width: 30,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Great Progress')
                          .bold()
                          .setColor(Colors.black45)
                          .setFontSize(22),
                      Text('You are completely')
                          .light()
                          .setColor(purpleLight)
                          .setFontSize(14),
                      Text(' on track, keep it up!')
                          .light()
                          .setColor(purpleLight)
                          .setFontSize(14)
                    ],
                  ),
                  flex: 2,
                ),
                Expanded(
                  flex: 1,
                  child: Stack(
                    children: [
                      Positioned(
                        child:
                            Text('+27%').setColor(Colors.pinkAccent).medium(),
                      ),
                      Container(
                        padding: EdgeInsets.all(7),
                        height: 120,
                        width: 100,
                        child: CustomPaint(
                          painter: LineProgressPainter(),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            height: 300,
            width: double.infinity,
            padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(25)),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text('Activity')
                        .bold()
                        .setColor(purpleLight)
                        .setFontSize(22),
                    Spacer(),
                    Text('Day').bold().setColor(purpleLight),
                    SizedBox(
                      width: 15,
                    ),
                    Text('Week').bold().setColor(purple),
                    SizedBox(
                      width: 15,
                    ),
                    Text('Month').bold().setColor(purpleLight),
                  ],
                ),
                Expanded(
                  flex: 1,
                  child: Stack(
                    children: [

                      Container(
                        padding: EdgeInsets.all(7),
                        height: 250,
                        width: double.infinity,
                        child: CustomPaint(
                          painter: ActivityChartPainter(),
                        ),
                      ),
                      Positioned(
                        child: Container(
                          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: bgColor),
                          child: Column(
                            children: [
                              Text('Score').setColor(purple).bold(),
                              Text('74.34').setColor(Colors.black45).medium()
                            ],
                          ),
                        ),
                        top: 60,
                        left: 120,
                      ),
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget widget01() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          Observer(builder: (_) => itemDay('S', 0)),
          Observer(builder: (_) => itemDay('M', 1)),
          Observer(builder: (_) => itemDay('T', 2)),
          Observer(builder: (_) => itemDay('W', 3)),
          Observer(builder: (_) => itemDay('T', 4)),
          Observer(builder: (_) => itemDay('F', 5)),
        ],
      ),
    );
  }

  Widget itemDay(String title, int day) {
    bool selected = controller.day == day;
    var shadowColor = selected ? purple : Colors.white;
    return Container(
      margin: EdgeInsets.all(10),
      height: 50,
      width: 50,
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: selected ? purple : Colors.white,
          boxShadow: [
            BoxShadow(
                color: shadowColor.withOpacity(0.6),
                offset: Offset(1.0, 1.0),
                blurRadius: 5.0,
                spreadRadius: 1.0),
            BoxShadow(
                color: shadowColor.withOpacity(0.1),
                offset: Offset(-1.0, -1.0),
                blurRadius: 15.0,
                spreadRadius: 1.0),
          ]),
      child: InkWell(
        child: SizedBox(
          height: 50,
          width: 50,
          child: Center(
            child: Text(title)
                .bold()
                .setColor(selected ? Colors.white : Colors.black87),
          ),
        ),
        onTap: () => controller.setDaY(day),
      ),
    );
  }
}

class LineProgressPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    // TODO: implement paint
    Paint paint = Paint();
    paint
      ..color = Colors.pinkAccent
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 6;

    Paint paint2 = Paint();
    paint2
      ..color = Colors.pinkAccent.withOpacity(0.2)
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.butt
      ..strokeWidth = 10;

    double width = size.width;
    double height = size.height;

    Path path = Path();
    Path path2 = Path();

    path.moveTo(0, height * 0.80);

    path.cubicTo(
        0.50 * width, height * 0.99, 0.40 * width, height * 0.08, width, 0);

    path2.moveTo(0, height);
    path2.lineTo(0, height * 0.90);

    path2.moveTo(width * 0.20, height);
    path2.lineTo(width * 0.20, height * 0.92);

    path2.moveTo(width * 0.40, height);
    path2.lineTo(width * 0.40, height * 0.78);

    path2.moveTo(width * 0.60, height);
    path2.lineTo(width * 0.60, height * 0.43);

    path2.moveTo(width * 0.80, height);
    path2.lineTo(width * 0.80, height * 0.20);

    path2.moveTo(width, height);
    path2.lineTo(width, height * 0.11);

    canvas.drawPath(path2, paint2);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}

class ActivityChartPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    // TODO: implement paint
    Paint paint = Paint();
    paint
      ..color = purple.withOpacity(0.8)
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 10;

    Paint paint2 = Paint();
    paint2
      ..color = purple.withOpacity(0.2)
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.butt
      ..strokeWidth = 20;

    double width = size.width;
    double height = size.height;

    Path path = Path();
    Path path2 = Path();

    path.moveTo(0, height * 0.50);

    path.cubicTo(width * 0.10, height * 0.30, width * 0.10, height * 0.90,
        width / 2, height * 0.40);

    path.cubicTo(
        0.80 * width, height * 0.05, 0.70 * width, height * 0.50, width, 0);

    path2.moveTo(0, height);
    path2.lineTo(0, height * 0.50);

    path2.moveTo(width * 0.20, height);
    path2.lineTo(width * 0.20, height * 0.55);

    path2.moveTo(width * 0.40, height);
    path2.lineTo(width * 0.40, height * 0.48);

    path2.moveTo(width * 0.60, height);
    path2.lineTo(width * 0.60, height * 0.26);

    path2.moveTo(width * 0.80, height);
    path2.lineTo(width * 0.80, height * 0.20);

    path2.moveTo(width, height);
    path2.lineTo(width, height * 0.01);

    canvas.drawPath(path, paint);
    canvas.drawPath(path2, paint2);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
