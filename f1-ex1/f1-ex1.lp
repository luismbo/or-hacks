\ENCODING=ISO-8859-1
\Problem name: IloCplex

Maximize
 obj: 12 x(1)(1) + 17 x(1)(2) + 13 x(1)(3) + 14 x(1)(4) + 18 x(1)(5)
      + 11 x(2)(1) + 15 x(2)(2) + 13 x(2)(3) + 13 x(2)(4) + 16 x(2)(5)
      + 13 x(3)(1) + 16 x(3)(2) + 15 x(3)(3) + 14 x(3)(4) + 17 x(3)(5)
      + 12 x(4)(1) + 15 x(4)(2) + 14 x(4)(3) + 12 x(4)(4) + 15 x(4)(5)
      + 10 x(5)(1) + 13 x(5)(2) + 11 x(5)(3) + 13 x(5)(4) + 14 x(5)(5) + x26
Subject To
 c1:  x(1)(1) + x(1)(2) + x(1)(3) + x(1)(4) + x(1)(5)  = 1
 c2:  x(2)(1) + x(2)(2) + x(2)(3) + x(2)(4) + x(2)(5)  = 1
 c3:  x(3)(1) + x(3)(2) + x(3)(3) + x(3)(4) + x(3)(5)  = 1
 c4:  x(4)(1) + x(4)(2) + x(4)(3) + x(4)(4) + x(4)(5)  = 1
 c5:  x(5)(1) + x(5)(2) + x(5)(3) + x(5)(4) + x(5)(5)  = 1
 c6:  x(1)(1) + x(2)(1) + x(3)(1) + x(4)(1) + x(5)(1)  = 1
 c7:  x(1)(2) + x(2)(2) + x(3)(2) + x(4)(2) + x(5)(2)  = 1
 c8:  x(1)(3) + x(2)(3) + x(3)(3) + x(4)(3) + x(5)(3)  = 1
 c9:  x(1)(4) + x(2)(4) + x(3)(4) + x(4)(4) + x(5)(4)  = 1
 c10: x(1)(5) + x(2)(5) + x(3)(5) + x(4)(5) + x(5)(5)  = 1
Bounds
 0 <= x(1)(1) <= 1
 0 <= x(1)(2) <= 1
 0 <= x(1)(3) <= 1
 0 <= x(1)(4) <= 1
 0 <= x(1)(5) <= 1
 0 <= x(2)(1) <= 1
 0 <= x(2)(2) <= 1
 0 <= x(2)(3) <= 1
 0 <= x(2)(4) <= 1
 0 <= x(2)(5) <= 1
 0 <= x(3)(1) <= 1
 0 <= x(3)(2) <= 1
 0 <= x(3)(3) <= 1
 0 <= x(3)(4) <= 1
 0 <= x(3)(5) <= 1
 0 <= x(4)(1) <= 1
 0 <= x(4)(2) <= 1
 0 <= x(4)(3) <= 1
 0 <= x(4)(4) <= 1
 0 <= x(4)(5) <= 1
 0 <= x(5)(1) <= 1
 0 <= x(5)(2) <= 1
 0 <= x(5)(3) <= 1
 0 <= x(5)(4) <= 1
 0 <= x(5)(5) <= 1
      x26 = 0
Binaries
 x(1)(1)  x(1)(2)  x(1)(3)  x(1)(4)  x(1)(5)  x(2)(1)  x(2)(2)  x(2)(3) 
 x(2)(4)  x(2)(5)  x(3)(1)  x(3)(2)  x(3)(3)  x(3)(4)  x(3)(5)  x(4)(1) 
 x(4)(2)  x(4)(3)  x(4)(4)  x(4)(5)  x(5)(1)  x(5)(2)  x(5)(3)  x(5)(4) 
 x(5)(5) 
End
