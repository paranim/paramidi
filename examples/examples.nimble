# Package

version       = "0.1.0"
author        = "oakes"
description   = "Paramidi examples"
license       = "Public Domain"
srcDir        = "src"
bin           = @["examples"]

task dev, "Run dev version":
  exec "nimble run examples"


# Dependencies

requires "nim >= 1.2.6"
requires "paramidi >= 0.1.0"
