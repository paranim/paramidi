#? replace(sub="d♭", by="cx") | replace(sub="e♭", by="dx") | replace(sub="g♭", by="fx") | replace(sub="a♭", by="gx") | replace(sub="b♭", by="ax")

import unittest
import paramidi

test "sharps and flats":
  const
    score1 = compile((piano, 1/4, cx, dx, fx, gx, ax, cx+1, dx+1, fx+1, gx+1, ax+1))
    score2 = compile((piano, 1/4, d♭, e♭, g♭, a♭, b♭, d♭+1, e♭+1, g♭+1, a♭+1, b♭+1))
  check score1 == score2
