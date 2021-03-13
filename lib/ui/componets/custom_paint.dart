import 'package:flutter/material.dart';
import 'dart:math' as math;

class CustomShapeBorder extends NotchedShape {
  @override
  Path getOuterPath(Rect host, Rect guest) {

    if (guest == null || !host.overlaps(guest)) return Path()..addRect(host);

    // The guest's shape is a circle bounded by the guest rectangle.
    // So the guest's radius is half the guest width.
    final double notchRadius = guest.width / 2.0;

    // We build a path for the notch from 3 segments:
    // Segment A - a Bezier curve from the host's top edge to segment B.
    // Segment B - an arc with radius notchRadius.
    // Segment C - a Bezier curve from segment B back to the host's top edge.
    //
    // A detailed explanation and the derivation of the formulas below is
    // available at: https://goo.gl/Ufzrqn

    const double s1 = 15.0;
    const double s2 = 1.0;

    final double r = notchRadius;
    final double a = -1.0 * r - s2;
    final double b = host.top - guest.center.dy;

    final double n2 = math.sqrt(b * b * r * r * (a * a + b * b - r * r));
    final double p2xA = ((a * r * r) - n2) / (a * a + b * b);
    final double p2xB = ((a * r * r) + n2) / (a * a + b * b);
    final double p2yA = math.sqrt(r * r - p2xA * p2xA);
    final double p2yB = math.sqrt(r * r - p2xB * p2xB);

    final List<Offset> p = List<Offset>.filled(6, null, growable: false);

    // p0, p1, and p2 are the control points for segment A.
    p[0] = Offset(a - s1, b);
    print("ewrwr " + p[0].toString());
    p[1] = Offset(a, b);
    final double cmp = b < 0 ? -1.0 : 1.0;
    p[2] = cmp * p2yA > cmp * p2yB ? Offset(p2xA, p2yA) : Offset(p2xB, p2yB);

    // p3, p4, and p5 are the control points for segment B, which is a mirror
    // of segment A around the y axis.
    p[3] = Offset(-1.0 * p[2].dx, p[2].dy);
    p[4] = Offset(-1.0 * p[1].dx, p[1].dy);
    p[5] = Offset(-1.0 * p[0].dx, p[0].dy);

    // translate all points back to the absolute coordinate system.
    for (int i = 0; i < p.length; i += 1) {
      p[i] = p[i] + guest.center;
      // print("p$i:"+p[i].toString());
    }
    // print("host : "+host.top.toString()+","+host.left.toString());
    // print("guest center : "+guest.center.toString());
    // print("notch radius $notchRadius and a $a");
    // print("left : ${host.left} ");
    return Path()
      ..moveTo(host.left, host.bottom)
      ..lineTo(host.left, host.top - 35)
      ..quadraticBezierTo(
          host.left, host.top, host.left + guest.center.dx / 3, host.top)
      ..lineTo(host.left + guest.center.dx, host.top)
      ..lineTo(p[0].dx, p[0].dy)
      ..quadraticBezierTo(p[1].dx, p[1].dy, p[2].dx, p[2].dy)
      ..arcToPoint(
        p[3],
        radius: Radius.circular(notchRadius),
        clockwise: false,
      )
      ..quadraticBezierTo(p[4].dx, p[4].dy, p[5].dx, p[5].dy)
      ..lineTo(host.right - guest.width * 0.8, host.top)
      ..quadraticBezierTo(host.right, host.top, host.right, host.top - 35)
      ..lineTo(host.right, host.top - 35)
      ..lineTo(host.right, host.bottom)
      ..close();
  }
}
