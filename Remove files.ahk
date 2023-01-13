#Include, D:\Macros\TF-master\tf.ahk

File=!Forhandler info.txt
TF_Removelines(File,1,13)
TF_Removelines(File,3,10)
TF_TrimLeft(File, 2,"", 5)
TF_TrimRight(File, 2,"", 17)
;TF_RangeReplace(File, "  ", "  ", "", False, 0, 0)

Orgnr=TF_ReadLines(File,1)
Tlf:=TF_ReadLines(File,2)

