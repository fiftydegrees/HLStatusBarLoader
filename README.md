# HLStatusBarLoader

Simple non-blocking HUD displaying a loader above the status bar with a cool animation. Single-line to use.

![HLStatusBarLoader sample](https://raw.githubusercontent.com/fiftydegrees/HLStatusBarLoader/master/README-Files/hlstatusbarloader-sample.gif)

## Installation

### Manually

* Simply drag the `./HLStatusBarLoader` folder into your project.

## Usage

This is an UIViewController extension. You just have to call these methods on your UIViewController instance. As it does concern a UI update, remmeber to dispach  on the main thread.

**Display the loader:**

```
func showStatusBarHUD() -> Void
```

**Hide the loader:**

```
func hideStatusBarHUD() -> Void
```

## Settings

**Changing tint color:**

Update this property in your UIViewController instance.

```
var statusBarHUDForegroundColor: UIColor?
```
Default color is `UIColor.black()`.

## Credits

HLStatusBarLoader was developed by [Hervé Heurtault de Lammerville](http://www.hervedroit.com) for Photowizz app. If you have any feature suggestion or bug report, please help out by creating [an issue](https://github.com/fiftydegrees/HLStatusBarLoader/issues/new) on GitHub.