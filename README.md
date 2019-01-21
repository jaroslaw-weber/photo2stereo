# photo2stereo

batch generate 3d stereo images from single photo

# examples

- inputs:

https://www.pexels.com/photo/action-adventure-alps-conifers-238622/

https://www.pexels.com/photo/alone-animal-bird-clouds-395196/

https://www.pexels.com/photo/woman-in-gray-long-sleeve-top-and-red-pants-sitting-beside-tree-and-white-medium-coated-dog-681833/

- outputs:

https://uploadfiles.io/niuk2

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