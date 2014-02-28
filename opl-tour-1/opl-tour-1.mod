/*********************************************
 * OPL 12.6.0.0 Model
 * Author: luismbo
 * Creation Date: 28 Feb 2014 at 13:15:06
 *********************************************/

// Consider a Belgian company Volsay, which specializes in producing ammoniac
// gas (NH3) and ammonium chloride (NH4Cl). Volsay has at its disposal 50 units
// of nitrogen (N), 180 units of hydrogen (H), and 40 units of chlorine (Cl).
// The company makes a profit of 40 Euros for each sale of an ammoniac gas unit
// and 50 Euros for each sale of an ammonium chloride unit. Volsay would like a
// production plan maximizing its profits given its available stocks. 

dvar float+ Gas;
dvar float+ Chloride;

maximize 40*Gas + 50*Chloride;

subject to {
	ctNitrogen: Gas + Chloride <= 50;
	ctHydrogen: 3*Gas + 4*Chloride <= 180;
	ctChlorine: Chloride <= 40;
}