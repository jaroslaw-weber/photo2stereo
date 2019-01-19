FROM pytorch/pytorch
RUN apt-get update \
	&& apt-get install -y \
    wget \
	imagemagick \
	nano
RUN pip install scipy
RUN pip install scikit-image

RUN mkdir depths
RUN mkdir checkpoints
RUN mkdir checkpoints/test_local
# model download
RUN wget https://www.cs.cornell.edu/projects/megadepth/dataset/models/best_generalization_net_G.pth
RUN cp best_generalization_net_G.pth /workspace/checkpoints/test_local/best_vanila_net_G.pth
# 
ADD start.sh start.sh
COPY start.sh /
COPY start.sh /usr/local/bin
RUN pip install git+https://github.com/jaroslaw-weber/depthgen
RUN pip install depth2stereo
RUN pip install git+https://github.com/jaroslaw-weber/photo2stereo
ADD run.py run.py
#ENTRYPOINT ["start.sh"]
