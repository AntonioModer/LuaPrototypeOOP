require 'Class'                                                                                                 --// reserved
Class('Class1')                                                                                                         --// reserved; may set Class, ParentClass
local ClassNew = Class1                                                                                                 --// reserved; may set Class

--// static private variables:
local staticPrivateVariable = ClassNew:getName()..' staticPrivateVariable'                                     --// example

--// static protected variables:
ClassNew.protected.staticProtectedVariable = ClassNew:getName()..' staticProtectedVariable'                    --// example

--// static public variables:
ClassNew.staticPublicVariable = ClassNew:getName()..' staticPublicVariable'                                                    --// example

--// global variables


--// static private methods:
local function staticPrivateMethod()                                                               --// example
  print(ClassNew:getName()..' run staticPrivateMethod')
end

--// static protected methods:


--// static public methods:
function ClassNew.new(SelfClass, _parent)                                                                       --// reserved
  local ThisObject = SelfClass:_new(_parent)                                                                  --// reserved, is table
  
  --// nonstatic private variables:


  --// nonstatic protected variables:
  
  
  --// nonstatic public variables:
  ThisObject.nonstaticPublicVariable = tostring(ThisObject)..' nonstaticPublicVariable'                                          --// example  
  
  --// nonstatic private methods:
  local function nonstaticPrivateMethod()                                                                    --// example
    print(ClassNew:getName()..' run nonstaticPrivateMethod')
  end
  --nonstaticPrivateMethod()
  
  --// nonstatic protected methods:
  
  
  --// nonstatic public methods:
  function ThisObject.nonstaticPublicMethod(SelfObject)                                                         --// example
    print(ClassNew:getName()..' run nonstaticPublicMethod')
  end
  
  --  print('created new Object: '..tostring(ThisObject.SelfClass:getObjectsCount()))
  return ThisObject                                                                                                               --// reserved
end

function ClassNew.staticPublicMethod()                                                                                           --// example
  print(ClassNew:getName()..' run staticPublicMethod')
end