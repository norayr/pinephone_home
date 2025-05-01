INPUT="-i REC006.WAV"
IMG=test.png
FONT='/home/inky/.fonts/SyntaxLTStd-Black.otf'
FONT='/home/inky/.fonts/SyntaxLTStd-Roman.otf'
SIZE="15"
SIZE="1"
SIZE="0"
#RES='1920x1080'
RES='1920x1432'
#RES='1280x1706'
#RES='1920x1278'
#RES='2048x1536'
#RES='1440x1920'
#RES='1920x1432'
#wave
WAVE='1920x500'
#WAVE='1280x430'
#WAVE='2048x555'
#WAVE='1440x555'
OVER='967'
#OVER='1330'
#OVER='1400'
# from here: https://ffmpeg.org/ffmpeg-filters.html
WVTP="cline"
#WVTP="line"
#WVTP="point"
#WVTP="p2p"
#txt
X=1200
#X=800
Y=30

#RES='800x600'
#colors here: https://man.archlinux.org/man/ffmpeg-utils.1.en
#COLOR=SteelBlue
#COLOR=DarkSlateBlue
#COLOR=DarkSeaGreen
#COLOR=DeepSkyBlue
#COLOR=DimGray
#COLOR=DodgerBlue
#COLOR=Indigo
#COLOR=Fuchsia
#COLOR=DarkKhaki
COLOR=Gainsboro
#COLOR=GhostWhite
#COLOR=LightGrey
#COLOR=LightYellow
#COLOR=GreenYellow
#COLOR=MidnightBlue
#COLOR=0xFFFEFF
#COLOR=0xFBFEFD
#COLOR=0xFEFEEF
#COLOR=0xFAC9A1
#COLOR=0xFCF0BE
#COLOR=0xFDFEBD
#COLOR=0xFDFBB2
#COLOR=0xBECEEC
#COLOR=0xEFF0EF
#COLOR=0xBFBFBF
#COLOR=0x9DC1D9
#COLOR=0x728cb4
#COLOR=0xf5c2ee
#COLOR=0xe4a391
#COLOR=0xb2dc54
#COLOR=0xe6ff97
#COLOR=0xf0f7f1
#COLOR=0xfcc5f2
#COLOR=0xfafff7
#COLOR=0x3e3940
#COLOR=0xeabde1
#COLOR=0xf9fdfc
#COLOR=0xd5f5e4
#COLOR=0xfac45f
#COLOR=0xcdba80
#COLOR=0xfaf7ee

OUT=out.mp4
#INPUT=" -f alsa -ac 2 -sample_rate 44100 -thread_queue_size 4096 -i default:CARD=Rmx2"
#ffmpeg -i ${INPUT} \
#  -f alsa -ac 2 -sample_rate 44100 -thread_queue_size 4096 -i default:CARD=Rmx2 \
#  -i ${IMG}  -filter_complex \
# [0:a]afade=t=in:st=64:d=15[a]; \
#[0:a]showwaves=mode=cline:s=${WAVE}:colors=${COLOR}@0.9|DarkOrchid@0.8:scale=cbrt:r=25[waves]; \
  # [0:a]showwaves=mode=${WVTP}:s=${WAVE}:colors=${COLOR}:scale=cbrt:r=25[waves]; \
#[0:a]showspectrum=mode=combined:s=${WAVE}:color=channel:scale=cbrt[waves]; \

nice -20 ffmpeg ${INPUT} -i ${IMG} -ss 00:00:00   -filter_complex \
 "[1:v]scale=${RES}[image]; \
  [0:a]afade=t=in:st=0:d=1[a]; \
  [image][waves]overlay=0:${OVER}; \
  [0:a]showwaves=mode=${WVTP}:s=${WAVE}:colors=${COLOR}:scale=lin:r=25[waves]" \
  -map [a] \
-c:v libx264 -preset fast -crf 18 -c:a aac -b:a 320k ${OUT}
#-c:v libx264 -preset fast -crf 18 -c:a aac -b:a 256k -f mpegts pipe:1 | ffplay -i pipe:0 
#


