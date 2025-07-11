local ls = require("luasnip")
local postfix = require("luasnip.extras.postfix").postfix
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node

return {
	-- .if → if (cond) { ... }
	postfix(".if", {
		t("if ("),
		f(function(_, parent)
			return parent.snippet.env.POSTFIX_MATCH
		end, {}),
		t({ ") {", "\t" }),
		i(0),
		t({ "", "}" }),
	}),

	-- .log → console.log(...)
	postfix(".log", {
		t("console.log("),
		f(function(_, parent)
			return parent.snippet.env.POSTFIX_MATCH
		end, {}),
		t(")"),
		i(0),
	}),

	-- .not → !cond
	postfix(".not", {
		t("!"),
		f(function(_, parent)
			return parent.snippet.env.POSTFIX_MATCH
		end, {}),
		i(0),
	}),

	-- .ternary → cond ? ... : ...
	postfix(".ternary", {
		f(function(_, parent)
			return parent.snippet.env.POSTFIX_MATCH .. " ? "
		end, {}),
		i(1, "trueValue"),
		t(" : "),
		i(2, "falseValue"),
	}),
}
