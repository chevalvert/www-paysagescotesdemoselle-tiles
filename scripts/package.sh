DIR="$(cd `dirname $0` && pwd)"
zip -FSrj package.zip $DIR/../data
echo 'Packaging done.'
open 'https://github.com/chevalvert/www-paysagescotesdemoselle-tiles/releases/edit/bin'
open .
