FROM jaroslawweber/depthgen:base
# 
RUN mkdir depths
RUN pip install depth2stereo
RUN pip install -e ./
ADD generate_stereo.py generate_stereo.py
#ENTRYPOINT ["start.sh"]
