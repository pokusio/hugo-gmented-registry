# The Hugo Gmented Registry

The `Hugo Gmented Registry` is a registry referencing all `Hugo Gmented`-compliant [Hugo](https://gohugo.io/) [Themes](https://themes.gohugo.io/)

## What is a `Hugo Gmented`-compliant Hugo Theme ?



## Use a `Hugo Gmented` Theme

## Submit your `hugo` theme

Create and submit a PR, and :

* the CI/CD will automatically run the compliance-tests, just like the comliance tests you ran in the pipeline attached to your hugo theme repository.
* The Pokus Team will run acceptance tests if and only if all automated compliance tests complete with success.

## Architecture

![Global Hugo GMented Architecture](./documentation/archhitecture/images/pokus-lifecycle.drawio.png)

## Tech Stack

* `NodeJS` `16+`
* `Golang` `17+`
* The `bash` `B`ourne `A`gain `SH`ell, version above `GNU bash, version 4.4.12`
* The [`hugo`](https://gohugo.io/) extended cli,  version above `hugo v0.89.4-AB01BA6E+extended` (`AB01BA6E` is a git commit hash `--short`)


## Tech Stack

* All that is in this repository works only on `GNU/Linux`, and was tested on `Debian 9 - Stretch` (with GNOME GUI)
* `golang` version
* you need `hugo extended` installation (not just `hugo` standard, but it is still open source)
* `nodejs` `npm`

```bash
$ lsb_release -a
No LSB modules are available.
Distributor ID:	Debian
Description:	Debian GNU/Linux 9.12 (stretch)
Release:	9.12
Codename:	stretch
$ go version
go version go1.17.4 linux/amd64
$ node -v
v16.13.0
$ npm --version
8.2.0
$ hugo version
hugo v0.89.4-AB01BA6E+extended linux/amd64 BuildDate=.20211207.084017 VendorInfo=gohugo.pokus.io

```

* To install `nodejs` and `npm` : https://github.com/nodesource/distributions/blob/master/README.md#deb
* To install `Golang` and `Hugo` :

```bash
export DESIRED_VERSION="develop"
export DESIRED_VERSION="feature/init-src-code"

git clone git@github.com:pokusio/hugo-gmented-registry.git ~/hugo-gmented-registry-work
cd ~/hugo-gmented-registry-work
git checkout ${DESIRED_VERSION}

#  install `Golang` :
./utils/workstation/debian/9/golang.setup.sh
#  install `Hugo` (from hugo sopurce code see [https://github.com/gohugoio/hugo.git] ) :
./utils/workstation/debian/9/hugo-extended.setup.sh

```


## See also

* A few weeks before created the registry, I created a git repo which kind of is the homo-erectus for the homo-sapiens-sapiens that the `Hugo Gmented Registry` is : https://github.com/pokusio/hugo-bunch
