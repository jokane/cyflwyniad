// Include this to add MathJax support to a presentation.

[script]

// Load a single-file version of MathJax.
#script http://cdn.rawgit.com/pkra/MathJax-single-file/master/dist/TeXSVG/MathJax.js

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
