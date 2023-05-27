
BeginPackage["AntonAntonov`NotebookModifiers`"];

DeleteCells::usage = "Delete cells of a specified style.";

CellPrintWL::usage = "CellPrintWL[s_String]";

CellPrintAndRunWL::usage = "CellPrintAndRunWL[s_String]";

CellPrintJulia::usage = "CellPrintJulia[s_String]";

CellPrintAndRunJulia::usage = "CellPrintAndRunJulia[s_String]";

CellPrintR::usage = "CellPrintR[s_String]";

CellPrintAndRunR::usage = "CellPrintAndRunR[s_String]";

CellPrintPython::usage = "CellPrintPython[s_String]";

CellPrintAndRunPython::usage = "CellPrintAndRunPython[s_String]";

Begin["`Private`"];

(*===========================================================*)
(* DeleteCells                                               *)
(*===========================================================*)

Clear[DeleteCells];
DeleteCells[style_String] := NotebookDelete[Cells[CellStyle -> style]];
DeleteCells[] := DeleteCells["Output"];


(*===========================================================*)
(* CellPrint                                                 *)
(*===========================================================*)

Clear[CellPrintWL];
CellPrintWL[s_String] := NotebookWrite[EvaluationNotebook[], Cell[s, "Input"], All];

Clear[CellPrintAndRunWL];
CellPrintAndRunWL[s_String] := (
  NotebookWrite[EvaluationNotebook[], Cell[s, "Input"], All];
  SelectionEvaluateCreateCell[EvaluationNotebook[]]
);

Clear[CellPrintJulia];
CellPrintJulia[s_String] :=
    NotebookWrite[EvaluationNotebook[], Cell[s, "ExternalLanguage", CellEvaluationLanguage -> "Julia"]];

Clear[CellPrintAndRunJulia];
CellPrintAndRunJulia[s_String] := (
  NotebookWrite[EvaluationNotebook[], Cell[s, "ExternalLanguage", CellEvaluationLanguage -> "Julia"], All];
  SelectionEvaluateCreateCell[EvaluationNotebook[]]
);

Clear[CellPrintR];
CellPrintR[s_String] :=
    NotebookWrite[EvaluationNotebook[], Cell["{\n" <> s <> "\n}", "ExternalLanguage", CellEvaluationLanguage -> "R"]];

Clear[CellPrintAndRunR];
CellPrintAndRunR[s_String] := (
  NotebookWrite[EvaluationNotebook[], Cell["{\n" <> s <> "\n}", "ExternalLanguage", CellEvaluationLanguage -> "R"], All];
  SelectionEvaluateCreateCell[EvaluationNotebook[]]);

Clear[CellPrintPython];
CellPrintPython[s_String] :=
    NotebookWrite[EvaluationNotebook[], Cell[s, "ExternalLanguage", CellEvaluationLanguage -> "Python"]];

Clear[CellPrintAndRunPython];
CellPrintAndRunPython[s_String] := (
  NotebookWrite[EvaluationNotebook[], Cell[s, "ExternalLanguage", CellEvaluationLanguage -> "Python"], All];
  SelectionEvaluateCreateCell[EvaluationNotebook[]]
);

Clear[CellPrintRaku];
CellPrintRaku[s_String] :=
    NotebookWrite[EvaluationNotebook[], Cell[s, "RakuInputExecute"]];

Clear[CellPrintAndRunRaku];
CellPrintAndRunRaku[s_String] := (
  NotebookWrite[EvaluationNotebook[], Cell[s, "RakuInputExecute"], All];
  SelectionEvaluateCreateCell[EvaluationNotebook[]]
);

aTargetLanguageToCellPrintFunc =
    <| "R" -> CellPrintR, "Python" -> CellPrintPython, "Julia" -> CellPrintJulia, "WL" -> CellPrintWL|>;

aTargetLanguageToCellPrintAndRunFunc =
    <| "R" -> CellPrintAndRunR, "Python" -> CellPrintAndRunPython, "Julia" -> CellPrintAndRunJulia, "WL" -> CellPrintAndRunWL|>;


End[];
EndPackage[];