--[[
	In Lua, we can create OOP classes using metatables. Basically, tables are objects and can have 
	attributes (properties), and they can also have methods (functions and logic) which coincidentally
	are considered the same thing because in Lua: functions are first-class values. 
	
	This means functions can be passed around, returned, and put into tables. Methods are technically slightly
	different; when you declare a function like so:
	
	function Table:Method()
	end
	
	The first argument passed to Method is implicitly assigned to a variable called "self" which can be used
	inside the Method. 
	
	function Table:Method()
		print(self) --> Banana Flakes
	end
	
	Table.Method("Banana flakes!")
	
	Additionally, when you call using : you implicitly pass as the first argument the table itself 
	
	function Table.ANormalFunction(FirstArgument)
		print(FirstArgument) -> hex table reference
	end
	
	Table:ANormalFunction()
	
	---------------------------
	Now, metatables are tables which can be assigned to tables. They can give the table certain powers like
	being used in arithmetic operations (add, sub, div etc), or in comparisons (<, >, ==). 
	
	local ModifiedTable = setmetatable(OriginalTable, TheMetaTable)
	
	We want to look at the handy metamethod __index (metamethods are differentiated from regular properties by
	the __ before it; not just a naming preference here!)
	
	__index is fired whenever the table is indexed and there is no corresponding value for that index. 
	
	local OurMetaTable = {
		__index = function(t, k)  -- t = table being indexed; k = index (or key)
			return k * 2
		end;
	}
	
	local Modified = setmetatable({2, 4, 6}, OurMetaTable)
	print(Modified[15]) --> (15) is not found in the table, but this triggers metamethod __index !! --> 30
	
	If __index redirects you to a table, then it will search through that table for the value instead.
	So, we can implement inheritance using this idea: the instance table has a metatable of the class and
	whenever there is a method call on the instance, the method won't be found directly in the instance
	so the class metatable takes over and then redirects Lua to the class table itself and Lua looks for
	the method there! 
--]]

local Noble = {}
Noble.__index = Noble

function Noble.new(Name, Title)
	local NewInstance = setmetatable({
		["Name"] = Name;
		["Title"] = Title;
	},Noble)

	return NewInstance
end

function Noble:Proclaim()
	print(string.format("I am %s %s ! ", self.Title, self.Name))
end

--[[
	So, we have instances deriving properties and methods from a class which is a good start.
	However, we need to embody the 4 principles of OOP:
	
	-Abstraction
	-Encapsulation
	-Inheritance
	-Polymorphism
	
	Now we've already got Abstraction down, and we can add proper Encapsulation pretty easily so let's 
	look at my inheritance example below:
--]]

local Lord = {
	["Title"] = "Lord";
}

Lord.__index = function(t, k)
	return Lord[k] or Noble[k]
end

function Lord.new(Name)
	local NewLord = setmetatable({
		["Name"] = Name;
	}, Lord)
	
	return NewLord
end

function Lord:MakeLaw(Law)
	print(string.format("By the power of my title as Lord %s, I decree: %s", self.Name, Law))
end
local NewLord = Lord.new("Flavin")

NewLord:Proclaim()
NewLord:MakeLaw("Bananas are illegal")

--[[
	Note that you could add Polymorphism by overriding the Proclaim method pretty simply. 
	
	There are also other ways of adding inheritance. For example, we could use tables for __index by
	setting the metatable of Lord to be Nobility. 
	
	That way, we can have a chain of inheritance:
	
	Instance -> metatable is Lord, check for method in Lord -> metatable of Lord is nobility, check here
--]]
