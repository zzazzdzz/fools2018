import os
import sys

try:
    import rgbbin.objfile
except:
    print("RGBBIN is not installed. Either install it to your global")
    print("python path, or put it in the build script's directory.")
    sys.exit(1)

def splice(data, s, offset):
    return data[0:offset] + s + data[offset+len(s):]

if not os.path.isdir("../bin"):
    if os.path.exists("../bin"):
        print("removing bin file...")
        ret = os.system("rm ../bin")
        if ret != 0:
            raise RuntimeError("can't remove ../bin file")
    print("creating bin folder...")
    ret = os.system("mkdir ../bin")
    if ret != 0:
        raise RuntimeError("can't create ../bin folder")

print("invoking rgbasm...")
ret = os.system("rgbasm -o ../bin/main.obj main.asm")
if ret != 0:
    raise RuntimeError("command not completed successfully")

obj = rgbbin.objfile.ObjectFile("../bin/main.obj")
obj.parse_all()

print("creating save data...")

with open("base.sav", "rb") as fp:
    savefile = bytearray(fp.read())

wram_at = savefile.index(b"OFFS_WRAM")
sram2_at = savefile.index(b"OFFS_SRAM2")
sram3_at = savefile.index(b"OFFS_SRAM3")

savefile = splice(savefile, obj.section_by_name("WRAM")['data'], wram_at)
savefile = splice(savefile, obj.section_by_name("SRAM2")['data'], sram2_at)
savefile = splice(savefile, obj.section_by_name("SRAM3")['data'], sram3_at)

checksum_len = 0x0f8b
checksum_offs = 0x2598

checksum = 0x00
for i in range(checksum_offs, checksum_offs + checksum_len):
    checksum += savefile[i]
    checksum %= 256
checksum ^= 0xFF
savefile[0x3523] = checksum

with open("build/glitchland.sav", "wb") as fp:
    fp.write(savefile)

savefile[sram3_at + 3] = 0x01

with open("build/sram.js", "wb") as fp:
    fp.write(bytes('B64_SRAM='+str(list(savefile))+'', 'ascii'))

print("writing all sections to ../bin/...")

for section in obj.sections:
    with open("../bin/" + section['name'] + ".bin", "wb") as fp:
        fp.write(section['data'])

print("done.")
