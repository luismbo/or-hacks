{string} Cities = ...;
float Distance[Cities][Cities];

dvar boolean TravelBetween[Cities][Cities];

minimize
  sum (i in Cities, j in Cities) TravelBetween[i][j] * Distance[i][j];

subject to {
  forall (i in Cities) {
    ctSingleDeparture:
      sum (j in Cities) TravelBetween[i][j] == 1;
    ctSingleArrival:
      sum (j in Cities) TravelBetween[j][i] == 1;
    ctMustLeaveCity:
      TravelBetween[i][i] == 0;
  }    
}