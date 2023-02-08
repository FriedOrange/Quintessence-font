import fontforge
import os

NAME_LIST = "quikscript.nam"
GLYPH_FOLDER = "temp\\outlines"
TEMP_FOLDER = "temp"
EM_SIZE = 1000


qs_unicodes = {}
with open(NAME_LIST) as name_list:
    for line in name_list:
        unicode, name = line.strip().split(" ")
        qs_unicodes[name] = int(unicode, 16)
        
print(qs_unicodes)

font = fontforge.font()
font.encoding = "UnicodeFull"
font.em = EM_SIZE

source_files = os.listdir(GLYPH_FOLDER)
for source in source_files:
    name = source[:-4]
    font.createChar(qs_unicodes[name] if name in qs_unicodes else fontforge.unicodeFromName(name), name)
    font[name].importOutlines(GLYPH_FOLDER + "\\" + source, scale=False)
    font[name].simplify()
    font[name].round()

font.save(TEMP_FOLDER + "\\step1.sfd")