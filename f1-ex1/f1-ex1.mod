int m = ...;
int n = ...;

range Rows = 1 .. m;
range Cols = 1 .. n;

dvar boolean x[Rows][Cols];
float A[Rows][Cols] = ...;

maximize
  sum(i in Rows, j in Cols) x[i][j] * A[i][j];
  
subject to {
  forall (i in Rows) sum (j in Cols) x[i][j] == 1;
  forall (j in Cols) sum (i in Rows) x[i][j] == 1;
}