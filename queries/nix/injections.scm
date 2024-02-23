; random learning
((indented_string_expression
  (string_fragment) @s)
 (#match? @s "^--lua")
 (#set! language "lua"))
