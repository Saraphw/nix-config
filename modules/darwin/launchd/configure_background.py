import os, datetime as dt


image_dir = "~/.system/backgrounds/"

def set_background(filepath):
    return os.run(
        'oasacript -e "tell application "Finder" to set desktop background to POSIX file"' + os.path.abspath(filepath)
    )


if __name__ == "__main__":
    cur_time = dt.time()
