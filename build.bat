@rem generate intermediate UFO sources
sfd2ufo source\Quintessence-MASTER.sfd source\Quintessence-Regular.ufo

@rem build OpenType fonts
@cd source
python %USERPROFILE%\AppData\Local\Programs\Python\Python310\Scripts\gftools-builder.py config.yaml
@cd ..

@rem autohint fonts
python %USERPROFILE%\AppData\Local\Programs\Python\Python310\Lib\site-packages\ttfautohint\__main__.py --symbol --fallback-stem-width 74 fonts\ttf\Quintessence-Regular.ttf fonts\ttf\Quintessence-Regular.ttf

@rem generate compressed WOFF2
fonttools ttLib.woff2 compress -o fonts\webfonts\Quintessence-Regular.woff2 fonts\ttf\Quintessence-Regular.ttf

@rem generate proof documents
@cd fonts\ttf
set PYTHONUTF8=1
python %USERPROFILE%\AppData\Local\Programs\Python\Python310\Scripts\gftools-gen-html.py proof -o ..\proof  Quintessence-Regular.ttf
@cd ..\..