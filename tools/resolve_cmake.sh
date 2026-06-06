find . -name CMakeLists.txt -exec sed -i \
's/cmake_minimum_required(VERSION 3\.0\.0)/cmake_minimum_required(VERSION 3.5)/g' {} \;

find . -name CMakeLists.txt -exec sed -i \
's/cmake_minimum_required(VERSION 3\.0 FATAL_ERROR)/cmake_minimum_required(VERSION 3.5 FATAL_ERROR)/g' {} \;