assert(Import, "Failed to get the import function! Please use the importer.")

local Connection = Import("Connection")

local Signal
do
	Signal = setmetatable({}, {
		__tostring = function()
			return "Signal"
		end,
	})
	Signal.__index = Signal
	function Signal.new(...)
		local self = setmetatable({}, Signal)
		return self:constructor(...) or self
	end
	function Signal:constructor()
		self.ConnectionList = {}
	end
	function Signal:Connect(Function)
		local Conn = Connection.new(Function)
		local _connectionList = self.ConnectionList
		-- ▼ Array.push ▼
		_connectionList[#_connectionList + 1] = Conn
		-- ▲ Array.push ▲
		return Conn
	end
	function Signal:Fire(Data)
		local _connectionList = self.ConnectionList
		local _arg0 = function(Conn)
			if Conn.Connected then
				Conn.Function(unpack(Data))
			end
		end
		-- ▼ ReadonlyArray.forEach ▼
		for _k, _v in ipairs(_connectionList) do
			_arg0(_v, _k - 1, _connectionList)
		end
		-- ▲ ReadonlyArray.forEach ▲
	end
end

local main = Signal
return {
	main = main,
}
