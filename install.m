(* ::Package:: *)

(* ::Text:: *)
(*Palettes directory:*)
(*FileNameJoin[{$BaseDirectory, "SystemFiles", "FrontEnd", "Palettes"}] *)
(*FileNameJoin[{$UserBaseDirectory, "SystemFiles", "FrontEnd", "Palettes"}] *)


FileOverwrite[file1_,file2_]:=
	(If[FileType[file2]==File,DeleteFile[file2]];
	CopyFile[file1,file2];)


DirectoryOverwrite[dir1_,dir2_]:=
	(If[FileType[dir2]==Directory,DeleteDirectory[dir2,DeleteContents->True]];
	CopyDirectory[dir1,dir2];)


(* ::Text:: *)
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


(* ::Text:: *)
(*Install Packages*)


DirectoryOverwrite[FileNameJoin[{NotebookDirectory[],"MatsubaraSum"}],
	FileNameJoin[{$InstallationDirectory,"AddOns","ExtraPackages","MatsubaraSum"}]]


DirectoryOverwrite[FileNameJoin[{NotebookDirectory[],"DiagramEditor"}],
	FileNameJoin[{$InstallationDirectory,"AddOns","ExtraPackages","DiagramEditor"}]]


(*DirectoryOverwrite[FileNameJoin[{NotebookDirectory[],"PauliAlgebra"}],
	FileNameJoin[{$InstallationDirectory,"AddOns","ExtraPackages","PauliAlgebra"}]]*)


(*DirectoryOverwrite[FileNameJoin[{NotebookDirectory[],"LoopIntegrate"}],
	FileNameJoin[{$InstallationDirectory,"AddOns","ExtraPackages","LoopIntegrate"}]]*)


DirectoryOverwrite[FileNameJoin[{NotebookDirectory[],"Themes"}],
	FileNameJoin[{$InstallationDirectory,"AddOns","ExtraPackages","Themes"}]]


DirectoryOverwrite[FileNameJoin[{NotebookDirectory[],"Toolkit"}],
	FileNameJoin[{$InstallationDirectory,"AddOns","ExtraPackages","Toolkit"}]]
