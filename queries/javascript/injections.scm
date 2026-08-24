(
  (variable_declarator
    (comment) @_glsl_comment
    (#match? @_glsl_comment "glsl")
    value: (template_string) @injection.content)
  (#set! injection.language "glsl")
  (#set! injection.include-children)
)
