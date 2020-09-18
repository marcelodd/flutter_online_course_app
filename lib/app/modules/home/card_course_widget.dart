import 'package:flutter/material.dart';
import 'package:text_extension/text_extension.dart';

class CardCourseWidget extends StatelessWidget {
  final Color color;
  final IconData icon;
  final String title;

  const CardCourseWidget({Key key, this.color = Colors.grey, this.icon, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      height: 200,
      width: 160,
      decoration:
          BoxDecoration(color: color, borderRadius: BorderRadius.circular(25)),
      child: Stack(
        children: [
          ClipRRect(
            child: Image.asset(
              'assets/images/bg1.png',
              height: 200,
              width: 160,
              fit: BoxFit.fill,
            ),
            borderRadius: BorderRadius.circular(25),
          ),
          Container(
              decoration: BoxDecoration(
                  color: color.withOpacity(0.6),
                  borderRadius: BorderRadius.circular(25))),
          Container(
            padding: EdgeInsets.all(15),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(
                  icon,
                  color: Colors.white,
                  size: 35,
                ),
                SizedBox(
                  height: 7,
                ),
                Text(title).medium().white(),
                Row(
                  children: [
                    Text('12').white().light(),
                    SizedBox(
                      width: 7,
                    ),
                    Text('Chapter').medium().white()
                  ],
                ),
                SizedBox(
                  height: 7,
                ),
                Slider(
                  color: color,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class Slider extends StatefulWidget {
  final ValueChanged<double> valueChanged;
  final Color color;

  Slider({this.valueChanged, this.color});

  @override
  SliderState createState() {
    return new SliderState();
  }
}

class SliderState extends State<Slider> {
  ValueNotifier<double> valueListener = ValueNotifier(.0);

  @override
  void initState() {
    valueListener.addListener(notifyParent);
    super.initState();
  }

  void notifyParent() {
    if (widget.valueChanged != null) {
      widget.valueChanged(valueListener.value);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: widget.color,
        gradient: LinearGradient(
            begin: Alignment.bottomLeft,
            end: Alignment.topRight,
            colors: [
              widget.color.withOpacity(0.2),
              widget.color.withOpacity(0.3),
              widget.color.withOpacity(0.5),
              widget.color,
            ],
            stops: [
              0.1,
              0.3,
              0.8,
              1
            ]),
        borderRadius: BorderRadius.circular(25),
        boxShadow: [
          BoxShadow(
              color: widget.color.withOpacity(0.5),
              offset: Offset(4.0, 4.0),
              blurRadius: 15.0,
              spreadRadius: 1.0),
          BoxShadow(
              color: widget.color.withOpacity(0.2),
              offset: Offset(-4.0, -4.0),
              blurRadius: 20.0,
              spreadRadius: 1.0),
        ],
      ),
      height: 50.0,
      width: 200,
      child: Builder(
        builder: (context) {
          final handle = GestureDetector(
            onHorizontalDragUpdate: (details) {
              valueListener.value =
                  (valueListener.value + details.delta.dx / context.size.width)
                      .clamp(.0, 1.0);
            },
            child: Container(
              height: double.infinity,
              width: 50,
              alignment: Alignment.center,
              padding: EdgeInsets.all(5),
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(25)),
              child: Text('Join').setColor(widget.color).medium(),
            ),
          );

          return AnimatedBuilder(
            animation: valueListener,
            builder: (context, child) {
              return Align(
                alignment: Alignment(valueListener.value * 2 - 1, .5),
                child: child,
              );
            },
            child: handle,
          );
        },
      ),
    );
  }
}
