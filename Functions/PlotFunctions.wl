(* ::Package:: *)

BeginPackage["PlotFunctions`"];


LogTicks::usage = "Define log scale plot ticks.";
CleanRegionPlot::usage = "Make the RegionPlot clean of grids when saved as PDF file.";


Begin["`Private`"];


LogTicks[lower_, upper_, step_] := 
  Flatten[Module[{Local = #, LocalTicks}, 
      LocalTicks = 
       Log[10, Range[10^(# - 1), 
         10^#, (10^# - 10^(# - 1))/(10 - 1)]];
      Join[{#, ""} & /@ 
        Most[LocalTicks], {{Last[LocalTicks], 
         Which[Last[LocalTicks] == 0, 1, Last[LocalTicks] == 1, 10, 
          True, Power[10, ToString[Last[LocalTicks]]]], {0.03, 
          0}(*longer ticks*)}}]] & /@ Range[lower, upper, step], 1];


CleanRegionPlot[cp_Graphics]:=Module[{points,groups,regions,lines},groups=Cases[cp,{style__,g_GraphicsGroup}:>{{style},g},Infinity];
points=First@Cases[cp,GraphicsComplex[pts_,___]:>pts,Infinity];
regions=Table[Module[{group,style,polys,edges,cover,graph},{style,group}=g;
polys=Join@@Cases[group,Polygon[pt_,___]:>pt,Infinity];
edges=Join@@(Partition[#,2,1,1]&/@polys);
cover=Cases[Tally[Sort/@edges],{e_,1}:>e];
graph=Graph[UndirectedEdge@@@cover];
{Sequence@@style,FilledCurve[List/@Line/@First/@Map[First,FindEulerianCycle/@(Subgraph[graph,#]&)/@ConnectedComponents[graph],{3}]]}],{g,groups}];
lines=Cases[cp,{__,_Line},Infinity];(*only change*)Graphics[GraphicsComplex[points,{regions,lines}],Sequence@@Options[cp]]];


End[];


EndPackage[];
