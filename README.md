# modern-fortran-project
A template repository for modern fortran projects

## How to install the FPM

See the instructions [here](https://fpm.fortran-lang.org/install/index.html)

If you are on a Linux distro and have any Fortran compiler installed, do:

```
git clone https://github.com/fortran-lang/fpm
cd fpm
./install.sh
```

This will put the fpm in your `$HOME/.local/bin`

## How to change the FPM config

Basically just remove my name and add yours. Also just add your project name.

To build, simply: `fpm build`

To test, `fpm test`

To see my super cool printout: `fpm run`

## How to change the CMake config

At the very top you have to change:

```
project(
  "demo"
  LANGUAGES Fortran
  VERSION 0.0
  DESCRIPTION "ADD YOUR DESCRIPTION HERE")


set(project_name demo)
set(main_lib ${project_name})
set(exe_name exe_${project_name})
set(all_targets ${main_lib} ${exe_name})
```

Replace `"demo"` with the name of your project.

For the `set` commands, change the name on the RIGHT, i.e. `demo`. This will
cascade down.

At the very bottom, change

```
# RENAME YOUR demoConfig.cmake.in to match ${your_new_name}Config.cmake
# and change here sampleConfig.cmake.in to xyzConfig.cmake.in
configure_package_config_file(
  "${CMAKE_CURRENT_SOURCE_DIR}/cmake/sampleConfig.cmake.in"
  "${CMAKE_CURRENT_BINARY_DIR}/${project_name}Config.cmake"
  INSTALL_DESTINATION lib/cmake/${project_name})
```


## How to use the CMake build system

Everything is set up so that you will load `test-drive` for unit-tests in a nice portable way. Also, I've set
all you need so that you package is findable by other cmake packages. To install to a known location simply do:

```
mkdir build
cmake -DCMAKE_INSTALL_PREFIX=$HOME/demo/ ../
make -j install
```

To run the tests, from the build dir run: `ctest`


## CI/CD

This repo contains a very powerful CI/CD workflow based on gha3mi's work, which you can find [here](https://github.com/gha3mi/setup-fortran-conda/tree/main)


## pre-commit hooks

The repo also comes with a pre-commit that will ensure a formatting for your Fortran files. You can install pre-commits by using:

```
python3 -m pip install pre-commit
pre-commit install
```

## Using your template repo in another project.

This repo will install everything CMake needs to find the project. THe only thing you need to set is  `YOUR_PROJECT_NAME_ROOT=/path/to/install/location`

And in your new project set `find_package(demo REQUIRED)`

To then link to demo, you can simply add `demo::demo` to you `target_link_libraries(${tgt} PRIVATE demo::demo)`
