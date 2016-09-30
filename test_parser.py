import pytest
from cyflwyniad import *

# A list of snippets to try.  Each is a triple:
# 1. Explanation of what's being tested.
# 2. An snippet that should generate an ParseError exception.
# 3. A very similar snippet that should not generate any exception.

tests = [
  (
    'Junk before declaring a mode.',
    'xxx [config]',
    '[config] xxx'
  ),
  (
    'Junk before slide title.',
    '[slides] yyy ### xxx ###',
    '[slides] ### xxx ### yyy'
  ),

  (
    'Unclosed div.',
    '[slides] ### xxx ### !xxx{',
    '[slides] ### xxx ### !xxx{}'
  ),

  (
    'Unclosed math mode.',
    '[slides] ### xxx ### $y',
    '[slides] ### xxx ### $y$',
  ),

  (
    'Unclosed bold.',
    '[slides] ### xxx ### **yyy',
    '[slides] ### xxx ### **yyy**',
  ),

  (
    'Mismatched tags.',
    '[slides] ### xxx ### **__yyy**__',
    '[slides] ### xxx ### **__yyy__**',
  ),

  (
    'Missing media source.',
    '[slides] ### xxx ### [[ ]]',
    '[slides] ### xxx ### [[yyy.png ]]',
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

  
