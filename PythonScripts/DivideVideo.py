'''
Using OpenCV takes a mp4 video and produces a number of images.
Requirements
----
You require OpenCV 3.2 to be installed.
Run
----
Open the main.py and edit the path to the video. Then run:
$ python main.py
Which will produce a folder called data with the images. There will be 2000+ images for example.mp4.
'''
import cv2
import numpy as np
import os
import sys


def DivideVideo(paths):
    # Playing video from file:
    cap = cv2.VideoCapture(paths)

    try:
        if not os.path.exists('Output'):
            os.makedirs('Output')
    except OSError:
        print('Error: Creating directory of output')

    currentFrame = 0
    # Capture frame-by-frame
    ret, frame = cap.read()
    while (ret):
        # Saves image of the current frame in jpg file
        name = './Output/' + str(currentFrame) + '.jpg'
        # print ('Creating...' + name)
        cv2.imwrite(name, frame)

        # To stop duplicate images
        currentFrame += 1
        ret, frame = cap.read()

    # When everything done, release the capture
    cap.release()
    cv2.destroyAllWindows()


def main():
    DivideVideo(sys.argv[1])


if __name__ == "__main__":
    main()
