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

[script]

#script http://rawgit.com/pkra/MathJax-single-file/master/dist/TeXSVG/MathJax.js

// Below is the part of reveal.js's math plugin that does *not* deal with
// loading the MathJax library.

MathJax.Hub.Config({
  messageStyle: 'none',
  tex2jax: {
    inlineMath: [['$','$'],['\\(','\\)']] ,
    skipTags: ['script','noscript','style','textarea','pre']
  },
  skipStartupTypeset: true
});

// Typeset followed by an immediate reveal.js layout since
// the typesetting process could affect slide height
MathJax.Hub.Queue( [ 'Typeset', MathJax.Hub ] );
MathJax.Hub.Queue( Reveal.layout );

// Reprocess equations in slides when they turn visible
Reveal.addEventListener( 'slidechanged', function( event ) {

  MathJax.Hub.Queue( [ 'Typeset', MathJax.Hub, event.currentSlide ] );

} );

[slides]

### Images ###
>>>
  [[https://upload.wikimedia.org/wikipedia/commons/0/0f/Grosser_Panda.JPG width=500]]
<<<

### Video ###
>>>
  [[movies/badday.mp4 data-autoplay width=500]]
<<<

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


### Dashes ###

--- for an em-dash

