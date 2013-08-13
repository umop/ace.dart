@Group('Point')
library ace.test.point;

import 'package:ace/ace.dart';
import 'package:bench/meta.dart';
import 'package:unittest/unittest.dart';

@Test()
void testPointCtor() {
  final point = new Point(1, 2);
  expect(point.row, equals(1));
  expect(point.column, equals(2));
}

@Test('Test the `==` operator.')
void testPointEquals() {
  var x = new Point(1, 2);
  var y = new Point(1, 2);
  var z = new Point(1, 2);
  expect(x, isNot(equals(null)));
  expect(x, equals(x));
  expect(x, equals(y));
  expect(y, equals(x));
  expect(y, equals(z));
  expect(x, equals(z));
  expect(x.hashCode, equals(y.hashCode));
  expect(y.hashCode, equals(z.hashCode));
  expect(x.hashCode, equals(z.hashCode));
  var w = new Point(-1, 2);
  expect(x, isNot(equals(w)));
  expect(w, isNot(equals(x)));
  expect(w.hashCode, isNot(equals(x.hashCode)));
  w = new Point(1, -2);
  expect(w, isNot(equals(x)));
  expect(w.hashCode, isNot(equals(x.hashCode)));
}

@Test('Test the `toString` method.')
void testPointToString() {
  var p = new Point(1, 2);
  expect(p.toString(), equals("Point: [1/2]"));
}