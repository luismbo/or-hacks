\ENCODING=ISO-8859-1
\Problem name: IloCplex

Maximize
 obj: 40 Production("gas") + 50 Production("chloride") + x3
Subject To
 ct("nitrogen"): Production("gas") + Production("chloride") <= 50
 ct("hydrogen"): 3 Production("gas") + 4 Production("chloride") <= 180
 ct("chlorine"): Production("chloride") <= 40
Bounds
      x3 = 0
End
