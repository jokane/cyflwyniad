import pytest
from cyflwyniad import *

# A list of snippets to try.  Each is a triple:
# 1. Explanation of what's begin tested.
# 2. An snippet that should generate an ParseError exception.
# 3. A snippet that should not generate any exception.

tests = [
  (
    'Junk before slide title.',
    '[slides] yyy ### xxx ###',
    '[slides] ### xxx ### yyy'
  ),

  (
    'Unclosed tag.',
    '[slides] ### xxx ### !xxx{',
    '[slides] ### xxx ### !xxx{}'
  ),

  (
    'End in math mode.',
    '[slides] ### xxx ### $y',
    '[slides] ### xxx ### $y$',
  ),

]

def test_parser(capsys):
  for (name, bad, good) in tests:
    with pytest.raises(ParseError) as e:
      print "Bad case for:", name
      Document(True).process_cy_string(bad)
    capsys.readouterr()

    print "Good case for:", name
    Document(True).process_cy_string(good)
    capsys.readouterr()

  
