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

tuple productData {
  float inCost;
  float outCost;
  float consumption[Resources];
  float demand;
}

productData Product[Products] = ...;
float Capacity[Resources] = ...;

dvar float+ InProduction[Products];
dvar float+ OutProduction[Products];

minimize
  sum (p in Products)
    (InProduction[p] * Product[p].inCost +
     OutProduction[p] * Product[p].outCost);

subject to {
  forall (p in Products)
    ctDemand:
      InProduction[p] + OutProduction[p] >= Product[p].demand;

  forall (r in Resources)
    ctCapacity:
      sum (p in Products)
        InProduction[p] * Product[p].consumption[r] <= Capacity[r];
}