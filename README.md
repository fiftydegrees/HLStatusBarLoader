# HLStatusBarLoader

Simple non-blocking HUD displaying a loader above the status bar with a cool animation. Single-line to use.

![HLStatusBarLoader sample](https://raw.githubusercontent.com/fiftydegrees/HLStatusBarLoader/develop/README-Files/hlstatusbarloader-sample.gif)

## Installation

* Simply drag the `./HLStatusBarLoader` folder into your project.

## Usage

**Display the loader:**

```
func startLoading() -> Void
```

**Hide the loader:**

```
func stopLoading() -> Void
```

Call these methods on the *main thread*. You can easily dispatch using GCD.

## Settings

**Change tint color:**

Update this property in your UIViewController instance.

```
var loaderForegroundColor: UIColor?
```
Default color is `UIColor.black()`.

## Credits

HLStatusBarLoader was developed by [Hervé Heurtault de Lammerville](http://www.hervedroit.com) for Photowizz app. If you have any feature suggestion or bug report, please help out by creating [an issue](https://github.com/fiftydegrees/HLStatusBarLoader/issues/new) on GitHub.