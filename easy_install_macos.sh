#!/bin/bash
brew install curl
brew cask install docker
docker pull jaroslawweber/photo2stereo:base
echo "alias photo2stereo='docker run -it -v ${PWD}/input:/workspace/input -v ${PWD}/output:/workspace/output jaroslawweber/photo2stereo:base'" >> ~/.bashrc