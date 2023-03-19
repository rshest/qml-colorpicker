---
title: "Colorpicker"
---
A basic colorpicker control made in Qt Quick/QML, as described in [the corresponding blog post](http://blog.ruslans.com/2010/12/cute-quick-colorpicker.html).

# Prerequisite
- Qt6(Qml, Quick and QuickControls2)
- It's also needed c++ compiler env, Qt6 Core and Qt6 Gui to run test.
- Note : If you want to use this on Qt5, refer to the other branch.

# How to test
see test directory and below gallery.

# New features
- Layout calculation using DPM(Pixel/Dot Per Millimeter) of primary screen.
- Fontsize calculation using Qt Window info(optional).
- Mostly follow [QML themes and styles](https://doc.qt.io/qt-6/qtquickcontrols2-styles.html).
- Support changing almost every layout parameters at runtime.

# Gallery
## Qt 6.4.3, windows (windows10)
### Basic Style
![](doc_image/win10_FHD_landscape_basic_normal.png)

### Basic Style and fake low DotPerMilimeter
![](doc_image/win10_FHD_landscape_basic_normal_test2.png)

### Basic Style and Palette mode
![](doc_image/win10_FHD_landscape_basic_norma_palette.png)

### Universal Style and fake low DotPerMilimeter
![](doc_image/win10_FHD_landscape_universal_normal_test2.png)

### Imagine Style, portrait and fake low DotPerMilimeter
![](doc_image/win10_FHD_portrait_imagine_test2.png)

### Material Style and fake low DotPerMilimeter
![](doc_image/win10_FHD_portrait_material_test2.png)

## Qt 6.4.3, android (Pixel 6 Pro API 33 on Simulator)
### Basic Style
![](doc_image/android_portrait_basic.png)

### Basic Style, palette mode and fake low DotPerMilimeter
![](doc_image/android_landscape_basic_test1.png)

### Basic Style, palette mode and fake low DotPerMilimeter(alternative font size calculation)
![](doc_image/android_landscape_basic_test2.png)

## Qt 6.4.3, linux (ubuntu 22.04.2 LTS on Hyper-V)
### Basic Style
![](doc_image/linux_landscape_basic_normal.png)

## Qt6.4.3, iPhone 14 pro (iOS16.2 on Simulator)
### Basic Style and fake low DotPerMilimeter
![](doc_image/ios_iphone14pro_landscape_basic_small_dpm.png)

### Basic Style and portrait
![](doc_image/ios_iphone14pro_portrait_basic.png)

### Basic Style, palette mode and fake low DotPerMilimeter
![](doc_image/ios_iphone14pro_landscape_basic_smalldpm_pallete.png)
