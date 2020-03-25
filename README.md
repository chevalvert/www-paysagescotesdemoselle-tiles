# www-paysagescotesdemoselle-tiles [<img src="https://github.com/chevalvert.png?size=100" align="right">](http://chevalvert.fr/)

<br>

## Installation
```console
$ git clone https://github.com/chevalvert/www-paysagescotesdemoselle-tiles
$ cd www-paysagescotesdemoselle-tiles
$ sh scripts/install.sh # this will download and unpackage the data binaries used in this project
```

## Usage
```console
$ npm install --global chevalvert/ppmm-builder
$ sh le-socle/render.sh
$ sh **/render.sh # render all in one go
```

### Note on uploading generated tiles
There will be a lot of tiles. _A lot_.

Although the average tile weight is almost negligeable, FTP clients tend to have trouble transfering a lot of smal files. It is recommended to package the tiles before transfering them, creating only one file to transfer, which will be faster (ziping and unzipping aslo takes time, but with modern SSDs it will be much faster than transfering individual files on a remote server):

```console
$ zip tiles.zip tiles
$ upload tiles.zip
$ ssh remote
$ unzip tiles.zip
```

## Development
```console
$ sh scripts/update.sh # update this package to the latest remote version
$ sh scripts/package.sh # this will package all data into a package.zip, which can in turn be uploaded as binaries in the releases page of this repo
```

## License

[MIT](https://tldrlegal.com/license/mit-license).
