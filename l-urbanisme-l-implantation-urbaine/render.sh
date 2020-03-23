DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" >/dev/null 2>&1 && pwd)"
DATA="$DIR/data"
BBOX='917147.156155741,6885201.29637512,937157.321376621,6903953.67978212'

STYLE="$DIR/style.json"

# NOTE: as we are using --skip-empty, we need to make sure all tiles are deleted
# before writing new ones to avoid keeping old irrelevant tiles
# rm -rf $DIR/{1,2,3,4,5,6}

# TODO: C32
# cat $DATA/{C49,C08,C09,C34,C35}.geojson | ppmm-builder \
cat $DATA/{C49,C09,C34,C35}.geojson | ppmm-builder \
  --progress \
  --output $DIR \
  --bbox $BBOX \
  --styles $STYLE \
  --resolution 144 \
  --skip-empty \
  --zoom '1,2,3,4,5'

# cat $DATA/{C03,C04}.geojson | ppmm-builder \
#   --progress \
#   --output $DIR \
#   --bbox $BBOX \
#   --styles $STYLE \
#   --skip-empty \
#   --zoom 6 \
#   # --region "18,15,19,18"

# # ZOOM 7
# let zoom=7
# let max=$[2**$zoom]
# let steps=$[2 ** ($zoom-6)]
# let tilesize=$[$max/$steps]

# echo "Subrendering regions for ZOOM #$zoom:"
# for i in {0..$[$steps-1]}; do;
#   for j in {0..$[$steps-1]}; do;
#     let x1=$[$tilesize*$i]
#     let y1=$[$tilesize*$j]
#     let x2=$[$tilesize*($i+1)]
#     let y2=$[$tilesize*($j+1)]
#     echo "ppmm-builder --region '$x1,$y1,$x2,$y2'"
#   done;
# done;
