import os
import os.path
import fnmatch
import logging
import ycm_core
import re


def getIncludesUnder(father):
    return [str("-I"+x[0]) for x in os.walk(father)]

def Settings( **kwargs ):
  BASE_FLAGS = [
          '-Wall',
          '-Wextra',
          '-Werror',
          '-Wno-long-long',
          '-Wno-variadic-macros',
          '-fexceptions',
          '-ferror-limit=10000',
          '-DNDEBUG',
          '-std=c++20',
          '-xc++',
          '-I/usr/lib/',
          '-I/usr/include/',
          ]
  BASE_FLAGS += getIncludesUnder(os.getcwd()+"/src")
  BASE_FLAGS += getIncludesUnder(os.getcwd()+"/3pp")
  return {
    'flags': BASE_FLAGS,
  }
