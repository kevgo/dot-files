# Firefox setup

Change scroll distance:

```
go to about:config
search for toolkit.scrollbox.verticalScrollDistance
set to 15
```

Smoother scrolling:

```
general.smoothScroll.currentVelocityWeighting	1	
general.smoothScroll.msdPhysics.continuousMotionMaxDeltaMS	12	
general.smoothScroll.msdPhysics.enabled	true	
general.smoothScroll.msdPhysics.motionBeginSpringConstant	100	
general.smoothScroll.msdPhysics.regularSpringConstant	100	
general.smoothScroll.msdPhysics.slowdownMinDeltaMS	25	
general.smoothScroll.msdPhysics.slowdownMinDeltaRatio	0.3	
general.smoothScroll.msdPhysics.slowdownSpringConstant	250	
general.smoothScroll.stopDecelerationWeighting	1.0
```


install https://addons.mozilla.org/en-US/firefox/addon/ublock-origin

- https://wiki.archlinux.org/title/Firefox/Tweaks
- disable pocket
- move disk cache to RAM
- https://github.com/iamadamdev/bypass-paywalls-chrome
