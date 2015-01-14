function Class(className, ClassParent)                                                                             --// reserved
--[[ 
v 1.0.0
OOP base system
Note: 
  наследование,
  супер-методы/переменные,
  не/статические методы/переменные,
  все нестатические методы/переменные по умолчанию переопределены, (All nonstatic variables and methods by default is overridden)
  не/виртуальные методы/переменные,
  private/public методы/переменные (private немного корявые)
  все значения в объекте по умолчанию виртуальные
  класс - это тоже объект
  все значения в классе по умолчанию не виртуальные
TODO:
--]] 

if ClassParent ~= nil and _G[ClassParent] == nil then                                                             --// reserved
  require (ClassParent)
end

--// static private variables:
local ClassNew = {}                                                                             --// reserved, is table
local className = className                                                                              --// reserved, is string may get
local ClassParent = _G[ClassParent]                                                                           --// reserved, is table or nil may get/(set in Class declaration) 
local Objects = {}                                                                               --// reserved, is table may get, tabIndex is string may get
local objectsCount = 0                                                                            --// reserved, is number may get

--// static protected variables:
ClassNew.protected = {}                                                                           --// reserved; is table may get/set only in Class declaration

--// static public variables:


--// global variables
_G[className] = ClassNew                                                                             --// reserved, is table may get

--// static private methods:


--// static protected methods:


--// static public methods:
function ClassNew.getName()                                                     --// reserved
  return className
end

function ClassNew.getParent()                                                     --// reserved
  return ClassParent
end

function ClassNew.getObjects()                                                     --// reserved
  return Objects
end

function ClassNew.getObjectsCount()                                                     --// reserved
  return objectsCount
end

function ClassNew.getClass(SelfObject)                                                     --// reserved
  return ClassNew
end

function ClassNew.objectIsExist(SelfClass, Object)                                                      --// reserved
  local result = false
  if Object ~= nil and type(Object) == 'table' then
    if Objects[Object] ~= nil then
      result = true
    end
  end
  return result
end

function ClassNew.delete(SelfObject)                                                              --// reserved
   Objects[SelfObject] = nil
   objectsCount = objectsCount-1
end

function ClassNew._new(SelfClass, _parent)                                                       --// reserved
  if not _parent then
   objectsCount = objectsCount+1                                                                       --// reserved
  end
  local ThisObject = false                                                                    --// reserved, is table
  
  if ClassParent ~= nil then                                                                              --// reserved
    ThisObject = ClassParent:new(true)
    if not _parent then
      Objects[ThisObject] = ThisObject
    end
  else
    ThisObject = {}
    if not _parent then
      Objects[ThisObject] = ThisObject
    end
  end
  
    
  --// nonstatic private variables:


  --// nonstatic protected variables:
  
  
  --// nonstatic public variables:
  
    
  --// static public methods of Class with access from Object:
  ThisObject.delete = SelfClass.delete                                                                       --// reserved
  ThisObject.getClass = SelfClass.getClass                                                                       --// reserved

  --// nonstatic private methods:

  
  --// nonstatic protected methods:
  
  
  --// nonstatic public methods:

    
--  print('created new Object: '..tostring(SelfClass:getObjectsCount()))
  return ThisObject                                                                                        --// reserved
end

print('declared new Class: '..className)
--return ClassNew   
end      
return Class                                                                                             --// reserved