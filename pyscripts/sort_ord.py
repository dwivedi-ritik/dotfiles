#This python script will make folder of each file extension 
#And store them into their respective extension folders

import os
import shutil
from sys import argv

def main():
    dir = argv[1]
    store_dir = "ordered"
    
    all_files = os.listdir(dir)
    all_files_ext = { f'{store_dir}/{file.split(".")[-1]}' for file in all_files  }
    
    os.chdir(dir)

    if not os.path.exists(store_dir):
        os.mkdir(store_dir)
    
    for r in all_files_ext:
        if not os.path.exists(r):
            os.mkdir(r)
    

    all_files = [ file for file in os.listdir(".") if os.path.isfile(file)]

    for file in all_files:
        target_folder = file.split(".")[-1]
        shutil.move(file , f"{store_dir}/{target_folder}/")

if __name__ == "__main__":
    main()
