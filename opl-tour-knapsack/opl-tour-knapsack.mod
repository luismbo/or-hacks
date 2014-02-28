// We have a knapsack with a fixed capacity (an integer) and a number
// of items. Each item has an associated weight (an integer) and an
// associated value (another integer). The problem consists of filling
// the knapsack without exceeding its capacity, while maximizing the
// overall value of its contents. A multi-knapsack problem is similar
// to the knapsack problem, except that there are multiple features for
// the object (e.g., weight and volume) and multiple capacity constraints.

int ItemCount = ...;
int ResourceCount = ...;

range Items = 1..ItemCount;
range Resources = 1..ResourceCount;

int Capacity[Resources] = ...;
int MaxCapacity = max (r in Resources) Capacity[r];

int Value[Items] = ...;
int Use[Resources][Items] = ...;

dvar int Take[Items] in 0..MaxCapacity;

maximize
  sum (i in Items) Take[i] * Value[i];

subject to {
  forall (r in Resources)
    ct:
      sum (i in Items) Take[i] * Use[r][i] <= Capacity[r];
}