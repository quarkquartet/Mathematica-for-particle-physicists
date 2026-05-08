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
resolvePlotTheme["AcademicFrame2D",_]:=Themes`SetWeight[{ImageSize->500,Background->White,LabelStyle->Directive[Background->White,FontFamily->"Latin Modern Roman",FontSize->25,Black],BaseStyle->Directive[FontSize->25,FontFamily->"Latin Modern Roman",InsetBoxOptions->Directive[Background->White,PrivateFontOptions->{"OperatorSubstitute"->False}]],AxesStyle->Directive[AbsoluteThickness[1.25],GrayLevel[0],FontSize->25,FontFamily->"Latin Modern Roman"],FrameStyle->Directive[AbsoluteThickness[1.25],GrayLevel[0],FontSize->25,FontFamily->"Latin Modern Roman"],TicksStyle->Directive[GrayLevel[0],FontSize->25,FontFamily->"Latin Modern Roman"],FrameTicksStyle->Directive[GrayLevel[0],FontSize->25,FontFamily->"Latin Modern Roman"],GridLinesStyle->Directive[AbsoluteThickness[0.6],Opacity[0.5]]},$ComponentWeight];
resolvePlotTheme["AcademicFrame3D",_]:=Themes`SetWeight[{ImageSize->500,Background->White,LabelStyle->Directive[Background->White,FontFamily->"Latin Modern Roman",FontSize->25,Black],BaseStyle->Directive[FontSize->25,FontFamily->"Latin Modern Roman",InsetBoxOptions->Directive[Background->White,PrivateFontOptions->{"OperatorSubstitute"->False}]],AxesStyle->Directive[AbsoluteThickness[1.25],GrayLevel[0],FontSize->25,FontFamily->"Latin Modern Roman"],TicksStyle->Directive[GrayLevel[0],FontSize->25,FontFamily->"Latin Modern Roman"],BoxStyle->GrayLevel[0]},$ComponentWeight];

(* ----- Size Features ----- *)
(* 2D plots 180 pts. *)
resolvePlotTheme["Figure",def:_String]:=Themes`SetWeight[{ImageSizeRaw->{{180},{180}},LabelStyle->Directive[GrayLevel[0],FontSize->12]},Themes`$SizeWeight];
(* ArrayPlot,MatrixPlot smaller,140 pts. *)
resolvePlotTheme["Figure","ArrayPlot"|"MatrixPlot"]:=Themes`SetWeight[{ImageSizeRaw->{{140},{140}},LabelStyle->Directive[GrayLevel[0],FontSize->12]},Themes`$SizeWeight];
(* 3D plots 200 pts. *)
resolvePlotTheme["Figure",def:_String/;StringMatchQ[def,___~~"3D"]]:=Themes`SetWeight[{LabelStyle->Directive[GrayLevel[0],FontSize->12]},Themes`$SizeWeight];
(* Size not specified for LinePlots (because they are wide). *)
resolvePlotTheme["Figure","NumberLinePlot"|"TimelinePlot"]:={};

(* ----- Style Features ----- *)
(* Use absolute size. *)
resolvePlotTheme["AcademicStyle",def:_String]:=Themes`SetWeight[{BaseStyle->{Directive[InsetBoxOptions->Directive[Background->White,PrivateFontOptions->{"OperatorSubstitute"->False}]]},LabelStyle->Directive[Background->White],"DefaultPlotStyle"->Directive[AbsolutePointSize[5],AbsoluteThickness[2]],MeshStyle->Directive[GrayLevel[0],AbsoluteThickness[1.25]],"DefaultBoundaryStyle"->Directive[GrayLevel[0]]},$LineThicknessWeight];
(* Special cases *)
resolvePlotTheme["AcademicStyle","ContourPlot"]:=Themes`SetWeight[{BaseStyle->{Directive[InsetBoxOptions->Directive[Background->White,PrivateFontOptions->{"OperatorSubstitute"->False}]]},ContourStyle->Directive[Opacity[1],AbsoluteThickness[1.0]],LabelStyle->Directive[Background->White],ExclusionsStyle->{None,Directive[GrayLevel[0],AbsoluteThickness[1.25]]},"DefaultPlotStyle"->Directive[AbsolutePointSize[5],AbsoluteThickness[1.25]],MeshStyle->Directive[GrayLevel[0],AbsoluteThickness[1.25]],"DefaultBoundaryStyle"->Directive[GrayLevel[0]]},$LineThicknessWeight];
resolvePlotTheme["AcademicStyle","ComplexPlot"]:=Themes`SetWeight[{BaseStyle->{Directive[InsetBoxOptions->Directive[Background->White,PrivateFontOptions->{"OperatorSubstitute"->False}]]},BoundaryStyle->AbsoluteThickness[1.25],LabelStyle->Directive[Background->White],"DefaultPlotStyle"->Directive[AbsolutePointSize[5],AbsoluteThickness[1.25]],MeshStyle->Directive[GrayLevel[0],AbsoluteThickness[1.25]],"DefaultBoundaryStyle"->Directive[GrayLevel[0]]},$LineThicknessWeight];


(* ----- Point Marker Features ----- *)
(* Define markers. *)
System`SmallOpenMarkers := {Graphics[{{GrayLevel[1], Disk[{0, 0}, Offset[{2., 2.}, {0., 0.}]]}, {AbsoluteThickness[1.5], Dashing[{}], Circle[{0, 0}, Offset[{2., 2.}, {0., 0.}]]}}, ImageSize -> 10], Graphics[{{GrayLevel[1], Polygon[{Offset[{0, 2.6}], Offset[{-2.25166604983954, -1.3}], Offset[{2.25166604983954, -1.3}]}]}, {AbsoluteThickness[1.5], Dashing[{}], JoinedCurve[Line[{Offset[{0, 2.6}], Offset[{-2.25166604983954, -1.3}], Offset[{2.25166604983954, -1.3}], Offset[{0, 2.6}]}], CurveClosed -> True]}}, ImageSize -> 10], Graphics[{{GrayLevel[1], Polygon[{Offset[{0, 2.5}], Offset[{2.5, 0}], Offset[{0, -2.5}], Offset[{-2.5, 0}]}]}, {AbsoluteThickness[1.5], Dashing[{}], Line[{Offset[{0, 2.5}], Offset[{2.5, 0}], Offset[{0, -2.5}], Offset[{-2.5, 0}], Offset[{0, 2.5}]}]}}, ImageSize -> 10], Graphics[{{GrayLevel[1], Polygon[{Offset[{-1.8, -1.8}], Offset[{1.8, -1.8}], Offset[{1.8, 1.8}], Offset[{-1.8, 1.8}], Offset[{-1.8, -1.8}]}]}, {AbsoluteThickness[1.5], Dashing[{}], Line[{Offset[{-1.8, -1.8}], Offset[{1.8, -1.8}], Offset[{1.8, 1.8}], Offset[{-1.8, 1.8}], Offset[{-1.8, -1.8}]}]}}, ImageSize -> 10], Graphics[{{GrayLevel[1], Polygon[{Offset[{0, -2.6}], Offset[{-2.25166604983954, 1.3}], Offset[{2.25166604983954, 1.3}]}]}, {AbsoluteThickness[1.5], Dashing[{}], JoinedCurve[Line[{Offset[{0, -2.6}], Offset[{-2.25166604983954, 1.3}], Offset[{2.25166604983954, 1.3}], Offset[{0, -2.6}]}], CurveClosed -> True]}}, ImageSize -> 10]};
resolvePlotTheme["SmallOpenMarkers",def:_String]:=Themes`SetWeight[{PlotMarkers->System`SmallOpenMarkers},$ComponentWeight];

(* ----- Deploy Plot Theme ----- *)
End[];
$PlotTheme="Academic";(*Set to default plot theme*)
SetOptions[Plot, LabelStyle -> Directive[Background -> White]];
(* OperatorSubstitute: prevent font glyph substitution for operators in plot labels *)
SetOptions[Graphics, BaseStyle -> {PrivateFontOptions -> {"OperatorSubstitute" -> False}}];
SetOptions[Graphics3D, BaseStyle -> {PrivateFontOptions -> {"OperatorSubstitute" -> False}}];


(* === Define a Similar Theme with Larger Size === *)
Clear["Global`*"]

(* === Load the Defined Academic Theme === *)
Begin["System`PlotThemeDump`"];
Themes`ThemeRules;

(* === Define the Large Theme === *)
resolvePlotTheme["AcademicLarge", def:_String] := Module[
  {baseTheme},
  baseTheme = resolvePlotTheme["Academic", def];
  Themes`SetWeight[
    baseTheme /. {
      (ImageSize -> size_) :> (ImageSize -> (1.6 size)),
      (FontSize -> size_) :> (FontSize -> (1.6 size)),
      AbsoluteThickness[size_] :> AbsoluteThickness[1.6 size],
      AbsolutePointSize[size_] :> AbsolutePointSize[1.6 size]
    },
    Themes`$DesignWeight
  ]
];

(* \:7ed3\:675f\:81ea\:5b9a\:4e49\:4e3b\:9898\:5b9a\:4e49 *)
End[];


<<PlotFunctions`


(* Workaround for Mathematica 14.3 bug: DefaultStyleDefinitions set in FrontEnd/init.m
   is overwritten by FrontEnd preference loading at startup. Setting it from the kernel
   runs after preferences are fully loaded, so it is not overwritten. *)
If[$FrontEnd =!= $Failed,
  SetOptions[$FrontEnd, DefaultStyleDefinitions -> "Source Article.nb"];
  CurrentValue[$FrontEnd, "DefaultStyleDefinitions"] = "Source Article.nb"
]
