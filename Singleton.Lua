local Singleton = {}
Singleton.__index = Singleton

function Singleton.new(Name)
	if Singleton.Instance then 
		warn("There is already a member of this class [SINGLETON]; are you sure you meant to create one?")
		return Singleton.Instance
	end
	
	local NewInstance = setmetatable({
		["Name"] = Name;
	},Singleton)
	
	Singleton.Instance = NewInstance
	
	return NewInstance
end

function Singleton:SingleJingle()
	print(string.format("I am %s the Singleton; King of them all! \n I am %s the Singleton; that's me, that's all! ", self.Name, self.Name))
end

local MySingleton = Singleton.new("Singly")
MySingleton:SingleJingle()

local Another = Singleton.new("Songly")
Another:SingleJingle()
