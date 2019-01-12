# photo2stereo

Generating 3d stereo images from single 2d photo.
Possible video conversion too.

## Examples:

![Input](https://github.com/jaroslaw-weber/makeit3d/examples/input.jpg)
![Output](https://github.com/jaroslaw-weber/makeit3d/examples/output.png)
![Input](https://github.com/jaroslaw-weber/makeit3d/examples/input2.jpg)
![Output](https://github.com/jaroslaw-weber/makeit3d/examples/output2.png)
![Input](https://github.com/jaroslaw-weber/makeit3d/examples/input3.jpg)
![Output](https://github.com/jaroslaw-weber/makeit3d/examples/output3.png)

## Installation:

Install docker and git.
Run:
```
git clone https://github.com/jaroslaw-weber/makeit3d
cd makeit3d
mkdir input
```

## How to use:
Run:
```
docker build . -t makeit3d
docker run -it --rm -v $(pwd)/input:/workspace/input -v $(pwd)/output:/workspace/output makeit3d
cpu
```
Put photos in the `input` folder.
Run:
```
makeit3d
```
Wait.
Open `output` folder.
Enjoy.



## Can I make it faster?

You can run it on GPU. Just don't run the cpu command. But you can only use GPU if you have CUDA.

## TODO

- parameters tweaking
- converting video
- more modular (depth detection/stereo generation)







