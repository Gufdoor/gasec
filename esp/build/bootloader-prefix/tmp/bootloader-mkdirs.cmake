# Distributed under the OSI-approved BSD 3-Clause License.  See accompanying
# file Copyright.txt or https://cmake.org/licensing for details.

cmake_minimum_required(VERSION 3.5)

file(MAKE_DIRECTORY
  "C:/Espressif/frameworks/esp-idf-v5.1.1/components/bootloader/subproject"
  "E:/General/Learning/PUC/7_periodo/ti5/gasec/esp/build/bootloader"
  "E:/General/Learning/PUC/7_periodo/ti5/gasec/esp/build/bootloader-prefix"
  "E:/General/Learning/PUC/7_periodo/ti5/gasec/esp/build/bootloader-prefix/tmp"
  "E:/General/Learning/PUC/7_periodo/ti5/gasec/esp/build/bootloader-prefix/src/bootloader-stamp"
  "E:/General/Learning/PUC/7_periodo/ti5/gasec/esp/build/bootloader-prefix/src"
  "E:/General/Learning/PUC/7_periodo/ti5/gasec/esp/build/bootloader-prefix/src/bootloader-stamp"
)

set(configSubDirs )
foreach(subDir IN LISTS configSubDirs)
    file(MAKE_DIRECTORY "E:/General/Learning/PUC/7_periodo/ti5/gasec/esp/build/bootloader-prefix/src/bootloader-stamp/${subDir}")
endforeach()
if(cfgdir)
  file(MAKE_DIRECTORY "E:/General/Learning/PUC/7_periodo/ti5/gasec/esp/build/bootloader-prefix/src/bootloader-stamp${cfgdir}") # cfgdir has leading slash
endif()
