DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" >/dev/null 2>&1 && pwd)"

curl -L https://github.com/chevalvert/www-paysagescotesdemoselle-tiles/releases/download/bin/package.zip > package.zip && \
unzip package.zip -d $DIR/../data && \
rm package.zip
