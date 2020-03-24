DIR="$(cd `dirname $0` && pwd)"

curl -L https://github.com/chevalvert/www-paysagescotesdemoselle-tiles/releases/download/bin/package.zip > package.zip && \
unzip package.zip -d $DIR/../data && \
rm package.zip
