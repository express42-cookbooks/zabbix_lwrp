# CHANGELOG for zabbix_lwrp

This file is used to list changes made in each version of zabbix_lwrp.

## 1.1.19
* Add MySQL supports
* Fix not filling gsm_modem API parameter for sms mediatype
#### Breaking changes:
* Rename databag item `database` to `postgresql`
* Rename database default attrubutes

## 1.1.18

## 1.1.17
* Fix rubocop and foodcritic issues
* Install zabbixapi gem at compile time

## 1.1.16
* Add compile_time workaround for chef 11
* Add test suite for chef 11

## 1.1.15
* Fix installation of zabbixapi gem

## 1.1.14
* Update zabbix api version

## 1.1.13
* Fix default serverhost for agent

## 1.1.12
* Do not update hosts on each chef run, because in some cases it leads to error with items linked with interfaces.

## 1.1.11:
* Fix bug with empty attributes
* Fix rubocop issues
* Add official nginx repo to fixture cookbook

## 1.1.10:

* Remove official nginx repository setup

## 1.1.9:

* Remove setup official postgresql repository setup

## 1.1.8:

* Fix run under Chef 11

## 1.1.7:

* Update docs

## 1.1.6:

* Use the latest Chef client
* Fix compatibility with Chef 12.4.0

## 1.1.5:

* Fix issues

## 1.1.4:

* Remove chef search from server and web recipes

## 1.1.3:

* Switch to php-fpm cookbook
* Fix issues

## 1.1.2:

* Add partition, host and connect recipes
* Add build-essential cookbook
* Fix issues

## 1.1.1:

* Remove express42 helpers dependencies

## 1.1.0:

* Change name for all zabbix resources from zabbix_lwrp_* to zabbix_*

## 1.0.1:

* Fix import triggers from xml template
* Remove postgresql and nginx repos

## 1.0.0:

* Initial release of zabbix_lwrp cookbook

- - -
Check the [Markdown Syntax Guide](http://daringfireball.net/projects/markdown/syntax) for help with Markdown.

The [Github Flavored Markdown page](http://github.github.com/github-flavored-markdown/) describes the differences between markdown on github and standard markdown.
