# photo2stereo

batch generate 3d stereo images from single photo

# examples

- inputs:

https://www.pexels.com/photo/action-adventure-alps-conifers-238622/
https://www.pexels.com/photo/alone-animal-bird-clouds-395196/
https://www.pexels.com/photo/woman-in-gray-long-sleeve-top-and-red-pants-sitting-beside-tree-and-white-medium-coated-dog-681833/

- outputs:

![output1](/examples/output1.jpg)
![output2](/examples/output2.jpg)
![output3](/examples/output3.jpg)

# install

install docker, then run:

```
docker pull jaroslawweber/photo2stereo:base
```

# use

create folder input and put there jpg files (jpeg not working)

then run

```
docker run -it -v ${PWD}/input:/workspace/input -v ${PWD}/output:/workspace/output jaroslawweber/photo2stereo:base
python generate_stereo.py
```

# depth maps

to also output depth maps run this command instead
```
docker run -it -v ${PWD}/input:/workspace/input -v ${PWD}/output:/workspace/output -v ${PWD}/depths:/workspace/depths jaroslawweber/photo2stereo:base
python generate_stereo.py
```

# customize

you can pass custom parameters to script. run:
```
python
from photo2stereo import batch_create
```

then run batch_create with your custom parameters

# custom deviation

by default, this script generates 3 stereo images with different deviation:
0.2 , 0.56, 1.1

you can use step (number of generated stereo images), min_deviation and max_deviation to tweak those parameters to desire effect

# easy install (not working yet)

linux:

```
curl -s http://github.com/jaroslaw-weber/photo2stereo/easy_install.sh | bash
```

# running docker image after easy install

```
photo2stereo
```
