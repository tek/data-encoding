v0.1: Initial Release

v0.1.1:  
- customizable initial size for internal buffer
- remove single lwt related function and lwt dependency

v0.2:  
- CI tests
- error management improvements (use result, allow exn and option)
- do not print 0-sized fields in binary descriptions

v0.3:  
- Adapt to json-data-encoding.0.9.1 and provide json-lexeme seq to string seq
- Improved performance
- `maximum_length` to determine static size bounds (when possible)
- provide `to_`/`of_string` alongside `to_`/`of_bytes`
- Improved documentation
- Increase test coverage
- Fix JSON encoding of Result
