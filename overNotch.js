var NSApplicationPresentationAutoHideMenuBar = 1 << 2;
var NSApplicationPresentationAutoHideDock = 1 << 0;
var NSWindowStyleMaskBorderless = 0;
var NSApplicationPresentationDefault = 0;
var global = {};

global.app = ObjC.classes.NSApplication.sharedApplication();

global.arrayFromNSArray = (nsArray) => {
  var jsArray = [];
  var count = nsArray.count();
  for (var i = 0; i < count; i++) {
    jsArray[i] = nsArray.objectAtIndex_(i);
  }
  return jsArray;
};

global.mainWindow = () => {
  if (global.app.mainWindow()) {
    return global.app.mainWindow();
  }
  if (global.app.keyWindow()) {
    return global.app.keyWindow();
  }

  var windows = arrayFromNSArray(global.app.windows());
  var index = Math.min(...windows.map((w) => w.orderedIndex()));
  return windows.find((w) => w.orderedIndex() == index);
};

global.w = mainWindow();

global.toggleFullScreen = (windowNum) => {
  if (!windowNum) {
    windowNum = global.w.windowNumber();
  }

  var dict = ObjC.classes.NSThread.mainThread().threadDictionary();
  if (dict.valueForKey_(windowNum.toString())) {
    stopFullScreen(windowNum);
  } else {
    makeFullScreen(windowNum);
  }
};

global.stopFullScreen = (windowNum) => {
  Interceptor.revert(app.setPresentationOptions_.implementation);
  ObjC.schedule(ObjC.mainQueue, () => {
    global.app.setPresentationOptions_(NSApplicationPresentationDefault);
  });

  var window = windowNum
    ? global.app.windowWithWindowNumber_(windowNum)
    : global.w;
  if (!window) {
    return console.log("Window not found");
  }

  ObjC.schedule(ObjC.mainQueue, () => {
    var key = window.windowNumber().toString();
    var dict = ObjC.classes.NSThread.mainThread().threadDictionary();
    if (dict.valueForKey_(key)) {
      window.setStyleMask_(dict.valueForKey_(key).unsignedLongLongValue());
      dict.removeObjectForKey_(key);
    }

    window.setFrameUsingName_(key);
    window.setIsMovable_(true);

    Interceptor.revert(app.setPresentationOptions_.implementation);
  });
};

global.makeFullScreen = (windowNum) => {
  var window = windowNum
    ? global.app.windowWithWindowNumber_(windowNum)
    : global.w;
  if (!window) {
    return console.log("Window not found");
  }

  ObjC.schedule(ObjC.mainQueue, () => {
    var key = window.windowNumber().toString();
    var dict = ObjC.classes.NSThread.mainThread().threadDictionary();
    var value = ObjC.classes.NSNumber.numberWithUnsignedLongLong_(
      window.styleMask(),
    );
    dict.setValue_forKey_(value, key);
    window.saveFrameUsingName_(key);

    global.app.setPresentationOptions_(
      NSApplicationPresentationAutoHideDock |
        NSApplicationPresentationAutoHideMenuBar,
    );
    window.setStyleMask_(NSWindowStyleMaskBorderless);
    window.setFrame_display_(window.screen().frame(), true);
    window.setIsMovable_(false);

    Interceptor.replace(
      app.setPresentationOptions_.implementation,
      new NativeCallback((mask) => {}),
    );
  });
};
