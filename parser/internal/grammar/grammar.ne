@include "./primitives.ne"

@{%
	function parseData(d) {
		switch(d) {
			case "true": {
				d = true;
				break;
			}
			case "false": {
				d = false;
				break;
			}
			default: {
				if (Number(d)) d = Number(d);
				break;
			}
		}
		
		return d; 
	}
%}

MAIN -> END | JUMPALWAYS | JUMP | SET | OP {%
	function(d) {
		return d
	}
%}

END -> "end" {%
	function(d) {
		return {
			type: "end"
		}
	}
%}

JUMPALWAYS -> "jump" __ int __ "if" __ "always" (__ any __ any):*{%
	function(d) {
		return {
			type: "jump",
			to: d[2],
			when: "always",
			arg1: null,
			arg2: null
		}
	}
%}

JUMP ->  "jump" __ int __ "if" __ conditional __ any __ any {%
  function(d) {
    return {
      type: "jump",
      to: d[2][0],
      when: parseData(d[6][0].join("")),
      arg1: parseData(d[8][0].join("")),
      arg2: parseData(d[10][0].join(""))
    }
  }
%}

SET -> "set" __ any __ any {%
	function(d) {
		return {
			type: "set",
			variable: parseData(d[2][0].join("")),
			value: parseData(d[4][0].join(""))
		}
	}
%}

OP -> "op" __ (conditional|operation) __ any __ any __ any {%
	function(d) {
		return {
			type: "op",
			subtype: d[2][0][0],
			variable: parseData(d[4][0].join("")),
			arg1: parseData(d[6][0].join("")),
			arg2: parseData(d[8][0].join(""))
		}
	}
%}