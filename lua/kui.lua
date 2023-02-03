--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]

local ____modules = {}
local ____moduleCache = {}
local ____originalRequire = require
local function require(file, ...)
    if ____moduleCache[file] then
        return ____moduleCache[file].value
    end
    if ____modules[file] then
        local module = ____modules[file]
        ____moduleCache[file] = { value = (select("#", ...) > 0) and module(...) or module(file) }
        return ____moduleCache[file].value
    else
        if ____originalRequire then
            return ____originalRequire(file)
        else
            error("module '" .. file .. "' not found")
        end
    end
end
____modules = {
["lualib_bundle"] = function(...) 
local function __TS__ArrayIsArray(value)
    return type(value) == "table" and (value[1] ~= nil or next(value) == nil)
end

local function __TS__ArrayConcat(self, ...)
    local items = {...}
    local result = {}
    local len = 0
    for i = 1, #self do
        len = len + 1
        result[len] = self[i]
    end
    for i = 1, #items do
        local item = items[i]
        if __TS__ArrayIsArray(item) then
            for j = 1, #item do
                len = len + 1
                result[len] = item[j]
            end
        else
            len = len + 1
            result[len] = item
        end
    end
    return result
end

local __TS__Symbol, Symbol
do
    local symbolMetatable = {__tostring = function(self)
        return ("Symbol(" .. (self.description or "")) .. ")"
    end}
    function __TS__Symbol(description)
        return setmetatable({description = description}, symbolMetatable)
    end
    Symbol = {
        iterator = __TS__Symbol("Symbol.iterator"),
        hasInstance = __TS__Symbol("Symbol.hasInstance"),
        species = __TS__Symbol("Symbol.species"),
        toStringTag = __TS__Symbol("Symbol.toStringTag")
    }
end

local function __TS__ArrayEntries(array)
    local key = 0
    return {
        [Symbol.iterator] = function(self)
            return self
        end,
        next = function(self)
            local result = {done = array[key + 1] == nil, value = {key, array[key + 1]}}
            key = key + 1
            return result
        end
    }
end

local function __TS__ArrayEvery(self, callbackfn, thisArg)
    for i = 1, #self do
        if not callbackfn(thisArg, self[i], i - 1, self) then
            return false
        end
    end
    return true
end

local function __TS__ArrayFilter(self, callbackfn, thisArg)
    local result = {}
    local len = 0
    for i = 1, #self do
        if callbackfn(thisArg, self[i], i - 1, self) then
            len = len + 1
            result[len] = self[i]
        end
    end
    return result
end

local function __TS__ArrayForEach(self, callbackFn, thisArg)
    for i = 1, #self do
        callbackFn(thisArg, self[i], i - 1, self)
    end
end

local function __TS__ArrayFind(self, predicate, thisArg)
    for i = 1, #self do
        local elem = self[i]
        if predicate(thisArg, elem, i - 1, self) then
            return elem
        end
    end
    return nil
end

local function __TS__ArrayFindIndex(self, callbackFn, thisArg)
    for i = 1, #self do
        if callbackFn(thisArg, self[i], i - 1, self) then
            return i - 1
        end
    end
    return -1
end

local __TS__Iterator
do
    local function iteratorGeneratorStep(self)
        local co = self.____coroutine
        local status, value = coroutine.resume(co)
        if not status then
            error(value, 0)
        end
        if coroutine.status(co) == "dead" then
            return
        end
        return true, value
    end
    local function iteratorIteratorStep(self)
        local result = self:next()
        if result.done then
            return
        end
        return true, result.value
    end
    local function iteratorStringStep(self, index)
        index = index + 1
        if index > #self then
            return
        end
        return index, string.sub(self, index, index)
    end
    function __TS__Iterator(iterable)
        if type(iterable) == "string" then
            return iteratorStringStep, iterable, 0
        elseif iterable.____coroutine ~= nil then
            return iteratorGeneratorStep, iterable
        elseif iterable[Symbol.iterator] then
            local iterator = iterable[Symbol.iterator](iterable)
            return iteratorIteratorStep, iterator
        else
            return ipairs(iterable)
        end
    end
end

local __TS__ArrayFrom
do
    local function arrayLikeStep(self, index)
        index = index + 1
        if index > self.length then
            return
        end
        return index, self[index]
    end
    local function arrayLikeIterator(arr)
        if type(arr.length) == "number" then
            return arrayLikeStep, arr, 0
        end
        return __TS__Iterator(arr)
    end
    function __TS__ArrayFrom(arrayLike, mapFn, thisArg)
        local result = {}
        if mapFn == nil then
            for ____, v in arrayLikeIterator(arrayLike) do
                result[#result + 1] = v
            end
        else
            for i, v in arrayLikeIterator(arrayLike) do
                result[#result + 1] = mapFn(thisArg, v, i - 1)
            end
        end
        return result
    end
end

local function __TS__ArrayIncludes(self, searchElement, fromIndex)
    if fromIndex == nil then
        fromIndex = 0
    end
    local len = #self
    local k = fromIndex
    if fromIndex < 0 then
        k = len + fromIndex
    end
    if k < 0 then
        k = 0
    end
    for i = k + 1, len do
        if self[i] == searchElement then
            return true
        end
    end
    return false
end

local function __TS__ArrayIndexOf(self, searchElement, fromIndex)
    if fromIndex == nil then
        fromIndex = 0
    end
    local len = #self
    if len == 0 then
        return -1
    end
    if fromIndex >= len then
        return -1
    end
    if fromIndex < 0 then
        fromIndex = len + fromIndex
        if fromIndex < 0 then
            fromIndex = 0
        end
    end
    for i = fromIndex + 1, len do
        if self[i] == searchElement then
            return i - 1
        end
    end
    return -1
end

local function __TS__ArrayJoin(self, separator)
    if separator == nil then
        separator = ","
    end
    local parts = {}
    for i = 1, #self do
        parts[i] = tostring(self[i])
    end
    return table.concat(parts, separator)
end

local function __TS__ArrayMap(self, callbackfn, thisArg)
    local result = {}
    for i = 1, #self do
        result[i] = callbackfn(thisArg, self[i], i - 1, self)
    end
    return result
end

local function __TS__ArrayPush(self, ...)
    local items = {...}
    local len = #self
    for i = 1, #items do
        len = len + 1
        self[len] = items[i]
    end
    return len
end

local function __TS__ArrayPushArray(self, items)
    local len = #self
    for i = 1, #items do
        len = len + 1
        self[len] = items[i]
    end
    return len
end

local function __TS__CountVarargs(...)
    return select("#", ...)
end

local function __TS__ArrayReduce(self, callbackFn, ...)
    local len = #self
    local k = 0
    local accumulator = nil
    if __TS__CountVarargs(...) ~= 0 then
        accumulator = ...
    elseif len > 0 then
        accumulator = self[1]
        k = 1
    else
        error("Reduce of empty array with no initial value", 0)
    end
    for i = k + 1, len do
        accumulator = callbackFn(
            nil,
            accumulator,
            self[i],
            i - 1,
            self
        )
    end
    return accumulator
end

local function __TS__ArrayReduceRight(self, callbackFn, ...)
    local len = #self
    local k = len - 1
    local accumulator = nil
    if __TS__CountVarargs(...) ~= 0 then
        accumulator = ...
    elseif len > 0 then
        accumulator = self[k + 1]
        k = k - 1
    else
        error("Reduce of empty array with no initial value", 0)
    end
    for i = k + 1, 1, -1 do
        accumulator = callbackFn(
            nil,
            accumulator,
            self[i],
            i - 1,
            self
        )
    end
    return accumulator
end

local function __TS__ArrayReverse(self)
    local i = 1
    local j = #self
    while i < j do
        local temp = self[j]
        self[j] = self[i]
        self[i] = temp
        i = i + 1
        j = j - 1
    end
    return self
end

local function __TS__ArrayUnshift(self, ...)
    local items = {...}
    local numItemsToInsert = #items
    if numItemsToInsert == 0 then
        return #self
    end
    for i = #self, 1, -1 do
        self[i + numItemsToInsert] = self[i]
    end
    for i = 1, numItemsToInsert do
        self[i] = items[i]
    end
    return #self
end

local function __TS__ArraySort(self, compareFn)
    if compareFn ~= nil then
        table.sort(
            self,
            function(a, b) return compareFn(nil, a, b) < 0 end
        )
    else
        table.sort(self)
    end
    return self
end

local function __TS__ArraySlice(self, first, last)
    local len = #self
    first = first or 0
    if first < 0 then
        first = len + first
        if first < 0 then
            first = 0
        end
    else
        if first > len then
            first = len
        end
    end
    last = last or len
    if last < 0 then
        last = len + last
        if last < 0 then
            last = 0
        end
    else
        if last > len then
            last = len
        end
    end
    local out = {}
    first = first + 1
    last = last + 1
    local n = 1
    while first < last do
        out[n] = self[first]
        first = first + 1
        n = n + 1
    end
    return out
end

local function __TS__ArraySome(self, callbackfn, thisArg)
    for i = 1, #self do
        if callbackfn(thisArg, self[i], i - 1, self) then
            return true
        end
    end
    return false
end

local function __TS__ArraySplice(self, ...)
    local args = {...}
    local len = #self
    local actualArgumentCount = __TS__CountVarargs(...)
    local start = args[1]
    local deleteCount = args[2]
    if start < 0 then
        start = len + start
        if start < 0 then
            start = 0
        end
    elseif start > len then
        start = len
    end
    local itemCount = actualArgumentCount - 2
    if itemCount < 0 then
        itemCount = 0
    end
    local actualDeleteCount
    if actualArgumentCount == 0 then
        actualDeleteCount = 0
    elseif actualArgumentCount == 1 then
        actualDeleteCount = len - start
    else
        actualDeleteCount = deleteCount or 0
        if actualDeleteCount < 0 then
            actualDeleteCount = 0
        end
        if actualDeleteCount > len - start then
            actualDeleteCount = len - start
        end
    end
    local out = {}
    for k = 1, actualDeleteCount do
        local from = start + k
        if self[from] ~= nil then
            out[k] = self[from]
        end
    end
    if itemCount < actualDeleteCount then
        for k = start + 1, len - actualDeleteCount do
            local from = k + actualDeleteCount
            local to = k + itemCount
            if self[from] then
                self[to] = self[from]
            else
                self[to] = nil
            end
        end
        for k = len - actualDeleteCount + itemCount + 1, len do
            self[k] = nil
        end
    elseif itemCount > actualDeleteCount then
        for k = len - actualDeleteCount, start + 1, -1 do
            local from = k + actualDeleteCount
            local to = k + itemCount
            if self[from] then
                self[to] = self[from]
            else
                self[to] = nil
            end
        end
    end
    local j = start + 1
    for i = 3, actualArgumentCount do
        self[j] = args[i]
        j = j + 1
    end
    for k = #self, len - actualDeleteCount + itemCount + 1, -1 do
        self[k] = nil
    end
    return out
end

local function __TS__ArrayToObject(self)
    local object = {}
    for i = 1, #self do
        object[i - 1] = self[i]
    end
    return object
end

local function __TS__ArrayFlat(self, depth)
    if depth == nil then
        depth = 1
    end
    local result = {}
    local len = 0
    for i = 1, #self do
        local value = self[i]
        if depth > 0 and __TS__ArrayIsArray(value) then
            local toAdd
            if depth == 1 then
                toAdd = value
            else
                toAdd = __TS__ArrayFlat(value, depth - 1)
            end
            for j = 1, #toAdd do
                local val = toAdd[j]
                len = len + 1
                result[len] = val
            end
        else
            len = len + 1
            result[len] = value
        end
    end
    return result
end

local function __TS__ArrayFlatMap(self, callback, thisArg)
    local result = {}
    local len = 0
    for i = 1, #self do
        local value = callback(thisArg, self[i], i - 1, self)
        if __TS__ArrayIsArray(value) then
            for j = 1, #value do
                len = len + 1
                result[len] = value[j]
            end
        else
            len = len + 1
            result[len] = value
        end
    end
    return result
end

local function __TS__ArraySetLength(self, length)
    if length < 0 or length ~= length or length == math.huge or math.floor(length) ~= length then
        error(
            "invalid array length: " .. tostring(length),
            0
        )
    end
    for i = length + 1, #self do
        self[i] = nil
    end
    return length
end

local function __TS__InstanceOf(obj, classTbl)
    if type(classTbl) ~= "table" then
        error("Right-hand side of 'instanceof' is not an object", 0)
    end
    if classTbl[Symbol.hasInstance] ~= nil then
        return not not classTbl[Symbol.hasInstance](classTbl, obj)
    end
    if type(obj) == "table" then
        local luaClass = obj.constructor
        while luaClass ~= nil do
            if luaClass == classTbl then
                return true
            end
            luaClass = luaClass.____super
        end
    end
    return false
end

local function __TS__New(target, ...)
    local instance = setmetatable({}, target.prototype)
    instance:____constructor(...)
    return instance
end

local function __TS__Class(self)
    local c = {prototype = {}}
    c.prototype.__index = c.prototype
    c.prototype.constructor = c
    return c
end

local __TS__Unpack = table.unpack or unpack

local function __TS__FunctionBind(fn, ...)
    local boundArgs = {...}
    return function(____, ...)
        local args = {...}
        __TS__ArrayUnshift(
            args,
            __TS__Unpack(boundArgs)
        )
        return fn(__TS__Unpack(args))
    end
end

local __TS__Promise
do
    local function promiseDeferred(self)
        local resolve
        local reject
        local promise = __TS__New(
            __TS__Promise,
            function(____, res, rej)
                resolve = res
                reject = rej
            end
        )
        return {promise = promise, resolve = resolve, reject = reject}
    end
    local function isPromiseLike(self, thing)
        return __TS__InstanceOf(thing, __TS__Promise)
    end
    __TS__Promise = __TS__Class()
    __TS__Promise.name = "__TS__Promise"
    function __TS__Promise.prototype.____constructor(self, executor)
        self.state = 0
        self.fulfilledCallbacks = {}
        self.rejectedCallbacks = {}
        self.finallyCallbacks = {}
        do
            local function ____catch(e)
                self:reject(e)
            end
            local ____try, ____hasReturned = pcall(function()
                executor(
                    nil,
                    __TS__FunctionBind(self.resolve, self),
                    __TS__FunctionBind(self.reject, self)
                )
            end)
            if not ____try then
                ____catch(____hasReturned)
            end
        end
    end
    function __TS__Promise.resolve(data)
        local promise = __TS__New(
            __TS__Promise,
            function()
            end
        )
        promise.state = 1
        promise.value = data
        return promise
    end
    function __TS__Promise.reject(reason)
        local promise = __TS__New(
            __TS__Promise,
            function()
            end
        )
        promise.state = 2
        promise.rejectionReason = reason
        return promise
    end
    __TS__Promise.prototype["then"] = function(self, onFulfilled, onRejected)
        local ____promiseDeferred_result_0 = promiseDeferred(nil)
        local promise = ____promiseDeferred_result_0.promise
        local resolve = ____promiseDeferred_result_0.resolve
        local reject = ____promiseDeferred_result_0.reject
        local isFulfilled = self.state == 1
        local isRejected = self.state == 2
        if onFulfilled then
            local internalCallback = self:createPromiseResolvingCallback(onFulfilled, resolve, reject)
            local ____self_fulfilledCallbacks_1 = self.fulfilledCallbacks
            ____self_fulfilledCallbacks_1[#____self_fulfilledCallbacks_1 + 1] = internalCallback
            if isFulfilled then
                internalCallback(nil, self.value)
            end
        else
            local ____self_fulfilledCallbacks_2 = self.fulfilledCallbacks
            ____self_fulfilledCallbacks_2[#____self_fulfilledCallbacks_2 + 1] = function(____, v) return resolve(nil, v) end
        end
        if onRejected then
            local internalCallback = self:createPromiseResolvingCallback(onRejected, resolve, reject)
            local ____self_rejectedCallbacks_3 = self.rejectedCallbacks
            ____self_rejectedCallbacks_3[#____self_rejectedCallbacks_3 + 1] = internalCallback
            if isRejected then
                internalCallback(nil, self.rejectionReason)
            end
        else
            local ____self_rejectedCallbacks_4 = self.rejectedCallbacks
            ____self_rejectedCallbacks_4[#____self_rejectedCallbacks_4 + 1] = function(____, err) return reject(nil, err) end
        end
        if isFulfilled then
            resolve(nil, self.value)
        end
        if isRejected then
            reject(nil, self.rejectionReason)
        end
        return promise
    end
    function __TS__Promise.prototype.catch(self, onRejected)
        return self["then"](self, nil, onRejected)
    end
    function __TS__Promise.prototype.finally(self, onFinally)
        if onFinally then
            local ____self_finallyCallbacks_5 = self.finallyCallbacks
            ____self_finallyCallbacks_5[#____self_finallyCallbacks_5 + 1] = onFinally
            if self.state ~= 0 then
                onFinally(nil)
            end
        end
        return self
    end
    function __TS__Promise.prototype.resolve(self, data)
        if __TS__InstanceOf(data, __TS__Promise) then
            data["then"](
                data,
                function(____, v) return self:resolve(v) end,
                function(____, err) return self:reject(err) end
            )
            return
        end
        if self.state == 0 then
            self.state = 1
            self.value = data
            for ____, callback in ipairs(self.fulfilledCallbacks) do
                callback(nil, data)
            end
            for ____, callback in ipairs(self.finallyCallbacks) do
                callback(nil)
            end
        end
    end
    function __TS__Promise.prototype.reject(self, reason)
        if self.state == 0 then
            self.state = 2
            self.rejectionReason = reason
            for ____, callback in ipairs(self.rejectedCallbacks) do
                callback(nil, reason)
            end
            for ____, callback in ipairs(self.finallyCallbacks) do
                callback(nil)
            end
        end
    end
    function __TS__Promise.prototype.createPromiseResolvingCallback(self, f, resolve, reject)
        return function(____, value)
            do
                local function ____catch(e)
                    reject(nil, e)
                end
                local ____try, ____hasReturned = pcall(function()
                    self:handleCallbackData(
                        f(nil, value),
                        resolve,
                        reject
                    )
                end)
                if not ____try then
                    ____catch(____hasReturned)
                end
            end
        end
    end
    function __TS__Promise.prototype.handleCallbackData(self, data, resolve, reject)
        if isPromiseLike(nil, data) then
            local nextpromise = data
            if nextpromise.state == 1 then
                resolve(nil, nextpromise.value)
            elseif nextpromise.state == 2 then
                reject(nil, nextpromise.rejectionReason)
            else
                data["then"](data, resolve, reject)
            end
        else
            resolve(nil, data)
        end
    end
end

local function __TS__AsyncAwaiter(generator)
    return __TS__New(
        __TS__Promise,
        function(____, resolve, reject)
            local adopt, fulfilled, step, resolved, asyncCoroutine
            function adopt(self, value)
                local ____temp_0
                if __TS__InstanceOf(value, __TS__Promise) then
                    ____temp_0 = value
                else
                    ____temp_0 = __TS__Promise.resolve(value)
                end
                return ____temp_0
            end
            function fulfilled(self, value)
                local success, resultOrError = coroutine.resume(asyncCoroutine, value)
                if success then
                    step(nil, resultOrError)
                else
                    reject(nil, resultOrError)
                end
            end
            function step(self, result)
                if resolved then
                    return
                end
                if coroutine.status(asyncCoroutine) == "dead" then
                    resolve(nil, result)
                else
                    local ____self_1 = adopt(nil, result)
                    ____self_1["then"](____self_1, fulfilled, reject)
                end
            end
            resolved = false
            asyncCoroutine = coroutine.create(generator)
            local success, resultOrError = coroutine.resume(
                asyncCoroutine,
                function(____, v)
                    resolved = true
                    local ____self_2 = adopt(nil, v)
                    ____self_2["then"](____self_2, resolve, reject)
                end
            )
            if success then
                step(nil, resultOrError)
            else
                reject(nil, resultOrError)
            end
        end
    )
end
local function __TS__Await(thing)
    return coroutine.yield(thing)
end

local function __TS__ClassExtends(target, base)
    target.____super = base
    local staticMetatable = setmetatable({__index = base}, base)
    setmetatable(target, staticMetatable)
    local baseMetatable = getmetatable(base)
    if baseMetatable then
        if type(baseMetatable.__index) == "function" then
            staticMetatable.__index = baseMetatable.__index
        end
        if type(baseMetatable.__newindex) == "function" then
            staticMetatable.__newindex = baseMetatable.__newindex
        end
    end
    setmetatable(target.prototype, base.prototype)
    if type(base.prototype.__index) == "function" then
        target.prototype.__index = base.prototype.__index
    end
    if type(base.prototype.__newindex) == "function" then
        target.prototype.__newindex = base.prototype.__newindex
    end
    if type(base.prototype.__tostring) == "function" then
        target.prototype.__tostring = base.prototype.__tostring
    end
end

local function __TS__CloneDescriptor(____bindingPattern0)
    local value
    local writable
    local set
    local get
    local configurable
    local enumerable
    enumerable = ____bindingPattern0.enumerable
    configurable = ____bindingPattern0.configurable
    get = ____bindingPattern0.get
    set = ____bindingPattern0.set
    writable = ____bindingPattern0.writable
    value = ____bindingPattern0.value
    local descriptor = {enumerable = enumerable == true, configurable = configurable == true}
    local hasGetterOrSetter = get ~= nil or set ~= nil
    local hasValueOrWritableAttribute = writable ~= nil or value ~= nil
    if hasGetterOrSetter and hasValueOrWritableAttribute then
        error("Invalid property descriptor. Cannot both specify accessors and a value or writable attribute.", 0)
    end
    if get or set then
        descriptor.get = get
        descriptor.set = set
    else
        descriptor.value = value
        descriptor.writable = writable == true
    end
    return descriptor
end

local function __TS__ObjectAssign(target, ...)
    local sources = {...}
    for i = 1, #sources do
        local source = sources[i]
        for key in pairs(source) do
            target[key] = source[key]
        end
    end
    return target
end

local function __TS__ObjectGetOwnPropertyDescriptor(object, key)
    local metatable = getmetatable(object)
    if not metatable then
        return
    end
    if not rawget(metatable, "_descriptors") then
        return
    end
    return rawget(metatable, "_descriptors")[key]
end

local __TS__SetDescriptor
do
    local function descriptorIndex(self, key)
        local value = rawget(self, key)
        if value ~= nil then
            return value
        end
        local metatable = getmetatable(self)
        while metatable do
            local rawResult = rawget(metatable, key)
            if rawResult ~= nil then
                return rawResult
            end
            local descriptors = rawget(metatable, "_descriptors")
            if descriptors then
                local descriptor = descriptors[key]
                if descriptor then
                    if descriptor.get then
                        return descriptor.get(self)
                    end
                    return descriptor.value
                end
            end
            metatable = getmetatable(metatable)
        end
    end
    local function descriptorNewIndex(self, key, value)
        local metatable = getmetatable(self)
        while metatable do
            local descriptors = rawget(metatable, "_descriptors")
            if descriptors then
                local descriptor = descriptors[key]
                if descriptor then
                    if descriptor.set then
                        descriptor.set(self, value)
                    else
                        if descriptor.writable == false then
                            error(
                                ((("Cannot assign to read only property '" .. key) .. "' of object '") .. tostring(self)) .. "'",
                                0
                            )
                        end
                        descriptor.value = value
                    end
                    return
                end
            end
            metatable = getmetatable(metatable)
        end
        rawset(self, key, value)
    end
    function __TS__SetDescriptor(target, key, desc, isPrototype)
        if isPrototype == nil then
            isPrototype = false
        end
        local ____isPrototype_0
        if isPrototype then
            ____isPrototype_0 = target
        else
            ____isPrototype_0 = getmetatable(target)
        end
        local metatable = ____isPrototype_0
        if not metatable then
            metatable = {}
            setmetatable(target, metatable)
        end
        local value = rawget(target, key)
        if value ~= nil then
            rawset(target, key, nil)
        end
        if not rawget(metatable, "_descriptors") then
            metatable._descriptors = {}
        end
        metatable._descriptors[key] = __TS__CloneDescriptor(desc)
        metatable.__index = descriptorIndex
        metatable.__newindex = descriptorNewIndex
    end
end

local function __TS__Decorate(decorators, target, key, desc)
    local result = target
    do
        local i = #decorators
        while i >= 0 do
            local decorator = decorators[i + 1]
            if decorator then
                local oldResult = result
                if key == nil then
                    result = decorator(nil, result)
                elseif desc == true then
                    local value = rawget(target, key)
                    local descriptor = __TS__ObjectGetOwnPropertyDescriptor(target, key) or ({configurable = true, writable = true, value = value})
                    local desc = decorator(nil, target, key, descriptor) or descriptor
                    local isSimpleValue = desc.configurable == true and desc.writable == true and not desc.get and not desc.set
                    if isSimpleValue then
                        rawset(target, key, desc.value)
                    else
                        __TS__SetDescriptor(
                            target,
                            key,
                            __TS__ObjectAssign({}, descriptor, desc)
                        )
                    end
                elseif desc == false then
                    result = decorator(nil, target, key, desc)
                else
                    result = decorator(nil, target, key)
                end
                result = result or oldResult
            end
            i = i - 1
        end
    end
    return result
end

local function __TS__DecorateParam(paramIndex, decorator)
    return function(____, target, key) return decorator(nil, target, key, paramIndex) end
end

local function __TS__StringIncludes(self, searchString, position)
    if not position then
        position = 1
    else
        position = position + 1
    end
    local index = string.find(self, searchString, position, true)
    return index ~= nil
end

local Error, RangeError, ReferenceError, SyntaxError, TypeError, URIError
do
    local function getErrorStack(self, constructor)
        local level = 1
        while true do
            local info = debug.getinfo(level, "f")
            level = level + 1
            if not info then
                level = 1
                break
            elseif info.func == constructor then
                break
            end
        end
        if __TS__StringIncludes(_VERSION, "Lua 5.0") then
            return debug.traceback(("[Level " .. tostring(level)) .. "]")
        else
            return debug.traceback(nil, level)
        end
    end
    local function wrapErrorToString(self, getDescription)
        return function(self)
            local description = getDescription(self)
            local caller = debug.getinfo(3, "f")
            local isClassicLua = __TS__StringIncludes(_VERSION, "Lua 5.0") or _VERSION == "Lua 5.1"
            if isClassicLua or caller and caller.func ~= error then
                return description
            else
                return (tostring(description) .. "\n") .. self.stack
            end
        end
    end
    local function initErrorClass(self, Type, name)
        Type.name = name
        return setmetatable(
            Type,
            {__call = function(____, _self, message) return __TS__New(Type, message) end}
        )
    end
    local ____initErrorClass_2 = initErrorClass
    local ____class_0 = __TS__Class()
    ____class_0.name = ""
    function ____class_0.prototype.____constructor(self, message)
        if message == nil then
            message = ""
        end
        self.message = message
        self.name = "Error"
        self.stack = getErrorStack(nil, self.constructor.new)
        local metatable = getmetatable(self)
        if not metatable.__errorToStringPatched then
            metatable.__errorToStringPatched = true
            metatable.__tostring = wrapErrorToString(nil, metatable.__tostring)
        end
    end
    function ____class_0.prototype.__tostring(self)
        local ____temp_1
        if self.message ~= "" then
            ____temp_1 = (self.name .. ": ") .. self.message
        else
            ____temp_1 = self.name
        end
        return ____temp_1
    end
    Error = ____initErrorClass_2(nil, ____class_0, "Error")
    local function createErrorClass(self, name)
        local ____initErrorClass_4 = initErrorClass
        local ____class_3 = __TS__Class()
        ____class_3.name = ____class_3.name
        __TS__ClassExtends(____class_3, Error)
        function ____class_3.prototype.____constructor(self, ...)
            ____class_3.____super.prototype.____constructor(self, ...)
            self.name = name
        end
        return ____initErrorClass_4(nil, ____class_3, name)
    end
    RangeError = createErrorClass(nil, "RangeError")
    ReferenceError = createErrorClass(nil, "ReferenceError")
    SyntaxError = createErrorClass(nil, "SyntaxError")
    TypeError = createErrorClass(nil, "TypeError")
    URIError = createErrorClass(nil, "URIError")
end

local function __TS__ObjectGetOwnPropertyDescriptors(object)
    local metatable = getmetatable(object)
    if not metatable then
        return {}
    end
    return rawget(metatable, "_descriptors") or ({})
end

local function __TS__Delete(target, key)
    local descriptors = __TS__ObjectGetOwnPropertyDescriptors(target)
    local descriptor = descriptors[key]
    if descriptor then
        if not descriptor.configurable then
            error(
                __TS__New(
                    TypeError,
                    ((("Cannot delete property " .. tostring(key)) .. " of ") .. tostring(target)) .. "."
                ),
                0
            )
        end
        descriptors[key] = nil
        return true
    end
    target[key] = nil
    return true
end

local function __TS__StringAccess(self, index)
    if index >= 0 and index < #self then
        return string.sub(self, index + 1, index + 1)
    end
end

local function __TS__DelegatedYield(iterable)
    if type(iterable) == "string" then
        for index = 0, #iterable - 1 do
            coroutine.yield(__TS__StringAccess(iterable, index))
        end
    elseif iterable.____coroutine ~= nil then
        local co = iterable.____coroutine
        while true do
            local status, value = coroutine.resume(co)
            if not status then
                error(value, 0)
            end
            if coroutine.status(co) == "dead" then
                return value
            else
                coroutine.yield(value)
            end
        end
    elseif iterable[Symbol.iterator] then
        local iterator = iterable[Symbol.iterator](iterable)
        while true do
            local result = iterator:next()
            if result.done then
                return result.value
            else
                coroutine.yield(result.value)
            end
        end
    else
        for ____, value in ipairs(iterable) do
            coroutine.yield(value)
        end
    end
end

local __TS__Generator
do
    local function generatorIterator(self)
        return self
    end
    local function generatorNext(self, ...)
        local co = self.____coroutine
        if coroutine.status(co) == "dead" then
            return {done = true}
        end
        local status, value = coroutine.resume(co, ...)
        if not status then
            error(value, 0)
        end
        return {
            value = value,
            done = coroutine.status(co) == "dead"
        }
    end
    function __TS__Generator(fn)
        return function(...)
            local args = {...}
            local argsLength = __TS__CountVarargs(...)
            return {
                ____coroutine = coroutine.create(function() return fn(__TS__Unpack(args, 1, argsLength)) end),
                [Symbol.iterator] = generatorIterator,
                next = generatorNext
            }
        end
    end
end

local function __TS__InstanceOfObject(value)
    local valueType = type(value)
    return valueType == "table" or valueType == "function"
end

local function __TS__LuaIteratorSpread(self, state, firstKey)
    local results = {}
    local key, value = self(state, firstKey)
    while key do
        results[#results + 1] = {key, value}
        key, value = self(state, key)
    end
    return __TS__Unpack(results)
end

local Map
do
    Map = __TS__Class()
    Map.name = "Map"
    function Map.prototype.____constructor(self, entries)
        self[Symbol.toStringTag] = "Map"
        self.items = {}
        self.size = 0
        self.nextKey = {}
        self.previousKey = {}
        if entries == nil then
            return
        end
        local iterable = entries
        if iterable[Symbol.iterator] then
            local iterator = iterable[Symbol.iterator](iterable)
            while true do
                local result = iterator:next()
                if result.done then
                    break
                end
                local value = result.value
                self:set(value[1], value[2])
            end
        else
            local array = entries
            for ____, kvp in ipairs(array) do
                self:set(kvp[1], kvp[2])
            end
        end
    end
    function Map.prototype.clear(self)
        self.items = {}
        self.nextKey = {}
        self.previousKey = {}
        self.firstKey = nil
        self.lastKey = nil
        self.size = 0
    end
    function Map.prototype.delete(self, key)
        local contains = self:has(key)
        if contains then
            self.size = self.size - 1
            local next = self.nextKey[key]
            local previous = self.previousKey[key]
            if next and previous then
                self.nextKey[previous] = next
                self.previousKey[next] = previous
            elseif next then
                self.firstKey = next
                self.previousKey[next] = nil
            elseif previous then
                self.lastKey = previous
                self.nextKey[previous] = nil
            else
                self.firstKey = nil
                self.lastKey = nil
            end
            self.nextKey[key] = nil
            self.previousKey[key] = nil
        end
        self.items[key] = nil
        return contains
    end
    function Map.prototype.forEach(self, callback)
        for ____, key in __TS__Iterator(self:keys()) do
            callback(nil, self.items[key], key, self)
        end
    end
    function Map.prototype.get(self, key)
        return self.items[key]
    end
    function Map.prototype.has(self, key)
        return self.nextKey[key] ~= nil or self.lastKey == key
    end
    function Map.prototype.set(self, key, value)
        local isNewValue = not self:has(key)
        if isNewValue then
            self.size = self.size + 1
        end
        self.items[key] = value
        if self.firstKey == nil then
            self.firstKey = key
            self.lastKey = key
        elseif isNewValue then
            self.nextKey[self.lastKey] = key
            self.previousKey[key] = self.lastKey
            self.lastKey = key
        end
        return self
    end
    Map.prototype[Symbol.iterator] = function(self)
        return self:entries()
    end
    function Map.prototype.entries(self)
        local items = self.items
        local nextKey = self.nextKey
        local key = self.firstKey
        return {
            [Symbol.iterator] = function(self)
                return self
            end,
            next = function(self)
                local result = {done = not key, value = {key, items[key]}}
                key = nextKey[key]
                return result
            end
        }
    end
    function Map.prototype.keys(self)
        local nextKey = self.nextKey
        local key = self.firstKey
        return {
            [Symbol.iterator] = function(self)
                return self
            end,
            next = function(self)
                local result = {done = not key, value = key}
                key = nextKey[key]
                return result
            end
        }
    end
    function Map.prototype.values(self)
        local items = self.items
        local nextKey = self.nextKey
        local key = self.firstKey
        return {
            [Symbol.iterator] = function(self)
                return self
            end,
            next = function(self)
                local result = {done = not key, value = items[key]}
                key = nextKey[key]
                return result
            end
        }
    end
    Map[Symbol.species] = Map
end

local __TS__Match = string.match

local __TS__MathAtan2 = math.atan2 or math.atan

local __TS__MathModf = math.modf

local function __TS__MathSign(val)
    if val > 0 then
        return 1
    elseif val < 0 then
        return -1
    end
    return 0
end

local function __TS__Number(value)
    local valueType = type(value)
    if valueType == "number" then
        return value
    elseif valueType == "string" then
        local numberValue = tonumber(value)
        if numberValue then
            return numberValue
        end
        if value == "Infinity" then
            return math.huge
        end
        if value == "-Infinity" then
            return -math.huge
        end
        local stringWithoutSpaces = string.gsub(value, "%s", "")
        if stringWithoutSpaces == "" then
            return 0
        end
        return 0 / 0
    elseif valueType == "boolean" then
        return value and 1 or 0
    else
        return 0 / 0
    end
end

local function __TS__NumberIsFinite(value)
    return type(value) == "number" and value == value and value ~= math.huge and value ~= -math.huge
end

local function __TS__NumberIsNaN(value)
    return value ~= value
end

local __TS__NumberToString
do
    local radixChars = "0123456789abcdefghijklmnopqrstuvwxyz"
    function __TS__NumberToString(self, radix)
        if radix == nil or radix == 10 or self == math.huge or self == -math.huge or self ~= self then
            return tostring(self)
        end
        radix = math.floor(radix)
        if radix < 2 or radix > 36 then
            error("toString() radix argument must be between 2 and 36", 0)
        end
        local integer, fraction = __TS__MathModf(math.abs(self))
        local result = ""
        if radix == 8 then
            result = string.format("%o", integer)
        elseif radix == 16 then
            result = string.format("%x", integer)
        else
            repeat
                do
                    result = __TS__StringAccess(radixChars, integer % radix) .. result
                    integer = math.floor(integer / radix)
                end
            until not (integer ~= 0)
        end
        if fraction ~= 0 then
            result = result .. "."
            local delta = 1e-16
            repeat
                do
                    fraction = fraction * radix
                    delta = delta * radix
                    local digit = math.floor(fraction)
                    result = result .. __TS__StringAccess(radixChars, digit)
                    fraction = fraction - digit
                end
            until not (fraction >= delta)
        end
        if self < 0 then
            result = "-" .. result
        end
        return result
    end
end

local function __TS__ObjectDefineProperty(target, key, desc)
    local ____temp_0
    if type(key) == "number" then
        ____temp_0 = key + 1
    else
        ____temp_0 = key
    end
    local luaKey = ____temp_0
    local value = rawget(target, luaKey)
    local hasGetterOrSetter = desc.get ~= nil or desc.set ~= nil
    local descriptor
    if hasGetterOrSetter then
        if value ~= nil then
            error(
                "Cannot redefine property: " .. tostring(key),
                0
            )
        end
        descriptor = desc
    else
        local valueExists = value ~= nil
        local ____desc_set_5 = desc.set
        local ____desc_get_6 = desc.get
        local ____temp_1
        if desc.configurable ~= nil then
            ____temp_1 = desc.configurable
        else
            ____temp_1 = valueExists
        end
        local ____temp_2
        if desc.enumerable ~= nil then
            ____temp_2 = desc.enumerable
        else
            ____temp_2 = valueExists
        end
        local ____temp_3
        if desc.writable ~= nil then
            ____temp_3 = desc.writable
        else
            ____temp_3 = valueExists
        end
        local ____temp_4
        if desc.value ~= nil then
            ____temp_4 = desc.value
        else
            ____temp_4 = value
        end
        descriptor = {
            set = ____desc_set_5,
            get = ____desc_get_6,
            configurable = ____temp_1,
            enumerable = ____temp_2,
            writable = ____temp_3,
            value = ____temp_4
        }
    end
    __TS__SetDescriptor(target, luaKey, descriptor)
    return target
end

local function __TS__ObjectEntries(obj)
    local result = {}
    local len = 0
    for key in pairs(obj) do
        len = len + 1
        result[len] = {key, obj[key]}
    end
    return result
end

local function __TS__ObjectFromEntries(entries)
    local obj = {}
    local iterable = entries
    if iterable[Symbol.iterator] then
        local iterator = iterable[Symbol.iterator](iterable)
        while true do
            local result = iterator:next()
            if result.done then
                break
            end
            local value = result.value
            obj[value[1]] = value[2]
        end
    else
        for ____, entry in ipairs(entries) do
            obj[entry[1]] = entry[2]
        end
    end
    return obj
end

local function __TS__ObjectKeys(obj)
    local result = {}
    local len = 0
    for key in pairs(obj) do
        len = len + 1
        result[len] = key
    end
    return result
end

local function __TS__ObjectRest(target, usedProperties)
    local result = {}
    for property in pairs(target) do
        if not usedProperties[property] then
            result[property] = target[property]
        end
    end
    return result
end

local function __TS__ObjectValues(obj)
    local result = {}
    local len = 0
    for key in pairs(obj) do
        len = len + 1
        result[len] = obj[key]
    end
    return result
end

local function __TS__ParseFloat(numberString)
    local infinityMatch = __TS__Match(numberString, "^%s*(-?Infinity)")
    if infinityMatch then
        local ____temp_0
        if __TS__StringAccess(infinityMatch, 0) == "-" then
            ____temp_0 = -math.huge
        else
            ____temp_0 = math.huge
        end
        return ____temp_0
    end
    local number = tonumber(__TS__Match(numberString, "^%s*(-?%d+%.?%d*)"))
    return number or 0 / 0
end

local function __TS__StringSubstring(self, start, ____end)
    if ____end ~= ____end then
        ____end = 0
    end
    if ____end ~= nil and start > ____end then
        start, ____end = ____end, start
    end
    if start >= 0 then
        start = start + 1
    else
        start = 1
    end
    if ____end ~= nil and ____end < 0 then
        ____end = 0
    end
    return string.sub(self, start, ____end)
end

local __TS__ParseInt
do
    local parseIntBasePattern = "0123456789aAbBcCdDeEfFgGhHiIjJkKlLmMnNoOpPqQrRsStTvVwWxXyYzZ"
    function __TS__ParseInt(numberString, base)
        if base == nil then
            base = 10
            local hexMatch = __TS__Match(numberString, "^%s*-?0[xX]")
            if hexMatch then
                base = 16
                local ____TS__Match_result__0_0
                if __TS__Match(hexMatch, "-") then
                    ____TS__Match_result__0_0 = "-" .. __TS__StringSubstring(numberString, #hexMatch)
                else
                    ____TS__Match_result__0_0 = __TS__StringSubstring(numberString, #hexMatch)
                end
                numberString = ____TS__Match_result__0_0
            end
        end
        if base < 2 or base > 36 then
            return 0 / 0
        end
        local ____temp_1
        if base <= 10 then
            ____temp_1 = __TS__StringSubstring(parseIntBasePattern, 0, base)
        else
            ____temp_1 = __TS__StringSubstring(parseIntBasePattern, 0, 10 + 2 * (base - 10))
        end
        local allowedDigits = ____temp_1
        local pattern = ("^%s*(-?[" .. allowedDigits) .. "]*)"
        local number = tonumber(
            __TS__Match(numberString, pattern),
            base
        )
        if number == nil then
            return 0 / 0
        end
        if number >= 0 then
            return math.floor(number)
        else
            return math.ceil(number)
        end
    end
end

local function __TS__PromiseAll(iterable)
    local results = {}
    local toResolve = {}
    local numToResolve = 0
    local i = 0
    for ____, item in __TS__Iterator(iterable) do
        if __TS__InstanceOf(item, __TS__Promise) then
            if item.state == 1 then
                results[i + 1] = item.value
            elseif item.state == 2 then
                return __TS__Promise.reject(item.rejectionReason)
            else
                numToResolve = numToResolve + 1
                toResolve[i] = item
            end
        else
            results[i + 1] = item
        end
        i = i + 1
    end
    if numToResolve == 0 then
        return __TS__Promise.resolve(results)
    end
    return __TS__New(
        __TS__Promise,
        function(____, resolve, reject)
            for index, promise in pairs(toResolve) do
                promise["then"](
                    promise,
                    function(____, data)
                        results[index + 1] = data
                        numToResolve = numToResolve - 1
                        if numToResolve == 0 then
                            resolve(nil, results)
                        end
                    end,
                    function(____, reason)
                        reject(nil, reason)
                    end
                )
            end
        end
    )
end

local function __TS__PromiseAllSettled(iterable)
    local results = {}
    local toResolve = {}
    local numToResolve = 0
    local i = 0
    for ____, item in __TS__Iterator(iterable) do
        if __TS__InstanceOf(item, __TS__Promise) then
            if item.state == 1 then
                results[i + 1] = {status = "fulfilled", value = item.value}
            elseif item.state == 2 then
                results[i + 1] = {status = "rejected", reason = item.rejectionReason}
            else
                numToResolve = numToResolve + 1
                toResolve[i] = item
            end
        else
            results[i + 1] = {status = "fulfilled", value = item}
        end
        i = i + 1
    end
    if numToResolve == 0 then
        return __TS__Promise.resolve(results)
    end
    return __TS__New(
        __TS__Promise,
        function(____, resolve)
            for index, promise in pairs(toResolve) do
                promise["then"](
                    promise,
                    function(____, data)
                        results[index + 1] = {status = "fulfilled", value = data}
                        numToResolve = numToResolve - 1
                        if numToResolve == 0 then
                            resolve(nil, results)
                        end
                    end,
                    function(____, reason)
                        results[index + 1] = {status = "rejected", reason = reason}
                        numToResolve = numToResolve - 1
                        if numToResolve == 0 then
                            resolve(nil, results)
                        end
                    end
                )
            end
        end
    )
end

local function __TS__PromiseAny(iterable)
    local rejections = {}
    local pending = {}
    for ____, item in __TS__Iterator(iterable) do
        if __TS__InstanceOf(item, __TS__Promise) then
            if item.state == 1 then
                return __TS__Promise.resolve(item.value)
            elseif item.state == 2 then
                rejections[#rejections + 1] = item.rejectionReason
            else
                pending[#pending + 1] = item
            end
        else
            return __TS__Promise.resolve(item)
        end
    end
    if #pending == 0 then
        return __TS__Promise.reject("No promises to resolve with .any()")
    end
    local numResolved = 0
    return __TS__New(
        __TS__Promise,
        function(____, resolve, reject)
            for ____, promise in ipairs(pending) do
                promise["then"](
                    promise,
                    function(____, data)
                        resolve(nil, data)
                    end,
                    function(____, reason)
                        rejections[#rejections + 1] = reason
                        numResolved = numResolved + 1
                        if numResolved == #pending then
                            reject(nil, {name = "AggregateError", message = "All Promises rejected", errors = rejections})
                        end
                    end
                )
            end
        end
    )
end

local function __TS__PromiseRace(iterable)
    local pending = {}
    for ____, item in __TS__Iterator(iterable) do
        if __TS__InstanceOf(item, __TS__Promise) then
            if item.state == 1 then
                return __TS__Promise.resolve(item.value)
            elseif item.state == 2 then
                return __TS__Promise.reject(item.rejectionReason)
            else
                pending[#pending + 1] = item
            end
        else
            return __TS__Promise.resolve(item)
        end
    end
    return __TS__New(
        __TS__Promise,
        function(____, resolve, reject)
            for ____, promise in ipairs(pending) do
                promise["then"](
                    promise,
                    function(____, value) return resolve(nil, value) end,
                    function(____, reason) return reject(nil, reason) end
                )
            end
        end
    )
end

local Set
do
    Set = __TS__Class()
    Set.name = "Set"
    function Set.prototype.____constructor(self, values)
        self[Symbol.toStringTag] = "Set"
        self.size = 0
        self.nextKey = {}
        self.previousKey = {}
        if values == nil then
            return
        end
        local iterable = values
        if iterable[Symbol.iterator] then
            local iterator = iterable[Symbol.iterator](iterable)
            while true do
                local result = iterator:next()
                if result.done then
                    break
                end
                self:add(result.value)
            end
        else
            local array = values
            for ____, value in ipairs(array) do
                self:add(value)
            end
        end
    end
    function Set.prototype.add(self, value)
        local isNewValue = not self:has(value)
        if isNewValue then
            self.size = self.size + 1
        end
        if self.firstKey == nil then
            self.firstKey = value
            self.lastKey = value
        elseif isNewValue then
            self.nextKey[self.lastKey] = value
            self.previousKey[value] = self.lastKey
            self.lastKey = value
        end
        return self
    end
    function Set.prototype.clear(self)
        self.nextKey = {}
        self.previousKey = {}
        self.firstKey = nil
        self.lastKey = nil
        self.size = 0
    end
    function Set.prototype.delete(self, value)
        local contains = self:has(value)
        if contains then
            self.size = self.size - 1
            local next = self.nextKey[value]
            local previous = self.previousKey[value]
            if next and previous then
                self.nextKey[previous] = next
                self.previousKey[next] = previous
            elseif next then
                self.firstKey = next
                self.previousKey[next] = nil
            elseif previous then
                self.lastKey = previous
                self.nextKey[previous] = nil
            else
                self.firstKey = nil
                self.lastKey = nil
            end
            self.nextKey[value] = nil
            self.previousKey[value] = nil
        end
        return contains
    end
    function Set.prototype.forEach(self, callback)
        for ____, key in __TS__Iterator(self:keys()) do
            callback(nil, key, key, self)
        end
    end
    function Set.prototype.has(self, value)
        return self.nextKey[value] ~= nil or self.lastKey == value
    end
    Set.prototype[Symbol.iterator] = function(self)
        return self:values()
    end
    function Set.prototype.entries(self)
        local nextKey = self.nextKey
        local key = self.firstKey
        return {
            [Symbol.iterator] = function(self)
                return self
            end,
            next = function(self)
                local result = {done = not key, value = {key, key}}
                key = nextKey[key]
                return result
            end
        }
    end
    function Set.prototype.keys(self)
        local nextKey = self.nextKey
        local key = self.firstKey
        return {
            [Symbol.iterator] = function(self)
                return self
            end,
            next = function(self)
                local result = {done = not key, value = key}
                key = nextKey[key]
                return result
            end
        }
    end
    function Set.prototype.values(self)
        local nextKey = self.nextKey
        local key = self.firstKey
        return {
            [Symbol.iterator] = function(self)
                return self
            end,
            next = function(self)
                local result = {done = not key, value = key}
                key = nextKey[key]
                return result
            end
        }
    end
    Set[Symbol.species] = Set
end

local function __TS__SparseArrayNew(...)
    local sparseArray = {...}
    sparseArray.sparseLength = __TS__CountVarargs(...)
    return sparseArray
end

local function __TS__SparseArrayPush(sparseArray, ...)
    local args = {...}
    local argsLen = __TS__CountVarargs(...)
    local listLen = sparseArray.sparseLength
    for i = 1, argsLen do
        sparseArray[listLen + i] = args[i]
    end
    sparseArray.sparseLength = listLen + argsLen
end

local function __TS__SparseArraySpread(sparseArray)
    local _unpack = unpack or table.unpack
    return _unpack(sparseArray, 1, sparseArray.sparseLength)
end

local WeakMap
do
    WeakMap = __TS__Class()
    WeakMap.name = "WeakMap"
    function WeakMap.prototype.____constructor(self, entries)
        self[Symbol.toStringTag] = "WeakMap"
        self.items = {}
        setmetatable(self.items, {__mode = "k"})
        if entries == nil then
            return
        end
        local iterable = entries
        if iterable[Symbol.iterator] then
            local iterator = iterable[Symbol.iterator](iterable)
            while true do
                local result = iterator:next()
                if result.done then
                    break
                end
                local value = result.value
                self.items[value[1]] = value[2]
            end
        else
            for ____, kvp in ipairs(entries) do
                self.items[kvp[1]] = kvp[2]
            end
        end
    end
    function WeakMap.prototype.delete(self, key)
        local contains = self:has(key)
        self.items[key] = nil
        return contains
    end
    function WeakMap.prototype.get(self, key)
        return self.items[key]
    end
    function WeakMap.prototype.has(self, key)
        return self.items[key] ~= nil
    end
    function WeakMap.prototype.set(self, key, value)
        self.items[key] = value
        return self
    end
    WeakMap[Symbol.species] = WeakMap
end

local WeakSet
do
    WeakSet = __TS__Class()
    WeakSet.name = "WeakSet"
    function WeakSet.prototype.____constructor(self, values)
        self[Symbol.toStringTag] = "WeakSet"
        self.items = {}
        setmetatable(self.items, {__mode = "k"})
        if values == nil then
            return
        end
        local iterable = values
        if iterable[Symbol.iterator] then
            local iterator = iterable[Symbol.iterator](iterable)
            while true do
                local result = iterator:next()
                if result.done then
                    break
                end
                self.items[result.value] = true
            end
        else
            for ____, value in ipairs(values) do
                self.items[value] = true
            end
        end
    end
    function WeakSet.prototype.add(self, value)
        self.items[value] = true
        return self
    end
    function WeakSet.prototype.delete(self, value)
        local contains = self:has(value)
        self.items[value] = nil
        return contains
    end
    function WeakSet.prototype.has(self, value)
        return self.items[value] == true
    end
    WeakSet[Symbol.species] = WeakSet
end

local function __TS__SourceMapTraceBack(fileName, sourceMap)
    _G.__TS__sourcemap = _G.__TS__sourcemap or ({})
    _G.__TS__sourcemap[fileName] = sourceMap
    if _G.__TS__originalTraceback == nil then
        local originalTraceback = debug.traceback
        _G.__TS__originalTraceback = originalTraceback
        debug.traceback = function(thread, message, level)
            local trace
            if thread == nil and message == nil and level == nil then
                trace = originalTraceback()
            elseif __TS__StringIncludes(_VERSION, "Lua 5.0") then
                trace = originalTraceback((("[Level " .. tostring(level)) .. "] ") .. message)
            else
                trace = originalTraceback(thread, message, level)
            end
            if type(trace) ~= "string" then
                return trace
            end
            local function replacer(____, file, srcFile, line)
                local fileSourceMap = _G.__TS__sourcemap[file]
                if fileSourceMap and fileSourceMap[line] then
                    local data = fileSourceMap[line]
                    if type(data) == "number" then
                        return (srcFile .. ":") .. tostring(data)
                    end
                    return (tostring(data.file) .. ":") .. tostring(data.line)
                end
                return (file .. ":") .. line
            end
            local result = string.gsub(
                trace,
                "(%S+)%.lua:(%d+)",
                function(file, line) return replacer(nil, file .. ".lua", file .. ".ts", line) end
            )
            local function stringReplacer(____, file, line)
                local fileSourceMap = _G.__TS__sourcemap[file]
                if fileSourceMap and fileSourceMap[line] then
                    local chunkName = __TS__Match(file, "%[string \"([^\"]+)\"%]")
                    local sourceName = string.gsub(chunkName, ".lua$", ".ts")
                    local data = fileSourceMap[line]
                    if type(data) == "number" then
                        return (sourceName .. ":") .. tostring(data)
                    end
                    return (tostring(data.file) .. ":") .. tostring(data.line)
                end
                return (file .. ":") .. line
            end
            result = string.gsub(
                result,
                "(%[string \"[^\"]+\"%]):(%d+)",
                function(file, line) return stringReplacer(nil, file, line) end
            )
            return result
        end
    end
end

local function __TS__Spread(iterable)
    local arr = {}
    if type(iterable) == "string" then
        for i = 0, #iterable - 1 do
            arr[i + 1] = __TS__StringAccess(iterable, i)
        end
    else
        local len = 0
        for ____, item in __TS__Iterator(iterable) do
            len = len + 1
            arr[len] = item
        end
    end
    return __TS__Unpack(arr)
end

local function __TS__StringCharAt(self, pos)
    if pos ~= pos then
        pos = 0
    end
    if pos < 0 then
        return ""
    end
    return string.sub(self, pos + 1, pos + 1)
end

local function __TS__StringCharCodeAt(self, index)
    if index ~= index then
        index = 0
    end
    if index < 0 then
        return 0 / 0
    end
    return string.byte(self, index + 1) or 0 / 0
end

local function __TS__StringEndsWith(self, searchString, endPosition)
    if endPosition == nil or endPosition > #self then
        endPosition = #self
    end
    return string.sub(self, endPosition - #searchString + 1, endPosition) == searchString
end

local function __TS__StringPadEnd(self, maxLength, fillString)
    if fillString == nil then
        fillString = " "
    end
    if maxLength ~= maxLength then
        maxLength = 0
    end
    if maxLength == -math.huge or maxLength == math.huge then
        error("Invalid string length", 0)
    end
    if #self >= maxLength or #fillString == 0 then
        return self
    end
    maxLength = maxLength - #self
    if maxLength > #fillString then
        fillString = fillString .. string.rep(
            fillString,
            math.floor(maxLength / #fillString)
        )
    end
    return self .. string.sub(
        fillString,
        1,
        math.floor(maxLength)
    )
end

local function __TS__StringPadStart(self, maxLength, fillString)
    if fillString == nil then
        fillString = " "
    end
    if maxLength ~= maxLength then
        maxLength = 0
    end
    if maxLength == -math.huge or maxLength == math.huge then
        error("Invalid string length", 0)
    end
    if #self >= maxLength or #fillString == 0 then
        return self
    end
    maxLength = maxLength - #self
    if maxLength > #fillString then
        fillString = fillString .. string.rep(
            fillString,
            math.floor(maxLength / #fillString)
        )
    end
    return string.sub(
        fillString,
        1,
        math.floor(maxLength)
    ) .. self
end

local __TS__StringReplace
do
    local sub = string.sub
    function __TS__StringReplace(source, searchValue, replaceValue)
        local startPos, endPos = string.find(source, searchValue, nil, true)
        if not startPos then
            return source
        end
        local before = sub(source, 1, startPos - 1)
        local ____temp_0
        if type(replaceValue) == "string" then
            ____temp_0 = replaceValue
        else
            ____temp_0 = replaceValue(nil, searchValue, startPos - 1, source)
        end
        local replacement = ____temp_0
        local after = sub(source, endPos + 1)
        return (before .. replacement) .. after
    end
end

local __TS__StringSplit
do
    local sub = string.sub
    local find = string.find
    function __TS__StringSplit(source, separator, limit)
        if limit == nil then
            limit = 4294967295
        end
        if limit == 0 then
            return {}
        end
        local result = {}
        local resultIndex = 1
        if separator == nil or separator == "" then
            for i = 1, #source do
                result[resultIndex] = sub(source, i, i)
                resultIndex = resultIndex + 1
            end
        else
            local currentPos = 1
            while resultIndex <= limit do
                local startPos, endPos = find(source, separator, currentPos, true)
                if not startPos then
                    break
                end
                result[resultIndex] = sub(source, currentPos, startPos - 1)
                resultIndex = resultIndex + 1
                currentPos = endPos + 1
            end
            if resultIndex <= limit then
                result[resultIndex] = sub(source, currentPos)
            end
        end
        return result
    end
end

local __TS__StringReplaceAll
do
    local sub = string.sub
    local find = string.find
    function __TS__StringReplaceAll(source, searchValue, replaceValue)
        if type(replaceValue) == "string" then
            local concat = table.concat(
                __TS__StringSplit(source, searchValue),
                replaceValue
            )
            if #searchValue == 0 then
                return (replaceValue .. concat) .. replaceValue
            end
            return concat
        end
        local parts = {}
        local partsIndex = 1
        if #searchValue == 0 then
            parts[1] = replaceValue(nil, "", 0, source)
            partsIndex = 2
            for i = 1, #source do
                parts[partsIndex] = sub(source, i, i)
                parts[partsIndex + 1] = replaceValue(nil, "", i, source)
                partsIndex = partsIndex + 2
            end
        else
            local currentPos = 1
            while true do
                local startPos, endPos = find(source, searchValue, currentPos, true)
                if not startPos then
                    break
                end
                parts[partsIndex] = sub(source, currentPos, startPos - 1)
                parts[partsIndex + 1] = replaceValue(nil, searchValue, startPos - 1, source)
                partsIndex = partsIndex + 2
                currentPos = endPos + 1
            end
            parts[partsIndex] = sub(source, currentPos)
        end
        return table.concat(parts)
    end
end

local function __TS__StringSlice(self, start, ____end)
    if start == nil or start ~= start then
        start = 0
    end
    if ____end ~= ____end then
        ____end = 0
    end
    if start >= 0 then
        start = start + 1
    end
    if ____end ~= nil and ____end < 0 then
        ____end = ____end - 1
    end
    return string.sub(self, start, ____end)
end

local function __TS__StringStartsWith(self, searchString, position)
    if position == nil or position < 0 then
        position = 0
    end
    return string.sub(self, position + 1, #searchString + position) == searchString
end

local function __TS__StringSubstr(self, from, length)
    if from ~= from then
        from = 0
    end
    if length ~= nil then
        if length ~= length or length <= 0 then
            return ""
        end
        length = length + from
    end
    if from >= 0 then
        from = from + 1
    end
    return string.sub(self, from, length)
end

local function __TS__StringTrim(self)
    local result = string.gsub(self, "^[%s ﻿]*(.-)[%s ﻿]*$", "%1")
    return result
end

local function __TS__StringTrimEnd(self)
    local result = string.gsub(self, "[%s ﻿]*$", "")
    return result
end

local function __TS__StringTrimStart(self)
    local result = string.gsub(self, "^[%s ﻿]*", "")
    return result
end

local __TS__SymbolRegistryFor, __TS__SymbolRegistryKeyFor
do
    local symbolRegistry = {}
    function __TS__SymbolRegistryFor(key)
        if not symbolRegistry[key] then
            symbolRegistry[key] = __TS__Symbol(key)
        end
        return symbolRegistry[key]
    end
    function __TS__SymbolRegistryKeyFor(sym)
        for key in pairs(symbolRegistry) do
            if symbolRegistry[key] == sym then
                return key
            end
        end
    end
end

local function __TS__TypeOf(value)
    local luaType = type(value)
    if luaType == "table" then
        return "object"
    elseif luaType == "nil" then
        return "undefined"
    else
        return luaType
    end
end

return {
  __TS__ArrayConcat = __TS__ArrayConcat,
  __TS__ArrayEntries = __TS__ArrayEntries,
  __TS__ArrayEvery = __TS__ArrayEvery,
  __TS__ArrayFilter = __TS__ArrayFilter,
  __TS__ArrayForEach = __TS__ArrayForEach,
  __TS__ArrayFind = __TS__ArrayFind,
  __TS__ArrayFindIndex = __TS__ArrayFindIndex,
  __TS__ArrayFrom = __TS__ArrayFrom,
  __TS__ArrayIncludes = __TS__ArrayIncludes,
  __TS__ArrayIndexOf = __TS__ArrayIndexOf,
  __TS__ArrayIsArray = __TS__ArrayIsArray,
  __TS__ArrayJoin = __TS__ArrayJoin,
  __TS__ArrayMap = __TS__ArrayMap,
  __TS__ArrayPush = __TS__ArrayPush,
  __TS__ArrayPushArray = __TS__ArrayPushArray,
  __TS__ArrayReduce = __TS__ArrayReduce,
  __TS__ArrayReduceRight = __TS__ArrayReduceRight,
  __TS__ArrayReverse = __TS__ArrayReverse,
  __TS__ArrayUnshift = __TS__ArrayUnshift,
  __TS__ArraySort = __TS__ArraySort,
  __TS__ArraySlice = __TS__ArraySlice,
  __TS__ArraySome = __TS__ArraySome,
  __TS__ArraySplice = __TS__ArraySplice,
  __TS__ArrayToObject = __TS__ArrayToObject,
  __TS__ArrayFlat = __TS__ArrayFlat,
  __TS__ArrayFlatMap = __TS__ArrayFlatMap,
  __TS__ArraySetLength = __TS__ArraySetLength,
  __TS__AsyncAwaiter = __TS__AsyncAwaiter,
  __TS__Await = __TS__Await,
  __TS__Class = __TS__Class,
  __TS__ClassExtends = __TS__ClassExtends,
  __TS__CloneDescriptor = __TS__CloneDescriptor,
  __TS__CountVarargs = __TS__CountVarargs,
  __TS__Decorate = __TS__Decorate,
  __TS__DecorateParam = __TS__DecorateParam,
  __TS__Delete = __TS__Delete,
  __TS__DelegatedYield = __TS__DelegatedYield,
  Error = Error,
  RangeError = RangeError,
  ReferenceError = ReferenceError,
  SyntaxError = SyntaxError,
  TypeError = TypeError,
  URIError = URIError,
  __TS__FunctionBind = __TS__FunctionBind,
  __TS__Generator = __TS__Generator,
  __TS__InstanceOf = __TS__InstanceOf,
  __TS__InstanceOfObject = __TS__InstanceOfObject,
  __TS__Iterator = __TS__Iterator,
  __TS__LuaIteratorSpread = __TS__LuaIteratorSpread,
  Map = Map,
  __TS__Match = __TS__Match,
  __TS__MathAtan2 = __TS__MathAtan2,
  __TS__MathModf = __TS__MathModf,
  __TS__MathSign = __TS__MathSign,
  __TS__New = __TS__New,
  __TS__Number = __TS__Number,
  __TS__NumberIsFinite = __TS__NumberIsFinite,
  __TS__NumberIsNaN = __TS__NumberIsNaN,
  __TS__NumberToString = __TS__NumberToString,
  __TS__ObjectAssign = __TS__ObjectAssign,
  __TS__ObjectDefineProperty = __TS__ObjectDefineProperty,
  __TS__ObjectEntries = __TS__ObjectEntries,
  __TS__ObjectFromEntries = __TS__ObjectFromEntries,
  __TS__ObjectGetOwnPropertyDescriptor = __TS__ObjectGetOwnPropertyDescriptor,
  __TS__ObjectGetOwnPropertyDescriptors = __TS__ObjectGetOwnPropertyDescriptors,
  __TS__ObjectKeys = __TS__ObjectKeys,
  __TS__ObjectRest = __TS__ObjectRest,
  __TS__ObjectValues = __TS__ObjectValues,
  __TS__ParseFloat = __TS__ParseFloat,
  __TS__ParseInt = __TS__ParseInt,
  __TS__Promise = __TS__Promise,
  __TS__PromiseAll = __TS__PromiseAll,
  __TS__PromiseAllSettled = __TS__PromiseAllSettled,
  __TS__PromiseAny = __TS__PromiseAny,
  __TS__PromiseRace = __TS__PromiseRace,
  Set = Set,
  __TS__SetDescriptor = __TS__SetDescriptor,
  __TS__SparseArrayNew = __TS__SparseArrayNew,
  __TS__SparseArrayPush = __TS__SparseArrayPush,
  __TS__SparseArraySpread = __TS__SparseArraySpread,
  WeakMap = WeakMap,
  WeakSet = WeakSet,
  __TS__SourceMapTraceBack = __TS__SourceMapTraceBack,
  __TS__Spread = __TS__Spread,
  __TS__StringAccess = __TS__StringAccess,
  __TS__StringCharAt = __TS__StringCharAt,
  __TS__StringCharCodeAt = __TS__StringCharCodeAt,
  __TS__StringEndsWith = __TS__StringEndsWith,
  __TS__StringIncludes = __TS__StringIncludes,
  __TS__StringPadEnd = __TS__StringPadEnd,
  __TS__StringPadStart = __TS__StringPadStart,
  __TS__StringReplace = __TS__StringReplace,
  __TS__StringReplaceAll = __TS__StringReplaceAll,
  __TS__StringSlice = __TS__StringSlice,
  __TS__StringSplit = __TS__StringSplit,
  __TS__StringStartsWith = __TS__StringStartsWith,
  __TS__StringSubstr = __TS__StringSubstr,
  __TS__StringSubstring = __TS__StringSubstring,
  __TS__StringTrim = __TS__StringTrim,
  __TS__StringTrimEnd = __TS__StringTrimEnd,
  __TS__StringTrimStart = __TS__StringTrimStart,
  __TS__Symbol = __TS__Symbol,
  Symbol = Symbol,
  __TS__SymbolRegistryFor = __TS__SymbolRegistryFor,
  __TS__SymbolRegistryKeyFor = __TS__SymbolRegistryKeyFor,
  __TS__TypeOf = __TS__TypeOf,
  __TS__Unpack = __TS__Unpack
}
 end,
["math.const"] = function(...) 
--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
local ____exports = {}
--- Two Pi.
-- 
-- @static
-- @member {number}
-- @memberof PIXI
____exports.PI_2 = math.pi * 2
--- Conversion factor for converting radians to degrees.
-- 
-- @static
-- @member {number} RAD_TO_DEG
-- @memberof PIXI
____exports.RAD_TO_DEG = 180 / math.pi
--- Conversion factor for converting degrees to radians.
-- 
-- @static
-- @member {number}
-- @memberof PIXI
____exports.DEG_TO_RAD = math.pi / 180
--- Constants that identify shapes, mainly to prevent `instanceof` calls.
-- 
-- @static
-- @memberof PIXI
-- @enum *
-- @property {number} POLY Polygon
-- @property {number} RECT Rectangle
-- @property {number} CIRC Circle
-- @property {number} ELIP Ellipse
-- @property {number} RREC Rounded Rectangle
____exports.SHAPES = SHAPES or ({})
____exports.SHAPES.POLY = 0
____exports.SHAPES[____exports.SHAPES.POLY] = "POLY"
____exports.SHAPES.RECT = 1
____exports.SHAPES[____exports.SHAPES.RECT] = "RECT"
____exports.SHAPES.CIRC = 2
____exports.SHAPES[____exports.SHAPES.CIRC] = "CIRC"
____exports.SHAPES.ELIP = 3
____exports.SHAPES[____exports.SHAPES.ELIP] = "ELIP"
____exports.SHAPES.RREC = 4
____exports.SHAPES[____exports.SHAPES.RREC] = "RREC"
return ____exports
 end,
["math.IPointData"] = function(...) 
--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
local ____exports = {}
return ____exports
 end,
["math.IPoint"] = function(...) 
--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
local ____exports = {}
return ____exports
 end,
["math.Point"] = function(...) 
local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__New = ____lualib.__TS__New
local ____exports = {}
--- The Point object represents a location in a two-dimensional coordinate system, where `x` represents
-- the position on the horizontal axis and `y` represents the position on the vertical axis
-- 
-- @class
-- @memberof PIXI
-- @implements IPoint
____exports.Point = __TS__Class()
local Point = ____exports.Point
Point.name = "Point"
function Point.prototype.____constructor(self, x, y)
    if x == nil then
        x = 0
    end
    if y == nil then
        y = 0
    end
    self.x = 0
    self.y = 0
    self.x = x
    self.y = y
end
function Point.prototype.clone(self)
    return __TS__New(____exports.Point, self.x, self.y)
end
function Point.prototype.copyFrom(self, p)
    self:set(p.x, p.y)
    return self
end
function Point.prototype.copyTo(self, p)
    p:set(self.x, self.y)
    return p
end
function Point.prototype.equals(self, p)
    return p.x == self.x and p.y == self.y
end
function Point.prototype.set(self, x, y)
    if x == nil then
        x = 0
    end
    if y == nil then
        y = x
    end
    self.x = x
    self.y = y
    return self
end
function Point.prototype.__tostring(self)
    return ((("[@pixi/math:Point x=" .. tostring(self.x)) .. " y=") .. tostring(self.y)) .. "]"
end
return ____exports
 end,
["math.ObservablePoint"] = function(...) 
local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__SetDescriptor = ____lualib.__TS__SetDescriptor
local __TS__New = ____lualib.__TS__New
local ____exports = {}
--- The ObservablePoint object represents a location in a two-dimensional coordinate system, where `x` represents
-- the position on the horizontal axis and `y` represents the position on the vertical axis.
-- 
-- An `ObservablePoint` is a point that triggers a callback when the point's position is changed.
-- 
-- @memberof PIXI
____exports.ObservablePoint = __TS__Class()
local ObservablePoint = ____exports.ObservablePoint
ObservablePoint.name = "ObservablePoint"
function ObservablePoint.prototype.____constructor(self, cb, scope, x, y)
    if x == nil then
        x = 0
    end
    if y == nil then
        y = 0
    end
    self._x = x
    self._y = y
    self.cb = cb
    self.scope = scope
end
__TS__SetDescriptor(
    ObservablePoint.prototype,
    "x",
    {
        get = function(self)
            return self._x
        end,
        set = function(self, value)
            if self._x ~= value then
                self._x = value
                self.cb(self.scope)
            end
        end
    },
    true
)
__TS__SetDescriptor(
    ObservablePoint.prototype,
    "y",
    {
        get = function(self)
            return self._y
        end,
        set = function(self, value)
            if self._y ~= value then
                self._y = value
                self.cb(self.scope)
            end
        end
    },
    true
)
function ObservablePoint.prototype.clone(self, cb, scope)
    if cb == nil then
        cb = self.cb
    end
    if scope == nil then
        scope = self.scope
    end
    return __TS__New(
        ____exports.ObservablePoint,
        cb,
        scope,
        self._x,
        self._y
    )
end
function ObservablePoint.prototype.set(self, x, y)
    if x == nil then
        x = 0
    end
    if y == nil then
        y = x
    end
    if self._x ~= x or self._y ~= y then
        self._x = x
        self._y = y
        self.cb(self.scope)
    end
    return self
end
function ObservablePoint.prototype.copyFrom(self, p)
    if self._x ~= p.x or self._y ~= p.y then
        self._x = p.x
        self._y = p.y
        self.cb(self.scope)
    end
    return self
end
function ObservablePoint.prototype.copyTo(self, p)
    p:set(self._x, self._y)
    return p
end
function ObservablePoint.prototype.equals(self, p)
    return p.x == self._x and p.y == self._y
end
function ObservablePoint.prototype.__tostring(self)
    return ((((("[@pixi/math:ObservablePoint x=" .. 0) .. " y=") .. 0) .. " scope=") .. tostring(self.scope)) .. "]"
end
return ____exports
 end,
["math.Transform"] = function(...) 
local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__New = ____lualib.__TS__New
local __TS__SetDescriptor = ____lualib.__TS__SetDescriptor
local ____exports = {}
local ____Matrix = require("math.Matrix")
local Matrix = ____Matrix.Matrix
local ____ObservablePoint = require("math.ObservablePoint")
local ObservablePoint = ____ObservablePoint.ObservablePoint
--- Transform that takes care about its versions.
-- 
-- @memberof PIXI
____exports.Transform = __TS__Class()
local Transform = ____exports.Transform
Transform.name = "Transform"
function Transform.prototype.____constructor(self)
    self.worldTransform = __TS__New(Matrix)
    self.localTransform = __TS__New(Matrix)
    self.position = __TS__New(
        ObservablePoint,
        self.onChange,
        self,
        0,
        0
    )
    self.scale = __TS__New(
        ObservablePoint,
        self.onChange,
        self,
        1,
        1
    )
    self.pivot = __TS__New(
        ObservablePoint,
        self.onChange,
        self,
        0,
        0
    )
    self.skew = __TS__New(
        ObservablePoint,
        self.updateSkew,
        self,
        0,
        0
    )
    self._rotation = 0
    self._cx = 1
    self._sx = 0
    self._cy = 0
    self._sy = 1
    self._localID = 0
    self._currentLocalID = 0
    self._worldID = 0
    self._parentID = 0
end
__TS__SetDescriptor(
    Transform.prototype,
    "rotation",
    {
        get = function(self)
            return self._rotation
        end,
        set = function(self, value)
            if self._rotation ~= value then
                self._rotation = value
                self:updateSkew()
            end
        end
    },
    true
)
function Transform.prototype.onChange(self)
    self._localID = self._localID + 1
end
function Transform.prototype.updateSkew(self)
    self._cx = math.cos(self._rotation + self.skew.y)
    self._sx = math.sin(self._rotation + self.skew.y)
    self._cy = -math.sin(self._rotation - self.skew.x)
    self._sy = math.cos(self._rotation - self.skew.x)
    self._localID = self._localID + 1
end
function Transform.prototype.__tostring(self)
    return (((("[@pixi/math:Transform " .. ((("position=(" .. tostring(self.position.x)) .. ", ") .. tostring(self.position.y)) .. ") ") .. ("rotation=" .. tostring(self.rotation)) .. " ") .. ((("scale=(" .. tostring(self.scale.x)) .. ", ") .. tostring(self.scale.y)) .. ") ") .. ((("skew=(" .. tostring(self.skew.x)) .. ", ") .. tostring(self.skew.y)) .. ") ") .. "]"
end
function Transform.prototype.updateLocalTransform(self)
    local lt = self.localTransform
    if self._localID ~= self._currentLocalID then
        lt.a = self._cx * self.scale.x
        lt.b = self._sx * self.scale.x
        lt.c = self._cy * self.scale.y
        lt.d = self._sy * self.scale.y
        lt.tx = self.position.x - (self.pivot.x * lt.a + self.pivot.y * lt.c)
        lt.ty = self.position.y - (self.pivot.x * lt.b + self.pivot.y * lt.d)
        self._currentLocalID = self._localID
        self._parentID = -1
    end
end
function Transform.prototype.updateTransform(self, parentTransform)
    local lt = self.localTransform
    if self._localID ~= self._currentLocalID then
        lt.a = self._cx * self.scale.x
        lt.b = self._sx * self.scale.x
        lt.c = self._cy * self.scale.y
        lt.d = self._sy * self.scale.y
        lt.tx = self.position.x - (self.pivot.x * lt.a + self.pivot.y * lt.c)
        lt.ty = self.position.y - (self.pivot.x * lt.b + self.pivot.y * lt.d)
        self._currentLocalID = self._localID
        self._parentID = -1
    end
    if self._parentID ~= parentTransform._worldID then
        local pt = parentTransform.worldTransform
        local wt = self.worldTransform
        wt.a = lt.a * pt.a + lt.b * pt.c
        wt.b = lt.a * pt.b + lt.b * pt.d
        wt.c = lt.c * pt.a + lt.d * pt.c
        wt.d = lt.c * pt.b + lt.d * pt.d
        wt.tx = lt.tx * pt.a + lt.ty * pt.c + pt.tx
        wt.ty = lt.tx * pt.b + lt.ty * pt.d + pt.ty
        self._parentID = parentTransform._worldID
        self._worldID = self._worldID + 1
    end
end
function Transform.prototype.setFromMatrix(self, matrix)
    matrix:decompose(self)
    self._localID = self._localID + 1
end
Transform.IDENTITY = __TS__New(____exports.Transform)
return ____exports
 end,
["math.Matrix"] = function(...) 
local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__New = ____lualib.__TS__New
local __TS__ObjectDefineProperty = ____lualib.__TS__ObjectDefineProperty
local ____exports = {}
local ____const = require("math.const")
local PI_2 = ____const.PI_2
local ____Point = require("math.Point")
local Point = ____Point.Point
--- The PixiJS Matrix as a class makes it a lot faster.
-- 
-- Here is a representation of it:
-- ```
-- | a | c | tx|
-- | b | d | ty|
-- | 0 | 0 | 1 |
-- ```
-- 
-- @memberof PIXI
____exports.Matrix = __TS__Class()
local Matrix = ____exports.Matrix
Matrix.name = "Matrix"
function Matrix.prototype.____constructor(self, a, b, c, d, tx, ty)
    if a == nil then
        a = 1
    end
    if b == nil then
        b = 0
    end
    if c == nil then
        c = 0
    end
    if d == nil then
        d = 1
    end
    if tx == nil then
        tx = 0
    end
    if ty == nil then
        ty = 0
    end
    self.array = nil
    self.a = a
    self.b = b
    self.c = c
    self.d = d
    self.tx = tx
    self.ty = ty
end
__TS__ObjectDefineProperty(
    Matrix,
    "IDENTITY",
    {get = function(self)
        return __TS__New(____exports.Matrix)
    end}
)
__TS__ObjectDefineProperty(
    Matrix,
    "TEMP_MATRIX",
    {get = function(self)
        return __TS__New(____exports.Matrix)
    end}
)
function Matrix.prototype.fromArray(self, array)
    self.a = array[1]
    self.b = array[2]
    self.c = array[4]
    self.d = array[5]
    self.tx = array[3]
    self.ty = array[6]
end
function Matrix.prototype.set(self, a, b, c, d, tx, ty)
    self.a = a
    self.b = b
    self.c = c
    self.d = d
    self.tx = tx
    self.ty = ty
    return self
end
function Matrix.prototype.toArray(self, transpose, out)
    if not self.array then
        self.array = __TS__New(Float32Array, 9)
    end
    local array = out or self.array
    if transpose then
        array[0] = self.a
        array[1] = self.b
        array[2] = 0
        array[3] = self.c
        array[4] = self.d
        array[5] = 0
        array[6] = self.tx
        array[7] = self.ty
        array[8] = 1
    else
        array[0] = self.a
        array[1] = self.c
        array[2] = self.tx
        array[3] = self.b
        array[4] = self.d
        array[5] = self.ty
        array[6] = 0
        array[7] = 0
        array[8] = 1
    end
    return array
end
function Matrix.prototype.apply(self, pos, newPos)
    newPos = newPos or __TS__New(Point)
    local x = pos.x
    local y = pos.y
    newPos.x = self.a * x + self.c * y + self.tx
    newPos.y = self.b * x + self.d * y + self.ty
    return newPos
end
function Matrix.prototype.applyInverse(self, pos, newPos)
    newPos = newPos or __TS__New(Point)
    local id = 1 / (self.a * self.d + self.c * -self.b)
    local x = pos.x
    local y = pos.y
    newPos.x = self.d * id * x + -self.c * id * y + (self.ty * self.c - self.tx * self.d) * id
    newPos.y = self.a * id * y + -self.b * id * x + (-self.ty * self.a + self.tx * self.b) * id
    return newPos
end
function Matrix.prototype.translate(self, x, y)
    self.tx = self.tx + x
    self.ty = self.ty + y
    return self
end
function Matrix.prototype.scale(self, x, y)
    self.a = self.a * x
    self.d = self.d * y
    self.c = self.c * x
    self.b = self.b * y
    self.tx = self.tx * x
    self.ty = self.ty * y
    return self
end
function Matrix.prototype.rotate(self, angle)
    local cos = math.cos(angle)
    local sin = math.sin(angle)
    local a1 = self.a
    local c1 = self.c
    local tx1 = self.tx
    self.a = a1 * cos - self.b * sin
    self.b = a1 * sin + self.b * cos
    self.c = c1 * cos - self.d * sin
    self.d = c1 * sin + self.d * cos
    self.tx = tx1 * cos - self.ty * sin
    self.ty = tx1 * sin + self.ty * cos
    return self
end
function Matrix.prototype.append(self, matrix)
    local a1 = self.a
    local b1 = self.b
    local c1 = self.c
    local d1 = self.d
    self.a = matrix.a * a1 + matrix.b * c1
    self.b = matrix.a * b1 + matrix.b * d1
    self.c = matrix.c * a1 + matrix.d * c1
    self.d = matrix.c * b1 + matrix.d * d1
    self.tx = matrix.tx * a1 + matrix.ty * c1 + self.tx
    self.ty = matrix.tx * b1 + matrix.ty * d1 + self.ty
    return self
end
function Matrix.prototype.setTransform(self, x, y, pivotX, pivotY, scaleX, scaleY, rotation, skewX, skewY)
    self.a = math.cos(rotation + skewY) * scaleX
    self.b = math.sin(rotation + skewY) * scaleX
    self.c = -math.sin(rotation - skewX) * scaleY
    self.d = math.cos(rotation - skewX) * scaleY
    self.tx = x - (pivotX * self.a + pivotY * self.c)
    self.ty = y - (pivotX * self.b + pivotY * self.d)
    return self
end
function Matrix.prototype.prepend(self, matrix)
    local tx1 = self.tx
    if matrix.a ~= 1 or matrix.b ~= 0 or matrix.c ~= 0 or matrix.d ~= 1 then
        local a1 = self.a
        local c1 = self.c
        self.a = a1 * matrix.a + self.b * matrix.c
        self.b = a1 * matrix.b + self.b * matrix.d
        self.c = c1 * matrix.a + self.d * matrix.c
        self.d = c1 * matrix.b + self.d * matrix.d
    end
    self.tx = tx1 * matrix.a + self.ty * matrix.c + matrix.tx
    self.ty = tx1 * matrix.b + self.ty * matrix.d + matrix.ty
    return self
end
function Matrix.prototype.decompose(self, transform)
    local a = self.a
    local b = self.b
    local c = self.c
    local d = self.d
    local pivot = transform.pivot
    local skewX = -math.atan2(-c, d)
    local skewY = math.atan2(b, a)
    local delta = math.abs(skewX + skewY)
    if delta < 0.00001 or math.abs(PI_2 - delta) < 0.00001 then
        transform.rotation = skewY
        local ____transform_skew_0 = transform.skew
        transform.skew.y = 0
        ____transform_skew_0.x = 0
    else
        transform.rotation = 0
        transform.skew.x = skewX
        transform.skew.y = skewY
    end
    transform.scale.x = math.sqrt(a * a + b * b)
    transform.scale.y = math.sqrt(c * c + d * d)
    transform.position.x = self.tx + (pivot.x * a + pivot.y * c)
    transform.position.y = self.ty + (pivot.x * b + pivot.y * d)
    return transform
end
function Matrix.prototype.invert(self)
    local a1 = self.a
    local b1 = self.b
    local c1 = self.c
    local d1 = self.d
    local tx1 = self.tx
    local n = a1 * d1 - b1 * c1
    self.a = d1 / n
    self.b = -b1 / n
    self.c = -c1 / n
    self.d = a1 / n
    self.tx = (c1 * self.ty - d1 * tx1) / n
    self.ty = -(a1 * self.ty - b1 * tx1) / n
    return self
end
function Matrix.prototype.identity(self)
    self.a = 1
    self.b = 0
    self.c = 0
    self.d = 1
    self.tx = 0
    self.ty = 0
    return self
end
function Matrix.prototype.clone(self)
    local matrix = __TS__New(____exports.Matrix)
    matrix.a = self.a
    matrix.b = self.b
    matrix.c = self.c
    matrix.d = self.d
    matrix.tx = self.tx
    matrix.ty = self.ty
    return matrix
end
function Matrix.prototype.copyTo(self, matrix)
    matrix.a = self.a
    matrix.b = self.b
    matrix.c = self.c
    matrix.d = self.d
    matrix.tx = self.tx
    matrix.ty = self.ty
    return matrix
end
function Matrix.prototype.copyFrom(self, matrix)
    self.a = matrix.a
    self.b = matrix.b
    self.c = matrix.c
    self.d = matrix.d
    self.tx = matrix.tx
    self.ty = matrix.ty
    return self
end
function Matrix.prototype.__tostring(self)
    return ((((((((((("[@pixi/math:Matrix a=" .. tostring(self.a)) .. " b=") .. tostring(self.b)) .. " c=") .. tostring(self.c)) .. " d=") .. tostring(self.d)) .. " tx=") .. tostring(self.tx)) .. " ty=") .. tostring(self.ty)) .. "]"
end
return ____exports
 end,
["math.shapes.Rectangle"] = function(...) 
local ____lualib = require("lualib_bundle")
local __TS__New = ____lualib.__TS__New
local __TS__Class = ____lualib.__TS__Class
local __TS__Number = ____lualib.__TS__Number
local __TS__SetDescriptor = ____lualib.__TS__SetDescriptor
local __TS__ObjectDefineProperty = ____lualib.__TS__ObjectDefineProperty
local __TS__MathSign = ____lualib.__TS__MathSign
local ____exports = {}
local ____const = require("math.const")
local SHAPES = ____const.SHAPES
local ____Point = require("math.Point")
local Point = ____Point.Point
local tempPoints = {
    __TS__New(Point),
    __TS__New(Point),
    __TS__New(Point),
    __TS__New(Point)
}
--- Rectangle object is an area defined by its position, as indicated by its top-left corner
-- point (x, y) and by its width and its height.
-- 
-- @memberof PIXI
____exports.Rectangle = __TS__Class()
local Rectangle = ____exports.Rectangle
Rectangle.name = "Rectangle"
function Rectangle.prototype.____constructor(self, x, y, width, height)
    if x == nil then
        x = 0
    end
    if y == nil then
        y = 0
    end
    if width == nil then
        width = 0
    end
    if height == nil then
        height = 0
    end
    self.x = __TS__Number(x)
    self.y = __TS__Number(y)
    self.width = __TS__Number(width)
    self.height = __TS__Number(height)
    self.type = SHAPES.RECT
end
__TS__SetDescriptor(
    Rectangle.prototype,
    "left",
    {get = function(self)
        return self.x
    end},
    true
)
__TS__SetDescriptor(
    Rectangle.prototype,
    "right",
    {get = function(self)
        return self.x + self.width
    end},
    true
)
__TS__SetDescriptor(
    Rectangle.prototype,
    "top",
    {get = function(self)
        return self.y
    end},
    true
)
__TS__SetDescriptor(
    Rectangle.prototype,
    "bottom",
    {get = function(self)
        return self.y + self.height
    end},
    true
)
__TS__ObjectDefineProperty(
    Rectangle,
    "EMPTY",
    {get = function(self)
        return __TS__New(
            ____exports.Rectangle,
            0,
            0,
            0,
            0
        )
    end}
)
function Rectangle.prototype.clone(self)
    return __TS__New(
        ____exports.Rectangle,
        self.x,
        self.y,
        self.width,
        self.height
    )
end
function Rectangle.prototype.copyFrom(self, rectangle)
    self.x = rectangle.x
    self.y = rectangle.y
    self.width = rectangle.width
    self.height = rectangle.height
    return self
end
function Rectangle.prototype.copyTo(self, rectangle)
    rectangle.x = self.x
    rectangle.y = self.y
    rectangle.width = self.width
    rectangle.height = self.height
    return rectangle
end
function Rectangle.prototype.contains(self, x, y)
    if self.width <= 0 or self.height <= 0 then
        return false
    end
    if x >= self.x and x < self.x + self.width then
        if y >= self.y and y < self.y + self.height then
            return true
        end
    end
    return false
end
function Rectangle.prototype.intersects(self, other, transform)
    if not transform then
        local x0 = self.x < other.x and other.x or self.x
        local x1 = self.right > other.right and other.right or self.right
        if x1 <= x0 then
            return false
        end
        local y0 = self.y < other.y and other.y or self.y
        local y1 = self.bottom > other.bottom and other.bottom or self.bottom
        return y1 > y0
    end
    local x0 = self.left
    local x1 = self.right
    local y0 = self.top
    local y1 = self.bottom
    if x1 <= x0 or y1 <= y0 then
        return false
    end
    local lt = tempPoints[1]:set(other.left, other.top)
    local lb = tempPoints[2]:set(other.left, other.bottom)
    local rt = tempPoints[3]:set(other.right, other.top)
    local rb = tempPoints[4]:set(other.right, other.bottom)
    if rt.x <= lt.x or lb.y <= lt.y then
        return false
    end
    local s = __TS__MathSign(transform.a * transform.d - transform.b * transform.c)
    if s == 0 then
        return false
    end
    transform:apply(lt, lt)
    transform:apply(lb, lb)
    transform:apply(rt, rt)
    transform:apply(rb, rb)
    if math.max(lt.x, lb.x, rt.x, rb.x) <= x0 or math.min(lt.x, lb.x, rt.x, rb.x) >= x1 or math.max(lt.y, lb.y, rt.y, rb.y) <= y0 or math.min(lt.y, lb.y, rt.y, rb.y) >= y1 then
        return false
    end
    local nx = s * (lb.y - lt.y)
    local ny = s * (lt.x - lb.x)
    local n00 = nx * x0 + ny * y0
    local n10 = nx * x1 + ny * y0
    local n01 = nx * x0 + ny * y1
    local n11 = nx * x1 + ny * y1
    if math.max(n00, n10, n01, n11) <= nx * lt.x + ny * lt.y or math.min(n00, n10, n01, n11) >= nx * rb.x + ny * rb.y then
        return false
    end
    local mx = s * (lt.y - rt.y)
    local my = s * (rt.x - lt.x)
    local m00 = mx * x0 + my * y0
    local m10 = mx * x1 + my * y0
    local m01 = mx * x0 + my * y1
    local m11 = mx * x1 + my * y1
    if math.max(m00, m10, m01, m11) <= mx * lt.x + my * lt.y or math.min(m00, m10, m01, m11) >= mx * rb.x + my * rb.y then
        return false
    end
    return true
end
function Rectangle.prototype.pad(self, paddingX, paddingY)
    if paddingX == nil then
        paddingX = 0
    end
    if paddingY == nil then
        paddingY = paddingX
    end
    self.x = self.x - paddingX
    self.y = self.y - paddingY
    self.width = self.width + paddingX * 2
    self.height = self.height + paddingY * 2
    return self
end
function Rectangle.prototype.fit(self, rectangle)
    local x1 = math.max(self.x, rectangle.x)
    local x2 = math.min(self.x + self.width, rectangle.x + rectangle.width)
    local y1 = math.max(self.y, rectangle.y)
    local y2 = math.min(self.y + self.height, rectangle.y + rectangle.height)
    self.x = x1
    self.width = math.max(x2 - x1, 0)
    self.y = y1
    self.height = math.max(y2 - y1, 0)
    return self
end
function Rectangle.prototype.ceil(self, resolution, eps)
    if resolution == nil then
        resolution = 1
    end
    if eps == nil then
        eps = 0.001
    end
    local x2 = math.ceil((self.x + self.width - eps) * resolution) / resolution
    local y2 = math.ceil((self.y + self.height - eps) * resolution) / resolution
    self.x = math.floor((self.x + eps) * resolution) / resolution
    self.y = math.floor((self.y + eps) * resolution) / resolution
    self.width = x2 - self.x
    self.height = y2 - self.y
    return self
end
function Rectangle.prototype.enlarge(self, rectangle)
    local x1 = math.min(self.x, rectangle.x)
    local x2 = math.max(self.x + self.width, rectangle.x + rectangle.width)
    local y1 = math.min(self.y, rectangle.y)
    local y2 = math.max(self.y + self.height, rectangle.y + rectangle.height)
    self.x = x1
    self.width = x2 - x1
    self.y = y1
    self.height = y2 - y1
    return self
end
function Rectangle.prototype.__tostring(self)
    return ((((((("[@pixi/math:Rectangle x=" .. tostring(self.x)) .. " y=") .. tostring(self.y)) .. " width=") .. tostring(self.width)) .. " height=") .. tostring(self.height)) .. "]"
end
return ____exports
 end,
["math.shapes.Circle"] = function(...) 
local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__New = ____lualib.__TS__New
local ____exports = {}
local ____const = require("math.const")
local SHAPES = ____const.SHAPES
local ____Rectangle = require("math.shapes.Rectangle")
local Rectangle = ____Rectangle.Rectangle
--- The Circle object is used to help draw graphics and can also be used to specify a hit area for displayObjects.
-- 
-- @memberof PIXI
____exports.Circle = __TS__Class()
local Circle = ____exports.Circle
Circle.name = "Circle"
function Circle.prototype.____constructor(self, x, y, radius)
    if x == nil then
        x = 0
    end
    if y == nil then
        y = 0
    end
    if radius == nil then
        radius = 0
    end
    self.x = x
    self.y = y
    self.radius = radius
    self.type = SHAPES.CIRC
end
function Circle.prototype.clone(self)
    return __TS__New(____exports.Circle, self.x, self.y, self.radius)
end
function Circle.prototype.contains(self, x, y)
    if self.radius <= 0 then
        return false
    end
    local r2 = self.radius * self.radius
    local dx = self.x - x
    local dy = self.y - y
    dx = dx * dx
    dy = dy * dy
    return dx + dy <= r2
end
function Circle.prototype.getBounds(self)
    return __TS__New(
        Rectangle,
        self.x - self.radius,
        self.y - self.radius,
        self.radius * 2,
        self.radius * 2
    )
end
function Circle.prototype.__tostring(self)
    return ((((("[@pixi/math:Circle x=" .. tostring(self.x)) .. " y=") .. tostring(self.y)) .. " radius=") .. tostring(self.radius)) .. "]"
end
return ____exports
 end,
["math.shapes.Ellipse"] = function(...) 
local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__New = ____lualib.__TS__New
local ____exports = {}
local ____const = require("math.const")
local SHAPES = ____const.SHAPES
local ____Rectangle = require("math.shapes.Rectangle")
local Rectangle = ____Rectangle.Rectangle
--- The Ellipse object is used to help draw graphics and can also be used to specify a hit area for displayObjects.
-- 
-- @memberof PIXI
____exports.Ellipse = __TS__Class()
local Ellipse = ____exports.Ellipse
Ellipse.name = "Ellipse"
function Ellipse.prototype.____constructor(self, x, y, halfWidth, halfHeight)
    if x == nil then
        x = 0
    end
    if y == nil then
        y = 0
    end
    if halfWidth == nil then
        halfWidth = 0
    end
    if halfHeight == nil then
        halfHeight = 0
    end
    self.x = x
    self.y = y
    self.width = halfWidth
    self.height = halfHeight
    self.type = SHAPES.ELIP
end
function Ellipse.prototype.clone(self)
    return __TS__New(
        ____exports.Ellipse,
        self.x,
        self.y,
        self.width,
        self.height
    )
end
function Ellipse.prototype.contains(self, x, y)
    if self.width <= 0 or self.height <= 0 then
        return false
    end
    local normx = (x - self.x) / self.width
    local normy = (y - self.y) / self.height
    normx = normx * normx
    normy = normy * normy
    return normx + normy <= 1
end
function Ellipse.prototype.getBounds(self)
    return __TS__New(
        Rectangle,
        self.x - self.width,
        self.y - self.height,
        self.width,
        self.height
    )
end
function Ellipse.prototype.__tostring(self)
    return ((((((("[@pixi/math:Ellipse x=" .. tostring(self.x)) .. " y=") .. tostring(self.y)) .. " width=") .. tostring(self.width)) .. " height=") .. tostring(self.height)) .. "]"
end
return ____exports
 end,
["math.shapes.Polygon"] = function(...) 
local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ArrayIsArray = ____lualib.__TS__ArrayIsArray
local __TS__ArrayPush = ____lualib.__TS__ArrayPush
local __TS__ArraySlice = ____lualib.__TS__ArraySlice
local __TS__New = ____lualib.__TS__New
local __TS__ArrayReduce = ____lualib.__TS__ArrayReduce
local ____exports = {}
local ____const = require("math.const")
local SHAPES = ____const.SHAPES
--- A class to define a shape via user defined coordinates.
-- 
-- @memberof PIXI
____exports.Polygon = __TS__Class()
local Polygon = ____exports.Polygon
Polygon.name = "Polygon"
function Polygon.prototype.____constructor(self, ...)
    local points = {...}
    local flat = __TS__ArrayIsArray(points[1]) and points[1] or points
    if type(flat[1]) ~= "number" then
        local p = {}
        do
            local i = 0
            local il = #flat
            while i < il do
                __TS__ArrayPush(p, flat[i + 1].x, flat[i + 1].y)
                i = i + 1
            end
        end
        flat = p
    end
    self.points = flat
    self.type = SHAPES.POLY
    self.closeStroke = true
end
function Polygon.prototype.clone(self)
    local points = __TS__ArraySlice(self.points)
    local polygon = __TS__New(____exports.Polygon, points)
    polygon.closeStroke = self.closeStroke
    return polygon
end
function Polygon.prototype.contains(self, x, y)
    local inside = false
    local length = #self.points / 2
    do
        local i = 0
        local j = length - 1
        while i < length do
            local xi = self.points[i * 2 + 1]
            local yi = self.points[i * 2 + 1 + 1]
            local xj = self.points[j * 2 + 1]
            local yj = self.points[j * 2 + 1 + 1]
            local intersect = yi > y ~= (yj > y) and x < (xj - xi) * ((y - yi) / (yj - yi)) + xi
            if intersect then
                inside = not inside
            end
            local ____i_0 = i
            i = ____i_0 + 1
            j = ____i_0
        end
    end
    return inside
end
function Polygon.prototype.__tostring(self)
    return ("[@pixi/math:Polygon" .. "closeStroke=" .. tostring(self.closeStroke)) .. ("points=" .. __TS__ArrayReduce(
        self.points,
        function(____, pointsDesc, currentPoint) return (pointsDesc .. ", ") .. tostring(currentPoint) end,
        ""
    )) .. "]"
end
return ____exports
 end,
["math.shapes.RoundedRectangle"] = function(...) 
local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__New = ____lualib.__TS__New
local ____exports = {}
local ____const = require("math.const")
local SHAPES = ____const.SHAPES
--- The Rounded Rectangle object is an area that has nice rounded corners, as indicated by its
-- top-left corner point (x, y) and by its width and its height and its radius.
-- 
-- @memberof PIXI
____exports.RoundedRectangle = __TS__Class()
local RoundedRectangle = ____exports.RoundedRectangle
RoundedRectangle.name = "RoundedRectangle"
function RoundedRectangle.prototype.____constructor(self, x, y, width, height, radius)
    if x == nil then
        x = 0
    end
    if y == nil then
        y = 0
    end
    if width == nil then
        width = 0
    end
    if height == nil then
        height = 0
    end
    if radius == nil then
        radius = 20
    end
    self.x = x
    self.y = y
    self.width = width
    self.height = height
    self.radius = radius
    self.type = SHAPES.RREC
end
function RoundedRectangle.prototype.clone(self)
    return __TS__New(
        ____exports.RoundedRectangle,
        self.x,
        self.y,
        self.width,
        self.height,
        self.radius
    )
end
function RoundedRectangle.prototype.contains(self, x, y)
    if self.width <= 0 or self.height <= 0 then
        return false
    end
    if x >= self.x and x <= self.x + self.width then
        if y >= self.y and y <= self.y + self.height then
            local radius = math.max(
                0,
                math.min(
                    self.radius,
                    math.min(self.width, self.height) / 2
                )
            )
            if y >= self.y + radius and y <= self.y + self.height - radius or x >= self.x + radius and x <= self.x + self.width - radius then
                return true
            end
            local dx = x - (self.x + radius)
            local dy = y - (self.y + radius)
            local radius2 = radius * radius
            if dx * dx + dy * dy <= radius2 then
                return true
            end
            dx = x - (self.x + self.width - radius)
            if dx * dx + dy * dy <= radius2 then
                return true
            end
            dy = y - (self.y + self.height - radius)
            if dx * dx + dy * dy <= radius2 then
                return true
            end
            dx = x - (self.x + radius)
            if dx * dx + dy * dy <= radius2 then
                return true
            end
        end
    end
    return false
end
function RoundedRectangle.prototype.__tostring(self)
    return ((("[@pixi/math:RoundedRectangle x=" .. tostring(self.x)) .. " y=") .. tostring(self.y)) .. ((((("width=" .. tostring(self.width)) .. " height=") .. tostring(self.height)) .. " radius=") .. tostring(self.radius)) .. "]"
end
return ____exports
 end,
["math.groupD8"] = function(...) 
local ____lualib = require("lualib_bundle")
local __TS__New = ____lualib.__TS__New
local ____exports = {}
local ____Matrix = require("math.Matrix")
local Matrix = ____Matrix.Matrix
local ux = {
    1,
    1,
    0,
    -1,
    -1,
    -1,
    0,
    1,
    1,
    1,
    0,
    -1,
    -1,
    -1,
    0,
    1
}
local uy = {
    0,
    1,
    1,
    1,
    0,
    -1,
    -1,
    -1,
    0,
    1,
    1,
    1,
    0,
    -1,
    -1,
    -1
}
local vx = {
    0,
    -1,
    -1,
    -1,
    0,
    1,
    1,
    1,
    0,
    1,
    1,
    1,
    0,
    -1,
    -1,
    -1
}
local vy = {
    1,
    1,
    0,
    -1,
    -1,
    -1,
    0,
    1,
    -1,
    -1,
    0,
    1,
    1,
    1,
    0,
    -1
}
--- [Cayley Table]{https://en.wikipedia.org/wiki/Cayley_table}
-- for the composition of each rotation in the dihederal group D8.
-- 
-- @type {number[][]}
-- @private
local rotationCayley = {}
--- Matrices for each `GD8Symmetry` rotation.
-- 
-- @type {PIXI.Matrix[]}
-- @private
local rotationMatrices = {}
local function signum(self, value)
    if value < 0 then
        return -1
    end
    if value > 0 then
        return 1
    end
    return value
end
local function init(self)
    do
        local i = 0
        while i < 16 do
            local row = {}
            rotationCayley[#rotationCayley + 1] = row
            do
                local j = 0
                while j < 16 do
                    local _ux = signum(nil, ux[i + 1] * ux[j + 1] + vx[i + 1] * uy[j + 1])
                    local _uy = signum(nil, uy[i + 1] * ux[j + 1] + vy[i + 1] * uy[j + 1])
                    local _vx = signum(nil, ux[i + 1] * vx[j + 1] + vx[i + 1] * vy[j + 1])
                    local _vy = signum(nil, uy[i + 1] * vx[j + 1] + vy[i + 1] * vy[j + 1])
                    do
                        local k = 0
                        while k < 16 do
                            if ux[k + 1] == _ux and uy[k + 1] == _uy and vx[k + 1] == _vx and vy[k + 1] == _vy then
                                row[#row + 1] = k
                                break
                            end
                            k = k + 1
                        end
                    end
                    j = j + 1
                end
            end
            i = i + 1
        end
    end
    do
        local i = 0
        while i < 16 do
            local mat = __TS__New(Matrix)
            mat:set(
                ux[i + 1],
                uy[i + 1],
                vx[i + 1],
                vy[i + 1],
                0,
                0
            )
            rotationMatrices[#rotationMatrices + 1] = mat
            i = i + 1
        end
    end
end
init(nil)
--- Implements the dihedral group D8, which is similar to
-- [group D4]{http://mathworld.wolfram.com/DihedralGroupD4.html};
-- D8 is the same but with diagonals, and it is used for texture
-- rotations.
-- 
-- The directions the U- and V- axes after rotation
-- of an angle of `a: GD8Constant` are the vectors `(uX(a), uY(a))`
-- and `(vX(a), vY(a))`. These aren't necessarily unit vectors.
-- 
-- **Origin:**<br>
--  This is the small part of gameofbombs.com portal system. It works.
-- 
-- @see PIXI.groupD8.E *
-- @see PIXI.groupD8.SE *
-- @see PIXI.groupD8.S *
-- @see PIXI.groupD8.SW *
-- @see PIXI.groupD8.W *
-- @see PIXI.groupD8.NW *
-- @see PIXI.groupD8.N *
-- @see PIXI.groupD8.NE *
-- @author Ivan
-- @ivanpopelyshev
-- @namespace PIXI.groupD8
-- @memberof PIXI
____exports.groupD8 = {
    E = 0,
    SE = 1,
    S = 2,
    SW = 3,
    W = 4,
    NW = 5,
    N = 6,
    NE = 7,
    MIRROR_VERTICAL = 8,
    MAIN_DIAGONAL = 10,
    MIRROR_HORIZONTAL = 12,
    REVERSE_DIAGONAL = 14,
    uX = function(____, ind) return ux[ind + 1] end,
    uY = function(____, ind) return uy[ind + 1] end,
    vX = function(____, ind) return vx[ind + 1] end,
    vY = function(____, ind) return vy[ind + 1] end,
    inv = function(____, rotation)
        if bit.band(rotation, 8) ~= 0 then
            return bit.band(rotation, 15)
        end
        return bit.band(-rotation, 7)
    end,
    add = function(____, rotationSecond, rotationFirst) return rotationCayley[rotationSecond + 1][rotationFirst + 1] end,
    sub = function(____, rotationSecond, rotationFirst) return rotationCayley[rotationSecond + 1][____exports.groupD8:inv(rotationFirst) + 1] end,
    rotate180 = function(____, rotation) return bit.bxor(rotation, 4) end,
    isVertical = function(____, rotation) return bit.band(rotation, 3) == 2 end,
    byDirection = function(____, dx, dy)
        if math.abs(dx) * 2 <= math.abs(dy) then
            if dy >= 0 then
                return ____exports.groupD8.S
            end
            return ____exports.groupD8.N
        elseif math.abs(dy) * 2 <= math.abs(dx) then
            if dx > 0 then
                return ____exports.groupD8.E
            end
            return ____exports.groupD8.W
        elseif dy > 0 then
            if dx > 0 then
                return ____exports.groupD8.SE
            end
            return ____exports.groupD8.SW
        elseif dx > 0 then
            return ____exports.groupD8.NE
        end
        return ____exports.groupD8.NW
    end,
    matrixAppendRotationInv = function(____, matrix, rotation, tx, ty)
        if tx == nil then
            tx = 0
        end
        if ty == nil then
            ty = 0
        end
        local mat = rotationMatrices[____exports.groupD8:inv(rotation) + 1]
        mat.tx = tx
        mat.ty = ty
        matrix:append(mat)
    end
}
return ____exports
 end,
["math.index"] = function(...) 
--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
local ____exports = {}
local ____Circle = require("math.shapes.Circle")
local Circle = ____Circle.Circle
local ____Ellipse = require("math.shapes.Ellipse")
local Ellipse = ____Ellipse.Ellipse
local ____Polygon = require("math.shapes.Polygon")
local Polygon = ____Polygon.Polygon
local ____Rectangle = require("math.shapes.Rectangle")
local Rectangle = ____Rectangle.Rectangle
local ____RoundedRectangle = require("math.shapes.RoundedRectangle")
local RoundedRectangle = ____RoundedRectangle.RoundedRectangle
do
    local ____export = require("math.groupD8")
    for ____exportKey, ____exportValue in pairs(____export) do
        if ____exportKey ~= "default" then
            ____exports[____exportKey] = ____exportValue
        end
    end
end
do
    local ____export = require("math.Matrix")
    for ____exportKey, ____exportValue in pairs(____export) do
        if ____exportKey ~= "default" then
            ____exports[____exportKey] = ____exportValue
        end
    end
end
do
    local ____export = require("math.ObservablePoint")
    for ____exportKey, ____exportValue in pairs(____export) do
        if ____exportKey ~= "default" then
            ____exports[____exportKey] = ____exportValue
        end
    end
end
do
    local ____export = require("math.Point")
    for ____exportKey, ____exportValue in pairs(____export) do
        if ____exportKey ~= "default" then
            ____exports[____exportKey] = ____exportValue
        end
    end
end
do
    local ____export = require("math.Transform")
    for ____exportKey, ____exportValue in pairs(____export) do
        if ____exportKey ~= "default" then
            ____exports[____exportKey] = ____exportValue
        end
    end
end
____exports.Circle = Circle
____exports.Ellipse = Ellipse
____exports.Polygon = Polygon
____exports.Rectangle = Rectangle
____exports.RoundedRectangle = RoundedRectangle
do
    local ____export = require("math.const")
    for ____exportKey, ____exportValue in pairs(____export) do
        if ____exportKey ~= "default" then
            ____exports[____exportKey] = ____exportValue
        end
    end
end
return ____exports
 end,
["index"] = function(...) 
local ____lualib = require("lualib_bundle")
local __TS__New = ____lualib.__TS__New
local ____exports = {}
local ____math = require("math.index")
local Rectangle = ____math.Rectangle
function ____exports.setup(self)
    print(__TS__New(
        Rectangle,
        1,
        0,
        10,
        10
    ))
end
return ____exports
 end,
}
return require("index", ...)
