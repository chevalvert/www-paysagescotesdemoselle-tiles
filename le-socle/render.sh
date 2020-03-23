DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" >/dev/null 2>&1 && pwd)"
DATA="$DIR/data"
BBOX='917147.156155741,6885201.29637512,937157.321376621,6903953.67978212'

STYLE="$DIR/style.json"
RASTERS="$DIR/rasters.json"

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

