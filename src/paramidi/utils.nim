import std/macros
import paramidi

proc instrumentImpl(body: NimNode): seq[NimNode]
proc concurentImpl(body: NimNode): NimNode

proc instrumentImpl(body: NimNode): seq[NimNode] =
  for call in body:
    case call.kind:
    of nnkInfix:
      let invoke = call.copyNimTree
      invoke.del(invoke.len - 1, 1)
      result.add invoke
      if call[^1][0].kind in {nnkBracket}:
        for x in call[^1][0]:
          result.add x
      else:
        result.add call[^1][0]
    of nnkAsgn:
      result.add nnkPar.newTree(nnkExprColonExpr.newTree(call[0], call[1]))
    of nnkCall:
      if call[0].eqIdent"concurrent":
        result.add call.concurentImpl
        echo result[^1].repr
      else:
        result.add nnkTupleConstr.newTree(call[0])
        result[^1].add call[^1].instrumentImpl
    of nnkIdent:
      result.add nnkTupleConstr.newTree(call)
    else: discard

proc concurentImpl(body: NimNode): NimNode =
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
