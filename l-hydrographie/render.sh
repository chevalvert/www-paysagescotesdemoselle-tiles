DIR="$(cd `dirname $0` && pwd)"
DATA="$DIR/../data"
STYLE="$DIR/style.json"
BBOX='917147.156155741,6885201.29637512,937157.321376621,6903953.67978212'

rm -rf $DIR/{1..7}
cat $DATA/{C04,C03}.geojson | ppmm-builder \
  --progress \
  --output $DIR \
  --bbox $BBOX \
  --styles $STYLE \
  --resolution 144 \
  --zoom '1,2,3,4,5,6,7'
