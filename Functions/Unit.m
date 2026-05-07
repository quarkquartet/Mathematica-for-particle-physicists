(* ::Package:: *)

(* ::Input:: *)
(**)


export2py[filename_,data\[ReversePrime]and\[ReversePrime]name_(*{{data1,data1name},{data2,data2name},...}*)]:=
Module[{pystr},
pystr=StringJoin@
Table[dn[[2]]<>"="<>ExportString[dn[[1]],"PythonExpression"]<>"\n",{dn,data\[ReversePrime]and\[ReversePrime]name}];
Export[filename,pystr,"Text"];
]

set\[ReversePrime]unit[evset_]:=( 
Which[
evset[[1]]=="eV",eV=evset[[2]],
evset[[1]]=="keV",eV=evset[[2]]/10^3,
evset[[1]]=="MeV",eV=evset[[2]]/10^6,
evset[[1]]=="GeV",eV=evset[[2]]/10^9,
True,Print["unit set error!!"];Interrupt[]];
(*If[Not[NumericQ[eV]],Print["unit set error!!"];Interrupt[]];*)
MeV=10^6 eV;
GeV=10^9 eV;
keV=10^3 eV;
StandardModelGF=1.166 10^-5 GeV^-2;
unit\[ReversePrime]gram=5.610 10^32 eV;
unit\[ReversePrime]kg=10^3 unit\[ReversePrime]gram;
unit\[ReversePrime]second\[ReversePrime]inv=6.582 10^-16 eV;
unit\[ReversePrime]cm\[ReversePrime]inv=1.973 10^-5 eV;
unit\[ReversePrime]cm=1/unit\[ReversePrime]cm\[ReversePrime]inv;
unit\[ReversePrime]second=unit\[ReversePrime]second\[ReversePrime]inv^-1;
unit\[ReversePrime]meter=100(unit\[ReversePrime]cm\[ReversePrime]inv^-1);
unit\[ReversePrime]km=10^3 unit\[ReversePrime]meter;
unit\[ReversePrime]year=365 24 3600 unit\[ReversePrime]second;
unit\[ReversePrime]K=8.617 10^-5 eV;
unit\[ReversePrime]kpc=3.086 10^16 unit\[ReversePrime]km;
unit\[ReversePrime]Mpc=10^3 unit\[ReversePrime]kpc;
unit\[ReversePrime]Msun=1.9884 10^30 unit\[ReversePrime]kg;
unit\[ReversePrime]erg=6.242 *10^11 eV;
unit\[ReversePrime]barn=10^-28 unit\[ReversePrime]meter^2;
unit\[ReversePrime]mpl=1.22*10^19 * GeV;
unit\[ReversePrime]Mp=unit\[ReversePrime]mpl/Sqrt[8*Pi];
unit\[ReversePrime]Msun=1.98*10^30*unit\[ReversePrime]kg;
)

clear\[ReversePrime]eV[]:=(Clear[eV]; set\[ReversePrime]unit["eV" -> eV])
clear\[ReversePrime]keV[]:=(Clear[keV]; set\[ReversePrime]unit["keV" -> keV])
clear\[ReversePrime]MeV[]:=(Clear[MeV]; set\[ReversePrime]unit["eV" -> MeV])
clear\[ReversePrime]GeV[]:=(Clear[GeV]; set\[ReversePrime]unit["GeV" -> GeV])

Print["Package loaded."]
Print["Please define your unit."]
Print["Example 1: set\[ReversePrime]unit[\"GeV\"\[Rule]1]" ]
Print["Example 2: set\[ReversePrime]unit[\"MeV\" -> MeV]"]
Print["To redefine units, for example, want to switch to eV, run clear\[ReversePrime]eV"]


