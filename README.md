# git-url-parse

[![Build Status](https://travis-ci.org/axetroy/git-url-parse.svg?branch=master)](https://travis-ci.org/axetroy/git-url-parse)
![License](https://img.shields.io/badge/license-MIT-green.svg)
![Dart](https://img.shields.io/badge/dart-%3E=1.2.0-blue.svg?style=flat-square)

A high level git url parser for common git providers.

## Usage

```dart
import 'package:git_url_parse/git-url-parse.dart' show gitUrlParse;

void main(){
  Map<String,dynamic> gitUrlInfo = gitUrlParse('https+git@github.com:gpmer/gpm.js.git');
  
  print(urlInfo);
}
```

```
# print out
{
  "href": "https+git@github.com:gpmer/gpm.js.git",
  "protocols": [
    "https",
    "git"
  ],
  "protocol": "https",
  "port": 443,
  "host": "github.com",
  "user": "gpmer",
  "password": "",
  "origin": "https+git@github.com",
  "path": "/gpm.js.git",
  "query": "",
  "hash": "",
  "source": "github.com",
  "name": "gpm.js",
  "owner": "gpmer",
  "full_name": "gpmer/gpm.js"
}
```

## Test

```bash
./TEST
```

## Contribute

```bash
git clone https://github.com/axetroy/git-url-parse.git && cd ./git-url-parse
pub get
./TEST
```

## LICENSE

The [MIT License](https://github.com/axetroy/git-url-parse/blob/master/LICENSE)