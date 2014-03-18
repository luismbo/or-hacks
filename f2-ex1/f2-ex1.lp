\ENCODING=ISO-8859-1
\Problem name: IloCplex

Maximize
 obj: 20 x1 + 30 x2 + x3
Subject To
 ctX1:         x1 <= 9
 ctX2:         x2 <= 9
 ctTotalHours: x1 + x2 <= 14
 ctResources:  2 x1 + 0.75 x2 <= 20
Bounds
      x3 = 0
End
