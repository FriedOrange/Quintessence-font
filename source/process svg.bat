@echo off
for %%f in (glyphs\*.svg) do (
	echo file-open:%%f
	echo select-all
	echo object-stroke-to-path
	echo select-all
	echo path-union
	echo export-filename:temp\outlines\%%~nf.svg
	echo export-overwrite
	echo export-do
	echo file-close
)
echo quit