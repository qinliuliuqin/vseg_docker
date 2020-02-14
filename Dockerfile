FROM nvidia/cuda:latest
WORKDIR /usr/seg

# Install dependencies
RUN apt-get update && apt-get upgrade -y && apt-get install -y && apt-get clean
RUN apt-get install -y curl python3.7 python3-pip

ENV LD_LIBRARY_PATH /usr/local/lib/python3.6/dist-packages/md/lib/Release
ENV PATH /usr/bin:$PATH

COPY . /usr/seg

RUN alias python=/usr/bin/python3.7 
RUN pip3 install torch torchvision
RUN pip3 install md-0.1-py3-none-any.whl
RUN pip3 install md_segmentation3d-3.5-py3-none-any.whl
RUN pip3 install nano
