[style]

.reveal .slide-body {
  text-align: left;
}

.reveal .ib {
  display: inline-block;
}

[script]

#script https://rawgit.com/pkra/MathJax-single-file/master/dist/TeXSVG/MathJax.js

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

### Line breaks ###

Be careful about spacing:
>>>
  !ib{
      [[test.png]] \\
      [[test.png]] 
  }
  !ib{
    [[test.png]]\\
    [[test.png]] 
  }
<<<

### Math ###

$n^{23}$


### Dashes ###

--- for an em-dash

