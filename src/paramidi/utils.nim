import std/macros
import paramidi

proc instrumentImpl(body: NimNode): seq[NimNode]
proc concurentImpl(body: NimNode): NimNode

proc instrumentImpl(body: NimNode): seq[NimNode] =
  ## Takes a given body and parses it to the proper AST
  for call in body:
    case call.kind:
    of nnkInfix: # This is `1/2: a` or similar
      let invoke = call.copyNimTree
      invoke.del(invoke.len - 1, 1)
      result.add invoke
      if call[^1][0].kind in {nnkBracket}: # This is sequential notes, so copy them
        for x in call[^1][0]:
          result.add x
      else: # We want these as is
        result.add call[^1][0]
    of nnkAsgn: # We got `a = b` and want `(a: b)`
      result.add nnkPar.newTree(nnkExprColonExpr.newTree(call[0], call[1]))
    of nnkCall: # Either a new Instrument ie: `piano:` or `concurrent:` block
      if call[0].eqIdent"concurrent":
        result.add call.concurentImpl
      else:
        result.add nnkTupleConstr.newTree(call[0])
        result[^1].add call[^1].instrumentImpl
    of nnkIdent: # Convert to a tuple so variables are usable `piano: measure` == `(piano, (measure))`
      result.add nnkTupleConstr.newTree(call)
    else: discard

proc concurentImpl(body: NimNode): NimNode =
  ## Takes a body and emits `((mode: Concurrent), (piano, g), (guitar, f))`
  result = nnkTupleConstr.newTree(nnkTupleConstr.newTree(nnkExprColonExpr.newTree(ident"mode",
      ident"concurrent")))
  result.add body[^1].instrumentImpl


macro makeMusic*(body: untyped): untyped =
  ## DSL for making easy midi music.
  ## `a` = `b` is used for things like `octave` or `tempo`.
  ## `1/8:` is used for a single __Word that is correct here__
  ## `[]` surrounds sequential entires in a note.
  ## `concurrent` can be used for blocks of concurrent music.
  runnableExamples:
    const test = makeMusic:
      piano:
        tempo = 74
        1/8: {-d, -a, e, fx}
        1/2: {fx, +d}
        1/8: [{-e, e, +c}, a]
        1/2: {c, e}
        1/8: [{-d, -a, e, fx}, a, +d, +cx, +e, +d, b, +cx]
        1/2: [{-e, c, a}, {c, e}]
  result = nnkTupleConstr.newNimNode
  result.add instrumentImpl(body)

macro concurrentMusic*(body: untyped): untyped =
  ## DSL for making easy concurrent midi music.
  ## The base block is concurrent, same rules as `makeMusic` apply.
  ## `a` = `b` is used for things like `octave` or `tempo`.
  ## `1/8:` is used for a single __Word that is correct here__
  ## `[]` surrounds sequential entires in a note.
  ## `concurrent` can be used for blocks of concurrent music.
  runnableExamples:
    const test2 = concurrentMusic:
      piano:
        tempo = 20
        1/8: {-d, -a, e, fx}
        1/2: {fx, +d}
        1/8: [{-e, e, +c}, a]
      agogo:
        tempo = 14
        1/8: {-d, -a, e, fx}
        1/2: {fx, +d}
        1/8: [{-e, e, +c}, a]

  result = nnkTupleConstr.newTree(nnkPar.newTree(nnkExprColonExpr.newTree(ident"mode", newLit(concurrent))))
  result.add body.instrumentImpl
