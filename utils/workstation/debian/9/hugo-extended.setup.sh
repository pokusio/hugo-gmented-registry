#!/bin/bash

if [ "x${HUGO_VERSION}" == "x" ]; then
  echo "[$0] - The HUGO_VERSION environment variable is not set, but must be"
fi;


# check you hugo version with [hugo version] command
# My hugonon extended installed  version was [v0.89.4] so I set HUGO_VERSION to 0.89.4 (without the v, to be pure semver)
# Set the HUGO_VERSION to the version of your hugo installation
export HUGO_VERSION=${HUGO_VERSION:-'0.89.4'}
echo "HUGO_VERSION=[${HUGO_VERSION}]"

export HUGO_EXECUTABLE="/usr/local/bin/hugo"
export HUGO_EXECUTABLE=$(which hugo)

if [ -f ${HUGO_EXECUTABLE} ]; then
  echo "HUGO_EXECUTABLE=[${HUGO_EXECUTABLE}] does EXIST YES"
  sudo rm ${HUGO_EXECUTABLE}
else
  echo "HUGO_EXECUTABLE=[${HUGO_EXECUTABLE}] does NOT EXISTS NO"
fi;
ls -alh ${HUGO_EXECUTABLE}

if [ -d ~/.hugo.extended/v${HUGO_VERSION} ]; then
  sudo rm -fr ~/.hugo.extended/v${HUGO_VERSION}
fi;
mkdir -p ~/.hugo.extended/v${HUGO_VERSION}

git clone https://github.com/gohugoio/hugo.git ~/.hugo.extended/v${HUGO_VERSION}
cd ~/.hugo.extended/v${HUGO_VERSION}
git checkout "v${HUGO_VERSION}"
echo ""
echo "Now Golang building Hugo extended version [${HUGO_VERSION}] ..."
echo ""
export PATH=$PATH:/usr/local/go/bin
export GOPATH=$(pwd)/distrib

if [ -d ${GOPATH}/ ]; then
  sudo rm -fr sudo rm -fr ${GOPATH}/
fi;

# --
# For ldflags : see [goreleaser.yml] in the gohugo golang project
# in gohugo.io github repo => its configuration for the
# famous, awesome goreleaser , used by all professionals to
# manage golang projects, in cicd
# => And here we just want to build a neat executable, with all its meta datas
# --
export POKUSIO_BUILD_DATE=`date -u +.%Y%m%d.%H%M%S`
export POKUSIO_COMMIT_HASH=$(git rev-parse --short HEAD)
export POKUSIO_PACKAGE=github.com/gohugoio/hugo

go install --tags extended -ldflags " -s -w -X $POKUSIO_PACKAGE/common/hugo.commitHash=$POKUSIO_COMMIT_HASH -X $POKUSIO_PACKAGE/common/hugo.buildDate=$POKUSIO_BUILD_DATE -X $POKUSIO_PACKAGE/common/hugo.vendorInfo=gohugo.pokus.io"

ls -alh ${GOPATH}/bin
ls -alh ${GOPATH}/pkg
ls -alh ${GOPATH}/bin/hugo

if [ -d /usr/local/bin/gohugo.io/v${HUGO_VERSION}/ ]; then
  sudo rm -fr /usr/local/bin/gohugo.io/v${HUGO_VERSION}/
fi;

sudo mkdir -p /usr/local/bin/gohugo.io/v${HUGO_VERSION}/

sudo cp ${GOPATH}/bin/hugo /usr/local/bin/gohugo.io/v${HUGO_VERSION}/

sudo ln -s /usr/local/bin/gohugo.io/v${HUGO_VERSION}/hugo /usr/local/bin/hugo


echo "# --- 📽️ + 📽️ + 📽️"
echo "  Finished installing Hugo extended version [${HUGO_VERSION}] : "
echo "# --- 📽️ + 📽️ + 📽️"
hugo version && hugo env

# --
# ln -s ${HUGO_EXECUTABLE} /usr/local/bin/hugo
# ln -s ~/.hugo.extended/v0.89.4/ /usr/local/bin/hugo
# ln -s ~/.hugo.extended/v0.78.2/ /usr/local/bin/hugo
# ln -s /usr/local/bin/gohugo.io/0.78.2/hugo /usr/local/bin/hugo
#
# --
#
