// To meet the demands of its customers, a company manufactures its products
// in its own factories (inside production) or buys them from other companies
// (outside production).
//
// Inside production is subject to some resource constraints: each product
// consumes a certain amount of each resource. In contrast, outside production
// is theoretically unlimited. The problem is to determine how much of each
// product should be produced inside and outside the company while minimizing
// the overall production cost, meeting the demand, and satisfying the resource
// constraints.

{string} Resources = ...;
{string} Products = ...;

float InCost[Products] = ...;
float OutCost[Products] = ...;
float Consumption[Products][Resources] = ...;
float Demand[Products] = ...;
float Capacity[Resources] = ...;

dvar float+ InProduction[Products];
dvar float+ OutProduction[Products];

minimize
  sum (p in Products)
    (InProduction[p] * InCost[p] + OutProduction[p] * OutCost[p]);

subject to {
  forall (p in Products)
    ctDemand:
      InProduction[p] + OutProduction[p] >= Demand[p];

  forall (r in Resources)
    ctCapacity:
      sum (p in Products)
        InProduction[p] * Consumption[p][r] <= Capacity[r];
}