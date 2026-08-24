; extends
((script_element
  (start_tag
    (attribute
      (quoted_attribute_value
        (attribute_value) @_type (#eq? @_type "text/babel"))))
  (raw_text) @injection.content)
 (#set! injection.language "jsx"))
