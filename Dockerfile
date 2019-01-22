FROM jaroslawweber/depthgen:base
# 
RUN mkdir depths
RUN pip install depth2stereo
RUN pip install git+https://github.com/jaroslaw-weber/photo2stereo
ADD generate_stereo.py generate_stereo.py
#ENTRYPOINT ["start.sh"]
