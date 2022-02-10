import os , shutil , json , sys
from os.path import expanduser

TOPIC_ARR = ["cssdocs" , "linuxblogs" , "pyblogs" , "reminders"]

if sys.argv[1] not in TOPIC_ARR:
    print(f"Select following topic -> {TOPIC_ARR}")
    exit(1) 
else:
    TOPIC = sys.argv[1]

ARTICLE_DIRECTORY = expanduser('~') + "/Documents/My Articles/"
PROJECT_PAGE_DIRECTORY = expanduser('~')+"/incomplete/blogs-and-docs/pages/"
ARTICLE_DIRECTORY_OF_PROJECT = f"{PROJECT_PAGE_DIRECTORY}{TOPIC}/"

# listing out markdown files of Documents folder
md_files = [ el for el in os.listdir(path = ARTICLE_DIRECTORY)]

JSON_FILE_PATH = f"{PROJECT_PAGE_DIRECTORY}{TOPIC}/meta.json" 

with open(JSON_FILE_PATH , 'r') as json_f:
    existed_json = json.loads(json_f.read())

TO_BE_ADD = [el for el in md_files if el[:-3] not in list(existed_json.values())]

if not len(TO_BE_ADD):
    print("Nothing to be added")
    exit(1)

#get how file is saved
f_name = sorted(list(existed_json.keys()) , key = lambda x: x[-1])[-1]

newly_added_files = []
for blog in TO_BE_ADD:
    f_name = f_name[:-1] + str( int(f_name[-1]) + 1)
    existed_json[f_name] = blog[:-3]
    newly_added_files.append(f_name)

with open(JSON_FILE_PATH , 'r+') as json_f:
    json.dump(existed_json, json_f , indent=4)
    print("Meta.json updated")

for source , dest in zip(TO_BE_ADD , newly_added_files):
    shutil.copy(f"{ARTICLE_DIRECTORY}{source}", f"{ARTICLE_DIRECTORY_OF_PROJECT}{dest}.mdx")
    print(f"{source} is copied")
