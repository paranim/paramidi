import json

let
  measure1 = %*[1/16, "b", "c+", 1/8, "d+", "b", "c+", "a", "b", "g", "a"]
  measure2 = %*[1/16, "g", "g", 1/8, "g", "a", "b", "c+", "d+", "c+", 1/2, "b"]
  measure3 = %*[1/16, [{"mode": "concurrent"}, "d", "b-", "g-"], [{"mode": "concurrent"}, "d", "b-", "g-"],
                1/8, [{"mode": "concurrent"}, "d", "b-", "g-"], [{"mode": "concurrent"}, "e", "c", "g-"],
                [{"mode": "concurrent"}, "d", "b-", "g-"]]
  measure4 = %*[1/16, "r", "r", 1/8, "g", "r", "d", "r", "g", "g", "d"]
  measure5 = %*[1/4, "g", 1/8, "a", "b", 1/4, "g", 1/8, "a", "d"]
  measure6 = %*[1/4, "g", 1/8, "a", "b", 1/4, "g", 1/8, [{"mode": "concurrent"}, "f", "a-"], "b", 1/4, "c"]
  score* =
    %*[{"tempo": 80, "octave": 3},
       ["guitar", measure1],
       ["banjo", measure1],
       ["guitar", measure1],
       ["guitar", 1/2, "d", 1/8, "g", "g", "a", "b", "g", "b", 1/2, "a"],
       ["banjo", 1/8, "g", "g", "a", "b", 1/2, "g"],
       ["guitar", {"octave": 2}, measure2],
       ["banjo", measure2],
       ["guitar", {"octave": 2}, measure2],
       ["banjo", measure2],
       ["guitar", measure2],
       ["banjo", measure2],
       {"octave": 4},
       ["guitar", measure3],
       ["banjo", measure3],
       ["guitar", measure3],
       ["banjo", measure3],
       ["guitar", {"octave": 2}, measure1],
       ["banjo", {"octave": 3}, measure1],
       {"tempo": 120, "octave": 3},
       [{"mode": "concurrent"},
        ["banjo", measure1],
        ["guitar", measure4]],
       [{"mode": "concurrent"},
        ["banjo", measure1],
        ["guitar", measure4]],
       [{"mode": "concurrent"},
        ["banjo", measure1],
        ["guitar", measure5]],
       [{"mode": "concurrent"},
        ["banjo", measure1],
        ["guitar", measure6]]]
