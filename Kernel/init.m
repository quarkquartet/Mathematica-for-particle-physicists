(* ::Package:: *)

(* ::Title:: *)
(*User initialization file*)


(* ::Section:: *)
(*Academic Plot Theme*)


(** User Mathematica initialization file **)
(* ===== Academic Plot Theme ===== *)

(* ----- Begin ----- *)
Begin["System`PlotThemeDump`"];
Themes`ThemeRules;(*preload Theme system*)
(* Define the base theme. *)
resolvePlotTheme["Academic",def:_String]:=Themes`SetWeight[Join[resolvePlotTheme["AcademicFrame",def],resolvePlotTheme["Figure",def],resolvePlotTheme["AcademicStyle",def],resolvePlotTheme["VividColor",def]],Themes`$DesignWeight];

(* ----- Axes Features ----- *)
(* [ Specific Features for 2D Plots ] *)
(* Academic figures are framed by default. *)
resolvePlotTheme["AcademicFrame",def:_String]:=Themes`SetWeight[Join[{Axes->False,Frame->True},resolvePlotTheme["AcademicFrame2D",def]],$ComponentWeight];
(* Cases with axes also. *)
resolvePlotTheme["AcademicFrame",def:"Plot"|"ListPlot"|"ListLinePlot"|"ListStepPlot"|"PolarPlot"|"ListPolarPlot"|"PairedBarChart"|"PairedHistogram"]:=Themes`SetWeight[Join[{Axes->False,Frame->True},resolvePlotTheme["AcademicFrame2D",def]],$ComponentWeight];
(* Frame not specified,but MeshStyle specified to be thin and light. *)
resolvePlotTheme["AcademicFrame",def:"ArrayPlot"|"MatrixPlot"]:=Themes`SetWeight[Join[{MeshStyle->Directive[AbsoluteThickness[0.5],Opacity[0.25]]},resolvePlotTheme["AcademicFrame2D",def]],$ComponentWeight];
(* Charts are not framed. *)
resolvePlotTheme["AcademicFrame",def:"BarChart"|"PieChart"|"RectangleChart"|"SectorChart"|"CandlestickChart"|"KagiChart"|"LineBreakChart"|"PointFigureChart"|"RenkoChart"|"InteractiveTradingChart"|"TradingChart"|"NumberLinePlot"|"TimelinePlot"|"WordCloud"]:=resolvePlotTheme["AcademicFrame2D",def];
(* [ Specific Features for 3D Plots ] *)
(* Front axes back box. *)
resolvePlotTheme["AcademicFrame",def:_String/;StringMatchQ[def,___~~"3D"]]:=Themes`SetWeight[Join[{Axes->False,AxesEdge->{{-1,-1},{1,-1},{-1,-1}},Boxed->{Left,Bottom,Back}},resolvePlotTheme["AcademicFrame3D",def]],$ComponentWeight];
(* Front box back axes. *)
resolvePlotTheme["AcademicFrame","ChromaticityPlot3D"]:=Themes`SetWeight[Join[{Axes->False,AxesEdge->{{-1,-1},{-1,-1},{-1,1}},Boxed->{Left,Top,Front}},resolvePlotTheme["AcademicFrame3D","ChromaticityPlot3D"]],$ComponentWeight];
(* Chart3Ds are not boxed. *)
resolvePlotTheme["AcademicFrame",def:"BarChart3D"|"PieChart3D"|"RectangleChart3D"|"SectorChart3D"]:=resolvePlotTheme["AcademicFrame3D",def];
(* [ Common Axes Features ] *)
(* Mathematica's working theme:axes and frames too thin,terribly grayish,and tick/label font too small,but grids too thick.All these are fixed in the new theme. *)
resolvePlotTheme["AcademicFrame2D",_]:=Themes`SetWeight[{ImageSize->400,Background->White,LabelStyle->Directive[Background->White],BaseStyle->Directive[FontSize->20,FontFamily->"CMU Serif",InsetBoxOptions->Directive[Background->White]],AxesStyle->Directive[AbsoluteThickness[1],monoColor,FontSize->20,FontFamily->"CMU Serif"],FrameStyle->Directive[AbsoluteThickness[1],monoColor,FontSize->20,FontFamily->"CMU Serif"],TicksStyle->Directive[monoColor,FontSize->20,FontFamily->"CMU Serif"],FrameTicksStyle->Directive[monoColor,FontSize->20,FontFamily->"CMU Serif"],GridLinesStyle->Directive[AbsoluteThickness[0.5],Opacity[0.5]]},$ComponentWeight];
resolvePlotTheme["AcademicFrame3D",_]:=Themes`SetWeight[{ImageSize->400,Background->White,LabelStyle->Directive[Background->White],BaseStyle->Directive[FontSize->20,FontFamily->"CMU Serif",InsetBoxOptions->Directive[Background->White]],AxesStyle->Directive[AbsoluteThickness[1],monoColor,FontSize->20,FontFamily->"CMU Serif"],TicksStyle->Directive[monoColor,FontSize->20,FontFamily->"CMU Serif"],BoxStyle->monoColor},$ComponentWeight];

(* ----- Size Features ----- *)
(* 2D plots 180 pts. *)
resolvePlotTheme["Figure",def:_String]:=Themes`SetWeight[{ImageSizeRaw->{{180},{180}},LabelStyle->Directive[monoColor,FontSize->12]},Themes`$SizeWeight];
(* ArrayPlot,MatrixPlot smaller,140 pts. *)
resolvePlotTheme["Figure","ArrayPlot"|"MatrixPlot"]:=Themes`SetWeight[{ImageSizeRaw->{{140},{140}},LabelStyle->Directive[monoColor,FontSize->12]},Themes`$SizeWeight];
(* 3D plots 200 pts. *)
resolvePlotTheme["Figure",def:_String/;StringMatchQ[def,___~~"3D"]]:=Themes`SetWeight[{LabelStyle->Directive[monoColor,FontSize->12]},Themes`$SizeWeight];
(* Size not specified for LinePlots (because they are wide). *)
resolvePlotTheme["Figure","NumberLinePlot"|"TimelinePlot"]:={};

(* ----- Style Features ----- *)
(* Use absolute size. *)
resolvePlotTheme["AcademicStyle",def:_String]:=Themes`SetWeight[{BaseStyle->{Directive[InsetBoxOptions->Directive[Background->White]]},LabelStyle->Directive[Background->White],"DefaultPlotStyle"->Directive[AbsolutePointSize[4],AbsoluteThickness[1.5]],MeshStyle->Directive[monoColor,AbsoluteThickness[1]],"DefaultBoundaryStyle"->Directive[monoColor]},$LineThicknessWeight];
(* Special cases *)
resolvePlotTheme["AcademicStyle","ContourPlot"]:=Themes`SetWeight[{BaseStyle->{Directive[InsetBoxOptions->Directive[Background->White]]},ContourStyle->Directive[Opacity[1],AbsoluteThickness[0.8]],LabelStyle->Directive[Background->White],ExclusionsStyle->{None,Directive[Black,AbsoluteThickness[1]]},"DefaultPlotStyle"->Directive[AbsolutePointSize[4],AbsoluteThickness[1]],MeshStyle->Directive[monoColor,AbsoluteThickness[1]],"DefaultBoundaryStyle"->Directive[monoColor]},$LineThicknessWeight];
resolvePlotTheme["AcademicStyle","ComplexPlot"]:=Themes`SetWeight[{BaseStyle->{Directive[InsetBoxOptions->Directive[Background->White]]},BoundaryStyle->AbsoluteThickness[1],LabelStyle->Directive[Background->White],"DefaultPlotStyle"->Directive[AbsolutePointSize[4],AbsoluteThickness[1]],MeshStyle->Directive[monoColor,AbsoluteThickness[1]],"DefaultBoundaryStyle"->Directive[monoColor]},$LineThicknessWeight];


(* ----- Point Marker Features ----- *)
(* Define markers. *)
System`SmallOpenMarkers := {Graphics[{{GrayLevel[1], Disk[{0, 0}, Offset[{2., 2.}, {0., 0.}]]}, {AbsoluteThickness[1.5], Dashing[{}], Circle[{0, 0}, Offset[{2., 2.}, {0., 0.}]]}}, ImageSize -> 10], Graphics[{{GrayLevel[1], Polygon[{Offset[{0, 2.6}], Offset[{-2.25166604983954, -1.3}], Offset[{2.25166604983954, -1.3}]}]}, {AbsoluteThickness[1.5], Dashing[{}], JoinedCurve[Line[{Offset[{0, 2.6}], Offset[{-2.25166604983954, -1.3}], Offset[{2.25166604983954, -1.3}], Offset[{0, 2.6}]}], CurveClosed -> True]}}, ImageSize -> 10], Graphics[{{GrayLevel[1], Polygon[{Offset[{0, 2.5}], Offset[{2.5, 0}], Offset[{0, -2.5}], Offset[{-2.5, 0}]}]}, {AbsoluteThickness[1.5], Dashing[{}], Line[{Offset[{0, 2.5}], Offset[{2.5, 0}], Offset[{0, -2.5}], Offset[{-2.5, 0}], Offset[{0, 2.5}]}]}}, ImageSize -> 10], Graphics[{{GrayLevel[1], Polygon[{Offset[{-1.8, -1.8}], Offset[{1.8, -1.8}], Offset[{1.8, 1.8}], Offset[{-1.8, 1.8}], Offset[{-1.8, -1.8}]}]}, {AbsoluteThickness[1.5], Dashing[{}], Line[{Offset[{-1.8, -1.8}], Offset[{1.8, -1.8}], Offset[{1.8, 1.8}], Offset[{-1.8, 1.8}], Offset[{-1.8, -1.8}]}]}}, ImageSize -> 10], Graphics[{{GrayLevel[1], Polygon[{Offset[{0, -2.6}], Offset[{-2.25166604983954, 1.3}], Offset[{2.25166604983954, 1.3}]}]}, {AbsoluteThickness[1.5], Dashing[{}], JoinedCurve[Line[{Offset[{0, -2.6}], Offset[{-2.25166604983954, 1.3}], Offset[{2.25166604983954, 1.3}], Offset[{0, -2.6}]}], CurveClosed -> True]}}, ImageSize -> 10]};
resolvePlotTheme["SmallOpenMarkers",def:_String]:=Themes`SetWeight[{PlotMarkers->System`SmallOpenMarkers},$ComponentWeight];

(* ----- Deploy Plot Theme ----- *)
End[];
$PlotTheme="Academic";(*Set to default plot theme*)
SetOptions[Plot, LabelStyle -> Directive[Background -> White]];


<<PlotFunctions`
