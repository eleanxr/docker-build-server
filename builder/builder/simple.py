
import os
import subprocess

def run_build(repository_url):
    """ Simple build that checks out from Git, runs CMake, and then Make.
    """
    checkout_directory = "source"
    subprocess.call(["git", "clone", repository_url, checkout_directory])
    os.chdir(checkout_directory)
    subprocess.call(["git", "submodule", "update", "--init"])
    os.chdir("..")
    os.mkdir("build-debug")
    os.chdir("build-debug")
    subprocess.call([
        "cmake",
        "-DCMAKE_BUILD_TYPE=debug",
        "../checkout_directory"
    ])
    subprocess.call(["make"])
