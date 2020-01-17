This repository contains a general 3D segmentation engine for mandible and maxiall segmentation from CT/CBCT image.
As we only tested the code in linux (Ubuntu 18.04) OS, we highly recommend you to run it in the same OS.
In addition to that, please install nvidia-docker first, and then, follow the steps listed below to get your segmentation results.

Step 1: Download docker image of the repository.

Run command: "sudo docker pull qinliu19/vseg_test:1.0"
It may take a while to download this image because its size is about 8.6G. We will try to make it smaller in the next version.
After the image is downloaded, you will see the message "Status: Downloaded newer image for qinliu19/vseg_test:1.0".

Run command: "sudo nvidia-docker run -it qinliu19/vseg_test:1.0 /bin/bash" to get the shell of the container.
You will see the path: "root@[container-id]:/usr/seg#". Remember this container id because it will be used later.


Step 2: Run test case in the docker image

Run command: "vseg_test"
By default, it will segment the test image "/usr/seg/test_data/org.mha", and save the segmentation result to the folder "/usr/seg/results/org".
The ground truth of the test image is "/usr/seg/test_data/gt.mha". 

You can use the following instructions to control the segmentation process:
Usage: vseg_test \
       -i The input folder of test images, or the name of test image. Type=string, default="./test_data/org.mha". \
       -m The model folder. Type=string, default="./model_1130_2019". \
       -o The output folder of test image(s). Type=string, default="./results".  \
       -n The name of the segmentation result to be saved. Type=string, default="seg.mha". \
       -g The gpu id to run model. Type=string, default='0'.


Step 3: Test your own data

First, open a new shell in your host machine, and copy your data to the container by runing: "sudo docker cp [test-folder] [container-id]:/usr/seg/[test-folder]".
The test-folder which contains your test images is copying from your host machine to the container that you are running now. You can check it in your container.
After this step, you can close the new shell in your host machine.

Second, run the command in your container: "vseg_test -i "./usr/seg/[test-folder]". The segmentation results will be saved in the folder "/usr/seg/results". 
You can copy all the test results from the container to your host machine by running: "sudo docker cp [container-id]:/usr/seg/results ."





