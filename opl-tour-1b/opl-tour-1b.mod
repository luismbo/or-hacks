/*********************************************
 * OPL 12.6.0.0 Model
 * Author: luismbo
 * Creation Date: 28 Feb 2014 at 14:29:06
 *********************************************/

{string} Products = ...;
{string} Components = ...;

float Demand[Products][Components] = ...;
float Profit[Products] = ...;
float Stock[Components] = ...;

dvar float+ Production[Products];

maximize
  sum (p in Products) Profit[p] * Production[p];

subject to {
	forall (c in Components)
	  ct: sum (p in Products)
	        Production[p] * Demand[p][c] <= Stock[c];
}