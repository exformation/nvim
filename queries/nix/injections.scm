; random learning
((indented_string_expression
  (string_fragment) @first-fragment)
 (#match? @first-fragment "^--lua")
 (#set! language "lua"))
