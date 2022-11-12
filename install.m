(* ::Package:: *)

(* ::Section:: *)
(*Preparing*)


(* ::Text:: *)
(*Palettes directory:*)
(*FileNameJoin[{$BaseDirectory, "SystemFiles", "FrontEnd", "Palettes"}] *)
(*FileNameJoin[{$UserBaseDirectory, "SystemFiles", "FrontEnd", "Palettes"}] *)


(* ::Text:: *)
(*Define Functions to overwrite directory and file*)


FileOverwrite[file1_,file2_]:=
	(If[FileType[file2]==File,DeleteFile[file2]];
	CopyFile[file1,file2];)


DirectoryOverwrite[dir1_,dir2_]:=
	(If[FileType[dir2]==Directory,DeleteDirectory[dir2,DeleteContents->True]];
	CopyDirectory[dir1,dir2];)


(* ::Section:: *)
(*Configure global preference. *)


Module[{sd},
sd=#->(#1->(Union[#,Capitalize/@#]&@Sort[#2])&@@@OptionValue[Options[$FrontEnd,#],#]&@#)&@SpellingDictionaries;
FileOverwrite[FileNameJoin[{NotebookDirectory[],"FrontEnd","init.m"}],
FileNameJoin[{$UserBaseDirectory, "FrontEnd", "init.m"}]];
Get[FileNameJoin[{$UserBaseDirectory, "FrontEnd", "init.m"}]];
SetOptions[$FrontEnd,sd];];


FileOverwrite[FileNameJoin[{NotebookDirectory[],"Kernel","init.m"}],
	FileNameJoin[{$UserBaseDirectory, "Kernel", "init.m"}]];


(* ::Text:: *)
(*Install style sheets*)


FileOverwrite[FileNameJoin[{NotebookDirectory[],"FrontEnd","CMU Article.nb"}],
	FileNameJoin[{$UserBaseDirectory, 
		"SystemFiles", "FrontEnd", "StyleSheets","CMU Article.nb"}]];


FileOverwrite[FileNameJoin[{NotebookDirectory[],"FrontEnd","XRef Palette.nb"}],
	FileNameJoin[{$UserBaseDirectory, 
		"SystemFiles", "FrontEnd", "Palettes","XRef Palette.nb"}]];


FileOverwrite[FileNameJoin[{NotebookDirectory[],"FrontEnd","Cambria Article.nb"}],
	FileNameJoin[{$UserBaseDirectory, 
		"SystemFiles", "FrontEnd", "StyleSheets","Cambria Article.nb"}]];


(* ::Section:: *)
(*Install Packages*)


(* ::Subsection:: *)
(*FeynCalc and FeynArts:*)


Import["https://raw.githubusercontent.com/FeynCalc/feyncalc/master/install.m"];

InstallFeynCalc[]


(* ::Subsection:: *)
(*GroupMath*)


file=URLDownload["https://renatofonseca.net/groupmath/ProgramVersions/GroupMath-1.1.2.zip",FileNameJoin[{$UserBaseDirectory,"Applications","GroupMath.zip"}]];
ExtractArchive[file,FileNameJoin[{$UserBaseDirectory,"Applications"}]];
DeleteFile[file];


(* ::Subsection:: *)
(*DRalgo*)


(* ::Text:: *)
(*Compute thermal effective potential from dimensional reduction method at 2-loop*)


file=URLDownload["https://github.com/DR-algo/DRalgo/archive/refs/tags/v1.0.1-beta.zip",FileNameJoin[{$UserBaseDirectory,"Applications","DRalgo.zip"}]];
extracted=ExtractArchive[file,FileNameJoin[{$UserBaseDirectory,"Applications"}]];
DeleteFile[file];
RenameDirectory[extracted[[1]],FileNameJoin[{$UserBaseDirectory,"Applications","DRalgo"}]];
