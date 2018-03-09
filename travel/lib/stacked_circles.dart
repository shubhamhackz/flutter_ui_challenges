import 'package:flutter/material.dart';
import 'package:travel/circles.dart';

class StackedCircles extends StatelessWidget {

  final double circleDiameter;

  StackedCircles(this.circleDiameter);

  @override
  Widget build(BuildContext context) {
    return new SizedBox(
      width: circleDiameter * 2,
      height: circleDiameter,
      child: new Stack(
        children: <Widget>[
          new Align(
            alignment: new Alignment(-0.5, 0.0),
            child: new Circle(color: Colors.purple, diameter: circleDiameter),
          ),
          new Align(
            alignment: new Alignment(0.5, 0.0),
            child: new Opacity(
              opacity: 0.8,
              child: new Circle(color: Colors.yellow, diameter: circleDiameter),
            ),
          ),
        ],
      ),
    );
  }
}

class StackedCirclesAnimation extends StatelessWidget {

  final Animation<double> controller;
  final Animation<double> diameter;
  final Animation<Alignment> alignment, alignment1;

  StackedCirclesAnimation({Key key, this.controller}):
        diameter = new Tween<double>(
            end: 25.0,
            begin: 30.0
        ).animate(new CurvedAnimation(parent: controller, curve: new Interval(0.0, 1.0, curve: Curves.ease))),

      alignment = new AlignmentTween(
          begin: new Alignment(-0.5, 0.0),
          end: new Alignment(0.2, 0.0),
        ).animate(new CurvedAnimation(parent: controller, curve: new Interval(0.0, 1.0, curve: Curves.ease))),

        alignment1 = new AlignmentTween(
          begin: new Alignment(0.5, 0.0),
          end: new Alignment(-0.2, 0.0),
        ).animate(new CurvedAnimation(parent: controller, curve: new Interval(0.0, 1.0, curve: Curves.ease))),

        super(key: key);

  Widget _buildAnimation(BuildContext context, Widget child){
    return new Stack(
      children: <Widget>[
        new Align(
          alignment: alignment.value,
          child: new Circle(color: Colors.purple, diameter: diameter.value),
        ),
        new Align(
          alignment: alignment1.value,
          child: new Opacity(
            opacity: 0.8,
            child: new Circle(color: Colors.yellow, diameter: diameter.value),
          ),
        ),
      ],
    );
  }
  @override
  Widget build(BuildContext context) {
    return new AnimatedBuilder(
      builder: _buildAnimation,
      animation: controller,
    );
  }
}
