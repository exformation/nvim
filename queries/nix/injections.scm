; random learning: https://www.youtube.com/watch?v=v3o9YaHBM4Q
; why doesn't TJ need to do set language??? is that what offset is for?
((indented_string_expression
  (string_fragment) @s)
  (#match? @s "^--lua")
  (#set! language "lua"))
