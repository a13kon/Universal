@echo BackUp
xcopy %cd% %~dp0Archive /f /y /i /EXCLUDE:%~dp0DoNotCopy

@pause