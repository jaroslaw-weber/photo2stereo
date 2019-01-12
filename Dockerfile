FROM pytorch/pytorch
RUN apt-get update \
	&& apt-get install -y \
    wget \
	imagemagick \
	nano
RUN pip install scipy
RUN pip install scikit-image

#clone repos
RUN git clone https://github.com/jaroslaw-weber/makeit3d
RUN git clone https://github.com/lixx2938/MegaDepth.git
# directories
RUN mkdir depths
RUN mkdir checkpoints
RUN mkdir checkpoints/test_local
# model download
ADD https://www.cs.cornell.edu/projects/megadepth/dataset/models/best_generalization_net_G.pth best_generalization_net_G.pth
RUN cp best_generalization_net_G.pth /workspace/checkpoints/test_local/best_vanila_net_G.pth
# aliases
RUN echo 'alias makeit3d="python makeit3d/src/run.py"' >> ~/.bashrc
RUN echo 'alias cpu="python makeit3d/src/use_cpu.py"' >> ~/.bashrc