@echo off
for %%f in (glyphs\*.svg) do (
	echo file-open:%%f
	echo select-all
	echo object-stroke-to-path
	echo export-overwrite
	echo export-do
	echo file-close
)
echo quit