' VB Script to extract Windows Event log.
' - Application Event Log  => AppEvent.evt
' - System Event Log       => SysEvent.evt
' - and Security Event Log.=> SecEvent.evt
' Usage: cscript get_win_event_log.vbs "<outputDir>"
'    - Where outputDir is fullPath to the output directory and is quoted.

Option Explicit
On Error Resume Next

Dim thisComputer: thisComputer = "."
Dim isDebug : isDebug = false

' Process input. Exit if invalid input
if not hasValidInput() then
	WScript.echo "Usage: csript b.vbs <outputDir>"
	WScript.echo "       - where outputDir is quoted and fullpath"
	WScript.Quit
end if

' Run it
Dim outputDir : outputDir = WScript.Arguments(0)
if isDebug then WScript.echo "Output Dir = "& outputDir

Call ExportSecurityLogs() 
Call ExportAppEventLogs() 
Call ExportSysEventLogs() 

WScript.echo "done."
'End of script

' ===========================
' Check valid input
' Checks for - argument count = 1, 
'   - not an empty string
'   - and full path (contains \ )
' ===========================
Function hasValidInput() 
   Dim args: set args = WScript.Arguments

   if (args.Count = 1) and (len(args(0)) > 0) and (InStr(args(0), "\") <> 0) then
       hasValidInput = true
       Exit Function
   end if
   hasValidInput = false
End Function

' ===========================
' ExportAppEventLogs() 
' ===========================
sub ExportAppEventLogs() 
   Dim objWMIService, outFile, queryLogFiles, objLogfile, backupLog
   
   WScript.echo "Collecting Application Event Logs ... "
   outFile = outputDir & "\AppEvent.evt" 
   if isDebug then WScript.echo "Output : " & outFile

   ' getting service w/ security + backup settings
   Set objWMIService = GetObject("winmgmts:{impersonationLevel=impersonate,(Backup)}!\\" & thisComputer & "\root\cimv2")

   ' query for all records in security
   Set queryLogFiles = objWMIService.ExecQuery("SELECT * FROM Win32_NTEventLogFile WHERE LogFileName='Application'")

   ' write it.
   for each objLogfile in queryLogFiles
	backupLog = objLogFile.BackupEventLog(outFile)
   next   
	
end sub

' ===========================
' ExportSysEventLogs() 
' ===========================
sub ExportSysEventLogs() 
   Dim objWMIService, outFile, queryLogFiles, objLogfile, backupLog
   
   WScript.echo "Collecting System Event Logs ... "
   outFile = outputDir & "\SysEvent.evt" 
   if isDebug then WScript.echo "Output : " & outFile

   ' getting service w/ security + backup settings
   Set objWMIService = GetObject("winmgmts:{impersonationLevel=impersonate,(Backup)}!\\" & thisComputer & "\root\cimv2")

   ' query for all records in security
   Set queryLogFiles = objWMIService.ExecQuery("SELECT * FROM Win32_NTEventLogFile WHERE LogFileName='System'")

   ' write it.
   for each objLogfile in queryLogFiles
	backupLog = objLogFile.BackupEventLog(outFile)
   next   
end sub


' ===========================
' ExportSecurityLogs() 
' ===========================
sub ExportSecurityLogs() 
   Dim objWMIService, outFile, queryLogFiles, objLogfile, backupLog
   
   WScript.echo "Collecting Security Event Logs ... "
   outFile = outputDir & "\SecEvent.evt" 
   if isDebug then WScript.echo "Output : " & outFile

   ' getting service w/ security + backup settings
   Set objWMIService = GetObject("winmgmts:{impersonationLevel=impersonate,(Security, Backup)}!\\" & thisComputer & "\root\cimv2")

   ' query for all records in security
   Set queryLogFiles = objWMIService.ExecQuery("SELECT * FROM Win32_NTEventLogFile WHERE LogFileName='Security'")

   ' write it.
   for each objLogfile in queryLogFiles
	backupLog = objLogFile.BackupEventLog(outFile)
   next   
	
end sub
