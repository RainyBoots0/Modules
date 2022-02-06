local Connection
do
	Connection = setmetatable({}, {
		__tostring = function()
			return "Connection"
		end,
	})
	Connection.__index = Connection
	function Connection.new(...)
		local self = setmetatable({}, Connection)
		return self:constructor(...) or self
	end
	function Connection:constructor(Function)
		self.Connected = true
		self.Function = Function
	end
	function Connection:Disconnect()
		self.Connected = false
		self.Function = function() end
	end
end
local main = Connection
return {
	main = main,
}
