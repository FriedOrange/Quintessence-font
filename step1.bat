del /q source\temp\outlines\*
@cd source
"process svg.bat" | inkscape --shell
fontforge -script step1.py
@cd ..