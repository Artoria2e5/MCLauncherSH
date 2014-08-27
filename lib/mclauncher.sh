#!/bin/bash

mc._osdetect(){
  case $(uname) in
    *darwin*)
      mc.native=osx
      ;;
    *linux*)
      mc.native=linux
      ;;
    *MINGW*|*cygwin*)
      mc.native=windows
      ;;
    *)
      mc._die $(echo $"WTF is" $(uname)$"?")
  esac
}



