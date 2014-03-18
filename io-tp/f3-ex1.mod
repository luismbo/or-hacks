dvar float+ x1;
dvar float+ x2;

maximize x1 + x2;

subject to {
  c1: 2*x1 + x2 <= 6;
  c2: 4*x1 + x2 <= 8;
  c3: x1 + 2*x2 >= 4;
  c4: x2 <= 4;
}