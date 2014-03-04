// Consider the following application involving mixing some metals into
// an alloy. The metal may come from several sources: in pure form or
// from raw materials, scraps from previous mixes, or ingots. The alloy
// must contain a certain amount of the various metals, as expressed by
// a production constraint specifying lower and upper bounds for the
// quantity of each metal in the alloy. Each source also has a cost and
// the problem consists of blending the sources into the alloy while
// minimizing the cost and satisfying the production constraints.

int   NbMetals = ...;
int   NbRaw = ...;
int   NbScrap = ...;
int   NbIngo = ...;

range Metals = 1..NbMetals;
range Raws = 1..NbRaw;
range Scraps = 1..NbScrap;
range Ingos = 1..NbIngo;

float CostMetal[Metals] = ...;
float CostRaw[Raws] = ...;
float CostScrap[Scraps] = ...;
float CostIngo[Ingos] = ...;
float Low[Metals] = ...;
float Up[Metals] = ...;
float PercRaw[Metals][Raws] = ...;
float PercScrap[Metals][Scraps] = ...;
float PercIngo[Metals][Ingos] = ...;

int Alloy  = ...;

dvar float+    p[Metals];
dvar float+    r[Raws];
dvar float+    s[Scraps];
dvar int+      i[Ingos];
dvar float    m[j in Metals] in Low[j] * Alloy .. Up[j] * Alloy;

minimize 
  sum (j in Metals) CostMetal[j] * p[j] +
  sum (j in Raws)   CostRaw[j]   * r[j] +
  sum (j in Scraps) CostScrap[j] * s[j] +
  sum (j in Ingos)  CostIngo[j]  * i[j];

subject to {
  forall (j in Metals)
    ct1:
      m[j] == p[j] + 
              sum (k in Raws)   PercRaw[j][k] * r[k] +
              sum (k in Scraps) PercScrap[j][k] * s[k] +
              sum (k in Ingos)  PercIngo[j][k] * i[k];
    ct2:  
      sum (j in Metals) m[j] == Alloy;
}