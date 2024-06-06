local languages = {
	"lua",
	"go",
	"markdown",
	"bash",
}

local import_language = function(lang)
	return require("keithhand.langs." .. lang)
end

local imports = (function()
	local test = {}
	for _, v in pairs(languages) do
		table.insert(test, import_language(v))
	end
	return test
end)()

local exports = (function()
	local exports = {}
	for _, i in pairs(imports) do
		for k, v in pairs(i) do
			if type(v) == "string" then
				table.insert(exports, v)
			elseif type(v) == "table" then
				exports[k] = v
			end
		end
	end
	return exports
end)()

return exports
