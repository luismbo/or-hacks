dvar float+ x1;
dvar float+ x2;

maximize 20*x1 + 30*x2;

subject to {
  ctX1: x1 <= 9;
  ctX2: x2 <= 9;
  ctTotalHours: x1 + x2 <= 14;
  ctResources: 2*x1 + 0.75*x2 <= 20;
}