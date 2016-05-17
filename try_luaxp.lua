local luaxp = require('luaxp')

local io = require("io")

local r, s, v, m
local ctx = { pi = 3.14159265, minrange = 0, maxrange=100 }

io.write("Running with Luaxp version " .. luaxp._VERSION .. "\n")
io.write("Context variables defined: ")
for r,s in pairs(ctx) do io.write(" " .. r .. "=" .. tostring(s)) end
io.write("\n")

while (true) do 
	io.write("\nEXP> ")
	io.flush()
	s = io.read()
	if (s == nil) then break end
	r, m = luaxp.compile(s)
	if (r == nil) then
		io.write("Expression parse failed: " .. tostring(m) .. "\n")
	else
		io.write("Compile result: ")
		io.write(luaxp.dump(r))
		io.write("\n")
		v,m = luaxp.run(r, ctx)
		if (v == nil) then
			io.write("Expression evaluation failed: " .. tostring(m) .. "\n")
		else
			io.write("Expression result: " .. tostring(v).."\n")
		end
	end
end
