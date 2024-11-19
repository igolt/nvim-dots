;; extends

((call
  function: (attribute
    attribute: (identifier) @funcName)
    arguments: (argument_list
      (string
        (string_content) @injection.content
      )))
  (#any-of? @funcName "executemany" "cursor")
  (#set! injection.language "sql"))
