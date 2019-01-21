import depthgen
from depthgen import generate_depth_map, normalize_depth_contrast
import depth2stereo as stereo
from os import walk, system, remove, rmdir
import os
from tqdm import tqdm
import numpy as np
from PIL import Image


def is_image(path):
    if path.endswith(".jpg"): return True
    return False


def batch_create(input_path="input",
                 output_path="output",
                 depth_path="depths",
                 temp_path="temp",
                 min_deviation=0.2,
                 max_deviation=1.1,
                 step=3,
                 remove_input_files=False,
                 create_depth_flag=True,
                 create_stereo_flag=True):
    #print("started!")
    mkdir(temp_path)
    mkdir(depth_path)
    mkdir(output_path)
    #system("mkdir " + temp_path)
    #system("mkdir " + depth_path)
    #system("mkdir " + output_path)
    #print("made directories")
    for (_, _, filenames) in walk(input_path):
        filenames_with_log = tqdm(sorted(filenames))
        for filename in filenames_with_log:
            if not is_image(filename): continue
            i_path = input_path + "/" + filename
            d_path = depth_path + "/" + filename.replace(".jpg", ".png")
            dn_path = depth_path + "/" + filename.replace(
                ".jpg", "_before.png")
            o_path = output_path + "/" + filename.replace(".jpg", ".png")
            fn_log = " (" + filename + ")"
            filenames_with_log.set_description("generating depth map..." +
                                               fn_log)
            depthmap = generate_depth_map(i_path)
            #print("depthmap: ")
            #print(depthmap)
            filenames_with_log.set_description("saving depthmap...")
            normalized = normalize_depth_contrast(depthmap)
            normalized.save(d_path)

            c = 0
            for i in np.linspace(min_deviation, max_deviation, step):
                c += 1
                filenames_with_log.set_description(
                    "generating stereo image (" + str(c) + ")..." + fn_log)
                distortion_rate = i
                o_path_with_number = o_path.replace(
                    ".png", "_" + str(i).replace(".", "_") + "_LRF.png")
                input_image = Image.open(i_path)
                depthmap = Image.open(d_path)
                stereoimage = stereo.generate_stereo_pair(
                    input_image, depthmap, distortion_rate)
                stereoimage.save(o_path_with_number)
            if remove_input_files: remove(i_path)


def mkdir(path):
    if not os.path.exists(path):
        os.makedirs(path)