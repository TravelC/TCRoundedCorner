# TCRoundedCorner
This is a category of UIView which provided the ability of add specified corner(s) to a view with a optional border.

![](https://github.com/TravelC/TCRoundedCorner/blob/master/demoOfTCRoundedCorner.gif)

Change Log
==========================
#### 0.0.4
1. Support device rotation.

Installation
==========================

#### Cocoapod Method:-

`pod 'TCRoundedCorner', '~> 1.0.0'`

#### Source Code Method:-
Add files in folder TCRoundedCorner to your project.

## How To Get Started

1.Only round myView's corners:

```
[self.myView roundedCorner:type radius:20.0];
```

2.Round corners and add a border together:

```
[self.myView roundedCorner:type radius:20.0 borderColor:borderColor borderWidth:5.0];
```

3.Add border only:

```
[self.myView addBorderWithColor:borderColor borderWidth:5.0];
```
4.Remove border:

```
[self removeBorder];
```
 

LICENSE
---
Distributed under the MIT License.

Author
---
If you wish to contact me, email at: chuchuanming@gmail.com

Blog
---
[http://travelchu.com](http://travelchu.com)

