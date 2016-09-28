import pytest
from cyflwyniad import *

def test_unclosed_tag():
  doc = Document(True)
  with pytest.raises(Exception) as e:
    doc.process_cy_string(
      """
        [slides]
        !class{
      """
    )

  
