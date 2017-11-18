#!/bin/bash
export TAG=docker-mt4u
export VERSION=0.1

echo Building $TAG:$VERSION
docker build --rm -t $TAG:$VERSION .
