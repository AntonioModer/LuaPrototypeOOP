print(_VERSION )

print("garbage in Kb: "..collectgarbage("count"))
print('-------------------')
local clock = os.clock
function sleep(n)  -- seconds
local t0 = clock()
while clock() - t0 <= n do end
end



require "Class3"
require "Class2"
require "Class1"                            --// declare new Class


function newWeakTable()
return setmetatable({}, {__mode = "v"}) 
end

OWR1 = newWeakTable()
OWR1.Obj1 = Class1:new()
OWR1.Obj2 = Class2:new()
OWR1.Obj3 = Class3:new()

--// create table with weak references to object
OWR2 = newWeakTable() 
OWR2.Obj1 = OWR1.Obj1             --// weak reference to object
OWR2.Obj2 = OWR1.Obj2
OWR2.Obj3 = OWR1.Obj3

--// create table with weak references to object
OWR3 = newWeakTable() 
OWR3.Obj1 = OWR2.Obj1             --// weak reference to object
OWR3.Obj2 = OWR2.Obj2
OWR3.Obj3 = OWR2.Obj3 

--  OWR1.Obj1 = nil
--  OWR2.Obj3:delete()

print('--------------------')
collectgarbage() 
print("garbage in Kb: "..collectgarbage("count"))
print('--------------------')
for k,v in pairs(Class1:getObjects()) do
	print('Class1 object: '..tostring(v))
end
-- 	print(tostring(OWR1.Obj1.SelfClass:objectIsExist(OWR1.Obj1)))
print('--------------------')
for k,v in pairs(Class2:getObjects()) do
	print('Class2 object: '..tostring(v))
end
--  print(tostring(OWR1.Obj1.SelfClass:objectIsExist(OWR1.Obj1)))
print('--------------------')
for k,v in pairs(Class3:getObjects()) do
	print('Class3 object: '..tostring(v))
end
--  print(tostring(OWR1.Obj1.SelfClass:objectIsExist(OWR1.Obj1)))
print('--------------------')
print(Class1:getObjectsCount())
print(Class2:getObjectsCount())
print(Class3:getObjectsCount()) 
print('--------------------')
print(Class2:getParent().staticPublicVariable)
print(Class2.staticPublicVariable)
print(Class2.staticPrivateVariable)
Class2:staticPublicMethod()
print('--------------------')
print(Class3.staticPublicVariable)
print('--------------------')
print(OWR1.Obj1:getClass():getName())
print(OWR1.Obj2:getClass():getName())
print(OWR1.Obj3:getClass():getName())   
print(OWR1.Obj1.nonstaticPublicVariable)
print(OWR1.Obj2.nonstaticPublicVariable)    
print(OWR1.Obj3.nonstaticPublicVariable) 
print('--------------------')

sleep(10)