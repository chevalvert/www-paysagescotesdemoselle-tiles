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
  # --region "18,15,19,18"
