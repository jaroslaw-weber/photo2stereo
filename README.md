# photo2stereo

batch generate 3d stereo images from single photo

# install

install docker, then run:

```
docker pull jaroslawweber/photo2stereo
```

# use

create folder input and put there jpg files (jpeg not working)

then run

```
docker run -it -v ${PWD}/input:/workspace/input -v ${PWD}/output:/workspace/output photo2stereo
python generate_stereo.py
```