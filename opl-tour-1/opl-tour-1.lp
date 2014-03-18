\ENCODING=ISO-8859-1
\Problem name: IloCplex

Maximize
 obj: 40 Gas + 50 Chloride + x3
Subject To
 ctNitrogen: Gas + Chloride <= 50
 ctHydrogen: 3 Gas + 4 Chloride <= 180
 ctChlorine: Chloride <= 40
Bounds
      x3 = 0
End
