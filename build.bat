@rem generate intermediate UFO sources
sfd2ufo source\Quintessence-MASTER.sfd source\Quintessence-Regular.ufo

@rem build OpenType fonts
@cd source
python %USERPROFILE%\AppData\Local\Programs\Python\Python310\Scripts\gftools-builder.py config.yaml
@cd ..

@rem generate proof documents
@cd fonts\ttf
set PYTHONUTF8=1
python %USERPROFILE%\AppData\Local\Programs\Python\Python310\Scripts\gftools-gen-html.py proof -o ..\proof  Quintessence-Regular.ttf
@cd ..\..