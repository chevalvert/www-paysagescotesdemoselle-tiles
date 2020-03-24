DIR="$(cd `dirname $0` && pwd)"
zip -FSrj package.zip $DIR/../data
echo 'Packaging done. Go to'
echo '→ https://github.com/chevalvert/www-paysagescotesdemoselle-tiles/releases/edit/bin'
