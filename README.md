# Article Extractors comparison

This scripts parses a bunch of urls (supplied in a `urls.txt` file) using multiple content extraction APIs and libraries, so you can check for accuracy.

This compares results using the following APIs:

- [Pismo](https://github.com/peterc/pismo) (Ruby)
- [Boilerpipe](https://github.com/kohlschutter/boilerpipe) (Java)
- [Diffbot](https://diffbot.com) (web api)


To be included:

- [aylien](https://developer.aylien.com/) (web api)


## Usage

Compile with:

```
build.sh
```

Run with:
```
ruby textfiers.rb
```
