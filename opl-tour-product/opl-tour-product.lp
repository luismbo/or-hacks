\ENCODING=ISO-8859-1
\Problem name: IloCplex

Minimize
 obj: 0.6 InProduction("kluski") + 0.8 OutProduction("kluski")
      + 0.8 InProduction("capellini") + 0.9 OutProduction("capellini")
      + 0.3 InProduction("fettucine") + 0.4 OutProduction("fettucine") + x7
Subject To
 ctDemand("kluski"):    InProduction("kluski") + OutProduction("kluski") >= 100
 ctDemand("capellini"): InProduction("capellini") + OutProduction("capellini")
                        >= 200
 ctDemand("fettucine"): InProduction("fettucine") + OutProduction("fettucine")
                        >= 300
 ctCapacity("flour"):   0.5 InProduction("kluski")
                        + 0.4 InProduction("capellini")
                        + 0.3 InProduction("fettucine") <= 20
 ctCapacity("eggs"):    0.2 InProduction("kluski")
                        + 0.4 InProduction("capellini")
                        + 0.6 InProduction("fettucine") <= 40
Bounds
      x7 = 0
End
