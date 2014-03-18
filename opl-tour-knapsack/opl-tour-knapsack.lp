\ENCODING=ISO-8859-1
\Problem name: IloCplex

Maximize
 obj: 96 Take(1) + 76 Take(2) + 56 Take(3) + 11 Take(4) + 86 Take(5)
      + 10 Take(6) + 66 Take(7) + 86 Take(8) + 83 Take(9) + 12 Take(10)
      + 9 Take(11) + 81 Take(12) + x13
Subject To
 ct(1): 19 Take(1) + Take(2) + 10 Take(3) + Take(4) + Take(5) + 14 Take(6)
        + 152 Take(7) + 11 Take(8) + Take(9) + Take(10) + Take(11) + Take(12)
        <= 18209
 ct(2): 4 Take(2) + 53 Take(3) + 80 Take(6) + 4 Take(8) + 5 Take(9) <= 7692
 ct(3): 4 Take(1) + 660 Take(2) + 3 Take(3) + 30 Take(5) + 3 Take(7)
        + 4 Take(9) + 90 Take(10) <= 1333
 ct(4): 7 Take(1) + 18 Take(3) + 6 Take(4) + 770 Take(5) + 330 Take(6)
        + 7 Take(7) + 6 Take(10) <= 924
 ct(5): 20 Take(2) + 4 Take(4) + 52 Take(5) + 3 Take(6) + 5 Take(10)
        + 4 Take(11) <= 26638
 ct(6): 40 Take(3) + 70 Take(4) + 4 Take(5) + 63 Take(6) + 60 Take(9)
        + 4 Take(11) <= 61188
 ct(7): 32 Take(2) + 5 Take(6) + 3 Take(8) + 660 Take(10) + 9 Take(12) <= 13360
Bounds
 0 <= Take(1) <= 61188
 0 <= Take(2) <= 61188
 0 <= Take(3) <= 61188
 0 <= Take(4) <= 61188
 0 <= Take(5) <= 61188
 0 <= Take(6) <= 61188
 0 <= Take(7) <= 61188
 0 <= Take(8) <= 61188
 0 <= Take(9) <= 61188
 0 <= Take(10) <= 61188
 0 <= Take(11) <= 61188
 0 <= Take(12) <= 61188
      x13 = 0
Generals
 Take(1)  Take(2)  Take(3)  Take(4)  Take(5)  Take(6)  Take(7)  Take(8) 
 Take(9)  Take(10)  Take(11)  Take(12) 
End
