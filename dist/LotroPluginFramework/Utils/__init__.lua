LPFClasses.Utils = class()

function LPFClasses.Utils:Constructor()
	return self
end

function LPFClasses.Utils:DumpTable(node)
	local cache, stack, output = {}, {}, {}
	local depth = 1
	local output_str = "{\n"

	while true do
		local size = 0
		for k, v in pairs(node) do
			size = size + 1
		end

		local cur_index = 1
		for k, v in pairs(node) do
			if (cache[node] == nil) or (cur_index >= cache[node]) then
				if string.find(output_str, "}", output_str:len()) then
					output_str = output_str .. ",\n"
				elseif not (string.find(output_str, "\n", output_str:len())) then
					output_str = output_str .. "\n"
				end

				-- This is necessary for working with HUGE tables otherwise we run out of memory using concat on huge strings
				table.insert(output, output_str)
				output_str = ""

				local key
				if type(k) == "number" or type(k) == "boolean" then
					key = "[" .. tostring(k) .. "]"
				else
					key = "['" .. tostring(k) .. "']"
				end

				if type(v) == "number" or type(v) == "boolean" then
					output_str = output_str .. string.rep("     ", depth) .. key .. " = " .. tostring(v)
				elseif type(v) == "table" then
					output_str = output_str .. string.rep("     ", depth) .. key .. " = {\n"
					table.insert(stack, node)
					table.insert(stack, v)
					cache[node] = cur_index + 1
					break
				else
					output_str = output_str .. string.rep("     ", depth) .. key .. " = '" .. tostring(v) .. "'"
				end

				if cur_index == size then
					output_str = output_str .. "\n" .. string.rep("     ", depth - 1) .. "}"
				else
					output_str = output_str .. ","
				end
			else
				-- close the table
				if cur_index == size then
					output_str = output_str .. "\n" .. string.rep("     ", depth - 1) .. "}"
				end
			end

			cur_index = cur_index + 1
		end

		if size == 0 then
			output_str = output_str .. "\n" .. string.rep("     ", depth - 1) .. "}"
		end

		if #stack > 0 then
			node = stack[#stack]
			stack[#stack] = nil
			depth = cache[node] == nil and depth + 1 or depth - 1
		else
			break
		end
	end

	-- This is necessary for working with HUGE tables otherwise we run out of memory using concat on huge strings
	table.insert(output, output_str)
	output_str = table.concat(output)

	return output_str
end

function LPFClasses.Utils:TableEncode(tbl)
	if type(tbl) == "number" then
		local text = tostring(tbl)

		return "#" .. string.gsub(text, ",", ".")
	elseif type(tbl) == "string" then
		return "$" .. tbl
	elseif type(tbl) == "table" then
		local new = {}

		for k, v in pairs(tbl) do
			new[self:TableEncode(k)] = self:TableEncode(v)
		end

		return new
	else
		return tbl
	end
end

function LPFClasses.Utils:TableDecode(tbl)
	if type(tbl) == "string" then
		local prefix = string.sub(tbl, 1, 1)

		if prefix == "$" then
			return string.sub(tbl, 2)
		elseif prefix == "#" then
			return loadstring("return " .. string.sub(tbl, 2))()
		else
			return tbl
		end
	elseif type(tbl) == "table" then
		local new = {}

		for k, v in pairs(tbl) do
			new[self:TableDecode(k)] = self:TableDecode(v)
		end

		return new
	else
		return tbl
	end
end
