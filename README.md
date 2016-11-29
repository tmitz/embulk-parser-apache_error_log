# Apache Error Log parser plugin for Embulk

Embulk parser plugin for apache error log

## Overview

* **Plugin type**: parser
* **Guess supported**: no

## Configuration

- **hostname**: hostname by generated log (string, optional)

## Example

```yaml
in:
  type: any file input plugin type
  parser:
    type: apache_error_log
    hostname: example.com
```


```
$ embulk gem install embulk-parser-apache_error_log
```

## Build

```
$ rake
```
