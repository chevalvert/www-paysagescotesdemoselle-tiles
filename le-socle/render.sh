DIR="$(cd `dirname $0` && pwd)"
DATA="$DIR/../data"
STYLE="$DIR/style.json"
RASTERS="$DIR/rasters.json"
BBOX='917147.156155741,6885201.29637512,937157.321376621,6903953.67978212'

cat $DATA/{C05-10m,C05}.geojson | ppmm-builder \
  --progress \
  --output $DIR \
  --bbox $BBOX \
  --styles $STYLE \
  --rasters $RASTERS \
  --resolution 144 \
  --zoom '1,2,3,4,5'

cat $DATA/{C05-10m,C05}.geojson | ppmm-builder \
  --progress \
  --output $DIR \
  --bbox $BBOX \
  --styles $STYLE \
  --rasters $RASTERS \
  --zoom 6

let zoom=7
let max=$[2 ** $zoom]
let steps=$[2 ** ($zoom - 6)]
let tilesize=$[$max / $steps]
for i in $(seq 0 $[$steps - 1]); do
  for j in $(seq 0 $[$steps - 1]); do
    let x1=$[$tilesize * $i]
    let y1=$[$tilesize * $j]
    let x2=$[$tilesize * ($i + 1)]
    let y2=$[$tilesize * ($j + 1)]
    cat $DATA/{C05-10m,C05}.geojson | ppmm-builder \
      --progress \
      --output $DIR \
      --bbox $BBOX \
      --styles $STYLE \
      --rasters $RASTERS \
      --zoom $zoom \
      --region "$x1,$y1,$x2,$y2"
  done;
done;
