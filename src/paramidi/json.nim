import std/json, sets, constants

proc compile*(ctx: var Context, node: JsonNode) =
  case node.kind:
  of JString:
    if noteSet.contains(node.str):
      compile(ctx, Note(notes.find(node.str)))
    elif instruments.contains(node.str):
      compile(ctx, Instrument(instruments.find(node.str) - 1))
    else:
      raise newException(Exception, "Invalid value: " & $node)
  of JInt:
    compile(ctx, node.num)
  of JFloat:
    compile(ctx, node.fnum)
  of JBool, JNull:
    raise newException(Exception, "Invalid value: " & $node)
  of JObject:
    for k, v in node:
      if k == "length":
        case v.kind:
        of JInt:
          setLength(ctx, v.num)
        of JFloat:
          setLength(ctx, v.fnum)
        else:
          raise newException(Exception, "Invalid length: " & $v)
      elif k == "octave":
        if v.kind == JInt:
          ctx.octave = v.num
        else:
          raise newException(Exception, "Invalid octave: " & $v)
      elif k == "play":
        if v.kind == JBool:
          ctx.play = v.bval
        else:
          raise newException(Exception, "Invalid play: " & $v)
      elif k == "mode":
        if v.kind == JString and modeSet.contains(v.str):
          ctx.mode = Mode(modes.find(v.str))
        else:
          raise newException(Exception, "Invalid mode: " & $v)
      elif k == "tempo":
        if v.kind == JInt:
          ctx.tempo = v.num.int
        else:
          raise newException(Exception, "Invalid tempo: " & $v)
      else:
        raise newException(Exception, "Invalid attribute: " & k)
  of JArray:
    var
      temp = ctx
      concurrent = false
      longestTime = ctx.time
    for item in node:
      let mode = temp.mode
      compile(temp, item)
      if mode != temp.mode and temp.mode == Mode.concurrent:
        concurrent = true
        temp.mode = Mode.sequential
      if concurrent:
        if temp.time > longestTime:
          longestTime = temp.time
        temp.time = ctx.time
    if concurrent:
      ctx.time = longestTime
    else:
      ctx.time = temp.time

