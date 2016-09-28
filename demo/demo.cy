
[style]

@import 'https://fonts.googleapis.com/css?family=Baloo+Paaji';
@import 'https://fonts.googleapis.com/css?family=Bitter';

.reveal h1 {
  font-family: 'Baloo Paaji';
  font-size: 30;
  text-align:left;
}

.reveal .slide-body {
  text-align: left;
  font-family: 'Bitter';
  font-size: 20;
}

.reveal .ib {
  display: inline-block;
}

.reveal b {
  font-weight: bold;
}

#include mathjax.cy

[slides]

### Start Slide ###

The presentation starts two slides forward from here.

### Start Slide ###
#start

The presentation starts on the next slide.  The start directive on this slide
is ignored --- only the last one counts.


### Images ###
#start
>>>
  [[https://upload.wikimedia.org/wikipedia/commons/0/0f/Grosser_Panda.JPG width=500]]
<<<

### Video ###
>>>
  [[movies/badday.mp4 data-autoplay width=500]]
<<<

### Lists ###

An unordered list:
@ul{
  -- A bullet point.
  -- Another one.
}

...

An ordered list:
@ol{
  -- A numbered point.
  -- Another one.
}


### Vertical spacing ###

Use an ellipsis

...

for blank vertical space.


### Line breaks ###

Be careful about spacing:
>>>
  !ib{
      [[figs/test.png]] \\
      [[figs/test.png]] 
  }
  !ib{
    [[figs/test.png]]\\
    [[figs/test.png]] 
  }
<<<

### Math ###

$n^{23}$


### Formatting Shortcuts ###

@ul{
  -- **Boldface**
  -- __Italics__
  -- Em-dash ---
}

