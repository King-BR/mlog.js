# custom primitives
any -> [\w]:+

conditional -> "equal" | "notEqual" | "lessThan" | "lessThanEq" | "greaterThan" | "greaterThanEq" | "strictEqual"

operation -> "add" | "sub" | "mul" | "div" | "idiv" | "mod" | "pow" | "shl" | "shr" | "or" | "and" | "xor" | "not" | "max" | "min" | "angle" | "len" | "noise" | "abs" | "log" | "log10" | "sin" | "cos" | "tan" | "floor" | "ceil" | "sqrt" | "rand"


# Matches various kinds of string literals

# Double-quoted string
dqstring -> "\"" dstrchar:* "\"" {% function(d) {return d[1].join(""); } %}
sqstring -> "'"  sstrchar:* "'"  {% function(d) {return d[1].join(""); } %}
btstring -> "`"  [^`]:*    "`"  {% function(d) {return d[1].join(""); } %}

dstrchar -> [^\\"\n] {% id %}
    | "\\" strescape {%
    function(d) {
        return JSON.parse("\""+d.join("")+"\"");
    }
%}

sstrchar -> [^\\'\n] {% id %}
    | "\\" strescape
        {% function(d) { return JSON.parse("\""+d.join("")+"\""); } %}
    | "\\'"
        {% function(d) {return "'"; } %}

strescape -> ["\\/bfnrt] {% id %}
    | "u" [a-fA-F0-9] [a-fA-F0-9] [a-fA-F0-9] [a-fA-F0-9] {%
    function(d) {
        return d.join("");
    }
%}

# Whitespace: `_` is optional, `__` is mandatory.
_  -> wschar:* {% function(d) {return null;} %}
__ -> wschar:+ {% function(d) {return null;} %}

wschar -> [ \t\n\v\f] {% id %}