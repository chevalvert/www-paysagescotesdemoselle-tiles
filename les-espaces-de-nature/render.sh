DIR="$(cd `dirname $0` && pwd)"
DATA="$DIR/../data"
STYLE="$DIR/style.json"
BBOX='917147.156155741,6885201.29637512,937157.321376621,6903953.67978212'

# NOTE: as we are using --skip-empty, we need to make sure all tiles are deleted
# before writing new ones to avoid keeping old irrelevant tiles
rm -rf $DIR/{1,2,3,4,5,6}

cat $DATA/{C21,C22,C52,C30,C26}.geojson | ppmm-builder \
  --progress \
  --output $DIR \
  --bbox $BBOX \
  --styles $STYLE \
  --resolution 144 \
  --skip-empty \
  --zoom '1,2,3,4,5'

cat $DATA/{C21,C22,C52,C30,C26}.geojson | ppmm-builder \
  --progress \
  --output $DIR \
  --bbox $BBOX \
  --styles $STYLE \
  --skip-empty \
  --zoom 6 \

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
    cat $DATA/{C21,C22,C52,C30,C26}.geojson | ppmm-builder \
      --progress \
      --output $DIR \
      --bbox $BBOX \
      --styles $STYLE \
      --skip-empty \
      --zoom $zoom \
      --region "$x1,$y1,$x2,$y2"
  done;
done;
