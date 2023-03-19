cmake_minimum_required(VERSION 3.16)

project(test LANGUAGES CXX)
set(CMAKE_CXX_STANDARD 17) # Qt6 requirement. If you want the latest, set "20"
set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_CXX_EXTENSIONS ON)

# specify build paths
set(CMAKE_ARCHIVE_OUTPUT_DIRECTORY "${CMAKE_BINARY_DIR}/lib")
set(CMAKE_LIBRARY_OUTPUT_DIRECTORY "${CMAKE_BINARY_DIR}/lib")
set(CMAKE_RUNTIME_OUTPUT_DIRECTORY "${CMAKE_BINARY_DIR}/bin")

# definitions
if (MSVC)
  set (CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} /fp:precise /EHa /MP")
  string (REGEX REPLACE "/EHsc" "" CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS}")
  add_definitions (-D_CRT_SECURE_NO_WARNINGS -D_CRT_NONSTDC_NO_DEPRECATE -DUNICODE -D_UNICODE -D_USE_MATH_DEFINES)
else()
  set (CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -fexceptions -fPIC")
endif()

# Find dependencies
find_package(Qt6 REQUIRED COMPONENTS Core Gui Qml Quick QuickControls2)
set(CMAKE_AUTOMOC ON)
set(CMAKE_AUTORCC ON)

FILE(GLOB_RECURSE SOURCE_FILES LIST_DIRECTORIES false CONFIGURE_DEPENDS
  "${CMAKE_CURRENT_SOURCE_DIR}/*.cpp")
FILE(GLOB_RECURSE HEADER_FILES LIST_DIRECTORIES false CONFIGURE_DEPEND
  "${CMAKE_CURRENT_SOURCE_DIR}/*.h")
#FILE(GLOB_RECURSE QML_FILES LIST_DIRECTORIES false CONFIGURE_DEPENDS
#  "${CMAKE_CURRENT_SOURCE_DIR}/*.qml")
set (RESOURCE_FILES ${CMAKE_CURRENT_SOURCE_DIR}/qml.qrc ${CMAKE_CURRENT_SOURCE_DIR}/../colorpicker/Colorpicker.qrc)
qt6_add_resources(RCC_SOURCES ${RESOURCE_FILES})

if(WIN32)
#  qt6_add_executable(${PROJECT_NAME} ${SOURCE_FILES} ${HEADER_FILES} 
#    ${QML_FILES} ${RESOURCE_FILE})
  qt6_add_executable(${PROJECT_NAME} ${SOURCE_FILES} ${HEADER_FILES} 
    ${RCC_SOURCES})

  set_target_properties(${PROJECT_NAME} PROPERTIES
    WIN32_EXECUTABLE TRUE
    MACOSX_BUNDLE TRUE

    # Prevent name clash with build subdirectory on case-insensitive file systems
    OUTPUT_NAME ${PROJECT_NAME}
  )
  set_property(TARGET ${PROJECT_NAME} PROPERTY QT6_NO_LINK_QTMAIN ON)
elseif(ANDROID)
  qt_add_library(${PROJECT_NAME} ${SOURCE_FILES} ${HEADER_FILES} SHARED)
  set_property(TARGET ${PROJECT_NAME} PROPERTY QT6_NO_LINK_QTMAIN ON)
endif(WIN32)

include_directories(
  ${CMAKE_CURRENT_SOURCE_DIR}
)

target_link_libraries(${PROJECT_NAME} PRIVATE
  Qt6::Core
  Qt6::Gui
  Qt6::Qml
  Qt6::Quick
  Qt6::QuickControls2
#  Qt6::QmlPrivate 
#  Qt6::QuickPrivate
)

# auxiliary development environment
if (MSVC)
  set (X_COMPILER_BITNESS x64)
#  get_target_property (QtCore_location Qt6::Core LOCATION)
#  get_filename_component (QT_BINARY_DIR ${QtCore_location} DIRECTORY)
#  set (QT_PLUGINS_DIR)
#  if(EXISTS "${QT_BINARY_DIR}/../plugins")
#    set (QT_PLUGINS_DIR "${QT_BINARY_DIR}/../plugins")
#  endif()
  #configure_file("${CMAKE_SOURCE_DIR}/adm/cmake/sample.vcxproj.user.in" "${CMAKE_BINARY_DIR}/${PROJECT_NAME}/${PROJECT_NAME}.vcxproj.user" @ONLY)
endif()

add_custom_command(TARGET ${PROJECT_NAME} POST_BUILD 
  COMMAND Qt6::windeployqt
  ARGS $<TARGET_FILE:${PROJECT_NAME}>
)
