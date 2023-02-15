import fontforge
import os

NAME_LIST = "quikscript.nam"
GLYPH_FOLDER = "temp\\outlines"
TEMP_FOLDER = "temp"
EM_SIZE = 1000
STROKE_THICKNESS = 82
MASTER_FONT = "Quintessence-MASTER.sfd"

qs_unicodes = {}
with open(NAME_LIST) as name_list:
    for line in name_list:
        unicode, name = line.strip().split(" ")
        qs_unicodes[name] = int(unicode, 16)

font = fontforge.font()
font.encoding = "UnicodeFull"
font.em = EM_SIZE

master = fontforge.open(MASTER_FONT)

source_files = os.listdir(GLYPH_FOLDER)
for source in source_files:
    name = source[:-4]
    font.createChar(qs_unicodes[name] if name in qs_unicodes else fontforge.unicodeFromName(name), name)
    font[name].importOutlines(GLYPH_FOLDER + "\\" + source, scale=False)
    font[name].addExtrema()
    font[name].simplify()
    font[name].round()
    try:
        font[name].left_side_bearing = int(master[name].left_side_bearing)
        font[name].right_side_bearing = int(master[name].right_side_bearing)
    except:
        pass

font.save(TEMP_FOLDER + "\\step1.sfd")