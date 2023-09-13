# -*- coding: utf-8 -*-
# VERSION: 1.2
# NOTE: Make sure to install japanese fonts

"""
Uses SauceNao's API to rename images based on the author and title
Usage:
    python <filename>.py <PATH>
    if PATH is not provided, it scans the current folder
    remove the trailing backslash in PATH
"""

import sys
import time
import os
import random
from datetime import datetime as dt
from saucenao_api import SauceNao
from saucenao_api.errors import BadKeyError, UnknownClientError

# CHANGE THE API KEY
API_KEY = "05c004067cbcb2b989e668b7ca0465a1ae451b3e"


def main():
    try:
        sauce = SauceNao(API_KEY)
    except BadKeyError:
        print("Bad API key Provided")
        log.write("BAD API key proovided\n")
        return 0
    except Exception as e:
        print("Unknown API error")
        log.write("Unknown API error\n")
        return 0

    count = 0

    if len(sys.argv) == 1:
        folder_path = os.getcwd()
    else:
        folder_path = sys.argv[1]

    if os.path.exists(folder_path) == False:
        print("Wrong path provided")
        quit()

    log.write(f"PATH: {folder_path}\n")
    files = [
        (folder_path + os.sep + file)
        for file in os.listdir(folder_path)
        if file.endswith(".jpg")
        or file.endswith(".png")
        or file.endswith(".jpeg")
        or file.endswith(".jfif")
    ]

    for file in files:
        try:
            result = sauce.from_file(open(file, "br+"))
        except UnknownClientError as uke:
            print(f"Unknown client error: {str(uke)}")
            log.write(f"Unknown client error: {str(uke)}\n")
            return count
        except Exception as e:
            print(f"API Error: {str(e)}")
            log.write(f"API Error: {str(e)}")
            return count

        # get the one with the most urls
        index = 0
        for i in range(len(result)):
            if len(result[index].urls) < len(result[i].urls):
                index = i

        if len(result) > 0:
            print(
                f"[{file}] Author: {result[index].author} title: {result[index].title} similarity: {result[index].similarity} url: {result[index].urls}"
            )
            log.write(
                f"[{file}] Author: {result[index].author} title: {result[index].title} similarity: {result[index].similarity} url: {result[index].urls}\n"
            )
            count += change_filename(
                folder_path, file, str(result[index].author), str(result[index].title)
            )
        else:
            print(f"[{file}] No results found")
            log.write(f"[{file}] No results found")

        time.sleep(5)
    return count


def change_filename(path, filename, author, title):
    _, ext = os.path.splitext(filename)

    # Remove special chars
    author = "".join(e for e in author if e.isalnum())
    title = "".join(e for e in title if e.isalnum())
    # find a new name, if it already exists

    new_name = path + os.sep + str(author).title() + "_" + str(title).title() + ext

    if os.path.exists(new_name) == True:
        new_name = (
            path
            + os.sep
            + str(author).title()
            + "_"
            + str(title).title()
            + str(random.randint(1, 1000))
            + ext
        )

    try:
        os.rename(filename, new_name)
        print(f"[{filename}] -> [{new_name}]")
        log.write(f"[{filename}] -> [{new_name}]\n")
    except:
        print(f"[{filename}]: Unable to rename")
        log.write(f"[{filename}]: Unable to rename")
        return 0

    return 1


if __name__ == "__main__":
    log = open(str(sys.argv[0]).replace(".py", ".log"), "a+")
    log.write(f"Start: {dt.now()}\n")

    img_count = main()

    log.write(f"Images Renamed: {img_count}\nEnd: {dt.now()}\n\n\n")
    log.close()
