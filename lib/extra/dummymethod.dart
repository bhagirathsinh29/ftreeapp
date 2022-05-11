import 'package:flutter/material.dart';

class FaceOutlinePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint1 = Paint()
      ..color = Colors.purple
      ..style = PaintingStyle.stroke
      ..strokeWidth = 3;

    Path path1 = Path();

    path1.moveTo(size.width / 2, size.width / 3); //Ax, Ay
    path1.quadraticBezierTo(
        size.width / 15, //Bx,
        size.height / 6, //By,

        size.width / 2, //Cx,
        size.height / 4); //Cy

    path1.quadraticBezierTo(
        size.height / 2, //Dx,
        size.width / 1.5, //Dy,

        size.width, //Ex,
        size.width / 2); // Ey
    // canvas.drawPath(path1, paint1);

/////////////////////////////////////////////////////////

    Paint paint = Paint()
      ..color = Colors.red
      ..style = PaintingStyle.stroke
      ..strokeWidth = 3;
    Path path = Path();

    path.moveTo(
      0, //Ax,
      size.width / 2,
    ); // Ay

    path.quadraticBezierTo(
        size.width / 15, //Bx,
        size.height / 6, //By,

        size.width / 2, //Cx,
        size.height / 4); //Cy

    path.quadraticBezierTo(
        size.height / 2, //Dx,
        size.width / 1.5, //Dy,

        size.width, //Ex,
        size.width / 2); // Ey

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(FaceOutlinePainter oldDelegate) => false;
}
