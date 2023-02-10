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
["typedarray.index"] = function(...) 
local ____lualib = require("lualib_bundle")
local __TS__StringReplace = ____lualib.__TS__StringReplace
local __TS__ObjectDefineProperty = ____lualib.__TS__ObjectDefineProperty
local __TS__Number = ____lualib.__TS__Number
local __TS__ArrayReverse = ____lualib.__TS__ArrayReverse
local __TS__StringSubstring = ____lualib.__TS__StringSubstring
local __TS__ParseInt = ____lualib.__TS__ParseInt
local __TS__Class = ____lualib.__TS__Class
local Error = ____lualib.Error
local RangeError = ____lualib.RangeError
local ReferenceError = ____lualib.ReferenceError
local SyntaxError = ____lualib.SyntaxError
local TypeError = ____lualib.TypeError
local URIError = ____lualib.URIError
local __TS__New = ____lualib.__TS__New
local __TS__ArraySetLength = ____lualib.__TS__ArraySetLength
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
local __TS__InstanceOf = ____lualib.__TS__InstanceOf
local ____exports = {}
local globalNamespace = _G
local MAX_ARRAY_LENGTH = 100000
local function toString(____, o)
    return tostring(o)
end
---
-- @noSelf
local function ECMA_Class(v)
    return __TS__StringReplace(
        __TS__StringReplace(
            toString(nil, v),
            "[object ",
            ""
        ),
        "]",
        ""
    )
end
---
-- @noSelf
local function ECMA_ToInt32(v)
    if v == nil then
        v = 0
    end
    return bit.arshift(v, 0)
end
---
-- @noSelf
local function ECMA_ToUint32(v)
    if v == nil then
        v = 0
    end
    return bit.rshift(v, 0)
end
local LN2 = 0.6931471805599453
---
-- @noSelf
local function clamp(v, minimum, max)
    return v < minimum and minimum or (v > max and max or v)
end
local function defineProp(____, o, prop, descriptor)
    return __TS__ObjectDefineProperty(o, prop, descriptor)
end
local function as_signed(self, value, bits)
    local s = 32 - bits
    return bit.arshift(
        bit.lshift(value, s),
        s
    )
end
local function as_unsigned(self, value, bits)
    local s = 32 - bits
    return bit.rshift(
        bit.lshift(value, s),
        s
    )
end
local function packI8(self, n)
    return {bit.band(n, 255)}
end
local function unpackI8(self, bytes)
    return as_signed(nil, bytes[1], 8)
end
local function packU8(self, n)
    return {bit.band(n, 255)}
end
local function unpackU8(self, bytes)
    return as_unsigned(nil, bytes[1], 8)
end
local function packU8Clamped(self, n)
    n = math.floor(__TS__Number(n) + 0.5)
    return {n < 0 and 0 or (n > 255 and 255 or bit.band(n, 255))}
end
local function packI16(self, n)
    return {
        bit.band(
            bit.arshift(n, 8),
            255
        ),
        bit.band(n, 255)
    }
end
local function unpackI16(self, bytes)
    return as_signed(
        nil,
        bit.bor(
            bit.lshift(bytes[1], 8),
            bytes[2]
        ),
        16
    )
end
local function packU16(self, n)
    return {
        bit.band(
            bit.arshift(n, 8),
            255
        ),
        bit.band(n, 255)
    }
end
local function unpackU16(self, bytes)
    return as_unsigned(
        nil,
        bit.bor(
            bit.lshift(bytes[1], 8),
            bytes[2]
        ),
        16
    )
end
local function packI32(self, n)
    return {
        bit.band(
            bit.arshift(n, 24),
            255
        ),
        bit.band(
            bit.arshift(n, 16),
            255
        ),
        bit.band(
            bit.arshift(n, 8),
            255
        ),
        bit.band(n, 255)
    }
end
local function unpackI32(self, bytes)
    return as_signed(
        nil,
        bit.bor(
            bit.bor(
                bit.bor(
                    bit.lshift(bytes[1], 24),
                    bit.lshift(bytes[2], 16)
                ),
                bit.lshift(bytes[3], 8)
            ),
            bytes[4]
        ),
        32
    )
end
local function packU32(self, n)
    return {
        bit.band(
            bit.arshift(n, 24),
            255
        ),
        bit.band(
            bit.arshift(n, 16),
            255
        ),
        bit.band(
            bit.arshift(n, 8),
            255
        ),
        bit.band(n, 255)
    }
end
local function unpackU32(self, bytes)
    return as_unsigned(
        nil,
        bit.bor(
            bit.bor(
                bit.bor(
                    bit.lshift(bytes[1], 24),
                    bit.lshift(bytes[2], 16)
                ),
                bit.lshift(bytes[3], 8)
            ),
            bytes[4]
        ),
        32
    )
end
local function packIEEE754(self, v, ebits, fbits)
    local bias = bit.lshift(1, ebits - 1) - 1
    local s
    local e
    local f
    local i
    local bytes
    local str = ""
    local function roundToEven(self, n)
        local w = math.floor(n)
        local fl = n - w
        if fl < 0.5 then
            return w
        end
        if fl > 0.5 then
            return w + 1
        end
        return w % 2 ~= 0 and w + 1 or w
    end
    if v ~= v then
        e = bit.lshift(1, ebits) - 1
        f = 2 ^ (fbits - 1)
        s = 0
    elseif v == math.huge or v == -math.huge then
        e = bit.lshift(1, ebits) - 1
        f = 0
        s = v < 0 and 1 or 0
    elseif v == 0 then
        e = 0
        f = 0
        s = 1 / v == -math.huge and 1 or 0
    else
        s = v < 0
        v = math.abs(v)
        if v >= 2 ^ (1 - bias) then
            e = math.min(
                math.floor(math.log(v) / LN2),
                1023
            )
            f = roundToEven(nil, v / 2 ^ e * 2 ^ fbits)
            if f / 2 ^ fbits >= 2 then
                e = e + 1
                f = 1
            end
            if e > bias then
                e = bit.lshift(1, ebits) - 1
                f = 0
            else
                e = e + bias
                f = f - 2 ^ fbits
            end
        else
            e = 0
            f = roundToEven(nil, v / 2 ^ (1 - bias - fbits))
        end
    end
    local bits = {}
    do
        i = fbits
        while i > 0 do
            bits[#bits + 1] = f % 2 ~= 0 and 1 or 0
            f = math.floor(f / 2)
            i = i - 1
        end
    end
    do
        i = ebits
        while i > 0 do
            bits[#bits + 1] = e % 2 ~= 0 and 1 or 0
            e = math.floor(e / 2)
            i = i - 1
        end
    end
    bits[#bits + 1] = s and 1 or 0
    __TS__ArrayReverse(bits)
    str = table.concat(bits, "")
    bytes = {}
    while #str > 0 do
        bytes[#bytes + 1] = __TS__ParseInt(
            __TS__StringSubstring(str, 0, 8),
            2
        )
        str = __TS__StringSubstring(str, 8)
    end
    return bytes
end
local function unpackIEEE754(self, bytes, ebits, fbits)
    local bits = {}
    local i
    local j
    local b
    local str
    local bias
    local s
    local e
    local f
    do
        i = #bytes
        while i do
            b = bytes[i]
            do
                j = 8
                while j do
                    bits[#bits + 1] = b % 2 ~= 0 and 1 or 0
                    b = bit.arshift(b, 1)
                    j = j - 1
                end
            end
            i = i - 1
        end
    end
    __TS__ArrayReverse(bits)
    str = table.concat(bits, "")
    bias = bit.lshift(1, ebits - 1) - 1
    s = __TS__ParseInt(
        __TS__StringSubstring(str, 0, 1),
        2
    ) ~= 0 and -1 or 1
    e = __TS__ParseInt(
        __TS__StringSubstring(str, 1, 1 + ebits),
        2
    )
    f = __TS__ParseInt(
        __TS__StringSubstring(str, 1 + ebits),
        2
    )
    if e == bit.lshift(1, ebits) - 1 then
        return f == 0 and s * math.huge or 0 / 0
    elseif e > 0 then
        return s * 2 ^ (e - bias) * (1 + f / 2 ^ fbits)
    elseif f ~= 0 then
        return s * 2 ^ (-(bias - 1)) * (f / 2 ^ fbits)
    end
    return s < 0 and -0 or 0
end
local function unpackF64(self, b)
    return unpackIEEE754(nil, b, 11, 52)
end
local function packF64(self, v)
    return packIEEE754(nil, v, 11, 52)
end
local function unpackF32(self, b)
    return unpackIEEE754(nil, b, 8, 23)
end
local function packF32(self, v)
    return packIEEE754(nil, v, 8, 23)
end
local ArrayBufferClass = __TS__Class()
ArrayBufferClass.name = "ArrayBufferClass"
function ArrayBufferClass.prototype.____constructor(self, length)
    length = ECMA_ToInt32(length)
    if length < 0 then
        error(
            __TS__New(RangeError, "ArrayBufferClass size is not a small enough positive integer"),
            0
        )
    end
    self.byteLength = length
    self._bytes = {}
    __TS__ArraySetLength(self._bytes, length)
    do
        local i = 0
        while i < self.byteLength do
            self._bytes[i + 1] = 0
            i = i + 1
        end
    end
end
globalNamespace.ArrayBuffer = ArrayBufferClass
local ArrayBufferView = __TS__Class()
ArrayBufferView.name = "ArrayBufferView"
function ArrayBufferView.prototype.____constructor(self, buffer, byteOffset, byteLength)
    self.buffer = buffer
    self.byteOffset = byteOffset
    self.byteLength = byteLength
end
local function makeConstructor(self, bytesPerElement, pack, ____unpack)
    local TypedArrayClass = __TS__Class()
    TypedArrayClass.name = "TypedArrayClass"
    __TS__ClassExtends(TypedArrayClass, ArrayBufferView)
    function TypedArrayClass.prototype.____constructor(self, buffer, byteOffset, length)
        self.BYTES_PER_ELEMENT = bytesPerElement
        self._pack = pack
        self._unpack = ____unpack
        self.get = self._getter
        local i
        local s
        if type(buffer) == "number" then
            local ownLength = length or 0
            if ownLength < 0 then
                error(
                    __TS__New(RangeError, "ArrayBufferView size is not a small enough positive integer"),
                    0
                )
            end
            local byteLength = ownLength * bytesPerElement
            ArrayBufferView.prototype.____constructor(
                self,
                __TS__New(ArrayBuffer, byteLength),
                0,
                ownLength
            )
            self.byteLength = byteLength
            self.length = ECMA_ToInt32(buffer)
        elseif type(buffer) == "table" and buffer.constructor == TypedArrayClass then
            local length = buffer.length
            local byteLength = length * bytesPerElement
            local ownBuffer = __TS__New(ArrayBuffer, byteLength)
            ArrayBufferView.prototype.____constructor(self, ownBuffer, 0, byteLength)
            self.length = length
            do
                i = 0
                while i < self.length do
                    self:_setter(
                        i,
                        buffer:_getter(i)
                    )
                    i = i + 1
                end
            end
        elseif type(buffer) == "table" and not (__TS__InstanceOf(buffer, ArrayBuffer) or ECMA_Class(buffer) == "ArrayBuffer") then
            local sequence = buffer
            local length = ECMA_ToUint32(sequence.length)
            local byteLength = length * bytesPerElement
            local ownBuffer = __TS__New(ArrayBuffer, byteLength)
            ArrayBufferView.prototype.____constructor(self, ownBuffer, 0, byteLength)
            self.length = length
            do
                local i = 0
                while i < self.length do
                    s = sequence[i]
                    self:_setter(
                        i,
                        __TS__Number(s)
                    )
                    i = i + 1
                end
            end
        elseif type(buffer) == "table" and (__TS__InstanceOf(buffer, ArrayBuffer) or ECMA_Class(buffer) == "ArrayBuffer") then
            ArrayBufferView.prototype.____constructor(
                self,
                buffer,
                ECMA_ToUint32(byteOffset),
                buffer.byteLength
            )
            if self.byteOffset > self.buffer.byteLength then
                error(
                    __TS__New(RangeError, "byteOffset out of range"),
                    0
                )
            end
            if self.byteOffset % self.BYTES_PER_ELEMENT ~= 0 then
                error(
                    __TS__New(RangeError, "ArrayBuffer length minus the byteOffset is not a multiple of the element size."),
                    0
                )
            end
            if length == nil then
                self.byteLength = self.buffer.byteLength - self.byteOffset
                if self.byteLength % self.BYTES_PER_ELEMENT ~= 0 then
                    error(
                        __TS__New(RangeError, "length of buffer minus byteOffset not a multiple of the element size"),
                        0
                    )
                end
                self.length = self.byteLength / self.BYTES_PER_ELEMENT
            else
                self.length = ECMA_ToUint32(length)
                self.byteLength = self.length * self.BYTES_PER_ELEMENT
            end
            if self.byteOffset + self.byteLength > self.buffer.byteLength then
                error(
                    __TS__New(RangeError, "byteOffset and length reference an area beyond the end of the buffer"),
                    0
                )
            end
        else
            error(
                __TS__New(TypeError, "Unexpected argument type(s)"),
                0
            )
        end
        self.constructor = TypedArrayClass
    end
    function TypedArrayClass.prototype.__index(self, key)
        if TypedArrayClass.prototype[key] ~= nil then
            return TypedArrayClass.prototype[key]
        end
        return self:_getter(key)
    end
    function TypedArrayClass.prototype.__newindex(self, key, value)
        if type(key) == "string" then
            rawset(self, key, value)
        else
            self:_setter(key, value)
        end
        return value
    end
    function TypedArrayClass.prototype._getter(self, index)
        index = ECMA_ToUint32(index)
        if index >= self.length then
            return 0
        end
        local buffer = self.buffer
        local bytes = {}
        do
            local i = 0
            local o = self.byteOffset + index * self.BYTES_PER_ELEMENT
            while i < self.BYTES_PER_ELEMENT do
                bytes[#bytes + 1] = buffer._bytes[o + 1]
                do
                    i = i + 1
                    o = o + 1
                end
            end
        end
        local _unpack = rawget(self, "_unpack")
        return _unpack(nil, bytes)
    end
    function TypedArrayClass.prototype._setter(self, index, value)
        index = ECMA_ToUint32(index)
        local length = rawget(self, "length")
        local _pack = rawget(self, "_pack")
        if index < length then
            local buffer = self.buffer
            local bytes = _pack(nil, value)
            local i = 0
            local o = self.byteOffset + index * self.BYTES_PER_ELEMENT
            do
                while i < self.BYTES_PER_ELEMENT do
                    buffer._bytes[o + 1] = bytes[i + 1]
                    do
                        i = i + 1
                        o = o + 1
                    end
                end
            end
        end
    end
    function TypedArrayClass.prototype.set(self, index, value)
        if arguments.length < 1 then
            error(
                __TS__New(SyntaxError, "Not enough arguments"),
                0
            )
        end
        local array
        local sequence
        local offset
        local len
        local i
        local s
        local d
        local byteOffset
        local byteLength
        local tmp
        if type(arguments[0]) == "table" and arguments[0].constructor == self.constructor then
            array = arguments[0]
            offset = ECMA_ToUint32(arguments[1])
            if offset + array.length > self.length then
                error(
                    __TS__New(RangeError, "Offset plus length of array is out of range"),
                    0
                )
            end
            byteOffset = self.byteOffset + offset * self.BYTES_PER_ELEMENT
            byteLength = array.length * self.BYTES_PER_ELEMENT
            if array.buffer == self.buffer then
                tmp = {}
                do
                    do
                        i = 0
                        s = array.byteOffset
                    end
                    while i < byteLength do
                        tmp[i + 1] = array.buffer._bytes[s]
                        do
                            i = i + 1
                            s = s + 1
                        end
                    end
                end
                do
                    do
                        i = 0
                        d = byteOffset
                    end
                    while i < byteLength do
                        self.buffer._bytes[d + 1] = tmp[i + 1]
                        do
                            i = i + 1
                            d = d + 1
                        end
                    end
                end
            else
                do
                    do
                        do
                            i = 0
                            s = array.byteOffset
                        end
                        d = byteOffset
                    end
                    while i < byteLength do
                        self.buffer._bytes[d + 1] = array.buffer._bytes[s]
                        do
                            do
                                i = i + 1
                                s = s + 1
                            end
                            d = d + 1
                        end
                    end
                end
            end
        elseif type(arguments[0]) == "table" and type(arguments[0].length) ~= "nil" then
            sequence = arguments[0]
            len = ECMA_ToUint32(sequence.length)
            offset = ECMA_ToUint32(arguments[1])
            if offset + len > self.length then
                error(
                    __TS__New(RangeError, "Offset plus length of array is out of range"),
                    0
                )
            end
            do
                i = 0
                while i < len do
                    s = sequence[i]
                    self:_setter(
                        offset + i,
                        __TS__Number(s)
                    )
                    i = i + 1
                end
            end
        else
            error(
                __TS__New(TypeError, "Unexpected argument type(s)"),
                0
            )
        end
    end
    function TypedArrayClass.prototype.subarray(self, start, ____end)
        start = ECMA_ToInt32(start)
        ____end = ECMA_ToInt32(____end)
        if arguments.length < 1 then
            start = 0
        end
        if arguments.length < 2 then
            ____end = self.length
        end
        if start < 0 then
            start = self.length + start
        end
        if ____end < 0 then
            ____end = self.length + ____end
        end
        start = clamp(start, 0, self.length)
        ____end = clamp(____end, 0, self.length)
        local len = ____end - start
        if len < 0 then
            len = 0
        end
        return __TS__New(TypedArrayClass, self.buffer, self.byteOffset + start * self.BYTES_PER_ELEMENT, len)
    end
    function TypedArrayClass.prototype.fill(self, value)
        print(vim.inspect({value, self.length, self.buffer}))
        do
            local i = 0
            while i < self.length do
                self:_setter(i, value)
                i = i + 1
            end
        end
    end
    TypedArrayClass.BYTES_PER_ELEMENT = bytesPerElement
    return TypedArrayClass
end
local ____makeConstructor_result_0 = makeConstructor(nil, 1, packI8, unpackI8)
globalNamespace.Int8Array = ____makeConstructor_result_0
____exports.Int8Array = ____makeConstructor_result_0
local ____makeConstructor_result_1 = makeConstructor(nil, 1, packU8, unpackU8)
globalNamespace.Uint8Array = ____makeConstructor_result_1
____exports.Uint8Array = ____makeConstructor_result_1
local ____makeConstructor_result_2 = makeConstructor(nil, 1, packU8Clamped, unpackU8)
globalNamespace.Uint8ClampedArray = ____makeConstructor_result_2
____exports.Uint8ClampedArray = ____makeConstructor_result_2
local ____makeConstructor_result_3 = makeConstructor(nil, 2, packI16, unpackI16)
globalNamespace.Int16Array = ____makeConstructor_result_3
____exports.Int16Array = ____makeConstructor_result_3
local ____makeConstructor_result_4 = makeConstructor(nil, 2, packU16, unpackU16)
globalNamespace.Uint16Array = ____makeConstructor_result_4
____exports.Uint16Array = ____makeConstructor_result_4
local ____makeConstructor_result_5 = makeConstructor(nil, 4, packI32, unpackI32)
globalNamespace.Int32Array = ____makeConstructor_result_5
____exports.Int32Array = ____makeConstructor_result_5
local ____makeConstructor_result_6 = makeConstructor(nil, 4, packU32, unpackU32)
globalNamespace.Uint32Array = ____makeConstructor_result_6
____exports.Uint32Array = ____makeConstructor_result_6
local ____makeConstructor_result_7 = makeConstructor(nil, 4, packF32, unpackF32)
globalNamespace.Float32Array = ____makeConstructor_result_7
____exports.Float32Array = ____makeConstructor_result_7
local ____makeConstructor_result_8 = makeConstructor(nil, 8, packF64, unpackF64)
globalNamespace.Float64Array = ____makeConstructor_result_8
____exports.Float64Array = ____makeConstructor_result_8
return ____exports
 end,
["colord.types"] = function(...) 
--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
local ____exports = {}
return ____exports
 end,
["colord.constants"] = function(...) 
--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
local ____exports = {}
--- We used to work with 2 digits after the decimal point, but it wasn't accurate enough,
-- so the library produced colors that were perceived differently.
____exports.ALPHA_PRECISION = 3
--- Valid CSS <angle> units.
-- https://developer.mozilla.org/en-US/docs/Web/CSS/angle
____exports.ANGLE_UNITS = {grad = 360 / 400, turn = 360, rad = 360 / (math.pi * 2)}
return ____exports
 end,
["colord.helpers"] = function(...) 
local ____lualib = require("lualib_bundle")
local __TS__Number = ____lualib.__TS__Number
local __TS__NumberIsFinite = ____lualib.__TS__NumberIsFinite
local ____exports = {}
local ____constants = require("colord.constants")
local ANGLE_UNITS = ____constants.ANGLE_UNITS
____exports.isPresent = function(____, value)
    if type(value) == "string" then
        return #value > 0
    end
    if type(value) == "number" then
        return true
    end
    return false
end
____exports.round = function(____, number, digits, base)
    if digits == nil then
        digits = 0
    end
    if base == nil then
        base = 10 ^ digits
    end
    return math.floor(base * number + 0.5) / base + 0
end
____exports.floor = function(____, number, digits, base)
    if digits == nil then
        digits = 0
    end
    if base == nil then
        base = 10 ^ digits
    end
    return math.floor(base * number) / base + 0
end
--- Clamps a value between an upper and lower bound.
-- We use ternary operators because it makes the minified code
-- is 2 times shorter then `Math.min(Math.max(a,b),c)`
-- NaN is clamped to the lower bound
____exports.clamp = function(____, number, min, max)
    if min == nil then
        min = 0
    end
    if max == nil then
        max = 1
    end
    return number > max and max or (number > min and number or min)
end
--- Processes and clamps a degree (angle) value properly.
-- Any `NaN` or `Infinity` will be converted to `0`.
-- Examples: -1 => 359, 361 => 1
____exports.clampHue = function(____, degrees)
    degrees = __TS__NumberIsFinite(__TS__Number(degrees)) and degrees % 360 or 0
    return degrees > 0 and degrees or degrees + 360
end
--- Converts a hue value to degrees from 0 to 360 inclusive.
____exports.parseHue = function(____, value, unit)
    if unit == nil then
        unit = "deg"
    end
    return __TS__Number(value) * (ANGLE_UNITS[unit] or 1)
end
return ____exports
 end,
["colord.colorModels.rgb"] = function(...) 
local ____lualib = require("lualib_bundle")
local __TS__Number = ____lualib.__TS__Number
local ____exports = {}
local ____constants = require("colord.constants")
local ALPHA_PRECISION = ____constants.ALPHA_PRECISION
local ____helpers = require("colord.helpers")
local round = ____helpers.round
local clamp = ____helpers.clamp
local isPresent = ____helpers.isPresent
____exports.clampRgba = function(____, rgba) return {
    r = clamp(nil, rgba.r, 0, 255),
    g = clamp(nil, rgba.g, 0, 255),
    b = clamp(nil, rgba.b, 0, 255),
    a = clamp(nil, rgba.a)
} end
____exports.roundRgba = function(____, rgba) return {
    r = round(nil, rgba.r),
    g = round(nil, rgba.g),
    b = round(nil, rgba.b),
    a = round(nil, rgba.a, ALPHA_PRECISION)
} end
____exports.parseRgba = function(____, ____bindingPattern0)
    local a
    local b
    local g
    local r
    r = ____bindingPattern0.r
    g = ____bindingPattern0.g
    b = ____bindingPattern0.b
    a = ____bindingPattern0.a
    if a == nil then
        a = 1
    end
    if not isPresent(nil, r) or not isPresent(nil, g) or not isPresent(nil, b) then
        return nil
    end
    return ____exports.clampRgba(
        nil,
        {
            r = __TS__Number(r),
            g = __TS__Number(g),
            b = __TS__Number(b),
            a = __TS__Number(a)
        }
    )
end
--- Converts an RGB channel [0-255] to its linear light (un-companded) form [0-1].
-- Linearized RGB values are widely used for color space conversions and contrast calculations
____exports.linearizeRgbChannel = function(____, value)
    local ratio = value / 255
    return ratio < 0.04045 and ratio / 12.92 or ((ratio + 0.055) / 1.055) ^ 2.4
end
--- Converts an linear-light sRGB channel [0-1] back to its gamma corrected form [0-255]
____exports.unlinearizeRgbChannel = function(____, ratio)
    local value = ratio > 0.0031308 and 1.055 * ratio ^ (1 / 2.4) - 0.055 or 12.92 * ratio
    return value * 255
end
return ____exports
 end,
["colord.colorModels.hex"] = function(...) 
local ____lualib = require("lualib_bundle")
local __TS__StringAccess = ____lualib.__TS__StringAccess
local __TS__ParseInt = ____lualib.__TS__ParseInt
local __TS__NumberToString = ____lualib.__TS__NumberToString
local ____exports = {}
local ____helpers = require("colord.helpers")
local round = ____helpers.round
local ____rgb = require("colord.colorModels.rgb")
local roundRgba = ____rgb.roundRgba
--- Parses any valid Hex3, Hex4, Hex6 or Hex8 string and converts it to an RGBA object
____exports.parseHex = function(____, input)
    local digits = string.sub(input, 2)
    if #digits <= 4 then
        return {
            r = __TS__ParseInt(
                __TS__StringAccess(digits, 0) .. __TS__StringAccess(digits, 0),
                16
            ),
            g = __TS__ParseInt(
                __TS__StringAccess(digits, 1) .. __TS__StringAccess(digits, 1),
                16
            ),
            b = __TS__ParseInt(
                __TS__StringAccess(digits, 2) .. __TS__StringAccess(digits, 2),
                16
            ),
            a = #digits == 4 and round(
                nil,
                __TS__ParseInt(
                    __TS__StringAccess(digits, 3) .. __TS__StringAccess(digits, 3),
                    16
                ) / 255,
                2
            ) or 1
        }
    end
    if #digits == 6 or #digits == 8 then
        return {
            r = __TS__ParseInt(
                string.sub(digits, 1, 2),
                16
            ),
            g = __TS__ParseInt(
                string.sub(digits, 3, 4),
                16
            ),
            b = __TS__ParseInt(
                string.sub(digits, 5, 6),
                16
            ),
            a = #digits == 8 and round(
                nil,
                __TS__ParseInt(
                    string.sub(digits, 7, 8),
                    16
                ) / 255,
                2
            ) or 1
        }
    end
    return nil
end
--- Formats any decimal number (e.g. 128) as a hexadecimal string (e.g. "08")
local function format(____, number)
    local digits = __TS__NumberToString(number, 16)
    return #digits < 2 and "0" .. digits or digits
end
--- Converts RGBA object to Hex6 or (if it has alpha channel) Hex8 string
____exports.rgbaToHex = function(____, rgba)
    local ____roundRgba_result_0 = roundRgba(nil, rgba)
    local r = ____roundRgba_result_0.r
    local g = ____roundRgba_result_0.g
    local b = ____roundRgba_result_0.b
    local a = ____roundRgba_result_0.a
    local alphaHex = a < 1 and format(
        nil,
        round(nil, a * 255)
    ) or ""
    return ((("#" .. format(nil, r)) .. format(nil, g)) .. format(nil, b)) .. alphaHex
end
return ____exports
 end,
["colord.colorModels.hsv"] = function(...) 
local ____lualib = require("lualib_bundle")
local __TS__Number = ____lualib.__TS__Number
local ____exports = {}
local ____constants = require("colord.constants")
local ALPHA_PRECISION = ____constants.ALPHA_PRECISION
local ____helpers = require("colord.helpers")
local clamp = ____helpers.clamp
local clampHue = ____helpers.clampHue
local isPresent = ____helpers.isPresent
local round = ____helpers.round
____exports.clampHsva = function(____, hsva) return {
    h = clampHue(nil, hsva.h),
    s = clamp(nil, hsva.s, 0, 100),
    v = clamp(nil, hsva.v, 0, 100),
    a = clamp(nil, hsva.a)
} end
____exports.roundHsva = function(____, hsva) return {
    h = round(nil, hsva.h),
    s = round(nil, hsva.s),
    v = round(nil, hsva.v),
    a = round(nil, hsva.a, ALPHA_PRECISION)
} end
____exports.parseHsva = function(____, ____bindingPattern0)
    local a
    local v
    local s
    local h
    h = ____bindingPattern0.h
    s = ____bindingPattern0.s
    v = ____bindingPattern0.v
    a = ____bindingPattern0.a
    if a == nil then
        a = 1
    end
    if not isPresent(nil, h) or not isPresent(nil, s) or not isPresent(nil, v) then
        return nil
    end
    local hsva = ____exports.clampHsva(
        nil,
        {
            h = __TS__Number(h),
            s = __TS__Number(s),
            v = __TS__Number(v),
            a = __TS__Number(a)
        }
    )
    return ____exports.hsvaToRgba(nil, hsva)
end
____exports.rgbaToHsva = function(____, ____bindingPattern0)
    local a
    local b
    local g
    local r
    r = ____bindingPattern0.r
    g = ____bindingPattern0.g
    b = ____bindingPattern0.b
    a = ____bindingPattern0.a
    local max = math.max(r, g, b)
    local delta = max - math.min(r, g, b)
    local hh = delta ~= 0 and (max == r and (g - b) / delta or (max == g and 2 + (b - r) / delta or 4 + (r - g) / delta)) or 0
    return {h = 60 * (hh < 0 and hh + 6 or hh), s = max ~= 0 and delta / max * 100 or 0, v = max / 255 * 100, a = a}
end
____exports.hsvaToRgba = function(____, ____bindingPattern0)
    local a
    local v
    local s
    local h
    h = ____bindingPattern0.h
    s = ____bindingPattern0.s
    v = ____bindingPattern0.v
    a = ____bindingPattern0.a
    h = h / 360 * 6
    s = s / 100
    v = v / 100
    local hh = math.floor(h)
    local b = v * (1 - s)
    local c = v * (1 - (h - hh) * s)
    local d = v * (1 - (1 - h + hh) * s)
    local module = hh % 6
    return {r = ({
        v,
        c,
        b,
        b,
        d,
        v
    })[module + 1] * 255, g = ({
        d,
        v,
        v,
        c,
        b,
        b
    })[module + 1] * 255, b = ({
        b,
        b,
        d,
        v,
        v,
        c
    })[module + 1] * 255, a = a}
end
return ____exports
 end,
["colord.colorModels.hsl"] = function(...) 
local ____lualib = require("lualib_bundle")
local __TS__Number = ____lualib.__TS__Number
local ____exports = {}
local ____constants = require("colord.constants")
local ALPHA_PRECISION = ____constants.ALPHA_PRECISION
local ____helpers = require("colord.helpers")
local clamp = ____helpers.clamp
local clampHue = ____helpers.clampHue
local round = ____helpers.round
local isPresent = ____helpers.isPresent
local ____hsv = require("colord.colorModels.hsv")
local hsvaToRgba = ____hsv.hsvaToRgba
local rgbaToHsva = ____hsv.rgbaToHsva
____exports.clampHsla = function(____, hsla) return {
    h = clampHue(nil, hsla.h),
    s = clamp(nil, hsla.s, 0, 100),
    l = clamp(nil, hsla.l, 0, 100),
    a = clamp(nil, hsla.a)
} end
____exports.roundHsla = function(____, hsla) return {
    h = round(nil, hsla.h),
    s = round(nil, hsla.s),
    l = round(nil, hsla.l),
    a = round(nil, hsla.a, ALPHA_PRECISION)
} end
____exports.parseHsla = function(____, ____bindingPattern0)
    local a
    local l
    local s
    local h
    h = ____bindingPattern0.h
    s = ____bindingPattern0.s
    l = ____bindingPattern0.l
    a = ____bindingPattern0.a
    if a == nil then
        a = 1
    end
    if not isPresent(nil, h) or not isPresent(nil, s) or not isPresent(nil, l) then
        return nil
    end
    local hsla = ____exports.clampHsla(
        nil,
        {
            h = __TS__Number(h),
            s = __TS__Number(s),
            l = __TS__Number(l),
            a = __TS__Number(a)
        }
    )
    return ____exports.hslaToRgba(nil, hsla)
end
____exports.hslaToHsva = function(____, ____bindingPattern0)
    local a
    local l
    local s
    local h
    h = ____bindingPattern0.h
    s = ____bindingPattern0.s
    l = ____bindingPattern0.l
    a = ____bindingPattern0.a
    s = s * ((l < 50 and l or 100 - l) / 100)
    return {h = h, s = s > 0 and 2 * s / (l + s) * 100 or 0, v = l + s, a = a}
end
____exports.hsvaToHsla = function(____, ____bindingPattern0)
    local a
    local v
    local s
    local h
    h = ____bindingPattern0.h
    s = ____bindingPattern0.s
    v = ____bindingPattern0.v
    a = ____bindingPattern0.a
    local hh = (200 - s) * v / 100
    return {h = h, s = hh > 0 and hh < 200 and s * v / 100 / (hh <= 100 and hh or 200 - hh) * 100 or 0, l = hh / 2, a = a}
end
____exports.hslaToRgba = function(____, hsla)
    return hsvaToRgba(
        nil,
        ____exports.hslaToHsva(nil, hsla)
    )
end
____exports.rgbaToHsla = function(____, rgba)
    return ____exports.hsvaToHsla(
        nil,
        rgbaToHsva(nil, rgba)
    )
end
return ____exports
 end,
["colord.colorModels.hslString"] = function(...) 
local ____lualib = require("lualib_bundle")
local Error = ____lualib.Error
local RangeError = ____lualib.RangeError
local ReferenceError = ____lualib.ReferenceError
local SyntaxError = ____lualib.SyntaxError
local TypeError = ____lualib.TypeError
local URIError = ____lualib.URIError
local __TS__New = ____lualib.__TS__New
local ____exports = {}
local ____hsl = require("colord.colorModels.hsl")
local rgbaToHsla = ____hsl.rgbaToHsla
local roundHsla = ____hsl.roundHsla
--- Parses a valid HSL[A] CSS color function/string
-- https://www.w3.org/TR/css-color-4/#the-hsl-notation
____exports.parseHslaString = function(____, input)
    error(
        __TS__New(Error, "unimplemented"),
        0
    )
end
____exports.rgbaToHslaString = function(____, rgba)
    local ____roundHsla_result_0 = roundHsla(
        nil,
        rgbaToHsla(nil, rgba)
    )
    local h = ____roundHsla_result_0.h
    local s = ____roundHsla_result_0.s
    local l = ____roundHsla_result_0.l
    local a = ____roundHsla_result_0.a
    return a < 1 and ((((((("hsla(" .. tostring(h)) .. ", ") .. tostring(s)) .. "%, ") .. tostring(l)) .. "%, ") .. tostring(a)) .. ")" or ((((("hsl(" .. tostring(h)) .. ", ") .. tostring(s)) .. "%, ") .. tostring(l)) .. "%)"
end
return ____exports
 end,
["colord.colorModels.rgbString"] = function(...) 
local ____lualib = require("lualib_bundle")
local __TS__StringTrim = ____lualib.__TS__StringTrim
local __TS__StringReplace = ____lualib.__TS__StringReplace
local __TS__StringSplit = ____lualib.__TS__StringSplit
local __TS__ArrayMap = ____lualib.__TS__ArrayMap
local __TS__Number = ____lualib.__TS__Number
local ____exports = {}
local ____rgb = require("colord.colorModels.rgb")
local roundRgba = ____rgb.roundRgba
local clampRgba = ____rgb.clampRgba
--- Parses a valid RGB[A] CSS color function/string
-- https://www.w3.org/TR/css-color-4/#rgb-functions
____exports.parseRgbaString = function(____, input)
    local parts = __TS__ArrayMap(
        __TS__StringSplit(
            __TS__StringReplace(
                __TS__StringReplace(
                    __TS__StringReplace(
                        __TS__StringTrim(input),
                        "rgba(",
                        ""
                    ),
                    "rgb(",
                    ""
                ),
                ")",
                ""
            ),
            ","
        ),
        function(____, p) return __TS__StringTrim(p) end
    )
    return clampRgba(
        nil,
        {
            r = __TS__Number(parts[2]),
            g = __TS__Number(parts[3]),
            b = __TS__Number(parts[4]),
            a = parts[5] == nil and 1 or __TS__Number(parts[5])
        }
    )
end
____exports.rgbaToRgbaString = function(____, rgba)
    local ____roundRgba_result_0 = roundRgba(nil, rgba)
    local r = ____roundRgba_result_0.r
    local g = ____roundRgba_result_0.g
    local b = ____roundRgba_result_0.b
    local a = ____roundRgba_result_0.a
    return a < 1 and ((((((("rgba(" .. tostring(r)) .. ", ") .. tostring(g)) .. ", ") .. tostring(b)) .. ", ") .. tostring(a)) .. ")" or ((((("rgb(" .. tostring(r)) .. ", ") .. tostring(g)) .. ", ") .. tostring(b)) .. ")"
end
return ____exports
 end,
["colord.parse"] = function(...) 
local ____lualib = require("lualib_bundle")
local __TS__StringTrim = ____lualib.__TS__StringTrim
local ____exports = {}
local ____hex = require("colord.colorModels.hex")
local parseHex = ____hex.parseHex
local ____rgb = require("colord.colorModels.rgb")
local parseRgba = ____rgb.parseRgba
local ____hsl = require("colord.colorModels.hsl")
local parseHsla = ____hsl.parseHsla
local ____hslString = require("colord.colorModels.hslString")
local parseHslaString = ____hslString.parseHslaString
local ____hsv = require("colord.colorModels.hsv")
local parseHsva = ____hsv.parseHsva
local ____rgbString = require("colord.colorModels.rgbString")
local parseRgbaString = ____rgbString.parseRgbaString
____exports.parsers = {string = {{parseHex, "hex"}, {parseRgbaString, "rgb"}, {parseHslaString, "hsl"}}, object = {{parseRgba, "rgb"}, {parseHsla, "hsl"}, {parseHsva, "hsv"}}}
local function findValidColor(____, input, parsers)
    do
        local index = 0
        while index < #parsers do
            local ____self_0 = parsers[index + 1]
            local result = ____self_0[1](____self_0, input)
            if result then
                return {result, parsers[index + 1][2]}
            end
            index = index + 1
        end
    end
    return {nil, nil}
end
--- Tries to convert an incoming value into RGBA color by going through all color model parsers
____exports.parse = function(____, input)
    if type(input) == "string" then
        return findValidColor(
            nil,
            __TS__StringTrim(input),
            ____exports.parsers.string
        )
    end
    if type(input) == "table" and input ~= nil then
        return findValidColor(nil, input, ____exports.parsers.object)
    end
    return {nil, nil}
end
--- Returns a color model name for the input passed to the function.
____exports.getFormat = function(____, input) return ____exports.parse(nil, input)[2] end
return ____exports
 end,
["colord.manipulate.changeAlpha"] = function(...) 
--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
local ____exports = {}
____exports.changeAlpha = function(____, rgba, a) return {r = rgba.r, g = rgba.g, b = rgba.b, a = a} end
return ____exports
 end,
["colord.manipulate.saturate"] = function(...) 
--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
local ____exports = {}
local ____hsl = require("colord.colorModels.hsl")
local rgbaToHsla = ____hsl.rgbaToHsla
local ____helpers = require("colord.helpers")
local clamp = ____helpers.clamp
____exports.saturate = function(____, rgba, amount)
    local hsla = rgbaToHsla(nil, rgba)
    return {
        h = hsla.h,
        s = clamp(nil, hsla.s + amount * 100, 0, 100),
        l = hsla.l,
        a = hsla.a
    }
end
return ____exports
 end,
["colord.get.getBrightness"] = function(...) 
--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
local ____exports = {}
--- Returns the brightness of a color [0-1].
-- https://www.w3.org/TR/AERT/#color-contrast
-- https://en.wikipedia.org/wiki/YIQ
____exports.getBrightness = function(____, rgba)
    return (rgba.r * 299 + rgba.g * 587 + rgba.b * 114) / 1000 / 255
end
return ____exports
 end,
["colord.manipulate.lighten"] = function(...) 
--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
local ____exports = {}
local ____hsl = require("colord.colorModels.hsl")
local rgbaToHsla = ____hsl.rgbaToHsla
local ____helpers = require("colord.helpers")
local clamp = ____helpers.clamp
____exports.lighten = function(____, rgba, amount)
    local hsla = rgbaToHsla(nil, rgba)
    return {
        h = hsla.h,
        s = hsla.s,
        l = clamp(nil, hsla.l + amount * 100, 0, 100),
        a = hsla.a
    }
end
return ____exports
 end,
["colord.manipulate.invert"] = function(...) 
--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
local ____exports = {}
____exports.invert = function(____, rgba) return {r = 255 - rgba.r, g = 255 - rgba.g, b = 255 - rgba.b, a = rgba.a} end
return ____exports
 end,
["colord.colord"] = function(...) 
local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__InstanceOf = ____lualib.__TS__InstanceOf
local __TS__New = ____lualib.__TS__New
local ____exports = {}
local ____helpers = require("colord.helpers")
local round = ____helpers.round
local ____constants = require("colord.constants")
local ALPHA_PRECISION = ____constants.ALPHA_PRECISION
local ____parse = require("colord.parse")
local parse = ____parse.parse
local ____hex = require("colord.colorModels.hex")
local rgbaToHex = ____hex.rgbaToHex
local ____rgb = require("colord.colorModels.rgb")
local roundRgba = ____rgb.roundRgba
local ____rgbString = require("colord.colorModels.rgbString")
local rgbaToRgbaString = ____rgbString.rgbaToRgbaString
local ____hsl = require("colord.colorModels.hsl")
local rgbaToHsla = ____hsl.rgbaToHsla
local roundHsla = ____hsl.roundHsla
local ____hslString = require("colord.colorModels.hslString")
local rgbaToHslaString = ____hslString.rgbaToHslaString
local ____hsv = require("colord.colorModels.hsv")
local rgbaToHsva = ____hsv.rgbaToHsva
local roundHsva = ____hsv.roundHsva
local ____changeAlpha = require("colord.manipulate.changeAlpha")
local changeAlpha = ____changeAlpha.changeAlpha
local ____saturate = require("colord.manipulate.saturate")
local saturate = ____saturate.saturate
local ____getBrightness = require("colord.get.getBrightness")
local getBrightness = ____getBrightness.getBrightness
local ____lighten = require("colord.manipulate.lighten")
local lighten = ____lighten.lighten
local ____invert = require("colord.manipulate.invert")
local invert = ____invert.invert
____exports.Colord = __TS__Class()
local Colord = ____exports.Colord
Colord.name = "Colord"
function Colord.prototype.____constructor(self, input)
    self.parsed = parse(nil, input)[1]
    self.rgba = self.parsed or ({r = 0, g = 0, b = 0, a = 1})
end
function Colord.prototype.isValid(self)
    return self.parsed ~= nil
end
function Colord.prototype.brightness(self)
    return round(
        nil,
        getBrightness(nil, self.rgba),
        2
    )
end
function Colord.prototype.isDark(self)
    return getBrightness(nil, self.rgba) < 0.5
end
function Colord.prototype.isLight(self)
    return getBrightness(nil, self.rgba) >= 0.5
end
function Colord.prototype.toHex(self)
    return rgbaToHex(nil, self.rgba)
end
function Colord.prototype.toRgb(self)
    return roundRgba(nil, self.rgba)
end
function Colord.prototype.toRgbString(self)
    return rgbaToRgbaString(nil, self.rgba)
end
function Colord.prototype.toHsl(self)
    return roundHsla(
        nil,
        rgbaToHsla(nil, self.rgba)
    )
end
function Colord.prototype.toHslString(self)
    return rgbaToHslaString(nil, self.rgba)
end
function Colord.prototype.toHsv(self)
    return roundHsva(
        nil,
        rgbaToHsva(nil, self.rgba)
    )
end
function Colord.prototype.invert(self)
    return ____exports.colord(
        nil,
        invert(nil, self.rgba)
    )
end
function Colord.prototype.saturate(self, amount)
    if amount == nil then
        amount = 0.1
    end
    return ____exports.colord(
        nil,
        saturate(nil, self.rgba, amount)
    )
end
function Colord.prototype.desaturate(self, amount)
    if amount == nil then
        amount = 0.1
    end
    return ____exports.colord(
        nil,
        saturate(nil, self.rgba, -amount)
    )
end
function Colord.prototype.grayscale(self)
    return ____exports.colord(
        nil,
        saturate(nil, self.rgba, -1)
    )
end
function Colord.prototype.lighten(self, amount)
    if amount == nil then
        amount = 0.1
    end
    return ____exports.colord(
        nil,
        lighten(nil, self.rgba, amount)
    )
end
function Colord.prototype.darken(self, amount)
    if amount == nil then
        amount = 0.1
    end
    return ____exports.colord(
        nil,
        lighten(nil, self.rgba, -amount)
    )
end
function Colord.prototype.rotate(self, amount)
    if amount == nil then
        amount = 15
    end
    return self:hue(self:hue() + amount)
end
function Colord.prototype.alpha(self, value)
    if type(value) == "number" then
        return ____exports.colord(
            nil,
            changeAlpha(nil, self.rgba, value)
        )
    end
    return round(nil, self.rgba.a, ALPHA_PRECISION)
end
function Colord.prototype.hue(self, value)
    local hsla = rgbaToHsla(nil, self.rgba)
    if type(value) == "number" then
        return ____exports.colord(nil, {h = value, s = hsla.s, l = hsla.l, a = hsla.a})
    end
    return round(nil, hsla.h)
end
function Colord.prototype.isEqual(self, color)
    return self:toHex() == ____exports.colord(nil, color):toHex()
end
--- Parses the given input color and creates a new `Colord` instance.
-- See accepted input formats: https://github.com/omgovich/colord#color-parsing
____exports.colord = function(____, input)
    if __TS__InstanceOf(input, ____exports.Colord) then
        return input
    end
    return __TS__New(____exports.Colord, input)
end
return ____exports
 end,
["colord.extend"] = function(...) 
local ____lualib = require("lualib_bundle")
local __TS__ArrayIndexOf = ____lualib.__TS__ArrayIndexOf
local __TS__ArrayForEach = ____lualib.__TS__ArrayForEach
local ____exports = {}
local ____colord = require("colord.colord")
local Colord = ____colord.Colord
local ____parse = require("colord.parse")
local parsers = ____parse.parsers
local activePlugins = {}
____exports.extend = function(____, plugins)
    __TS__ArrayForEach(
        plugins,
        function(____, plugin)
            if __TS__ArrayIndexOf(activePlugins, plugin) < 0 then
                plugin(nil, Colord, parsers)
                activePlugins[#activePlugins + 1] = plugin
            end
        end
    )
end
return ____exports
 end,
["colord.random"] = function(...) 
local ____lualib = require("lualib_bundle")
local __TS__New = ____lualib.__TS__New
local ____exports = {}
local ____colord = require("colord.colord")
local Colord = ____colord.Colord
____exports.random = function()
    return __TS__New(
        Colord,
        {
            r = math.random() * 255,
            g = math.random() * 255,
            b = math.random() * 255
        }
    )
end
return ____exports
 end,
["colord.index"] = function(...) 
--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
local ____exports = {}
do
    local ____colord = require("colord.colord")
    local colord = ____colord.colord
    local Colord = ____colord.Colord
    ____exports.colord = colord
    ____exports.Colord = Colord
end
do
    local ____extend = require("colord.extend")
    local extend = ____extend.extend
    ____exports.extend = extend
end
do
    local ____parse = require("colord.parse")
    local getFormat = ____parse.getFormat
    ____exports.getFormat = getFormat
end
do
    local ____random = require("colord.random")
    local random = ____random.random
    ____exports.random = random
end
return ____exports
 end,
["colord.plugins.names"] = function(...) 
local ____lualib = require("lualib_bundle")
local __TS__New = ____lualib.__TS__New
local ____exports = {}
--- Plugin to work with named colors.
-- Adds a parser to read CSS color names and `toName` method.
-- See https://www.w3.org/TR/css-color-4/#named-colors
-- Supports 'transparent' string as defined in
-- https://drafts.csswg.org/css-color/#transparent-color
local function namesPlugin(____, ColordClass, parsers)
    local NAME_HEX_STORE = {
        white = "#ffffff",
        bisque = "#ffe4c4",
        blue = "#0000ff",
        cadetblue = "#5f9ea0",
        chartreuse = "#7fff00",
        chocolate = "#d2691e",
        coral = "#ff7f50",
        antiquewhite = "#faebd7",
        aqua = "#00ffff",
        azure = "#f0ffff",
        whitesmoke = "#f5f5f5",
        papayawhip = "#ffefd5",
        plum = "#dda0dd",
        blanchedalmond = "#ffebcd",
        black = "#000000",
        gold = "#ffd700",
        goldenrod = "#daa520",
        gainsboro = "#dcdcdc",
        cornsilk = "#fff8dc",
        cornflowerblue = "#6495ed",
        burlywood = "#deb887",
        aquamarine = "#7fffd4",
        beige = "#f5f5dc",
        crimson = "#dc143c",
        cyan = "#00ffff",
        darkblue = "#00008b",
        darkcyan = "#008b8b",
        darkgoldenrod = "#b8860b",
        darkkhaki = "#bdb76b",
        darkgray = "#a9a9a9",
        darkgreen = "#006400",
        darkgrey = "#a9a9a9",
        peachpuff = "#ffdab9",
        darkmagenta = "#8b008b",
        darkred = "#8b0000",
        darkorchid = "#9932cc",
        darkorange = "#ff8c00",
        darkslateblue = "#483d8b",
        gray = "#808080",
        darkslategray = "#2f4f4f",
        darkslategrey = "#2f4f4f",
        deeppink = "#ff1493",
        deepskyblue = "#00bfff",
        wheat = "#f5deb3",
        firebrick = "#b22222",
        floralwhite = "#fffaf0",
        ghostwhite = "#f8f8ff",
        darkviolet = "#9400d3",
        magenta = "#ff00ff",
        green = "#008000",
        dodgerblue = "#1e90ff",
        grey = "#808080",
        honeydew = "#f0fff0",
        hotpink = "#ff69b4",
        blueviolet = "#8a2be2",
        forestgreen = "#228b22",
        lawngreen = "#7cfc00",
        indianred = "#cd5c5c",
        indigo = "#4b0082",
        fuchsia = "#ff00ff",
        brown = "#a52a2a",
        maroon = "#800000",
        mediumblue = "#0000cd",
        lightcoral = "#f08080",
        darkturquoise = "#00ced1",
        lightcyan = "#e0ffff",
        ivory = "#fffff0",
        lightyellow = "#ffffe0",
        lightsalmon = "#ffa07a",
        lightseagreen = "#20b2aa",
        linen = "#faf0e6",
        mediumaquamarine = "#66cdaa",
        lemonchiffon = "#fffacd",
        lime = "#00ff00",
        khaki = "#f0e68c",
        mediumseagreen = "#3cb371",
        limegreen = "#32cd32",
        mediumspringgreen = "#00fa9a",
        lightskyblue = "#87cefa",
        lightblue = "#add8e6",
        midnightblue = "#191970",
        lightpink = "#ffb6c1",
        mistyrose = "#ffe4e1",
        moccasin = "#ffe4b5",
        mintcream = "#f5fffa",
        lightslategray = "#778899",
        lightslategrey = "#778899",
        navajowhite = "#ffdead",
        navy = "#000080",
        mediumvioletred = "#c71585",
        powderblue = "#b0e0e6",
        palegoldenrod = "#eee8aa",
        oldlace = "#fdf5e6",
        paleturquoise = "#afeeee",
        mediumturquoise = "#48d1cc",
        mediumorchid = "#ba55d3",
        rebeccapurple = "#663399",
        lightsteelblue = "#b0c4de",
        mediumslateblue = "#7b68ee",
        thistle = "#d8bfd8",
        tan = "#d2b48c",
        orchid = "#da70d6",
        mediumpurple = "#9370db",
        purple = "#800080",
        pink = "#ffc0cb",
        skyblue = "#87ceeb",
        springgreen = "#00ff7f",
        palegreen = "#98fb98",
        red = "#ff0000",
        yellow = "#ffff00",
        slateblue = "#6a5acd",
        lavenderblush = "#fff0f5",
        peru = "#cd853f",
        palevioletred = "#db7093",
        violet = "#ee82ee",
        teal = "#008080",
        slategray = "#708090",
        slategrey = "#708090",
        aliceblue = "#f0f8ff",
        darkseagreen = "#8fbc8f",
        darkolivegreen = "#556b2f",
        greenyellow = "#adff2f",
        seagreen = "#2e8b57",
        seashell = "#fff5ee",
        tomato = "#ff6347",
        silver = "#c0c0c0",
        sienna = "#a0522d",
        lavender = "#e6e6fa",
        lightgreen = "#90ee90",
        orange = "#ffa500",
        orangered = "#ff4500",
        steelblue = "#4682b4",
        royalblue = "#4169e1",
        turquoise = "#40e0d0",
        yellowgreen = "#9acd32",
        salmon = "#fa8072",
        saddlebrown = "#8b4513",
        sandybrown = "#f4a460",
        rosybrown = "#bc8f8f",
        darksalmon = "#e9967a",
        lightgoldenrodyellow = "#fafad2",
        snow = "#fffafa",
        lightgrey = "#d3d3d3",
        lightgray = "#d3d3d3",
        dimgray = "#696969",
        dimgrey = "#696969",
        olivedrab = "#6b8e23",
        olive = "#808000"
    }
    local HEX_NAME_STORE = {}
    for name in pairs(NAME_HEX_STORE) do
        HEX_NAME_STORE[NAME_HEX_STORE[name]] = name
    end
    local NAME_RGBA_STORE = {}
    local function getDistanceBetween(____, rgb1, rgb2)
        return (rgb1.r - rgb2.r) ^ 2 + (rgb1.g - rgb2.g) ^ 2 + (rgb1.b - rgb2.b) ^ 2
    end
    ColordClass.prototype.toName = function(self, options)
        if not self.rgba.a and not self.rgba.r and not self.rgba.g and not self.rgba.b then
            return "transparent"
        end
        local exactMatch = HEX_NAME_STORE[self:toHex()]
        if exactMatch ~= nil then
            return exactMatch
        end
        if options and options.closest then
            local rgba = self:toRgb()
            local minDistance = math.huge
            local closestMatch = "black"
            if not NAME_RGBA_STORE.length then
                for name in pairs(NAME_HEX_STORE) do
                    NAME_RGBA_STORE[name] = __TS__New(ColordClass, NAME_HEX_STORE[name]):toRgb()
                end
            end
            for name in pairs(NAME_HEX_STORE) do
                local distance = getDistanceBetween(nil, rgba, NAME_RGBA_STORE[name])
                if distance < minDistance then
                    minDistance = distance
                    closestMatch = name
                end
            end
            return closestMatch
        end
        return nil
    end
    local function parseColorName(____, input)
        local name = string.lower(input)
        local hex = name == "transparent" and "#0000" or NAME_HEX_STORE[name]
        if hex ~= nil then
            return __TS__New(ColordClass, hex):toRgb()
        end
        return nil
    end
    local ____parsers_string_2 = parsers.string
    ____parsers_string_2[#____parsers_string_2 + 1] = {parseColorName, "name"}
end
____exports.default = namesPlugin
return ____exports
 end,
["color.Color"] = function(...) 
local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__SetDescriptor = ____lualib.__TS__SetDescriptor
local __TS__InstanceOf = ____lualib.__TS__InstanceOf
local __TS__ArraySlice = ____lualib.__TS__ArraySlice
local __TS__New = ____lualib.__TS__New
local __TS__NumberToString = ____lualib.__TS__NumberToString
local __TS__StringSubstring = ____lualib.__TS__StringSubstring
local __TS__ArrayIsArray = ____lualib.__TS__ArrayIsArray
local __TS__ArrayEvery = ____lualib.__TS__ArrayEvery
local Error = ____lualib.Error
local RangeError = ____lualib.RangeError
local ReferenceError = ____lualib.ReferenceError
local SyntaxError = ____lualib.SyntaxError
local TypeError = ____lualib.TypeError
local URIError = ____lualib.URIError
local __TS__StringStartsWith = ____lualib.__TS__StringStartsWith
local ____exports = {}
local ____colord = require("colord.index")
local colord = ____colord.colord
local extend = ____colord.extend
local ____names = require("colord.plugins.names")
local namesPlugin = ____names.default
extend(nil, {namesPlugin})
--- Color utility class
-- 
-- @example import { Color } from 'pixi.js';
-- new Color('red').toArray(); // [1, 0, 0, 1]
-- new Color(0xff0000).toArray(); // [1, 0, 0, 1]
-- new Color('ff0000').toArray(); // [1, 0, 0, 1]
-- new Color('#f00').toArray(); // [1, 0, 0, 1]
-- new Color([1, 0, 0, 0.5]).toArray(); // [1, 0, 0, 0.5]
-- new Color([1, 1, 1]).toArray(); // [1, 1, 1, 1]
-- new Color('rgb(255, 0, 0, 0.5)').toArray(); // [1, 0, 0, 0.5]
-- new Color({h: 0, s: 100, l: 50, a: 0.5}).toArray(); // [1, 0, 0, 0.5]
-- new Color({h: 0, s: 100, v: 100, a: 0.5}).toArray(); // [1, 0, 0, 0.5]
-- @memberof PIXI
____exports.Color = __TS__Class()
local Color = ____exports.Color
Color.name = "Color"
function Color.prototype.____constructor(self, value)
    if value == nil then
        value = 16777215
    end
    self._components = {1, 1, 1, 1}
    self._value = -1
    self._int = -1
    self.value = value
end
__TS__SetDescriptor(
    Color.prototype,
    "red",
    {get = function(self)
        return self._components[1]
    end},
    true
)
__TS__SetDescriptor(
    Color.prototype,
    "green",
    {get = function(self)
        return self._components[2]
    end},
    true
)
__TS__SetDescriptor(
    Color.prototype,
    "blue",
    {get = function(self)
        return self._components[3]
    end},
    true
)
__TS__SetDescriptor(
    Color.prototype,
    "alpha",
    {get = function(self)
        return self._components[4]
    end},
    true
)
__TS__SetDescriptor(
    Color.prototype,
    "value",
    {
        get = function(self)
            return self._value
        end,
        set = function(self, value)
            if __TS__InstanceOf(value, ____exports.Color) then
                self._value = value._value
                self._int = value._int
                self._components = __TS__ArraySlice(value._components, 0)
            elseif self._value ~= value then
                self:normalize(value)
                self._value = value
            end
        end
    },
    true
)
function Color.prototype.setValue(self, value)
    self.value = value
    return self
end
function Color.prototype.toRgba(self)
    --- Normalized rgba component, floats from 0-1
    local r, g, b, a = unpack(self._components)
    return {r = r, g = g, b = b, a = a}
end
function Color.prototype.toRgb(self)
    --- Normalized rgba component, floats from 0-1
    local r, g, b = unpack(self._components)
    return {r = r, g = g, b = b}
end
function Color.prototype.toRgbaString(self)
    local r, g, b = unpack(self:toUint8RgbArray())
    return ((((((("rgba(" .. tostring(r)) .. ",") .. tostring(g)) .. ",") .. tostring(b)) .. ",") .. tostring(self.alpha)) .. ")"
end
function Color.prototype.toUint8RgbArray(self, out)
    --- Normalized rgba component, floats from 0-1
    local r, g, b = unpack(self._components)
    out = out or ({})
    out[1] = math.floor(r * 255 + 0.5)
    out[2] = math.floor(g * 255 + 0.5)
    out[3] = math.floor(b * 255 + 0.5)
    return out
end
function Color.prototype.toRgbArray(self, out)
    out = out or ({})
    --- Normalized rgba component, floats from 0-1
    local r, g, b = unpack(self._components)
    out[1] = r
    out[2] = g
    out[3] = b
    return out
end
function Color.prototype.toNumber(self)
    return self._int
end
function Color.prototype.toLittleEndianNumber(self)
    local value = self._int
    return bit.arshift(value, 16) + bit.band(value, 65280) + bit.lshift(
        bit.band(value, 255),
        16
    )
end
function Color.prototype.multiply(self, value)
    --- Normalized rgba component, floats from 0-1
    local r, g, b, a = unpack(____exports.Color.temp:setValue(value)._components)
    local ____self__components_0, ____1_1 = self._components, 1
    ____self__components_0[____1_1] = ____self__components_0[____1_1] * r
    local ____self__components_2, ____2_3 = self._components, 2
    ____self__components_2[____2_3] = ____self__components_2[____2_3] * g
    local ____self__components_4, ____3_5 = self._components, 3
    ____self__components_4[____3_5] = ____self__components_4[____3_5] * b
    local ____self__components_6, ____4_7 = self._components, 4
    ____self__components_6[____4_7] = ____self__components_6[____4_7] * a
    return self
end
function Color.prototype.toHex(self)
    local hexString = __TS__NumberToString(self._int, 16)
    return "#" .. __TS__StringSubstring("000000", 0, 6 - #hexString) .. hexString
end
function Color.prototype.toHexa(self)
    local alphaValue = math.floor(self._components[4] * 255 + 0.5)
    local alphaString = __TS__NumberToString(alphaValue, 16)
    return (self:toHex() .. __TS__StringSubstring("00", 0, 2 - #alphaString)) .. alphaString
end
function Color.prototype.setAlpha(self, alpha)
    self._components[4] = alpha
    return self
end
function Color.prototype.round(self, step)
    --- Normalized rgba component, floats from 0-1
    local r, g, b = unpack(self._components)
    self._components = {
        math.min(255, r / step * step),
        math.min(255, g / step * step),
        math.min(255, b / step * step)
    }
    return self
end
function Color.prototype.toArray(self, out)
    out = out or ({})
    --- Normalized rgba component, floats from 0-1
    local r, g, b, a = unpack(self._components)
    out[1] = r
    out[2] = g
    out[3] = b
    out[4] = a
    return out
end
function Color.prototype.normalize(self, value)
    local components
    if __TS__ArrayIsArray(value) or __TS__InstanceOf(value, Float32Array) then
        local values = value
        if #values < 3 and #values > 4 or not __TS__ArrayEvery(
            values,
            function(____, v) return v <= 1 and v >= 0 end
        ) then
            error(
                __TS__New(
                    Error,
                    "Color: invalid input: " .. vim.inspect(values)
                ),
                0
            )
        end
        local r, g, b, a = unpack(value)
        if a == nil then
            a = 1
        end
        components = {r, g, b, a}
    elseif (__TS__InstanceOf(value, Uint8Array) or __TS__InstanceOf(value, Uint8ClampedArray)) and value.length >= 3 and value.length <= 4 then
        local r, g, b, a = unpack(value)
        if a == nil then
            a = 255
        end
        components = {r / 255, g / 255, b / 255, a / 255}
    elseif type(value) == "string" or type(value) == "table" then
        if type(value) == "string" then
            if __TS__StringStartsWith(value, "#") then
                value = string.sub(value, 2)
            end
            if __TS__StringStartsWith(value, "0x") then
                value = string.sub(value, 3)
            end
            value = "#" .. value
        end
        local color = colord(nil, value)
        if color:isValid() then
            local ____color_rgba_8 = color.rgba
            local r = ____color_rgba_8.r
            local g = ____color_rgba_8.g
            local b = ____color_rgba_8.b
            local a = ____color_rgba_8.a
            components = {r / 255, g / 255, b / 255, a}
        end
    elseif type(value) == "number" and value >= 0 and value <= 16777215 then
        components = {
            bit.band(
                bit.arshift(value, 16),
                255
            ) / 255,
            bit.band(
                bit.arshift(value, 8),
                255
            ) / 255,
            bit.band(value, 255) / 255,
            1
        }
    end
    if components then
        local r, g, b = unpack(components)
        self._components = __TS__ArraySlice(components, 0)
        self._int = bit.lshift(r * 255, 16) + bit.lshift(g * 255, 8) + bit.bor(b * 255, 0)
    else
        error(
            __TS__New(
                Error,
                "Unable to convert color " .. tostring(value)
            ),
            0
        )
    end
end
Color.shared = __TS__New(____exports.Color)
Color.temp = __TS__New(____exports.Color)
return ____exports
 end,
["color.index"] = function(...) 
--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
local ____exports = {}
do
    local ____export = require("color.Color")
    for ____exportKey, ____exportValue in pairs(____export) do
        if ____exportKey ~= "default" then
            ____exports[____exportKey] = ____exportValue
        end
    end
end
return ____exports
 end,
["constants.index"] = function(...) 
--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
local ____exports = {}
--- Different types of environments for WebGL.
-- 
-- @static
-- @memberof PIXI
-- @name ENV
-- @enum *
-- @property {number} WEBGL_LEGACY - Used for older v1 WebGL devices. PixiJS will aim to ensure compatibility
-- with older / less advanced devices. If you experience unexplained flickering prefer this environment.
-- @property {number} WEBGL - Version 1 of WebGL
-- @property {number} WEBGL2 - Version 2 of WebGL
____exports.ENV = ENV or ({})
____exports.ENV.WEBGL_LEGACY = 0
____exports.ENV[____exports.ENV.WEBGL_LEGACY] = "WEBGL_LEGACY"
____exports.ENV.WEBGL = 1
____exports.ENV[____exports.ENV.WEBGL] = "WEBGL"
____exports.ENV.WEBGL2 = 2
____exports.ENV[____exports.ENV.WEBGL2] = "WEBGL2"
--- Constant to identify the Renderer Type.
-- 
-- @static
-- @memberof PIXI
-- @name RENDERER_TYPE
-- @enum *
-- @property {number} UNKNOWN - Unknown render type.
-- @property {number} WEBGL - WebGL render type.
-- @property {number} CANVAS - Canvas render type.
____exports.RENDERER_TYPE = RENDERER_TYPE or ({})
____exports.RENDERER_TYPE.UNKNOWN = 0
____exports.RENDERER_TYPE[____exports.RENDERER_TYPE.UNKNOWN] = "UNKNOWN"
____exports.RENDERER_TYPE.WEBGL = 1
____exports.RENDERER_TYPE[____exports.RENDERER_TYPE.WEBGL] = "WEBGL"
____exports.RENDERER_TYPE.CANVAS = 2
____exports.RENDERER_TYPE[____exports.RENDERER_TYPE.CANVAS] = "CANVAS"
--- Bitwise OR of masks that indicate the buffers to be cleared.
-- 
-- @static
-- @memberof PIXI
-- @name BUFFER_BITS
-- @enum *
-- @property {number} COLOR - Indicates the buffers currently enabled for color writing.
-- @property {number} DEPTH - Indicates the depth buffer.
-- @property {number} STENCIL - Indicates the stencil buffer.
____exports.BUFFER_BITS = BUFFER_BITS or ({})
____exports.BUFFER_BITS.COLOR = 16384
____exports.BUFFER_BITS[____exports.BUFFER_BITS.COLOR] = "COLOR"
____exports.BUFFER_BITS.DEPTH = 256
____exports.BUFFER_BITS[____exports.BUFFER_BITS.DEPTH] = "DEPTH"
____exports.BUFFER_BITS.STENCIL = 1024
____exports.BUFFER_BITS[____exports.BUFFER_BITS.STENCIL] = "STENCIL"
--- Various blend modes supported by PIXI.
-- 
-- IMPORTANT - The WebGL renderer only supports the NORMAL, ADD, MULTIPLY and SCREEN blend modes.
-- Anything else will silently act like NORMAL.
-- 
-- @memberof PIXI
-- @name BLEND_MODES
-- @enum *
-- @property {number} NORMAL -
-- @property {number} ADD -
-- @property {number} MULTIPLY -
-- @property {number} SCREEN -
-- @property {number} OVERLAY -
-- @property {number} DARKEN -
-- @property {number} LIGHTEN -
-- @property {number} COLOR_DODGE -
-- @property {number} COLOR_BURN -
-- @property {number} HARD_LIGHT -
-- @property {number} SOFT_LIGHT -
-- @property {number} DIFFERENCE -
-- @property {number} EXCLUSION -
-- @property {number} HUE -
-- @property {number} SATURATION -
-- @property {number} COLOR -
-- @property {number} LUMINOSITY -
-- @property {number} NORMAL_NPM -
-- @property {number} ADD_NPM -
-- @property {number} SCREEN_NPM -
-- @property {number} NONE -
-- @property {number} SRC_IN -
-- @property {number} SRC_OUT -
-- @property {number} SRC_ATOP -
-- @property {number} DST_OVER -
-- @property {number} DST_IN -
-- @property {number} DST_OUT -
-- @property {number} DST_ATOP -
-- @property {number} SUBTRACT -
-- @property {number} SRC_OVER -
-- @property {number} ERASE -
-- @property {number} XOR -
____exports.BLEND_MODES = BLEND_MODES or ({})
____exports.BLEND_MODES.NORMAL = 0
____exports.BLEND_MODES[____exports.BLEND_MODES.NORMAL] = "NORMAL"
____exports.BLEND_MODES.ADD = 1
____exports.BLEND_MODES[____exports.BLEND_MODES.ADD] = "ADD"
____exports.BLEND_MODES.MULTIPLY = 2
____exports.BLEND_MODES[____exports.BLEND_MODES.MULTIPLY] = "MULTIPLY"
____exports.BLEND_MODES.SCREEN = 3
____exports.BLEND_MODES[____exports.BLEND_MODES.SCREEN] = "SCREEN"
____exports.BLEND_MODES.OVERLAY = 4
____exports.BLEND_MODES[____exports.BLEND_MODES.OVERLAY] = "OVERLAY"
____exports.BLEND_MODES.DARKEN = 5
____exports.BLEND_MODES[____exports.BLEND_MODES.DARKEN] = "DARKEN"
____exports.BLEND_MODES.LIGHTEN = 6
____exports.BLEND_MODES[____exports.BLEND_MODES.LIGHTEN] = "LIGHTEN"
____exports.BLEND_MODES.COLOR_DODGE = 7
____exports.BLEND_MODES[____exports.BLEND_MODES.COLOR_DODGE] = "COLOR_DODGE"
____exports.BLEND_MODES.COLOR_BURN = 8
____exports.BLEND_MODES[____exports.BLEND_MODES.COLOR_BURN] = "COLOR_BURN"
____exports.BLEND_MODES.HARD_LIGHT = 9
____exports.BLEND_MODES[____exports.BLEND_MODES.HARD_LIGHT] = "HARD_LIGHT"
____exports.BLEND_MODES.SOFT_LIGHT = 10
____exports.BLEND_MODES[____exports.BLEND_MODES.SOFT_LIGHT] = "SOFT_LIGHT"
____exports.BLEND_MODES.DIFFERENCE = 11
____exports.BLEND_MODES[____exports.BLEND_MODES.DIFFERENCE] = "DIFFERENCE"
____exports.BLEND_MODES.EXCLUSION = 12
____exports.BLEND_MODES[____exports.BLEND_MODES.EXCLUSION] = "EXCLUSION"
____exports.BLEND_MODES.HUE = 13
____exports.BLEND_MODES[____exports.BLEND_MODES.HUE] = "HUE"
____exports.BLEND_MODES.SATURATION = 14
____exports.BLEND_MODES[____exports.BLEND_MODES.SATURATION] = "SATURATION"
____exports.BLEND_MODES.COLOR = 15
____exports.BLEND_MODES[____exports.BLEND_MODES.COLOR] = "COLOR"
____exports.BLEND_MODES.LUMINOSITY = 16
____exports.BLEND_MODES[____exports.BLEND_MODES.LUMINOSITY] = "LUMINOSITY"
____exports.BLEND_MODES.NORMAL_NPM = 17
____exports.BLEND_MODES[____exports.BLEND_MODES.NORMAL_NPM] = "NORMAL_NPM"
____exports.BLEND_MODES.ADD_NPM = 18
____exports.BLEND_MODES[____exports.BLEND_MODES.ADD_NPM] = "ADD_NPM"
____exports.BLEND_MODES.SCREEN_NPM = 19
____exports.BLEND_MODES[____exports.BLEND_MODES.SCREEN_NPM] = "SCREEN_NPM"
____exports.BLEND_MODES.NONE = 20
____exports.BLEND_MODES[____exports.BLEND_MODES.NONE] = "NONE"
____exports.BLEND_MODES.SRC_OVER = 0
____exports.BLEND_MODES[____exports.BLEND_MODES.SRC_OVER] = "SRC_OVER"
____exports.BLEND_MODES.SRC_IN = 21
____exports.BLEND_MODES[____exports.BLEND_MODES.SRC_IN] = "SRC_IN"
____exports.BLEND_MODES.SRC_OUT = 22
____exports.BLEND_MODES[____exports.BLEND_MODES.SRC_OUT] = "SRC_OUT"
____exports.BLEND_MODES.SRC_ATOP = 23
____exports.BLEND_MODES[____exports.BLEND_MODES.SRC_ATOP] = "SRC_ATOP"
____exports.BLEND_MODES.DST_OVER = 24
____exports.BLEND_MODES[____exports.BLEND_MODES.DST_OVER] = "DST_OVER"
____exports.BLEND_MODES.DST_IN = 25
____exports.BLEND_MODES[____exports.BLEND_MODES.DST_IN] = "DST_IN"
____exports.BLEND_MODES.DST_OUT = 26
____exports.BLEND_MODES[____exports.BLEND_MODES.DST_OUT] = "DST_OUT"
____exports.BLEND_MODES.DST_ATOP = 27
____exports.BLEND_MODES[____exports.BLEND_MODES.DST_ATOP] = "DST_ATOP"
____exports.BLEND_MODES.ERASE = 26
____exports.BLEND_MODES[____exports.BLEND_MODES.ERASE] = "ERASE"
____exports.BLEND_MODES.SUBTRACT = 28
____exports.BLEND_MODES[____exports.BLEND_MODES.SUBTRACT] = "SUBTRACT"
____exports.BLEND_MODES.XOR = 29
____exports.BLEND_MODES[____exports.BLEND_MODES.XOR] = "XOR"
--- Various webgl draw modes. These can be used to specify which GL drawMode to use
-- under certain situations and renderers.
-- 
-- @memberof PIXI
-- @static
-- @name DRAW_MODES
-- @enum *
-- @property {number} POINTS -
-- @property {number} LINES -
-- @property {number} LINE_LOOP -
-- @property {number} LINE_STRIP -
-- @property {number} TRIANGLES -
-- @property {number} TRIANGLE_STRIP -
-- @property {number} TRIANGLE_FAN -
____exports.DRAW_MODES = DRAW_MODES or ({})
____exports.DRAW_MODES.POINTS = 0
____exports.DRAW_MODES[____exports.DRAW_MODES.POINTS] = "POINTS"
____exports.DRAW_MODES.LINES = 1
____exports.DRAW_MODES[____exports.DRAW_MODES.LINES] = "LINES"
____exports.DRAW_MODES.LINE_LOOP = 2
____exports.DRAW_MODES[____exports.DRAW_MODES.LINE_LOOP] = "LINE_LOOP"
____exports.DRAW_MODES.LINE_STRIP = 3
____exports.DRAW_MODES[____exports.DRAW_MODES.LINE_STRIP] = "LINE_STRIP"
____exports.DRAW_MODES.TRIANGLES = 4
____exports.DRAW_MODES[____exports.DRAW_MODES.TRIANGLES] = "TRIANGLES"
____exports.DRAW_MODES.TRIANGLE_STRIP = 5
____exports.DRAW_MODES[____exports.DRAW_MODES.TRIANGLE_STRIP] = "TRIANGLE_STRIP"
____exports.DRAW_MODES.TRIANGLE_FAN = 6
____exports.DRAW_MODES[____exports.DRAW_MODES.TRIANGLE_FAN] = "TRIANGLE_FAN"
--- Various GL texture/resources formats.
-- 
-- @memberof PIXI
-- @static
-- @name FORMATS
-- @enum *
-- @property {number} [RGBA=6408] -
-- @property {number} [RGB=6407] -
-- @property {number} [RG=33319] -
-- @property {number} [RED=6403] -
-- @property {number} [RGBA_INTEGER=36249] -
-- @property {number} [RGB_INTEGER=36248] -
-- @property {number} [RG_INTEGER=33320] -
-- @property {number} [RED_INTEGER=36244] -
-- @property {number} [ALPHA=6406] -
-- @property {number} [LUMINANCE=6409] -
-- @property {number} [LUMINANCE_ALPHA=6410] -
-- @property {number} [DEPTH_COMPONENT=6402] -
-- @property {number} [DEPTH_STENCIL=34041] -
____exports.FORMATS = FORMATS or ({})
____exports.FORMATS.RGBA = 6408
____exports.FORMATS[____exports.FORMATS.RGBA] = "RGBA"
____exports.FORMATS.RGB = 6407
____exports.FORMATS[____exports.FORMATS.RGB] = "RGB"
____exports.FORMATS.RG = 33319
____exports.FORMATS[____exports.FORMATS.RG] = "RG"
____exports.FORMATS.RED = 6403
____exports.FORMATS[____exports.FORMATS.RED] = "RED"
____exports.FORMATS.RGBA_INTEGER = 36249
____exports.FORMATS[____exports.FORMATS.RGBA_INTEGER] = "RGBA_INTEGER"
____exports.FORMATS.RGB_INTEGER = 36248
____exports.FORMATS[____exports.FORMATS.RGB_INTEGER] = "RGB_INTEGER"
____exports.FORMATS.RG_INTEGER = 33320
____exports.FORMATS[____exports.FORMATS.RG_INTEGER] = "RG_INTEGER"
____exports.FORMATS.RED_INTEGER = 36244
____exports.FORMATS[____exports.FORMATS.RED_INTEGER] = "RED_INTEGER"
____exports.FORMATS.ALPHA = 6406
____exports.FORMATS[____exports.FORMATS.ALPHA] = "ALPHA"
____exports.FORMATS.LUMINANCE = 6409
____exports.FORMATS[____exports.FORMATS.LUMINANCE] = "LUMINANCE"
____exports.FORMATS.LUMINANCE_ALPHA = 6410
____exports.FORMATS[____exports.FORMATS.LUMINANCE_ALPHA] = "LUMINANCE_ALPHA"
____exports.FORMATS.DEPTH_COMPONENT = 6402
____exports.FORMATS[____exports.FORMATS.DEPTH_COMPONENT] = "DEPTH_COMPONENT"
____exports.FORMATS.DEPTH_STENCIL = 34041
____exports.FORMATS[____exports.FORMATS.DEPTH_STENCIL] = "DEPTH_STENCIL"
--- Various GL target types.
-- 
-- @memberof PIXI
-- @static
-- @name TARGETS
-- @enum *
-- @property {number} [TEXTURE_2D=3553] -
-- @property {number} [TEXTURE_CUBE_MAP=34067] -
-- @property {number} [TEXTURE_2D_ARRAY=35866] -
-- @property {number} [TEXTURE_CUBE_MAP_POSITIVE_X=34069] -
-- @property {number} [TEXTURE_CUBE_MAP_NEGATIVE_X=34070] -
-- @property {number} [TEXTURE_CUBE_MAP_POSITIVE_Y=34071] -
-- @property {number} [TEXTURE_CUBE_MAP_NEGATIVE_Y=34072] -
-- @property {number} [TEXTURE_CUBE_MAP_POSITIVE_Z=34073] -
-- @property {number} [TEXTURE_CUBE_MAP_NEGATIVE_Z=34074] -
____exports.TARGETS = TARGETS or ({})
____exports.TARGETS.TEXTURE_2D = 3553
____exports.TARGETS[____exports.TARGETS.TEXTURE_2D] = "TEXTURE_2D"
____exports.TARGETS.TEXTURE_CUBE_MAP = 34067
____exports.TARGETS[____exports.TARGETS.TEXTURE_CUBE_MAP] = "TEXTURE_CUBE_MAP"
____exports.TARGETS.TEXTURE_2D_ARRAY = 35866
____exports.TARGETS[____exports.TARGETS.TEXTURE_2D_ARRAY] = "TEXTURE_2D_ARRAY"
____exports.TARGETS.TEXTURE_CUBE_MAP_POSITIVE_X = 34069
____exports.TARGETS[____exports.TARGETS.TEXTURE_CUBE_MAP_POSITIVE_X] = "TEXTURE_CUBE_MAP_POSITIVE_X"
____exports.TARGETS.TEXTURE_CUBE_MAP_NEGATIVE_X = 34070
____exports.TARGETS[____exports.TARGETS.TEXTURE_CUBE_MAP_NEGATIVE_X] = "TEXTURE_CUBE_MAP_NEGATIVE_X"
____exports.TARGETS.TEXTURE_CUBE_MAP_POSITIVE_Y = 34071
____exports.TARGETS[____exports.TARGETS.TEXTURE_CUBE_MAP_POSITIVE_Y] = "TEXTURE_CUBE_MAP_POSITIVE_Y"
____exports.TARGETS.TEXTURE_CUBE_MAP_NEGATIVE_Y = 34072
____exports.TARGETS[____exports.TARGETS.TEXTURE_CUBE_MAP_NEGATIVE_Y] = "TEXTURE_CUBE_MAP_NEGATIVE_Y"
____exports.TARGETS.TEXTURE_CUBE_MAP_POSITIVE_Z = 34073
____exports.TARGETS[____exports.TARGETS.TEXTURE_CUBE_MAP_POSITIVE_Z] = "TEXTURE_CUBE_MAP_POSITIVE_Z"
____exports.TARGETS.TEXTURE_CUBE_MAP_NEGATIVE_Z = 34074
____exports.TARGETS[____exports.TARGETS.TEXTURE_CUBE_MAP_NEGATIVE_Z] = "TEXTURE_CUBE_MAP_NEGATIVE_Z"
--- Various GL data format types.
-- 
-- @memberof PIXI
-- @static
-- @name TYPES
-- @enum *
-- @property {number} [UNSIGNED_BYTE=5121] -
-- @property {number} [UNSIGNED_SHORT=5123] -
-- @property {number} [UNSIGNED_SHORT_5_6_5=33635] -
-- @property {number} [UNSIGNED_SHORT_4_4_4_4=32819] -
-- @property {number} [UNSIGNED_SHORT_5_5_5_1=32820] -
-- @property {number} [UNSIGNED_INT=5125] -
-- @property {number} [UNSIGNED_INT_10F_11F_11F_REV=35899] -
-- @property {number} [UNSIGNED_INT_2_10_10_10_REV=33640] -
-- @property {number} [UNSIGNED_INT_24_8=34042] -
-- @property {number} [UNSIGNED_INT_5_9_9_9_REV=35902] -
-- @property {number} [BYTE=5120] -
-- @property {number} [SHORT=5122] -
-- @property {number} [INT=5124] -
-- @property {number} [FLOAT=5126] -
-- @property {number} [FLOAT_32_UNSIGNED_INT_24_8_REV=36269] -
-- @property {number} [HALF_FLOAT=36193] -
____exports.TYPES = TYPES or ({})
____exports.TYPES.UNSIGNED_BYTE = 5121
____exports.TYPES[____exports.TYPES.UNSIGNED_BYTE] = "UNSIGNED_BYTE"
____exports.TYPES.UNSIGNED_SHORT = 5123
____exports.TYPES[____exports.TYPES.UNSIGNED_SHORT] = "UNSIGNED_SHORT"
____exports.TYPES.UNSIGNED_SHORT_5_6_5 = 33635
____exports.TYPES[____exports.TYPES.UNSIGNED_SHORT_5_6_5] = "UNSIGNED_SHORT_5_6_5"
____exports.TYPES.UNSIGNED_SHORT_4_4_4_4 = 32819
____exports.TYPES[____exports.TYPES.UNSIGNED_SHORT_4_4_4_4] = "UNSIGNED_SHORT_4_4_4_4"
____exports.TYPES.UNSIGNED_SHORT_5_5_5_1 = 32820
____exports.TYPES[____exports.TYPES.UNSIGNED_SHORT_5_5_5_1] = "UNSIGNED_SHORT_5_5_5_1"
____exports.TYPES.UNSIGNED_INT = 5125
____exports.TYPES[____exports.TYPES.UNSIGNED_INT] = "UNSIGNED_INT"
____exports.TYPES.UNSIGNED_INT_10F_11F_11F_REV = 35899
____exports.TYPES[____exports.TYPES.UNSIGNED_INT_10F_11F_11F_REV] = "UNSIGNED_INT_10F_11F_11F_REV"
____exports.TYPES.UNSIGNED_INT_2_10_10_10_REV = 33640
____exports.TYPES[____exports.TYPES.UNSIGNED_INT_2_10_10_10_REV] = "UNSIGNED_INT_2_10_10_10_REV"
____exports.TYPES.UNSIGNED_INT_24_8 = 34042
____exports.TYPES[____exports.TYPES.UNSIGNED_INT_24_8] = "UNSIGNED_INT_24_8"
____exports.TYPES.UNSIGNED_INT_5_9_9_9_REV = 35902
____exports.TYPES[____exports.TYPES.UNSIGNED_INT_5_9_9_9_REV] = "UNSIGNED_INT_5_9_9_9_REV"
____exports.TYPES.BYTE = 5120
____exports.TYPES[____exports.TYPES.BYTE] = "BYTE"
____exports.TYPES.SHORT = 5122
____exports.TYPES[____exports.TYPES.SHORT] = "SHORT"
____exports.TYPES.INT = 5124
____exports.TYPES[____exports.TYPES.INT] = "INT"
____exports.TYPES.FLOAT = 5126
____exports.TYPES[____exports.TYPES.FLOAT] = "FLOAT"
____exports.TYPES.FLOAT_32_UNSIGNED_INT_24_8_REV = 36269
____exports.TYPES[____exports.TYPES.FLOAT_32_UNSIGNED_INT_24_8_REV] = "FLOAT_32_UNSIGNED_INT_24_8_REV"
____exports.TYPES.HALF_FLOAT = 36193
____exports.TYPES[____exports.TYPES.HALF_FLOAT] = "HALF_FLOAT"
--- Various sampler types. Correspond to `sampler`, `isampler`, `usampler` GLSL types respectively.
-- WebGL1 works only with FLOAT.
-- 
-- @memberof PIXI
-- @static
-- @name SAMPLER_TYPES
-- @enum *
-- @property {number} [FLOAT=0] -
-- @property {number} [INT=1] -
-- @property {number} [UINT=2] -
____exports.SAMPLER_TYPES = SAMPLER_TYPES or ({})
____exports.SAMPLER_TYPES.FLOAT = 0
____exports.SAMPLER_TYPES[____exports.SAMPLER_TYPES.FLOAT] = "FLOAT"
____exports.SAMPLER_TYPES.INT = 1
____exports.SAMPLER_TYPES[____exports.SAMPLER_TYPES.INT] = "INT"
____exports.SAMPLER_TYPES.UINT = 2
____exports.SAMPLER_TYPES[____exports.SAMPLER_TYPES.UINT] = "UINT"
--- The scale modes that are supported by pixi.
-- 
-- The {_link PIXI.BaseTexture.defaultOptions.scaleMode} scale mode affects the default scaling mode of future operations.
-- It can be re-assigned to either LINEAR or NEAREST, depending upon suitability.
-- 
-- @memberof PIXI
-- @static
-- @name SCALE_MODES
-- @enum *
-- @property {number} LINEAR Smooth scaling
-- @property {number} NEAREST Pixelating scaling
____exports.SCALE_MODES = SCALE_MODES or ({})
____exports.SCALE_MODES.NEAREST = 0
____exports.SCALE_MODES[____exports.SCALE_MODES.NEAREST] = "NEAREST"
____exports.SCALE_MODES.LINEAR = 1
____exports.SCALE_MODES[____exports.SCALE_MODES.LINEAR] = "LINEAR"
--- The wrap modes that are supported by pixi.
-- 
-- The wrap mode affects the default wrapping mode of future operations.
-- It can be re-assigned to either CLAMP or REPEAT, depending upon suitability.
-- If the texture is non power of two then clamp will be used regardless as WebGL can
-- only use REPEAT if the texture is po2.
-- 
-- This property only affects WebGL.
-- 
-- @name WRAP_MODES
-- @memberof PIXI
-- @static
-- @enum *
-- @property {number} CLAMP - The textures uvs are clamped
-- @property {number} REPEAT - The texture uvs tile and repeat
-- @property {number} MIRRORED_REPEAT - The texture uvs tile and repeat with mirroring
____exports.WRAP_MODES = WRAP_MODES or ({})
____exports.WRAP_MODES.CLAMP = 33071
____exports.WRAP_MODES[____exports.WRAP_MODES.CLAMP] = "CLAMP"
____exports.WRAP_MODES.REPEAT = 10497
____exports.WRAP_MODES[____exports.WRAP_MODES.REPEAT] = "REPEAT"
____exports.WRAP_MODES.MIRRORED_REPEAT = 33648
____exports.WRAP_MODES[____exports.WRAP_MODES.MIRRORED_REPEAT] = "MIRRORED_REPEAT"
--- Mipmap filtering modes that are supported by pixi.
-- 
-- The {_link PIXI.BaseTexture.defaultOptions.mipmap} affects default texture filtering.
-- Mipmaps are generated for a baseTexture if its `mipmap` field is `ON`,
-- or its `POW2` and texture dimensions are powers of 2.
-- Since WebGL 1 don't support mipmap for non-power-of-two textures,
-- `ON` option will work like `POW2` for WebGL 1.
-- 
-- This property only affects WebGL.
-- 
-- @name MIPMAP_MODES
-- @memberof PIXI
-- @static
-- @enum *
-- @property {number} OFF - No mipmaps.
-- @property {number} POW2 - Generate mipmaps if texture dimensions are powers of 2.
-- @property {number} ON - Always generate mipmaps.
-- @property {number} ON_MANUAL - Use mipmaps, but do not auto-generate them;
-- this is used with a resource that supports buffering each level-of-detail.
____exports.MIPMAP_MODES = MIPMAP_MODES or ({})
____exports.MIPMAP_MODES.OFF = 0
____exports.MIPMAP_MODES[____exports.MIPMAP_MODES.OFF] = "OFF"
____exports.MIPMAP_MODES.POW2 = 1
____exports.MIPMAP_MODES[____exports.MIPMAP_MODES.POW2] = "POW2"
____exports.MIPMAP_MODES.ON = 2
____exports.MIPMAP_MODES[____exports.MIPMAP_MODES.ON] = "ON"
____exports.MIPMAP_MODES.ON_MANUAL = 3
____exports.MIPMAP_MODES[____exports.MIPMAP_MODES.ON_MANUAL] = "ON_MANUAL"
--- How to treat textures with premultiplied alpha
-- 
-- @name ALPHA_MODES
-- @memberof PIXI
-- @static
-- @enum *
-- @property {number} NO_PREMULTIPLIED_ALPHA - Source is not premultiplied, leave it like that.
-- Option for compressed and data textures that are created from typed arrays.
-- @property {number} PREMULTIPLY_ON_UPLOAD - Source is not premultiplied, premultiply on upload.
-- Default option, used for all loaded images.
-- @property {number} PREMULTIPLIED_ALPHA - Source is already premultiplied
-- Example: spine atlases with `_pma` suffix.
-- @property {number} NPM - Alias for NO_PREMULTIPLIED_ALPHA.
-- @property {number} UNPACK - Default option, alias for PREMULTIPLY_ON_UPLOAD.
-- @property {number} PMA - Alias for PREMULTIPLIED_ALPHA.
____exports.ALPHA_MODES = ALPHA_MODES or ({})
____exports.ALPHA_MODES.NPM = 0
____exports.ALPHA_MODES[____exports.ALPHA_MODES.NPM] = "NPM"
____exports.ALPHA_MODES.UNPACK = 1
____exports.ALPHA_MODES[____exports.ALPHA_MODES.UNPACK] = "UNPACK"
____exports.ALPHA_MODES.PMA = 2
____exports.ALPHA_MODES[____exports.ALPHA_MODES.PMA] = "PMA"
____exports.ALPHA_MODES.NO_PREMULTIPLIED_ALPHA = 0
____exports.ALPHA_MODES[____exports.ALPHA_MODES.NO_PREMULTIPLIED_ALPHA] = "NO_PREMULTIPLIED_ALPHA"
____exports.ALPHA_MODES.PREMULTIPLY_ON_UPLOAD = 1
____exports.ALPHA_MODES[____exports.ALPHA_MODES.PREMULTIPLY_ON_UPLOAD] = "PREMULTIPLY_ON_UPLOAD"
____exports.ALPHA_MODES.PREMULTIPLIED_ALPHA = 2
____exports.ALPHA_MODES[____exports.ALPHA_MODES.PREMULTIPLIED_ALPHA] = "PREMULTIPLIED_ALPHA"
--- Configure whether filter textures are cleared after binding.
-- 
-- Filter textures need not be cleared if the filter does not use pixel blending. {_link CLEAR_MODES.BLIT} will detect
-- this and skip clearing as an optimization.
-- 
-- @name CLEAR_MODES
-- @memberof PIXI
-- @static
-- @enum *
-- @property {number} BLEND - Do not clear the filter texture. The filter's output will blend on top of the output texture.
-- @property {number} CLEAR - Always clear the filter texture.
-- @property {number} BLIT - Clear only if {_link FilterSystem.forceClear} is set or if the filter uses pixel blending.
-- @property {number} NO - Alias for BLEND, same as `false` in earlier versions
-- @property {number} YES - Alias for CLEAR, same as `true` in earlier versions
-- @property {number} AUTO - Alias for BLIT
____exports.CLEAR_MODES = CLEAR_MODES or ({})
____exports.CLEAR_MODES.NO = 0
____exports.CLEAR_MODES[____exports.CLEAR_MODES.NO] = "NO"
____exports.CLEAR_MODES.YES = 1
____exports.CLEAR_MODES[____exports.CLEAR_MODES.YES] = "YES"
____exports.CLEAR_MODES.AUTO = 2
____exports.CLEAR_MODES[____exports.CLEAR_MODES.AUTO] = "AUTO"
____exports.CLEAR_MODES.BLEND = 0
____exports.CLEAR_MODES[____exports.CLEAR_MODES.BLEND] = "BLEND"
____exports.CLEAR_MODES.CLEAR = 1
____exports.CLEAR_MODES[____exports.CLEAR_MODES.CLEAR] = "CLEAR"
____exports.CLEAR_MODES.BLIT = 2
____exports.CLEAR_MODES[____exports.CLEAR_MODES.BLIT] = "BLIT"
--- The gc modes that are supported by pixi.
-- 
-- The {_link PIXI.TextureGCSystem.defaultMode} Garbage Collection mode for PixiJS textures is AUTO
-- If set to GC_MODE, the renderer will occasionally check textures usage. If they are not
-- used for a specified period of time they will be removed from the GPU. They will of course
-- be uploaded again when they are required. This is a silent behind the scenes process that
-- should ensure that the GPU does not  get filled up.
-- 
-- Handy for mobile devices!
-- This property only affects WebGL.
-- 
-- @name GC_MODES
-- @enum *
-- @static
-- @memberof PIXI
-- @property {number} AUTO - Garbage collection will happen periodically automatically
-- @property {number} MANUAL - Garbage collection will need to be called manually
____exports.GC_MODES = GC_MODES or ({})
____exports.GC_MODES.AUTO = 0
____exports.GC_MODES[____exports.GC_MODES.AUTO] = "AUTO"
____exports.GC_MODES.MANUAL = 1
____exports.GC_MODES[____exports.GC_MODES.MANUAL] = "MANUAL"
--- Constants that specify float precision in shaders.
-- 
-- @name PRECISION
-- @memberof PIXI
-- @static
-- @enum *
-- @property {string} [LOW='lowp'] -
-- @property {string} [MEDIUM='mediump'] -
-- @property {string} [HIGH='highp'] -
____exports.PRECISION = PRECISION or ({})
____exports.PRECISION.LOW = "lowp"
____exports.PRECISION.MEDIUM = "mediump"
____exports.PRECISION.HIGH = "highp"
--- Constants for mask implementations.
-- We use `type` suffix because it leads to very different behaviours
-- 
-- @name MASK_TYPES
-- @memberof PIXI
-- @static
-- @enum *
-- @property {number} NONE - Mask is ignored
-- @property {number} SCISSOR - Scissor mask, rectangle on screen, cheap
-- @property {number} STENCIL - Stencil mask, 1-bit, medium, works only if renderer supports stencil
-- @property {number} SPRITE - Mask that uses SpriteMaskFilter, uses temporary RenderTexture
-- @property {number} COLOR - Color mask (RGBA)
____exports.MASK_TYPES = MASK_TYPES or ({})
____exports.MASK_TYPES.NONE = 0
____exports.MASK_TYPES[____exports.MASK_TYPES.NONE] = "NONE"
____exports.MASK_TYPES.SCISSOR = 1
____exports.MASK_TYPES[____exports.MASK_TYPES.SCISSOR] = "SCISSOR"
____exports.MASK_TYPES.STENCIL = 2
____exports.MASK_TYPES[____exports.MASK_TYPES.STENCIL] = "STENCIL"
____exports.MASK_TYPES.SPRITE = 3
____exports.MASK_TYPES[____exports.MASK_TYPES.SPRITE] = "SPRITE"
____exports.MASK_TYPES.COLOR = 4
____exports.MASK_TYPES[____exports.MASK_TYPES.COLOR] = "COLOR"
--- Bitwise OR of masks that indicate the color channels that are rendered to.
-- 
-- @static
-- @memberof PIXI
-- @name COLOR_MASK_BITS
-- @enum *
-- @property {number} RED - Red channel.
-- @property {number} GREEN - Green channel
-- @property {number} BLUE - Blue channel.
-- @property {number} ALPHA - Alpha channel.
____exports.COLOR_MASK_BITS = COLOR_MASK_BITS or ({})
____exports.COLOR_MASK_BITS.RED = 1
____exports.COLOR_MASK_BITS[____exports.COLOR_MASK_BITS.RED] = "RED"
____exports.COLOR_MASK_BITS.GREEN = 2
____exports.COLOR_MASK_BITS[____exports.COLOR_MASK_BITS.GREEN] = "GREEN"
____exports.COLOR_MASK_BITS.BLUE = 4
____exports.COLOR_MASK_BITS[____exports.COLOR_MASK_BITS.BLUE] = "BLUE"
____exports.COLOR_MASK_BITS.ALPHA = 8
____exports.COLOR_MASK_BITS[____exports.COLOR_MASK_BITS.ALPHA] = "ALPHA"
--- Constants for multi-sampling antialiasing.
-- 
-- @see PIXI.Framebuffer#multisample *
-- @name MSAA_QUALITY
-- @memberof PIXI
-- @static
-- @enum *
-- @property {number} NONE - No multisampling for this renderTexture
-- @property {number} LOW - Try 2 samples
-- @property {number} MEDIUM - Try 4 samples
-- @property {number} HIGH - Try 8 samples
____exports.MSAA_QUALITY = MSAA_QUALITY or ({})
____exports.MSAA_QUALITY.NONE = 0
____exports.MSAA_QUALITY[____exports.MSAA_QUALITY.NONE] = "NONE"
____exports.MSAA_QUALITY.LOW = 2
____exports.MSAA_QUALITY[____exports.MSAA_QUALITY.LOW] = "LOW"
____exports.MSAA_QUALITY.MEDIUM = 4
____exports.MSAA_QUALITY[____exports.MSAA_QUALITY.MEDIUM] = "MEDIUM"
____exports.MSAA_QUALITY.HIGH = 8
____exports.MSAA_QUALITY[____exports.MSAA_QUALITY.HIGH] = "HIGH"
--- Constants for various buffer types in Pixi
-- 
-- @see PIXI.BUFFER_TYPE *
-- @name BUFFER_TYPE
-- @memberof PIXI
-- @static
-- @enum *
-- @property {number} ELEMENT_ARRAY_BUFFER - buffer type for using as an index buffer
-- @property {number} ARRAY_BUFFER - buffer type for using attribute data
-- @property {number} UNIFORM_BUFFER - the buffer type is for uniform buffer objects
____exports.BUFFER_TYPE = BUFFER_TYPE or ({})
____exports.BUFFER_TYPE.ELEMENT_ARRAY_BUFFER = 34963
____exports.BUFFER_TYPE[____exports.BUFFER_TYPE.ELEMENT_ARRAY_BUFFER] = "ELEMENT_ARRAY_BUFFER"
____exports.BUFFER_TYPE.ARRAY_BUFFER = 34962
____exports.BUFFER_TYPE[____exports.BUFFER_TYPE.ARRAY_BUFFER] = "ARRAY_BUFFER"
____exports.BUFFER_TYPE.UNIFORM_BUFFER = 35345
____exports.BUFFER_TYPE[____exports.BUFFER_TYPE.UNIFORM_BUFFER] = "UNIFORM_BUFFER"
return ____exports
 end,
["math.const"] = function(...) 
--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
local ____exports = {}
--- Two Pi.
-- 
-- @static
-- @member {number}
-- @memberof PIXI
____exports.TAU = math.pi * 2
____exports.PI_2 = ____exports.TAU
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
["runner.Runner"] = function(...) 
local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__SetDescriptor = ____lualib.__TS__SetDescriptor
local __TS__ArraySlice = ____lualib.__TS__ArraySlice
local __TS__ArrayIndexOf = ____lualib.__TS__ArrayIndexOf
local __TS__ArraySplice = ____lualib.__TS__ArraySplice
local __TS__ArrayIncludes = ____lualib.__TS__ArrayIncludes
local __TS__ArraySetLength = ____lualib.__TS__ArraySetLength
local ____exports = {}
--- A Runner is a highly performant and simple alternative to signals. Best used in situations
-- where events are dispatched to many objects at high frequency (say every frame!)
-- 
-- Like a signal:
-- 
-- ```js
-- import { Runner } from '@pixi/runner';
-- 
-- const myObject = {
--     loaded: new Runner('loaded'),
-- };
-- 
-- const listener = {
--     loaded: function() {
--         // Do something when loaded
--     }
-- };
-- 
-- myObject.loaded.add(listener);
-- 
-- myObject.loaded.emit();
-- ```
-- 
-- Or for handling calling the same function on many items:
-- 
-- ```js
-- import { Runner } from '@pixi/runner';
-- 
-- const myGame = {
--     update: new Runner('update'),
-- };
-- 
-- const gameObject = {
--     update: function(time) {
--         // Update my gamey state
--     },
-- };
-- 
-- myGame.update.add(gameObject);
-- 
-- myGame.update.emit(time);
-- ```
-- 
-- @memberof PIXI
____exports.Runner = __TS__Class()
local Runner = ____exports.Runner
Runner.name = "Runner"
function Runner.prototype.____constructor(self, name)
    self.dispatch = ____exports.Runner.prototype.emit
    self.run = ____exports.Runner.prototype.emit
    self.items = {}
    self._name = name
    self._aliasCount = 0
end
__TS__SetDescriptor(
    Runner.prototype,
    "empty",
    {get = function(self)
        return #self.items == 0
    end},
    true
)
__TS__SetDescriptor(
    Runner.prototype,
    "name",
    {get = function(self)
        return self._name
    end},
    true
)
function Runner.prototype.emit(self, ...)
    local name = self.name
    local items = self.items
    self._aliasCount = self._aliasCount + 1
    do
        local i = 0
        local len = #items
        while i < len do
            local ____self_0 = items[i + 1]
            ____self_0[name](____self_0, ...)
            i = i + 1
        end
    end
    if items == self.items then
        self._aliasCount = self._aliasCount - 1
    end
    return self
end
function Runner.prototype.ensureNonAliasedItems(self)
    if self._aliasCount > 0 and #self.items > 1 then
        self._aliasCount = 0
        self.items = __TS__ArraySlice(self.items, 0)
    end
end
function Runner.prototype.add(self, item)
    if item[self._name] then
        self:ensureNonAliasedItems()
        self:remove(item)
        local ____self_items_1 = self.items
        ____self_items_1[#____self_items_1 + 1] = item
    end
    return self
end
function Runner.prototype.remove(self, item)
    local index = __TS__ArrayIndexOf(self.items, item)
    if index ~= -1 then
        self:ensureNonAliasedItems()
        __TS__ArraySplice(self.items, index, 1)
    end
    return self
end
function Runner.prototype.contains(self, item)
    return __TS__ArrayIncludes(self.items, item)
end
function Runner.prototype.removeAll(self)
    self:ensureNonAliasedItems()
    __TS__ArraySetLength(self.items, 0)
    return self
end
function Runner.prototype.destroy(self)
    self:removeAll()
    self.items = nil
    self._name = nil
end
return ____exports
 end,
["runner.index"] = function(...) 
--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
local ____exports = {}
do
    local ____export = require("runner.Runner")
    for ____exportKey, ____exportValue in pairs(____export) do
        if ____exportKey ~= "default" then
            ____exports[____exportKey] = ____exportValue
        end
    end
end
return ____exports
 end,
["context2d.Context2D"] = function(...) 
local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__New = ____lualib.__TS__New
local __TS__SetDescriptor = ____lualib.__TS__SetDescriptor
local Error = ____lualib.Error
local RangeError = ____lualib.RangeError
local ReferenceError = ____lualib.ReferenceError
local SyntaxError = ____lualib.SyntaxError
local TypeError = ____lualib.TypeError
local URIError = ____lualib.URIError
local __TS__StringTrim = ____lualib.__TS__StringTrim
local __TS__StringSplit = ____lualib.__TS__StringSplit
local __TS__ArrayMap = ____lualib.__TS__ArrayMap
local __TS__StringEndsWith = ____lualib.__TS__StringEndsWith
local __TS__ParseInt = ____lualib.__TS__ParseInt
local ____exports = {}
local parseFont, defaultFontName, FONT_NAMES, FONT_WEIGHT_NAMES, FONT_STYLE_NAMES
local cairo = require("kui.cairo.cairo")
local ____color = require("color.index")
local Color = ____color.Color
function parseFont(self, fontStyle)
    local size = 10
    local name = defaultFontName
    local style = "normal"
    local weight = "normal"
    local parts = __TS__ArrayMap(
        __TS__StringSplit(fontStyle, " "),
        function(____, s) return __TS__StringTrim(s) end
    )
    for ____, part in ipairs(parts) do
        if __TS__StringEndsWith(part, "px") then
            size = __TS__ParseInt(
                string.sub(part, 1, -3),
                10
            )
        elseif FONT_STYLE_NAMES[part] ~= nil then
            style = FONT_STYLE_NAMES[part]
        elseif FONT_WEIGHT_NAMES[part] ~= nil then
            style = FONT_WEIGHT_NAMES[part]
        elseif part == "normal" then
        else
            name = part
        end
    end
    return {size, FONT_NAMES[name] or name, style, weight}
end
____exports.Context2D = __TS__Class()
local Context2D = ____exports.Context2D
Context2D.name = "Context2D"
function Context2D.prototype.____constructor(self, width, height)
    self.surface = cairo.image_surface("argb32", width, height)
    self.context = self.surface:context()
    self._width = width
    self._height = height
    self._globalCompositeOperation = "source-over"
    self._globalAlpha = 1
    self._fillColor = __TS__New(Color, 0)
    self._strokeColor = __TS__New(Color, 0)
    self._font = "10x sans-serif"
end
__TS__SetDescriptor(
    Context2D.prototype,
    "width",
    {
        get = function(self)
            return self._width
        end,
        set = function(self, width)
            self:setDimensions(width, self._height)
        end
    },
    true
)
__TS__SetDescriptor(
    Context2D.prototype,
    "height",
    {
        get = function(self)
            return self._height
        end,
        set = function(self, height)
            self:setDimensions(self._width, height)
        end
    },
    true
)
__TS__SetDescriptor(
    Context2D.prototype,
    "globalCompositeOperation",
    {
        get = function(self)
            return self._globalCompositeOperation
        end,
        set = function(self, value)
            self._globalCompositeOperation = value
        end
    },
    true
)
__TS__SetDescriptor(
    Context2D.prototype,
    "globalAlpha",
    {
        get = function(self)
            return self._globalAlpha
        end,
        set = function(self, value)
            self._globalAlpha = value
        end
    },
    true
)
__TS__SetDescriptor(
    Context2D.prototype,
    "fillStyle",
    {
        get = function(self)
            return self._fillColor:toHex()
        end,
        set = function(self, color)
            self._fillColor = __TS__New(Color, color)
        end
    },
    true
)
__TS__SetDescriptor(
    Context2D.prototype,
    "strokeStyle",
    {
        get = function(self)
            return self._strokeColor
        end,
        set = function(self, color)
            self._strokeColor = __TS__New(Color, color)
        end
    },
    true
)
__TS__SetDescriptor(
    Context2D.prototype,
    "font",
    {
        get = function(self)
            return self._font
        end,
        set = function(self, value)
            self._font = value
            local size, name, style, weight = unpack(parseFont(nil, value))
            self.context:font_face(name, style, weight)
            self.context:font_size(size)
        end
    },
    true
)
__TS__SetDescriptor(
    Context2D.prototype,
    "lineCap",
    {
        get = function(self)
            return self.context:line_cap()
        end,
        set = function(self, value)
            self.context:line_cap(value)
        end
    },
    true
)
__TS__SetDescriptor(
    Context2D.prototype,
    "lineJoin",
    {
        get = function(self)
            return self.context:line_join()
        end,
        set = function(self, value)
            self.context:line_join(value)
        end
    },
    true
)
__TS__SetDescriptor(
    Context2D.prototype,
    "lineWidth",
    {
        get = function(self)
            return self.context:line_width()
        end,
        set = function(self, value)
            self.context:line_width(value)
        end
    },
    true
)
__TS__SetDescriptor(
    Context2D.prototype,
    "miterLimit",
    {
        get = function(self)
            return self.context:miter_limit()
        end,
        set = function(self, value)
            self.context:miter_limit(value)
        end
    },
    true
)
__TS__SetDescriptor(
    Context2D.prototype,
    "letterSpacing",
    {
        get = function(self)
            return "0px"
        end,
        set = function(self, value)
        end
    },
    true
)
function Context2D.prototype.setDimensions(self, width, height)
    local surface = cairo.image_surface("argb32", width, height)
    local context = surface:context()
    self.surface:flush()
    context:source(self.surface)
    context:paint()
    self.surface = surface
    self.context = context
    self._width = width
    self._height = height
end
function Context2D.prototype._fill(self)
    self.context:rgba(self._fillColor.red, self._fillColor.green, self._fillColor.blue, self._fillColor.alpha * self._globalAlpha)
    self.context:fill()
end
function Context2D.prototype._stroke(self)
    self.context:rgba(self._strokeColor.red, self._strokeColor.green, self._strokeColor.blue, self._strokeColor.alpha * self._globalAlpha)
    self.context:stroke()
end
function Context2D.prototype.arc(self, x, y, radius, startAngle, endAngle, counterclockwise)
    if not counterclockwise then
        self.context:arc(
            x,
            y,
            radius,
            startAngle,
            endAngle
        )
    else
        self.context:arc_negative(
            x,
            y,
            radius,
            startAngle,
            endAngle
        )
    end
end
function Context2D.prototype.beginPath(self)
    self.context:new_path()
end
function Context2D.prototype.bezierCurveTo(self, x1, y1, x2, y2, x3, y3)
    self.context:curve_to(
        x1,
        y1,
        x2,
        y2,
        x3,
        y3
    )
end
function Context2D.prototype.clip(self)
    self.context:clip()
end
function Context2D.prototype.closePath(self)
    self.context:close_path()
end
function Context2D.prototype.drawImage(self, image, sx, sy, sWidth, sHeight, dx, dy, dWidth, dHeight)
    local ctx = self.context
    local source = image.context.surface
    ctx:save()
    ctx:rectangle(dx, dy, dWidth, dHeight)
    ctx:clip()
    ctx:translate(dx, dy)
    ctx:scale(dWidth / sWidth, dHeight / sHeight)
    ctx:source(source, -sx, -sy)
    ctx:paint()
    ctx:restore()
end
function Context2D.prototype.ellipse(self, x, y, radiusX, radiusY, rotation, startAngle, endAngle, counterclockwise)
    if not counterclockwise then
        self.context:elliptic_arc(
            x,
            y,
            radiusX,
            radiusY,
            rotation,
            startAngle,
            endAngle
        )
    else
        self.context:elliptic_arc_negative(
            x,
            y,
            radiusX,
            radiusY,
            rotation,
            startAngle,
            endAngle
        )
    end
end
function Context2D.prototype.fill(self)
    self:_fill()
end
function Context2D.prototype.fillText(self, text, x, y)
    self.context:move_to(x, y)
    self.context:text_path(text)
    self:_fill()
end
function Context2D.prototype.getImageData(self, x, y, width, height)
    local isSameDimensions = x ~= 0 and y ~= 0 and width ~= self._width and height ~= self._height
    if isSameDimensions then
        local length = width * height * 4
        local arrayLike = setmetatable(
            self.surface:data(),
            {__len = function() return length end}
        )
        return __TS__New(____exports.ImageData, width, height, arrayLike)
    else
        local surface = cairo.image_surface("argb32", width, height)
        local context = surface:context()
        context:source(self.surface, -x, -y)
        context:paint()
        local length = width * height * 4
        local arrayLike = setmetatable(
            surface:data(),
            {__len = function() return length end}
        )
        return __TS__New(
            ____exports.ImageData,
            width,
            height,
            arrayLike,
            {surface, context}
        )
    end
end
function Context2D.prototype.putImageData(self, image, dx, dy)
    local surface = cairo.image_surface_from_data(
        "argb32",
        image.data,
        image.width,
        image.height,
        4
    )
    self.context:source(surface, -dx, -dy)
    self.context:paint()
end
function Context2D.prototype.lineTo(self, x, y)
    self.context:line_to(x, y)
end
function Context2D.prototype.measureText(self, text)
    return self.context:text_extents(text)
end
function Context2D.prototype.moveTo(self, x, y)
    self.context:move_to(x, y)
end
function Context2D.prototype.quadraticCurveTo(self, x1, y1, x2, y2)
    self.context:quad_curve_to(x1, y1, x2, y2)
end
function Context2D.prototype.roundRect(self, x, y, width, height, radius)
    self.context:rounded_rectangle(
        x,
        y,
        width,
        height,
        radius
    )
end
function Context2D.prototype.stroke(self)
    self:_stroke()
end
function Context2D.prototype.strokeText(self, text, x, y)
    self.context:move_to(x, y)
    self.context:text_path(text)
    self:_stroke()
end
function Context2D.prototype.save(self)
    self.context:save()
end
function Context2D.prototype.restore(self)
    self.context:restore()
end
function Context2D.prototype.rect(self, x, y, width, height)
    self.context:rectangle(x, y, width, height)
end
function Context2D.prototype.clearRect(self, x, y, width, height)
    self.context:save()
    self.context:rectangle(x, y, width, height)
    self.context:clip()
    self.context:paint_with_alpha(0)
    self.context:restore()
end
function Context2D.prototype.fillRect(self, x, y, width, height)
    self.context:rectangle(x, y, width, height)
    self:_fill()
end
function Context2D.prototype.strokeRect(self, x, y, width, height)
    self.context:rectangle(x, y, width, height)
    self:_stroke()
end
function Context2D.prototype.scale(self, x, y)
    self.context:scale(x, y)
end
function Context2D.prototype.translate(self, x, y)
    self.context:translate(x, y)
end
function Context2D.prototype.rotate(self, rads)
    self.context:rotate(rads)
end
function Context2D.prototype.transform(self, a, b, c, d, e, f)
    self.context:transform(cairo.matrix(
        a,
        b,
        c,
        d,
        e,
        f
    ))
end
function Context2D.prototype.setTransform(self, a, b, c, d, e, f)
    self.context:set_matrix(cairo.matrix(
        a,
        b,
        c,
        d,
        e,
        f
    ))
end
function Context2D.prototype.getTransform(self)
    error(
        __TS__New(Error, "unimplemented"),
        0
    )
end
function Context2D.prototype.getFontExtents(self)
    return self.context:font_extents()
end
____exports.Canvas = __TS__Class()
local Canvas = ____exports.Canvas
Canvas.name = "Canvas"
function Canvas.prototype.____constructor(self, width, height)
    self.context = __TS__New(____exports.Context2D, width, height)
end
__TS__SetDescriptor(
    Canvas.prototype,
    "width",
    {
        get = function(self)
            return self.context.width
        end,
        set = function(self, value)
            self.context.width = value
        end
    },
    true
)
__TS__SetDescriptor(
    Canvas.prototype,
    "height",
    {
        get = function(self)
            return self.context.height
        end,
        set = function(self, value)
            self.context.height = value
        end
    },
    true
)
function Canvas.prototype.setDimensions(self, width, height)
    self.context:setDimensions(width, height)
end
function Canvas.prototype.getContext(self, _name)
    return self.context
end
____exports.ImageData = __TS__Class()
local ImageData = ____exports.ImageData
ImageData.name = "ImageData"
function ImageData.prototype.____constructor(self, width, height, data, refs)
    self.width = width
    self.height = height
    self.data = data
    self._refs = refs
end
defaultFontName = "sans-serif"
function ____exports.setDefaultFontName(self, n)
    defaultFontName = n
end
FONT_NAMES = {serif = "Cantarell", ["sans-serif"] = "Cantarell", monospace = "DejaVu Sans Mono"}
FONT_WEIGHT_NAMES = {
    [100] = "normal",
    [200] = "normal",
    [300] = "normal",
    [400] = "normal",
    [500] = "normal",
    bold = "bold",
    [600] = "bold",
    [700] = "bold",
    [800] = "bold",
    [900] = "bold"
}
FONT_STYLE_NAMES = {italic = "italic", oblique = "oblique"}
return ____exports
 end,
["context2d.index"] = function(...) 
--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
local ____exports = {}
do
    local ____export = require("context2d.Context2D")
    for ____exportKey, ____exportValue in pairs(____export) do
        if ____exportKey ~= "default" then
            ____exports[____exportKey] = ____exportValue
        end
    end
end
return ____exports
 end,
["settings"] = function(...) 
local ____lualib = require("lualib_bundle")
local __TS__New = ____lualib.__TS__New
local ____exports = {}
local ____context2d = require("context2d.index")
local Context2D = ____context2d.Context2D
local Canvas = ____context2d.Canvas
____exports.settings = {
    RESOLUTION = 1,
    ROUND_PIXELS = true,
    RENDER_OPTIONS = {
        view = nil,
        width = 800,
        height = 600,
        autoDensity = false,
        backgroundColor = 0,
        backgroundAlpha = 1,
        clearBeforeRender = true,
        antialias = false,
        premultipliedAlpha = true,
        preserveDrawingBuffer = false,
        hello = false
    },
    ADAPTER = {
        getCanvasRenderingContext2D = function() return Context2D end,
        createCanvas = function(____, width, height)
            return __TS__New(Canvas, width, height)
        end
    }
}
____exports.default = ____exports.settings
return ____exports
 end,
["eventemitter3.index"] = function(...) 
local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local Error = ____lualib.Error
local RangeError = ____lualib.RangeError
local ReferenceError = ____lualib.ReferenceError
local SyntaxError = ____lualib.SyntaxError
local TypeError = ____lualib.TypeError
local URIError = ____lualib.URIError
local __TS__New = ____lualib.__TS__New
local __TS__Delete = ____lualib.__TS__Delete
local __TS__ObjectKeys = ____lualib.__TS__ObjectKeys
local ____exports = {}
--- Representation of a single event listener.
local EE = __TS__Class()
EE.name = "EE"
function EE.prototype.____constructor(self, fn, context, once)
    self.fn = fn
    self.context = context
    self.once = once or false
end
--- Add a listener for a given event.
local function addListener(self, emitter, event, fn, context, once)
    if type(fn) ~= "function" then
        error(
            __TS__New(TypeError, "The listener must be a function"),
            0
        )
    end
    local listener = __TS__New(EE, fn, context or emitter, once)
    if not emitter._events[event] then
        emitter._events[event] = {listener}
        emitter._eventsCount = emitter._eventsCount + 1
    else
        local ____emitter__events_event_0 = emitter._events[event]
        ____emitter__events_event_0[#____emitter__events_event_0 + 1] = listener
    end
    return emitter
end
--- Clear event by name.
local function clearEvent(self, emitter, event)
    local ____emitter_1, ____eventsCount_2 = emitter, "_eventsCount"
    local ____emitter__eventsCount_3 = ____emitter_1[____eventsCount_2] - 1
    ____emitter_1[____eventsCount_2] = ____emitter__eventsCount_3
    if ____emitter__eventsCount_3 == 0 then
        emitter._events = {}
    else
        __TS__Delete(emitter._events, event)
    end
end
--- Minimal `EventEmitter` interface that is molded against the Node.js
-- `EventEmitter` interface.
-- 
-- @constructor
-- @public
____exports.EventEmitter = __TS__Class()
local EventEmitter = ____exports.EventEmitter
EventEmitter.name = "EventEmitter"
function EventEmitter.prototype.____constructor(self)
    self.off = self.removeListener
    self.addListener = self.on
    self._events = {}
    self._eventsCount = 0
end
function EventEmitter.prototype.eventNames(self)
    if self._eventsCount == 0 then
        return {}
    end
    return __TS__ObjectKeys(self._events)
end
function EventEmitter.prototype.listeners(self, event)
    local handlers = self._events[event]
    if not handlers then
        return {}
    end
    local i = 0
    local l = handlers.length
    local ee = __TS__New(Array, l)
    do
        while i < l do
            ee[i + 1] = handlers[i].fn
            i = i + 1
        end
    end
    return ee
end
function EventEmitter.prototype.listenerCount(self, event)
    local listeners = self._events[event]
    if not listeners then
        return 0
    end
    return listeners.length
end
function EventEmitter.prototype.emit(self, event, ...)
    if not self._events[event] then
        return false
    end
    local listeners = self._events[event]
    do
        local i = 0
        while i < #listeners do
            if listeners[i + 1].once then
                self:removeListener(event, listeners[i + 1].fn, nil, true)
            end
            listeners[i + 1].fn(listeners[i + 1].context, ...)
            i = i + 1
        end
    end
    return true
end
function EventEmitter.prototype.on(self, event, fn, context)
    return addListener(
        nil,
        self,
        event,
        fn,
        context,
        false
    )
end
function EventEmitter.prototype.once(self, event, fn, context)
    return addListener(
        nil,
        self,
        event,
        fn,
        context,
        true
    )
end
function EventEmitter.prototype.removeListener(self, event, fn, context, once)
    if not self._events[event] then
        return self
    end
    if not fn then
        clearEvent(nil, self, event)
        return self
    end
    local listeners = self._events[event]
    local i = 0
    local events = {}
    local length = listeners.length
    do
        while i < length do
            if listeners[i].fn ~= fn or once and not listeners[i].once or context and listeners[i].context ~= context then
                events[#events + 1] = listeners[i]
            end
            i = i + 1
        end
    end
    if #events == 0 then
        clearEvent(nil, self, event)
    end
    return self
end
function EventEmitter.prototype.removeAllListeners(self, event)
    if event then
        if self._events[event] then
            clearEvent(nil, self, event)
        end
    else
        self._events = {}
        self._eventsCount = 0
    end
    return self
end
____exports.EventEmitter.prototype.off = ____exports.EventEmitter.prototype.removeListener
____exports.EventEmitter.prototype.addListener = ____exports.EventEmitter.prototype.on
____exports.EventEmitter.EventEmitter = ____exports.EventEmitter
____exports.default = ____exports.EventEmitter
return ____exports
 end,
["utils.url"] = function(...) 
local ____lualib = require("lualib_bundle")
local Error = ____lualib.Error
local RangeError = ____lualib.RangeError
local ReferenceError = ____lualib.ReferenceError
local SyntaxError = ____lualib.SyntaxError
local TypeError = ____lualib.TypeError
local URIError = ____lualib.URIError
local __TS__New = ____lualib.__TS__New
local ____exports = {}
local function _format()
    error(
        __TS__New(Error, "unimplemented"),
        0
    )
end
local function _parse()
    error(
        __TS__New(Error, "unimplemented"),
        0
    )
end
local function _resolve()
    error(
        __TS__New(Error, "unimplemented"),
        0
    )
end
____exports.url = {parse = _parse, format = _format, resolve = _resolve}
return ____exports
 end,
["utils.lastIndexOf"] = function(...) 
--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
local ____exports = {}
function ____exports.default(self, haystack, needle)
    local i = -1
    local j = -1
    local k = 0
    repeat
        do
            i = j
            j, k = string.find(haystack, needle, k + 1, true)
        end
    until not (j ~= nil)
    return i
end
return ____exports
 end,
["utils.path"] = function(...) 
local ____lualib = require("lualib_bundle")
local Error = ____lualib.Error
local RangeError = ____lualib.RangeError
local ReferenceError = ____lualib.ReferenceError
local SyntaxError = ____lualib.SyntaxError
local TypeError = ____lualib.TypeError
local URIError = ____lualib.URIError
local __TS__New = ____lualib.__TS__New
local __TS__StringSplit = ____lualib.__TS__StringSplit
local __TS__StringCharCodeAt = ____lualib.__TS__StringCharCodeAt
local __TS__StringSlice = ____lualib.__TS__StringSlice
local __TS__StringReplaceAll = ____lualib.__TS__StringReplaceAll
local __TS__StringStartsWith = ____lualib.__TS__StringStartsWith
local __TS__StringEndsWith = ____lualib.__TS__StringEndsWith
local ____exports = {}
local ____lastIndexOf = require("utils.lastIndexOf")
local lastIndexOf = ____lastIndexOf.default
local function assertPath(self, path)
    if type(path) ~= "string" then
        error(
            __TS__New(
                TypeError,
                "Path must be a string. Received " .. JSON:stringify(path)
            ),
            0
        )
    end
end
local function removeUrlParams(self, url)
    local re = __TS__StringSplit(url, "?")[1]
    return __TS__StringSplit(re, "#")[1]
end
local function normalizeStringPosix(self, path, allowAboveRoot)
    local res = ""
    local lastSegmentLength = 0
    local lastSlash = -1
    local dots = 0
    local code = -1
    do
        local i = 0
        while i <= #path do
            do
                if i < #path then
                    code = __TS__StringCharCodeAt(path, i)
                elseif code == 47 then
                    break
                else
                    code = 47
                end
                if code == 47 then
                    if lastSlash == i - 1 or dots == 1 then
                    elseif lastSlash ~= i - 1 and dots == 2 then
                        if #res < 2 or lastSegmentLength ~= 2 or __TS__StringCharCodeAt(res, #res - 1) ~= 46 or __TS__StringCharCodeAt(res, #res - 2) ~= 46 then
                            if #res > 2 then
                                local lastSlashIndex = lastIndexOf(nil, res, "/")
                                if lastSlashIndex ~= #res - 1 then
                                    if lastSlashIndex == -1 then
                                        res = ""
                                        lastSegmentLength = 0
                                    else
                                        res = __TS__StringSlice(res, 0, lastSlashIndex)
                                        lastSegmentLength = #res - 1 - lastIndexOf(nil, res, "/")
                                    end
                                    lastSlash = i
                                    dots = 0
                                    goto __continue6
                                end
                            elseif #res == 2 or #res == 1 then
                                res = ""
                                lastSegmentLength = 0
                                lastSlash = i
                                dots = 0
                                goto __continue6
                            end
                        end
                        if allowAboveRoot then
                            if #res > 0 then
                                res = res .. "/.."
                            else
                                res = ".."
                            end
                            lastSegmentLength = 2
                        end
                    else
                        if #res > 0 then
                            res = res .. "/" .. __TS__StringSlice(path, lastSlash + 1, i)
                        else
                            res = __TS__StringSlice(path, lastSlash + 1, i)
                        end
                        lastSegmentLength = i - lastSlash - 1
                    end
                    lastSlash = i
                    dots = 0
                elseif code == 46 and dots ~= -1 then
                    dots = dots + 1
                else
                    dots = -1
                end
            end
            ::__continue6::
            i = i + 1
        end
    end
    return res
end
____exports.path = {
    toPosix = function(self, path)
        return __TS__StringReplaceAll(path, "\\", "/")
    end,
    isUrl = function(self, path)
        return __TS__StringStartsWith(path, "http")
    end,
    isDataUrl = function(self, path)
        return __TS__StringStartsWith(path, "data")
    end,
    toAbsolute = function(self, url, customBaseUrl, customRootUrl)
        if self:isDataUrl(url) then
            return url
        end
        local baseUrl = removeUrlParams(
            nil,
            self:toPosix(customBaseUrl or os.getenv("PWD") or "/")
        )
        local rootUrl = removeUrlParams(
            nil,
            self:toPosix(customRootUrl or self:rootname(baseUrl))
        )
        assertPath(nil, url)
        url = self:toPosix(url)
        if __TS__StringStartsWith(url, "/") then
            return ____exports.path:join(
                rootUrl,
                string.sub(url, 2)
            )
        end
        local absolutePath = self:isAbsolute(url) and url or self:join(baseUrl, url)
        return absolutePath
    end,
    normalize = function(self, path)
        path = self:toPosix(path)
        assertPath(nil, path)
        if #path == 0 then
            return "."
        end
        local protocol = ""
        local isAbsolute = __TS__StringStartsWith(path, "/")
        if self:hasProtocol(path) then
            protocol = self:rootname(path)
            path = __TS__StringSlice(path, #protocol)
        end
        local trailingSeparator = __TS__StringEndsWith(path, "/")
        path = normalizeStringPosix(nil, path, false)
        if #path > 0 and trailingSeparator then
            path = path .. "/"
        end
        if isAbsolute then
            return "/" .. path
        end
        return protocol .. path
    end,
    isAbsolute = function(self, path)
        assertPath(nil, path)
        path = self:toPosix(path)
        if self:hasProtocol(path) then
            return true
        end
        return __TS__StringStartsWith(path, "/")
    end,
    join = function(self, ...)
        local segments = {...}
        if #segments == 0 then
            return "."
        end
        local joined
        do
            local i = 0
            while i < #segments do
                local arg = segments[i + 1]
                assertPath(nil, arg)
                if #arg > 0 then
                    if joined == nil then
                        joined = arg
                    else
                        local prevArg = segments[i] or ""
                        if self:extname(prevArg) ~= "" then
                            joined = joined .. "/../" .. arg
                        else
                            joined = joined .. "/" .. arg
                        end
                    end
                end
                i = i + 1
            end
        end
        if joined == nil then
            return "."
        end
        return self:normalize(joined)
    end,
    dirname = function(self, path)
        assertPath(nil, path)
        if #path == 0 then
            return "."
        end
        path = self:toPosix(path)
        local code = string.byte(path, 1) or 0 / 0
        local hasRoot = code == 47
        local ____end = -1
        local matchedSlash = true
        local proto = self:getProtocol(path)
        local origpath = path
        path = __TS__StringSlice(path, #proto)
        do
            local i = #path - 1
            while i >= 1 do
                code = __TS__StringCharCodeAt(path, i)
                if code == 47 then
                    if not matchedSlash then
                        ____end = i
                        break
                    end
                else
                    matchedSlash = false
                end
                i = i - 1
            end
        end
        if ____end == -1 then
            return hasRoot and "/" or (self:isUrl(origpath) and proto .. path or proto)
        end
        if hasRoot and ____end == 1 then
            return "//"
        end
        return proto .. __TS__StringSlice(path, 0, ____end)
    end,
    rootname = function(self, path)
        assertPath(nil, path)
        path = self:toPosix(path)
        local root = ""
        if __TS__StringStartsWith(path, "/") then
            root = "/"
        else
            root = self:getProtocol(path)
        end
        if self:isUrl(path) then
            local index = (string.find(
                path,
                "/",
                math.max(#root + 1, 1),
                true
            ) or 0) - 1
            if index ~= -1 then
                root = __TS__StringSlice(path, 0, index)
            else
                root = path
            end
            if not __TS__StringEndsWith(root, "/") then
                root = root .. "/"
            end
        end
        return root
    end,
    basename = function(self, path, ext)
        assertPath(nil, path)
        if ext then
            assertPath(nil, ext)
        end
        path = removeUrlParams(
            nil,
            self:toPosix(path)
        )
        local start = 0
        local ____end = -1
        local matchedSlash = true
        local i
        if ext ~= nil and #ext > 0 and #ext <= #path then
            if #ext == #path and ext == path then
                return ""
            end
            local extIdx = #ext - 1
            local firstNonSlashEnd = -1
            do
                i = #path - 1
                while i >= 0 do
                    local code = __TS__StringCharCodeAt(path, i)
                    if code == 47 then
                        if not matchedSlash then
                            start = i + 1
                            break
                        end
                    else
                        if firstNonSlashEnd == -1 then
                            matchedSlash = false
                            firstNonSlashEnd = i + 1
                        end
                        if extIdx >= 0 then
                            if code == __TS__StringCharCodeAt(ext, extIdx) then
                                extIdx = extIdx - 1
                                if extIdx == -1 then
                                    ____end = i
                                end
                            else
                                extIdx = -1
                                ____end = firstNonSlashEnd
                            end
                        end
                    end
                    i = i - 1
                end
            end
            if start == ____end then
                ____end = firstNonSlashEnd
            elseif ____end == -1 then
                ____end = #path
            end
            return __TS__StringSlice(path, start, ____end)
        end
        do
            i = #path - 1
            while i >= 0 do
                if __TS__StringCharCodeAt(path, i) == 47 then
                    if not matchedSlash then
                        start = i + 1
                        break
                    end
                elseif ____end == -1 then
                    matchedSlash = false
                    ____end = i + 1
                end
                i = i - 1
            end
        end
        if ____end == -1 then
            return ""
        end
        return __TS__StringSlice(path, start, ____end)
    end,
    extname = function(self, path)
        assertPath(nil, path)
        path = removeUrlParams(
            nil,
            self:toPosix(path)
        )
        local startDot = -1
        local startPart = 0
        local ____end = -1
        local matchedSlash = true
        local preDotState = 0
        do
            local i = #path - 1
            while i >= 0 do
                do
                    local code = __TS__StringCharCodeAt(path, i)
                    if code == 47 then
                        if not matchedSlash then
                            startPart = i + 1
                            break
                        end
                        goto __continue85
                    end
                    if ____end == -1 then
                        matchedSlash = false
                        ____end = i + 1
                    end
                    if code == 46 then
                        if startDot == -1 then
                            startDot = i
                        elseif preDotState ~= 1 then
                            preDotState = 1
                        end
                    elseif startDot ~= -1 then
                        preDotState = -1
                    end
                end
                ::__continue85::
                i = i - 1
            end
        end
        if startDot == -1 or ____end == -1 or preDotState == 0 or preDotState == 1 and startDot == ____end - 1 and startDot == startPart + 1 then
            return ""
        end
        return __TS__StringSlice(path, startDot, ____end)
    end,
    parse = function(self, path)
        assertPath(nil, path)
        local ret = {
            root = "",
            dir = "",
            base = "",
            ext = "",
            name = ""
        }
        if #path == 0 then
            return ret
        end
        path = removeUrlParams(
            nil,
            self:toPosix(path)
        )
        local code = string.byte(path, 1) or 0 / 0
        local isAbsolute = self:isAbsolute(path)
        local start
        ret.root = self:rootname(path)
        if isAbsolute or self:hasProtocol(path) then
            start = 1
        else
            start = 0
        end
        local startDot = -1
        local startPart = 0
        local ____end = -1
        local matchedSlash = true
        local i = #path - 1
        local preDotState = 0
        do
            while i >= start do
                do
                    code = __TS__StringCharCodeAt(path, i)
                    if code == 47 then
                        if not matchedSlash then
                            startPart = i + 1
                            break
                        end
                        goto __continue98
                    end
                    if ____end == -1 then
                        matchedSlash = false
                        ____end = i + 1
                    end
                    if code == 46 then
                        if startDot == -1 then
                            startDot = i
                        elseif preDotState ~= 1 then
                            preDotState = 1
                        end
                    elseif startDot ~= -1 then
                        preDotState = -1
                    end
                end
                ::__continue98::
                i = i - 1
            end
        end
        if startDot == -1 or ____end == -1 or preDotState == 0 or preDotState == 1 and startDot == ____end - 1 and startDot == startPart + 1 then
            if ____end ~= -1 then
                if startPart == 0 and isAbsolute then
                    local ____TS__StringSlice_result_0 = __TS__StringSlice(path, 1, ____end)
                    ret.name = ____TS__StringSlice_result_0
                    ret.base = ____TS__StringSlice_result_0
                else
                    local ____TS__StringSlice_result_1 = __TS__StringSlice(path, startPart, ____end)
                    ret.name = ____TS__StringSlice_result_1
                    ret.base = ____TS__StringSlice_result_1
                end
            end
        else
            if startPart == 0 and isAbsolute then
                ret.name = __TS__StringSlice(path, 1, startDot)
                ret.base = __TS__StringSlice(path, 1, ____end)
            else
                ret.name = __TS__StringSlice(path, startPart, startDot)
                ret.base = __TS__StringSlice(path, startPart, ____end)
            end
            ret.ext = __TS__StringSlice(path, startDot, ____end)
        end
        ret.dir = self:dirname(path)
        return ret
    end,
    sep = "/",
    delimiter = ":"
}
return ____exports
 end,
["utils.color.premultiply"] = function(...) 
local ____lualib = require("lualib_bundle")
local __TS__New = ____lualib.__TS__New
local ____exports = {}
local ____color = require("color.index")
local Color = ____color.Color
local ____constants = require("constants.index")
local BLEND_MODES = ____constants.BLEND_MODES
--- Corrects PixiJS blend, takes premultiplied alpha into account
-- 
-- @memberof PIXI.utils
-- @function mapPremultipliedBlendModes
-- @private
-- @returns Mapped modes.
local function mapPremultipliedBlendModes(self)
    local pm = {}
    local npm = {}
    do
        local i = 0
        while i < 32 do
            pm[i + 1] = i
            npm[i + 1] = i
            i = i + 1
        end
    end
    pm[BLEND_MODES.NORMAL_NPM + 1] = BLEND_MODES.NORMAL
    pm[BLEND_MODES.ADD_NPM + 1] = BLEND_MODES.ADD
    pm[BLEND_MODES.SCREEN_NPM + 1] = BLEND_MODES.SCREEN
    npm[BLEND_MODES.NORMAL + 1] = BLEND_MODES.NORMAL_NPM
    npm[BLEND_MODES.ADD + 1] = BLEND_MODES.ADD_NPM
    npm[BLEND_MODES.SCREEN + 1] = BLEND_MODES.SCREEN_NPM
    local array = {}
    array[#array + 1] = npm
    array[#array + 1] = pm
    return array
end
--- maps premultiply flag and blendMode to adjusted blendMode
-- 
-- @memberof PIXI.utils
-- @type {Array<number[]>}
____exports.premultiplyBlendMode = mapPremultipliedBlendModes(nil)
--- changes blendMode according to texture format
-- 
-- @memberof PIXI.utils
-- @function correctBlendMode
-- @param blendMode - supposed blend mode
-- @param premultiplied - whether source is premultiplied
-- @returns true blend mode for this texture
function ____exports.correctBlendMode(self, blendMode, premultiplied)
    return ____exports.premultiplyBlendMode[(premultiplied and 1 or 0) + 1][blendMode + 1]
end
--- combines rgb and alpha to out array
-- 
-- @memberof PIXI.utils
-- @function premultiplyRgba
-- @param rgb - input rgb
-- @param alpha - alpha param
-- @param out - output
-- @param premultiply - do premultiply it
-- @returns vec4 rgba
function ____exports.premultiplyRgba(self, rgb, alpha, out, premultiply)
    out = out or __TS__New(Float32Array, 4)
    if premultiply or premultiply == nil then
        out[0] = rgb[1] * alpha
        out[1] = rgb[2] * alpha
        out[2] = rgb[3] * alpha
    else
        out[0] = rgb[1]
        out[1] = rgb[2]
        out[2] = rgb[3]
    end
    out[3] = alpha
    return out
end
--- premultiplies tint
-- 
-- @memberof PIXI.utils
-- @function premultiplyTint
-- @param tint - integer RGB
-- @param alpha - floating point alpha (0.0-1.0)
-- @returns tint multiplied by alpha
function ____exports.premultiplyTint(self, tint, alpha)
    if alpha == 1 then
        return bit.lshift(alpha * 255, 24) + tint
    end
    if alpha == 0 then
        return 0
    end
    local R = bit.band(
        bit.arshift(tint, 16),
        255
    )
    local G = bit.band(
        bit.arshift(tint, 8),
        255
    )
    local B = bit.band(tint, 255)
    R = bit.bor(R * alpha + 0.5, 0)
    G = bit.bor(G * alpha + 0.5, 0)
    B = bit.bor(B * alpha + 0.5, 0)
    return bit.lshift(alpha * 255, 24) + bit.lshift(R, 16) + bit.lshift(G, 8) + B
end
--- converts integer tint and float alpha to vec4 form, premultiplies by default
-- 
-- @memberof PIXI.utils
-- @function premultiplyTintToRgba
-- @param tint - input tint
-- @param alpha - alpha param
-- @param out - output
-- @param premultiply - do premultiply it
-- @returns vec4 rgba
function ____exports.premultiplyTintToRgba(self, tint, alpha, out, premultiply)
    out = Color.shared:setValue(tint):toRgbArray(out or __TS__New(Float32Array, 4))
    if premultiply or premultiply == nil then
        out[0] = out[0] * alpha
        out[1] = out[1] * alpha
        out[2] = out[2] * alpha
    end
    out[3] = alpha
    return out
end
return ____exports
 end,
["utils.data.createIndicesForQuads"] = function(...) 
local ____lualib = require("lualib_bundle")
local __TS__New = ____lualib.__TS__New
local Error = ____lualib.Error
local RangeError = ____lualib.RangeError
local ReferenceError = ____lualib.ReferenceError
local SyntaxError = ____lualib.SyntaxError
local TypeError = ____lualib.TypeError
local URIError = ____lualib.URIError
local ____exports = {}
--- Generic Mask Stack data structure
-- 
-- @memberof PIXI.utils
-- @function createIndicesForQuads
-- @param size - Number of quads
-- @param outBuffer - Buffer for output, length has to be `6 * size`
-- @returns - Resulting index buffer
function ____exports.createIndicesForQuads(self, size, outBuffer)
    if outBuffer == nil then
        outBuffer = nil
    end
    local totalIndices = size * 6
    outBuffer = outBuffer or __TS__New(Uint16Array, totalIndices)
    if outBuffer.length ~= totalIndices then
        error(
            __TS__New(
                Error,
                (("Out buffer length is incorrect, got " .. tostring(outBuffer.length)) .. " and expected ") .. tostring(totalIndices)
            ),
            0
        )
    end
    do
        local i = 0
        local j = 0
        while i < totalIndices do
            outBuffer[i + 0] = j + 0
            outBuffer[i + 1] = j + 1
            outBuffer[i + 2] = j + 2
            outBuffer[i + 3] = j + 0
            outBuffer[i + 4] = j + 2
            outBuffer[i + 5] = j + 3
            do
                i = i + 6
                j = j + 4
            end
        end
    end
    return outBuffer
end
return ____exports
 end,
["utils.data.getBufferType"] = function(...) 
local ____lualib = require("lualib_bundle")
local __TS__InstanceOf = ____lualib.__TS__InstanceOf
local Error = ____lualib.Error
local RangeError = ____lualib.RangeError
local ReferenceError = ____lualib.ReferenceError
local SyntaxError = ____lualib.SyntaxError
local TypeError = ____lualib.TypeError
local URIError = ____lualib.URIError
local __TS__New = ____lualib.__TS__New
local ____exports = {}
function ____exports.getBufferType(self, array)
    if array.BYTES_PER_ELEMENT == 4 then
        if __TS__InstanceOf(array, Float32Array) then
            return "Float32Array"
        elseif __TS__InstanceOf(array, Uint32Array) then
            return "Uint32Array"
        end
        return "Int32Array"
    elseif array.BYTES_PER_ELEMENT == 2 then
        if __TS__InstanceOf(array, Uint16Array) then
            return "Uint16Array"
        end
    elseif array.BYTES_PER_ELEMENT == 1 then
        if __TS__InstanceOf(array, Uint8Array) then
            return "Uint8Array"
        end
    end
    error(
        __TS__New(Error, "Unimplemented buffer type"),
        0
    )
end
return ____exports
 end,
["utils.data.interleaveTypedArrays"] = function(...) 
local ____lualib = require("lualib_bundle")
local __TS__New = ____lualib.__TS__New
local ____exports = {}
local ____getBufferType = require("utils.data.getBufferType")
local getBufferType = ____getBufferType.getBufferType
local map = {Float32Array = Float32Array, Uint32Array = Uint32Array, Int32Array = Int32Array, Uint8Array = Uint8Array}
function ____exports.interleaveTypedArrays(self, arrays, sizes)
    local outSize = 0
    local stride = 0
    local views = {}
    do
        local i = 0
        while i < #arrays do
            stride = stride + sizes[i + 1]
            outSize = outSize + arrays[i + 1].length
            i = i + 1
        end
    end
    local buffer = __TS__New(ArrayBuffer, outSize * 4)
    local out = nil
    local littleOffset = 0
    do
        local i = 0
        while i < #arrays do
            local size = sizes[i + 1]
            local array = arrays[i + 1]
            local ____type = getBufferType(nil, array)
            if not views[____type] then
                views[____type] = __TS__New(map[____type], buffer)
            end
            out = views[____type]
            do
                local j = 0
                while j < array.length do
                    local indexStart = bit.bor(j / size, 0) * stride + littleOffset
                    local index = j % size
                    out[indexStart + index] = array[j]
                    j = j + 1
                end
            end
            littleOffset = littleOffset + size
            i = i + 1
        end
    end
    return __TS__New(Float32Array, buffer)
end
return ____exports
 end,
["utils.data.pow2"] = function(...) 
--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
local ____exports = {}
--- Rounds to next power of two.
-- 
-- @function nextPow2
-- @memberof PIXI.utils
-- @param v - input value
-- @returns - next rounded power of two
function ____exports.nextPow2(self, v)
    v = v + (v == 0 and 1 or 0)
    v = v - 1
    v = bit.bor(
        v,
        bit.rshift(v, 1)
    )
    v = bit.bor(
        v,
        bit.rshift(v, 2)
    )
    v = bit.bor(
        v,
        bit.rshift(v, 4)
    )
    v = bit.bor(
        v,
        bit.rshift(v, 8)
    )
    v = bit.bor(
        v,
        bit.rshift(v, 16)
    )
    return v + 1
end
--- Checks if a number is a power of two.
-- 
-- @function isPow2
-- @memberof PIXI.utils
-- @param v - input value
-- @returns `true` if value is power of two
function ____exports.isPow2(self, v)
    return not bit.band(v, v - 1) and not not v
end
--- Computes ceil of log base 2
-- 
-- @function log2
-- @memberof PIXI.utils
-- @param v - input value
-- @returns logarithm base 2
function ____exports.log2(self, v)
    local r = bit.lshift(v > 65535 and 1 or 0, 4)
    v = bit.rshift(v, r)
    local shift = bit.lshift(v > 255 and 1 or 0, 3)
    v = bit.rshift(v, shift)
    r = bit.bor(r, shift)
    shift = bit.lshift(v > 15 and 1 or 0, 2)
    v = bit.rshift(v, shift)
    r = bit.bor(r, shift)
    shift = bit.lshift(v > 3 and 1 or 0, 1)
    v = bit.rshift(v, shift)
    r = bit.bor(r, shift)
    return bit.bor(
        r,
        bit.arshift(v, 1)
    )
end
return ____exports
 end,
["utils.data.removeItems"] = function(...) 
local ____lualib = require("lualib_bundle")
local __TS__ArraySetLength = ____lualib.__TS__ArraySetLength
local ____exports = {}
--- Remove items from a javascript array without generating garbage
-- 
-- @function removeItems
-- @memberof PIXI.utils
-- @param arr - Array to remove elements from
-- @param startIdx - starting index
-- @param removeCount - how many to remove
function ____exports.removeItems(self, arr, startIdx, removeCount)
    local length = #arr
    local i
    if startIdx >= length or removeCount == 0 then
        return
    end
    removeCount = startIdx + removeCount > length and length - startIdx or removeCount
    local len = length - removeCount
    do
        i = startIdx
        while i < len do
            arr[i + 1] = arr[i + removeCount + 1]
            i = i + 1
        end
    end
    __TS__ArraySetLength(arr, len)
end
return ____exports
 end,
["utils.data.sign"] = function(...) 
--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
local ____exports = {}
--- Returns sign of number
-- 
-- @memberof PIXI.utils
-- @function sign
-- @param n - the number to check the sign of
-- @returns 0 if `n` is 0, -1 if `n` is negative, 1 if `n` is positive
function ____exports.sign(self, n)
    if n == 0 then
        return 0
    end
    return n < 0 and -1 or 1
end
return ____exports
 end,
["utils.data.uid"] = function(...) 
--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
local ____exports = {}
local nextUid = 0
--- Gets the next unique identifier
-- 
-- @memberof PIXI.utils
-- @function uid
-- @returns The next unique identifier to use.
function ____exports.uid(self)
    nextUid = nextUid + 1
    return nextUid
end
return ____exports
 end,
["utils.types.index"] = function(...) 
--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
local ____exports = {}
return ____exports
 end,
["utils.logging.deprecation"] = function(...) 
local ____lualib = require("lualib_bundle")
local Error = ____lualib.Error
local RangeError = ____lualib.RangeError
local ReferenceError = ____lualib.ReferenceError
local SyntaxError = ____lualib.SyntaxError
local TypeError = ____lualib.TypeError
local URIError = ____lualib.URIError
local __TS__New = ____lualib.__TS__New
local __TS__StringSplit = ____lualib.__TS__StringSplit
local __TS__ArraySplice = ____lualib.__TS__ArraySplice
local ____exports = {}
local warnings = {}
--- Helper for warning developers about deprecated features & settings.
-- A stack track for warnings is given; useful for tracking-down where
-- deprecated methods/properties/classes are being used within the code.
-- 
-- @memberof PIXI.utils
-- @function deprecation
-- @param version - The version where the feature became deprecated
-- @param message - Message should include what is deprecated, where, and the new solution
-- @param ignoreDepth - The number of steps to ignore at the top of the error stack
-- this is mostly to ignore internal deprecation calls.
function ____exports.deprecation(self, version, message, ignoreDepth)
    if ignoreDepth == nil then
        ignoreDepth = 3
    end
    if warnings[message] then
        return
    end
    local stack = __TS__New(Error).stack
    if type(stack) == "nil" then
        print("PixiJS Deprecation Warning: ", (message .. "\nDeprecated since v") .. version)
    else
        stack = table.concat(
            __TS__ArraySplice(
                __TS__StringSplit(stack, "\n"),
                ignoreDepth
            ),
            "\n"
        )
        print("PixiJS Deprecation Warning: ", (message .. "\nDeprecated since v") .. version)
        print(stack)
    end
    warnings[message] = true
end
return ____exports
 end,
["utils.media.cache"] = function(...) 
local ____lualib = require("lualib_bundle")
local __TS__Delete = ____lualib.__TS__Delete
local ____exports = {}
---
-- @todo Describe property usage
-- @static
-- @name TextureCache
-- @memberof PIXI.utils
-- @type {object}
____exports.TextureCache = {}
---
-- @todo Describe property usage
-- @static
-- @name BaseTextureCache
-- @memberof PIXI.utils
-- @type {object}
____exports.BaseTextureCache = {}
--- Destroys all texture in the cache
-- 
-- @memberof PIXI.utils
-- @function destroyTextureCache
function ____exports.destroyTextureCache(self)
    local key
    for ____value in pairs(____exports.TextureCache) do
        key = ____value
        ____exports.TextureCache[key]:destroy()
    end
    for ____value in pairs(____exports.BaseTextureCache) do
        key = ____value
        ____exports.BaseTextureCache[key]:destroy()
    end
end
--- Removes all textures from cache, but does not destroy them
-- 
-- @memberof PIXI.utils
-- @function clearTextureCache
function ____exports.clearTextureCache(self)
    local key
    for ____value in pairs(____exports.TextureCache) do
        key = ____value
        __TS__Delete(____exports.TextureCache, key)
    end
    for ____value in pairs(____exports.BaseTextureCache) do
        key = ____value
        __TS__Delete(____exports.BaseTextureCache, key)
    end
end
return ____exports
 end,
["utils.media.BoundingBox"] = function(...) 
local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__SetDescriptor = ____lualib.__TS__SetDescriptor
local __TS__New = ____lualib.__TS__New
local ____exports = {}
--- A rectangular bounding box describing the boundary of an area.
-- 
-- @memberof PIXI.utils
-- @since 7.1.0
____exports.BoundingBox = __TS__Class()
local BoundingBox = ____exports.BoundingBox
BoundingBox.name = "BoundingBox"
function BoundingBox.prototype.____constructor(self, left, top, right, bottom)
    self.left = left
    self.top = top
    self.right = right
    self.bottom = bottom
end
__TS__SetDescriptor(
    BoundingBox.prototype,
    "width",
    {get = function(self)
        return self.right - self.left
    end},
    true
)
__TS__SetDescriptor(
    BoundingBox.prototype,
    "height",
    {get = function(self)
        return self.bottom - self.top
    end},
    true
)
function BoundingBox.prototype.isEmpty(self)
    return self.left == self.right or self.top == self.bottom
end
BoundingBox.EMPTY = __TS__New(
    ____exports.BoundingBox,
    0,
    0,
    0,
    0
)
return ____exports
 end,
["utils.media.getCanvasBoundingBox"] = function(...) 
local ____lualib = require("lualib_bundle")
local Error = ____lualib.Error
local RangeError = ____lualib.RangeError
local ReferenceError = ____lualib.ReferenceError
local SyntaxError = ____lualib.SyntaxError
local TypeError = ____lualib.TypeError
local URIError = ____lualib.URIError
local __TS__New = ____lualib.__TS__New
local ____exports = {}
local ____BoundingBox = require("utils.media.BoundingBox")
local BoundingBox = ____BoundingBox.BoundingBox
local ALPHA_CHANNEL = 0
local function checkRow(self, data, width, y)
    do
        local x = 0
        local index = 4 * y * width
        while x < width do
            if data[index + ALPHA_CHANNEL] ~= 0 then
                return false
            end
            do
                x = x + 1
                index = index + 4
            end
        end
    end
    return true
end
local function checkColumn(self, data, width, x, top, bottom)
    local stride = 4 * width
    do
        local y = top
        local index = top * stride + 4 * x
        while y <= bottom do
            if data[index + ALPHA_CHANNEL] ~= 0 then
                return false
            end
            do
                y = y + 1
                index = index + stride
            end
        end
    end
    return true
end
--- Measuring the bounds of a canvas' visible (non-transparent) pixels.
-- 
-- @memberof PIXI.utils
-- @param canvas - The canvas to measure.
-- @returns The bounding box of the canvas' visible pixels.
-- @since 7.1.0
function ____exports.getCanvasBoundingBox(self, canvas)
    local ____canvas_0 = canvas
    local width = ____canvas_0.width
    local height = ____canvas_0.height
    local context = canvas:getContext("2d")
    if context == nil then
        error(
            __TS__New(TypeError, "Failed to get canvas 2D context"),
            0
        )
    end
    local imageData = context:getImageData(0, 0, width, height)
    local data = imageData.data
    local left = 0
    local top = 0
    local right = width - 1
    local bottom = height - 1
    while top < height and checkRow(nil, data, width, top) do
        top = top + 1
    end
    if top == height then
        return BoundingBox.EMPTY
    end
    while checkRow(nil, data, width, bottom) do
        bottom = bottom - 1
    end
    while checkColumn(
        nil,
        data,
        width,
        left,
        top,
        bottom
    ) do
        left = left + 1
    end
    while checkColumn(
        nil,
        data,
        width,
        right,
        top,
        bottom
    ) do
        right = right - 1
    end
    right = right + 1
    bottom = bottom + 1
    return __TS__New(
        BoundingBox,
        left,
        top,
        right,
        bottom
    )
end
return ____exports
 end,
["utils.media.trimCanvas"] = function(...) 
local ____lualib = require("lualib_bundle")
local Error = ____lualib.Error
local RangeError = ____lualib.RangeError
local ReferenceError = ____lualib.ReferenceError
local SyntaxError = ____lualib.SyntaxError
local TypeError = ____lualib.TypeError
local URIError = ____lualib.URIError
local __TS__New = ____lualib.__TS__New
local ____exports = {}
local ____getCanvasBoundingBox = require("utils.media.getCanvasBoundingBox")
local getCanvasBoundingBox = ____getCanvasBoundingBox.getCanvasBoundingBox
--- Trim transparent borders from a canvas.
-- 
-- @memberof PIXI.utils
-- @param canvas - The canvas to trim.
-- @returns The trimmed canvas data.
function ____exports.trimCanvas(self, canvas)
    local boundingBox = getCanvasBoundingBox(nil, canvas)
    local width = boundingBox.width
    local height = boundingBox.height
    local data = nil
    if not boundingBox:isEmpty() then
        local context = canvas:getContext("2d")
        if context == nil then
            error(
                __TS__New(TypeError, "Failed to get canvas 2D context"),
                0
            )
        end
        data = context:getImageData(boundingBox.left, boundingBox.top, width, height)
    end
    return {width = width, height = height, data = data}
end
return ____exports
 end,
["utils.network.decomposeDataUri"] = function(...) 
local ____lualib = require("lualib_bundle")
local Error = ____lualib.Error
local RangeError = ____lualib.RangeError
local ReferenceError = ____lualib.ReferenceError
local SyntaxError = ____lualib.SyntaxError
local TypeError = ____lualib.TypeError
local URIError = ____lualib.URIError
local __TS__New = ____lualib.__TS__New
local ____exports = {}
--- Split a data URI into components. Returns undefined if
-- parameter `dataUri` is not a valid data URI.
-- 
-- @memberof PIXI.utils
-- @function decomposeDataUri
-- @param dataUri - the data URI to check
-- @returns The decomposed data uri or undefined
function ____exports.decomposeDataUri(self, dataUri)
    error(
        __TS__New(Error, "unimplemented"),
        0
    )
end
return ____exports
 end,
["utils.index"] = function(...) 
--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
local ____exports = {}
do
    local ____eventemitter3 = require("eventemitter3.index")
    local EventEmitter = ____eventemitter3.default
    ____exports.EventEmitter = EventEmitter
end
do
    local ____export = require("utils.url")
    for ____exportKey, ____exportValue in pairs(____export) do
        if ____exportKey ~= "default" then
            ____exports[____exportKey] = ____exportValue
        end
    end
end
do
    local ____export = require("utils.path")
    for ____exportKey, ____exportValue in pairs(____export) do
        if ____exportKey ~= "default" then
            ____exports[____exportKey] = ____exportValue
        end
    end
end
do
    local ____export = require("utils.color.premultiply")
    for ____exportKey, ____exportValue in pairs(____export) do
        if ____exportKey ~= "default" then
            ____exports[____exportKey] = ____exportValue
        end
    end
end
do
    local ____export = require("utils.data.createIndicesForQuads")
    for ____exportKey, ____exportValue in pairs(____export) do
        if ____exportKey ~= "default" then
            ____exports[____exportKey] = ____exportValue
        end
    end
end
do
    local ____export = require("utils.data.getBufferType")
    for ____exportKey, ____exportValue in pairs(____export) do
        if ____exportKey ~= "default" then
            ____exports[____exportKey] = ____exportValue
        end
    end
end
do
    local ____export = require("utils.data.interleaveTypedArrays")
    for ____exportKey, ____exportValue in pairs(____export) do
        if ____exportKey ~= "default" then
            ____exports[____exportKey] = ____exportValue
        end
    end
end
do
    local ____export = require("utils.data.pow2")
    for ____exportKey, ____exportValue in pairs(____export) do
        if ____exportKey ~= "default" then
            ____exports[____exportKey] = ____exportValue
        end
    end
end
do
    local ____export = require("utils.data.removeItems")
    for ____exportKey, ____exportValue in pairs(____export) do
        if ____exportKey ~= "default" then
            ____exports[____exportKey] = ____exportValue
        end
    end
end
do
    local ____export = require("utils.data.sign")
    for ____exportKey, ____exportValue in pairs(____export) do
        if ____exportKey ~= "default" then
            ____exports[____exportKey] = ____exportValue
        end
    end
end
do
    local ____export = require("utils.data.uid")
    for ____exportKey, ____exportValue in pairs(____export) do
        if ____exportKey ~= "default" then
            ____exports[____exportKey] = ____exportValue
        end
    end
end
do
    local ____export = require("utils.logging.deprecation")
    for ____exportKey, ____exportValue in pairs(____export) do
        if ____exportKey ~= "default" then
            ____exports[____exportKey] = ____exportValue
        end
    end
end
do
    local ____export = require("utils.media.cache")
    for ____exportKey, ____exportValue in pairs(____export) do
        if ____exportKey ~= "default" then
            ____exports[____exportKey] = ____exportValue
        end
    end
end
do
    local ____export = require("utils.media.BoundingBox")
    for ____exportKey, ____exportValue in pairs(____export) do
        if ____exportKey ~= "default" then
            ____exports[____exportKey] = ____exportValue
        end
    end
end
do
    local ____export = require("utils.media.getCanvasBoundingBox")
    for ____exportKey, ____exportValue in pairs(____export) do
        if ____exportKey ~= "default" then
            ____exports[____exportKey] = ____exportValue
        end
    end
end
do
    local ____export = require("utils.media.trimCanvas")
    for ____exportKey, ____exportValue in pairs(____export) do
        if ____exportKey ~= "default" then
            ____exports[____exportKey] = ____exportValue
        end
    end
end
do
    local ____export = require("utils.network.decomposeDataUri")
    for ____exportKey, ____exportValue in pairs(____export) do
        if ____exportKey ~= "default" then
            ____exports[____exportKey] = ____exportValue
        end
    end
end
return ____exports
 end,
["core.systems"] = function(...) 
--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
local ____exports = {}
____exports.byName = {}
function ____exports.register(self, name, classRef)
    ____exports.byName[name] = classRef
end
function ____exports.get(self, name)
    return ____exports.byName[name]
end
____exports.default = {byName = ____exports.byName, register = ____exports.register, get = ____exports.get}
return ____exports
 end,
["canvas-renderer.BaseTexture"] = function(...) 
--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
local ____exports = {}
____exports.texture = 0
return ____exports
 end,
["canvas-renderer.utils.canUseNewCanvasBlendModes"] = function(...) 
--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
local ____exports = {}
--- Checks whether the Canvas BlendModes are supported by the current browser
-- 
-- @private
-- @returns whether they are supported
function ____exports.canUseNewCanvasBlendModes(self)
    return false
end
return ____exports
 end,
["canvas-renderer.utils.mapCanvasBlendModesToPixi"] = function(...) 
--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
local ____exports = {}
local ____constants = require("constants.index")
local BLEND_MODES = ____constants.BLEND_MODES
local ____canUseNewCanvasBlendModes = require("canvas-renderer.utils.canUseNewCanvasBlendModes")
local canUseNewCanvasBlendModes = ____canUseNewCanvasBlendModes.canUseNewCanvasBlendModes
--- Maps blend combinations to Canvas.
-- 
-- @memberof PIXI
-- @function mapCanvasBlendModesToPixi
-- @private
-- @param array - The array to output into.
-- @returns Mapped modes.
function ____exports.mapCanvasBlendModesToPixi(self, array)
    if array == nil then
        array = {}
    end
    if canUseNewCanvasBlendModes(nil) then
        array[BLEND_MODES.NORMAL + 1] = "source-over"
        array[BLEND_MODES.ADD + 1] = "lighter"
        array[BLEND_MODES.MULTIPLY + 1] = "multiply"
        array[BLEND_MODES.SCREEN + 1] = "screen"
        array[BLEND_MODES.OVERLAY + 1] = "overlay"
        array[BLEND_MODES.DARKEN + 1] = "darken"
        array[BLEND_MODES.LIGHTEN + 1] = "lighten"
        array[BLEND_MODES.COLOR_DODGE + 1] = "color-dodge"
        array[BLEND_MODES.COLOR_BURN + 1] = "color-burn"
        array[BLEND_MODES.HARD_LIGHT + 1] = "hard-light"
        array[BLEND_MODES.SOFT_LIGHT + 1] = "soft-light"
        array[BLEND_MODES.DIFFERENCE + 1] = "difference"
        array[BLEND_MODES.EXCLUSION + 1] = "exclusion"
        array[BLEND_MODES.HUE + 1] = "hue"
        array[BLEND_MODES.SATURATION + 1] = "saturation"
        array[BLEND_MODES.COLOR + 1] = "color"
        array[BLEND_MODES.LUMINOSITY + 1] = "luminosity"
    else
        array[BLEND_MODES.NORMAL + 1] = "source-over"
        array[BLEND_MODES.ADD + 1] = "lighter"
        array[BLEND_MODES.MULTIPLY + 1] = "source-over"
        array[BLEND_MODES.SCREEN + 1] = "source-over"
        array[BLEND_MODES.OVERLAY + 1] = "source-over"
        array[BLEND_MODES.DARKEN + 1] = "source-over"
        array[BLEND_MODES.LIGHTEN + 1] = "source-over"
        array[BLEND_MODES.COLOR_DODGE + 1] = "source-over"
        array[BLEND_MODES.COLOR_BURN + 1] = "source-over"
        array[BLEND_MODES.HARD_LIGHT + 1] = "source-over"
        array[BLEND_MODES.SOFT_LIGHT + 1] = "source-over"
        array[BLEND_MODES.DIFFERENCE + 1] = "source-over"
        array[BLEND_MODES.EXCLUSION + 1] = "source-over"
        array[BLEND_MODES.HUE + 1] = "source-over"
        array[BLEND_MODES.SATURATION + 1] = "source-over"
        array[BLEND_MODES.COLOR + 1] = "source-over"
        array[BLEND_MODES.LUMINOSITY + 1] = "source-over"
    end
    array[BLEND_MODES.NORMAL_NPM + 1] = array[BLEND_MODES.NORMAL + 1]
    array[BLEND_MODES.ADD_NPM + 1] = array[BLEND_MODES.ADD + 1]
    array[BLEND_MODES.SCREEN_NPM + 1] = array[BLEND_MODES.SCREEN + 1]
    array[BLEND_MODES.SRC_IN + 1] = "source-in"
    array[BLEND_MODES.SRC_OUT + 1] = "source-out"
    array[BLEND_MODES.SRC_ATOP + 1] = "source-atop"
    array[BLEND_MODES.DST_OVER + 1] = "destination-over"
    array[BLEND_MODES.DST_IN + 1] = "destination-in"
    array[BLEND_MODES.DST_OUT + 1] = "destination-out"
    array[BLEND_MODES.DST_ATOP + 1] = "destination-atop"
    array[BLEND_MODES.XOR + 1] = "xor"
    array[BLEND_MODES.SUBTRACT + 1] = "source-over"
    return array
end
return ____exports
 end,
["display.Bounds"] = function(...) 
local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__New = ____lualib.__TS__New
local ____exports = {}
local ____math = require("math.index")
local Rectangle = ____math.Rectangle
--- 'Builder' pattern for bounds rectangles.
-- 
-- This could be called an Axis-Aligned Bounding Box.
-- It is not an actual shape. It is a mutable thing; no 'EMPTY' or those kind of problems.
-- 
-- @memberof PIXI
____exports.Bounds = __TS__Class()
local Bounds = ____exports.Bounds
Bounds.name = "Bounds"
function Bounds.prototype.____constructor(self)
    self.minX = math.huge
    self.minY = math.huge
    self.maxX = -math.huge
    self.maxY = -math.huge
    self.rect = nil
    self.updateID = -1
end
function Bounds.prototype.isEmpty(self)
    return self.minX > self.maxX or self.minY > self.maxY
end
function Bounds.prototype.clear(self)
    self.minX = math.huge
    self.minY = math.huge
    self.maxX = -math.huge
    self.maxY = -math.huge
end
function Bounds.prototype.getRectangle(self, rect)
    if self.minX > self.maxX or self.minY > self.maxY then
        return Rectangle.EMPTY
    end
    rect = rect or __TS__New(
        Rectangle,
        0,
        0,
        1,
        1
    )
    rect.x = self.minX
    rect.y = self.minY
    rect.width = self.maxX - self.minX
    rect.height = self.maxY - self.minY
    return rect
end
function Bounds.prototype.addPoint(self, point)
    self.minX = math.min(self.minX, point.x)
    self.maxX = math.max(self.maxX, point.x)
    self.minY = math.min(self.minY, point.y)
    self.maxY = math.max(self.maxY, point.y)
end
function Bounds.prototype.addPointMatrix(self, matrix, point)
    local ____matrix_0 = matrix
    local a = ____matrix_0.a
    local b = ____matrix_0.b
    local c = ____matrix_0.c
    local d = ____matrix_0.d
    local tx = ____matrix_0.tx
    local ty = ____matrix_0.ty
    local x = a * point.x + c * point.y + tx
    local y = b * point.x + d * point.y + ty
    self.minX = math.min(self.minX, x)
    self.maxX = math.max(self.maxX, x)
    self.minY = math.min(self.minY, y)
    self.maxY = math.max(self.maxY, y)
end
function Bounds.prototype.addQuad(self, vertices)
    local minX = self.minX
    local minY = self.minY
    local maxX = self.maxX
    local maxY = self.maxY
    local x = vertices[0]
    local y = vertices[1]
    minX = x < minX and x or minX
    minY = y < minY and y or minY
    maxX = x > maxX and x or maxX
    maxY = y > maxY and y or maxY
    x = vertices[2]
    y = vertices[3]
    minX = x < minX and x or minX
    minY = y < minY and y or minY
    maxX = x > maxX and x or maxX
    maxY = y > maxY and y or maxY
    x = vertices[4]
    y = vertices[5]
    minX = x < minX and x or minX
    minY = y < minY and y or minY
    maxX = x > maxX and x or maxX
    maxY = y > maxY and y or maxY
    x = vertices[6]
    y = vertices[7]
    minX = x < minX and x or minX
    minY = y < minY and y or minY
    maxX = x > maxX and x or maxX
    maxY = y > maxY and y or maxY
    self.minX = minX
    self.minY = minY
    self.maxX = maxX
    self.maxY = maxY
end
function Bounds.prototype.addFrame(self, transform, x0, y0, x1, y1)
    self:addFrameMatrix(
        transform.worldTransform,
        x0,
        y0,
        x1,
        y1
    )
end
function Bounds.prototype.addFrameMatrix(self, matrix, x0, y0, x1, y1)
    local a = matrix.a
    local b = matrix.b
    local c = matrix.c
    local d = matrix.d
    local tx = matrix.tx
    local ty = matrix.ty
    local minX = self.minX
    local minY = self.minY
    local maxX = self.maxX
    local maxY = self.maxY
    local x = a * x0 + c * y0 + tx
    local y = b * x0 + d * y0 + ty
    minX = x < minX and x or minX
    minY = y < minY and y or minY
    maxX = x > maxX and x or maxX
    maxY = y > maxY and y or maxY
    x = a * x1 + c * y0 + tx
    y = b * x1 + d * y0 + ty
    minX = x < minX and x or minX
    minY = y < minY and y or minY
    maxX = x > maxX and x or maxX
    maxY = y > maxY and y or maxY
    x = a * x0 + c * y1 + tx
    y = b * x0 + d * y1 + ty
    minX = x < minX and x or minX
    minY = y < minY and y or minY
    maxX = x > maxX and x or maxX
    maxY = y > maxY and y or maxY
    x = a * x1 + c * y1 + tx
    y = b * x1 + d * y1 + ty
    minX = x < minX and x or minX
    minY = y < minY and y or minY
    maxX = x > maxX and x or maxX
    maxY = y > maxY and y or maxY
    self.minX = minX
    self.minY = minY
    self.maxX = maxX
    self.maxY = maxY
end
function Bounds.prototype.addVertexData(self, vertexData, beginOffset, endOffset)
    local minX = self.minX
    local minY = self.minY
    local maxX = self.maxX
    local maxY = self.maxY
    do
        local i = beginOffset
        while i < endOffset do
            local x = vertexData[i]
            local y = vertexData[i + 1]
            minX = x < minX and x or minX
            minY = y < minY and y or minY
            maxX = x > maxX and x or maxX
            maxY = y > maxY and y or maxY
            i = i + 2
        end
    end
    self.minX = minX
    self.minY = minY
    self.maxX = maxX
    self.maxY = maxY
end
function Bounds.prototype.addVertices(self, transform, vertices, beginOffset, endOffset)
    self:addVerticesMatrix(transform.worldTransform, vertices, beginOffset, endOffset)
end
function Bounds.prototype.addVerticesMatrix(self, matrix, vertices, beginOffset, endOffset, padX, padY)
    if padX == nil then
        padX = 0
    end
    if padY == nil then
        padY = padX
    end
    local a = matrix.a
    local b = matrix.b
    local c = matrix.c
    local d = matrix.d
    local tx = matrix.tx
    local ty = matrix.ty
    local minX = self.minX
    local minY = self.minY
    local maxX = self.maxX
    local maxY = self.maxY
    do
        local i = beginOffset
        while i < endOffset do
            local rawX = vertices[i]
            local rawY = vertices[i + 1]
            local x = a * rawX + c * rawY + tx
            local y = d * rawY + b * rawX + ty
            minX = math.min(minX, x - padX)
            maxX = math.max(maxX, x + padX)
            minY = math.min(minY, y - padY)
            maxY = math.max(maxY, y + padY)
            i = i + 2
        end
    end
    self.minX = minX
    self.minY = minY
    self.maxX = maxX
    self.maxY = maxY
end
function Bounds.prototype.addBounds(self, bounds)
    local minX = self.minX
    local minY = self.minY
    local maxX = self.maxX
    local maxY = self.maxY
    self.minX = bounds.minX < minX and bounds.minX or minX
    self.minY = bounds.minY < minY and bounds.minY or minY
    self.maxX = bounds.maxX > maxX and bounds.maxX or maxX
    self.maxY = bounds.maxY > maxY and bounds.maxY or maxY
end
function Bounds.prototype.addBoundsMask(self, bounds, mask)
    local _minX = bounds.minX > mask.minX and bounds.minX or mask.minX
    local _minY = bounds.minY > mask.minY and bounds.minY or mask.minY
    local _maxX = bounds.maxX < mask.maxX and bounds.maxX or mask.maxX
    local _maxY = bounds.maxY < mask.maxY and bounds.maxY or mask.maxY
    if _minX <= _maxX and _minY <= _maxY then
        local minX = self.minX
        local minY = self.minY
        local maxX = self.maxX
        local maxY = self.maxY
        self.minX = _minX < minX and _minX or minX
        self.minY = _minY < minY and _minY or minY
        self.maxX = _maxX > maxX and _maxX or maxX
        self.maxY = _maxY > maxY and _maxY or maxY
    end
end
function Bounds.prototype.addBoundsMatrix(self, bounds, matrix)
    self:addFrameMatrix(
        matrix,
        bounds.minX,
        bounds.minY,
        bounds.maxX,
        bounds.maxY
    )
end
function Bounds.prototype.addBoundsArea(self, bounds, area)
    local _minX = bounds.minX > area.x and bounds.minX or area.x
    local _minY = bounds.minY > area.y and bounds.minY or area.y
    local _maxX = bounds.maxX < area.x + area.width and bounds.maxX or area.x + area.width
    local _maxY = bounds.maxY < area.y + area.height and bounds.maxY or area.y + area.height
    if _minX <= _maxX and _minY <= _maxY then
        local minX = self.minX
        local minY = self.minY
        local maxX = self.maxX
        local maxY = self.maxY
        self.minX = _minX < minX and _minX or minX
        self.minY = _minY < minY and _minY or minY
        self.maxX = _maxX > maxX and _maxX or maxX
        self.maxY = _maxY > maxY and _maxY or maxY
    end
end
function Bounds.prototype.pad(self, paddingX, paddingY)
    if paddingX == nil then
        paddingX = 0
    end
    if paddingY == nil then
        paddingY = paddingX
    end
    if not self:isEmpty() then
        self.minX = self.minX - paddingX
        self.maxX = self.maxX + paddingX
        self.minY = self.minY - paddingY
        self.maxY = self.maxY + paddingY
    end
end
function Bounds.prototype.addFramePad(self, x0, y0, x1, y1, padX, padY)
    x0 = x0 - padX
    y0 = y0 - padY
    x1 = x1 + padX
    y1 = y1 + padY
    self.minX = self.minX < x0 and self.minX or x0
    self.maxX = self.maxX > x1 and self.maxX or x1
    self.minY = self.minY < y0 and self.minY or y0
    self.maxY = self.maxY > y1 and self.maxY or y1
end
return ____exports
 end,
["display.DisplayObject"] = function(...) 
local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
local __TS__New = ____lualib.__TS__New
local __TS__SetDescriptor = ____lualib.__TS__SetDescriptor
local __TS__ObjectKeys = ____lualib.__TS__ObjectKeys
local __TS__ObjectGetOwnPropertyDescriptor = ____lualib.__TS__ObjectGetOwnPropertyDescriptor
local __TS__ObjectDefineProperty = ____lualib.__TS__ObjectDefineProperty
local Error = ____lualib.Error
local RangeError = ____lualib.RangeError
local ReferenceError = ____lualib.ReferenceError
local SyntaxError = ____lualib.SyntaxError
local TypeError = ____lualib.TypeError
local URIError = ____lualib.URIError
local ____exports = {}
local ____eventemitter3 = require("eventemitter3.index")
local EventEmitter = ____eventemitter3.default
local ____math = require("math.index")
local DEG_TO_RAD = ____math.DEG_TO_RAD
local RAD_TO_DEG = ____math.RAD_TO_DEG
local Rectangle = ____math.Rectangle
local Transform = ____math.Transform
local ____Bounds = require("display.Bounds")
local Bounds = ____Bounds.Bounds
local function noop()
end
--- The base class for all objects that are rendered on the screen.
-- 
-- This is an abstract class and can not be used on its own; rather it should be extended.
-- 
-- ## Display objects implemented in PixiJS
-- 
-- | Display Object                  | Description                                                           |
-- | ------------------------------- | --------------------------------------------------------------------- |
-- | {link PIXI.Container}          | Adds support for `children` to DisplayObject                          |
-- | {link PIXI.Graphics}           | Shape-drawing display object similar to the Canvas API                |
-- | {link PIXI.Sprite}             | Draws textures (i.e. images)                                          |
-- | {link PIXI.Text}               | Draws text using the Canvas API internally                            |
-- | {link PIXI.BitmapText}         | More scaleable solution for text rendering, reusing glyph textures    |
-- | {link PIXI.TilingSprite}       | Draws textures/images in a tiled fashion                              |
-- | {link PIXI.AnimatedSprite}     | Draws an animation of multiple images                                 |
-- | {link PIXI.Mesh}               | Provides a lower-level API for drawing meshes with custom data        |
-- | {link PIXI.NineSlicePlane}     | Mesh-related                                                          |
-- | {link PIXI.SimpleMesh}         | v4-compatible mesh                                                    |
-- | {link PIXI.SimplePlane}        | Mesh-related                                                          |
-- | {link PIXI.SimpleRope}         | Mesh-related                                                          |
-- 
-- ## Transforms
-- 
-- The [transform]{link DisplayObject#transform} of a display object describes the projection from its
-- local coordinate space to its parent's local coordinate space. The following properties are derived
-- from the transform:
-- 
-- <table>
--   <thead>
--     <tr>
--       <th>Property</th>
--       <th>Description</th>
--     </tr>
--   </thead>
--   <tbody>
--     <tr>
--       <td>[pivot]{link PIXI.DisplayObject#pivot}</td>
--       <td>
--         Invariant under rotation, scaling, and skewing. The projection of into the parent's space of the pivot
--         is equal to position, regardless of the other three transformations. In other words, It is the center of
--         rotation, scaling, and skewing.
--       </td>
--     </tr>
--     <tr>
--       <td>[position]{link PIXI.DisplayObject#position}</td>
--       <td>
--         Translation. This is the position of the [pivot]{link PIXI.DisplayObject#pivot} in the parent's local
--         space. The default value of the pivot is the origin (0,0). If the top-left corner of your display object
--         is (0,0) in its local space, then the position will be its top-left corner in the parent's local space.
--       </td>
--     </tr>
--     <tr>
--       <td>[scale]{link PIXI.DisplayObject#scale}</td>
--       <td>
--         Scaling. This will stretch (or compress) the display object's projection. The scale factors are along the
--         local coordinate axes. In other words, the display object is scaled before rotated or skewed. The center
--         of scaling is the [pivot]{link PIXI.DisplayObject#pivot}.
--       </td>
--     </tr>
--     <tr>
--       <td>[rotation]{link PIXI.DisplayObject#rotation}</td>
--       <td>
--          Rotation. This will rotate the display object's projection by this angle (in radians).
--       </td>
--     </tr>
--     <tr>
--       <td>[skew]{link PIXI.DisplayObject#skew}</td>
--       <td>
--         <p>Skewing. This can be used to deform a rectangular display object into a parallelogram.</p>
--         <p>
--         In PixiJS, skew has a slightly different behaviour than the conventional meaning. It can be
--         thought of the net rotation applied to the coordinate axes (separately). For example, if "skew.x" is
--         ⍺ and "skew.y" is β, then the line x = 0 will be rotated by ⍺ (y = -x*cot⍺) and the line y = 0 will be
--         rotated by β (y = x*tanβ). A line y = x*tanϴ (i.e. a line at angle ϴ to the x-axis in local-space) will
--         be rotated by an angle between ⍺ and β.
--         </p>
--         <p>
--         It can be observed that if skew is applied equally to both axes, then it will be equivalent to applying
--         a rotation. Indeed, if "skew.x" = -ϴ and "skew.y" = ϴ, it will produce an equivalent of "rotation" = ϴ.
--         </p>
--         <p>
--         Another quite interesting observation is that "skew.x", "skew.y", rotation are communtative operations. Indeed,
--         because rotation is essentially a careful combination of the two.
--         </p>
--       </td>
--     </tr>
--     <tr>
--       <td>angle</td>
--       <td>Rotation. This is an alias for [rotation]{link PIXI.DisplayObject#rotation}, but in degrees.</td>
--     </tr>
--     <tr>
--       <td>x</td>
--       <td>Translation. This is an alias for position.x!</td>
--     </tr>
--     <tr>
--       <td>y</td>
--       <td>Translation. This is an alias for position.y!</td>
--     </tr>
--     <tr>
--       <td>width</td>
--       <td>
--         Implemented in [Container]{link PIXI.Container}. Scaling. The width property calculates scale.x by dividing
--         the "requested" width by the local bounding box width. It is indirectly an abstraction over scale.x, and there
--         is no concept of user-defined width.
--       </td>
--     </tr>
--     <tr>
--       <td>height</td>
--       <td>
--         Implemented in [Container]{link PIXI.Container}. Scaling. The height property calculates scale.y by dividing
--         the "requested" height by the local bounding box height. It is indirectly an abstraction over scale.y, and there
--         is no concept of user-defined height.
--       </td>
--     </tr>
--   </tbody>
-- </table>
-- 
-- ## Bounds
-- 
-- The bounds of a display object is defined by the minimum axis-aligned rectangle in world space that can fit
-- around it. The abstract `calculateBounds` method is responsible for providing it (and it should use the
-- `worldTransform` to calculate in world space).
-- 
-- There are a few additional types of bounding boxes:
-- 
-- | Bounds                | Description                                                                              |
-- | --------------------- | ---------------------------------------------------------------------------------------- |
-- | World Bounds          | This is synonymous is the regular bounds described above. See `getBounds()`.             |
-- | Local Bounds          | This the axis-aligned bounding box in the parent's local space. See `getLocalBounds()`.  |
-- | Render Bounds         | The bounds, but including extra rendering effects like filter padding.                   |
-- | Projected Bounds      | The bounds of the projected display object onto the screen. Usually equals world bounds. |
-- | Relative Bounds       | The bounds of a display object when projected onto a ancestor's (or parent's) space.     |
-- | Natural Bounds        | The bounds of an object in its own local space (not parent's space, like in local bounds)|
-- | Content Bounds        | The natural bounds when excluding all children of a `Container`.                         |
-- 
-- ### calculateBounds
-- 
-- [Container]{link Container} already implements `calculateBounds` in a manner that includes children.
-- 
-- But for a non-Container display object, the `calculateBounds` method must be overridden in order for `getBounds` and
-- `getLocalBounds` to work. This method must write the bounds into `this._bounds`.
-- 
-- Generally, the following technique works for most simple cases: take the list of points
-- forming the "hull" of the object (i.e. outline of the object's shape), and then add them
-- using {link PIXI.Bounds#addPointMatrix}.
-- 
-- ```js
-- calculateBounds()
-- {
--     const points = [...];
-- 
--     for (let i = 0, j = points.length; i < j; i++)
--     {
--         this._bounds.addPointMatrix(this.worldTransform, points[i]);
--     }
-- }
-- ```
-- 
-- You can optimize this for a large number of points by using {link PIXI.Bounds#addVerticesMatrix} to pass them
-- in one array together.
-- 
-- ## Alpha
-- 
-- This alpha sets a display object's **relative opacity** w.r.t its parent. For example, if the alpha of a display
-- object is 0.5 and its parent's alpha is 0.5, then it will be rendered with 25% opacity (assuming alpha is not
-- applied on any ancestor further up the chain).
-- 
-- The alpha with which the display object will be rendered is called the [worldAlpha]{link PIXI.DisplayObject#worldAlpha}.
-- 
-- ## Renderable vs Visible
-- 
-- The `renderable` and `visible` properties can be used to prevent a display object from being rendered to the
-- screen. However, there is a subtle difference between the two. When using `renderable`, the transforms  of the display
-- object (and its children subtree) will continue to be calculated. When using `visible`, the transforms will not
-- be calculated.
-- 
-- It is recommended that applications use the `renderable` property for culling. See
-- [@pixi-essentials/cull]{link https://www.npmjs.com/package/@pixi-essentials/cull} or
-- [pixi-cull]{link https://www.npmjs.com/package/pixi-cull} for more details.
-- 
-- Otherwise, to prevent an object from rendering in the general-purpose sense - `visible` is the property to use. This
-- one is also better in terms of performance.
-- 
-- @memberof PIXI
____exports.DisplayObject = __TS__Class()
local DisplayObject = ____exports.DisplayObject
DisplayObject.name = "DisplayObject"
__TS__ClassExtends(DisplayObject, EventEmitter)
function DisplayObject.prototype.____constructor(self)
    EventEmitter.prototype.____constructor(self)
    self.tempDisplayObjectParent = nil
    self.transform = __TS__New(Transform)
    self.alpha = 1
    self.visible = true
    self.renderable = true
    self.cullable = false
    self.cullArea = nil
    self.parent = nil
    self.worldAlpha = 1
    self._lastSortedIndex = 0
    self._zIndex = 0
    self._bounds = __TS__New(Bounds)
    self._localBounds = nil
    self._boundsID = 0
    self._boundsRect = nil
    self._localBoundsRect = nil
    self._destroyed = false
    self.isSprite = false
    self.displayObjectUpdateTransform = ____exports.DisplayObject.prototype.updateTransform
end
__TS__SetDescriptor(
    DisplayObject.prototype,
    "destroyed",
    {get = function(self)
        return self._destroyed
    end},
    true
)
__TS__SetDescriptor(
    DisplayObject.prototype,
    "_tempDisplayObjectParent",
    {get = function(self)
        if self.tempDisplayObjectParent == nil then
            self.tempDisplayObjectParent = __TS__New(____exports.TemporaryDisplayObject)
        end
        return self.tempDisplayObjectParent
    end},
    true
)
__TS__SetDescriptor(
    DisplayObject.prototype,
    "x",
    {
        get = function(self)
            return self.position.x
        end,
        set = function(self, value)
            self.transform.position.x = value
        end
    },
    true
)
__TS__SetDescriptor(
    DisplayObject.prototype,
    "y",
    {
        get = function(self)
            return self.position.y
        end,
        set = function(self, value)
            self.transform.position.y = value
        end
    },
    true
)
__TS__SetDescriptor(
    DisplayObject.prototype,
    "worldTransform",
    {get = function(self)
        return self.transform.worldTransform
    end},
    true
)
__TS__SetDescriptor(
    DisplayObject.prototype,
    "localTransform",
    {get = function(self)
        return self.transform.localTransform
    end},
    true
)
__TS__SetDescriptor(
    DisplayObject.prototype,
    "position",
    {
        get = function(self)
            return self.transform.position
        end,
        set = function(self, value)
            self.transform.position:copyFrom(value)
        end
    },
    true
)
__TS__SetDescriptor(
    DisplayObject.prototype,
    "scale",
    {
        get = function(self)
            return self.transform.scale
        end,
        set = function(self, value)
            self.transform.scale:copyFrom(value)
        end
    },
    true
)
__TS__SetDescriptor(
    DisplayObject.prototype,
    "pivot",
    {
        get = function(self)
            return self.transform.pivot
        end,
        set = function(self, value)
            self.transform.pivot:copyFrom(value)
        end
    },
    true
)
__TS__SetDescriptor(
    DisplayObject.prototype,
    "skew",
    {
        get = function(self)
            return self.transform.skew
        end,
        set = function(self, value)
            self.transform.skew:copyFrom(value)
        end
    },
    true
)
__TS__SetDescriptor(
    DisplayObject.prototype,
    "rotation",
    {
        get = function(self)
            return self.transform.rotation
        end,
        set = function(self, value)
            self.transform.rotation = value
        end
    },
    true
)
__TS__SetDescriptor(
    DisplayObject.prototype,
    "angle",
    {
        get = function(self)
            return self.transform.rotation * RAD_TO_DEG
        end,
        set = function(self, value)
            self.transform.rotation = value * DEG_TO_RAD
        end
    },
    true
)
__TS__SetDescriptor(
    DisplayObject.prototype,
    "zIndex",
    {
        get = function(self)
            return self._zIndex
        end,
        set = function(self, value)
            self._zIndex = value
            if self.parent then
                self.parent.sortDirty = true
            end
        end
    },
    true
)
__TS__SetDescriptor(
    DisplayObject.prototype,
    "worldVisible",
    {get = function(self)
        local item = self
        while item do
            if not item.visible then
                return false
            end
            item = item.parent
        end
        return true
    end},
    true
)
function DisplayObject.mixin(self, source)
    local keys = __TS__ObjectKeys(source)
    do
        local i = 0
        while i < #keys do
            do
                local propertyName = keys[i + 1]
                local descriptor = __TS__ObjectGetOwnPropertyDescriptor(source, propertyName)
                if not descriptor then
                    goto __continue32
                end
                __TS__ObjectDefineProperty(____exports.DisplayObject.prototype, propertyName, descriptor)
            end
            ::__continue32::
            i = i + 1
        end
    end
end
function DisplayObject.prototype._recursivePostUpdateTransform(self)
    if self.parent then
        self.parent:_recursivePostUpdateTransform()
        self.transform:updateTransform(self.parent.transform)
    else
        self.transform:updateTransform(self._tempDisplayObjectParent.transform)
    end
end
function DisplayObject.prototype.updateTransform(self)
    self._boundsID = self._boundsID + 1
    self.transform:updateTransform(self.parent.transform)
    self.worldAlpha = self.alpha * self.parent.worldAlpha
end
function DisplayObject.prototype.getBounds(self, skipUpdate, rect)
    if not skipUpdate then
        if not self.parent then
            self.parent = self._tempDisplayObjectParent
            self:updateTransform()
            self.parent = nil
        else
            self:_recursivePostUpdateTransform()
            self:updateTransform()
        end
    end
    if self._bounds.updateID ~= self._boundsID then
        self:calculateBounds()
        self._bounds.updateID = self._boundsID
    end
    if not rect then
        if not self._boundsRect then
            self._boundsRect = __TS__New(Rectangle)
        end
        rect = self._boundsRect
    end
    return self._bounds:getRectangle(rect)
end
function DisplayObject.prototype.getLocalBounds(self, rect)
    if not rect then
        if not self._localBoundsRect then
            self._localBoundsRect = __TS__New(Rectangle)
        end
        rect = self._localBoundsRect
    end
    if not self._localBounds then
        self._localBounds = __TS__New(Bounds)
    end
    local transformRef = self.transform
    local parentRef = self.parent
    self.parent = nil
    self.transform = self._tempDisplayObjectParent.transform
    local worldBounds = self._bounds
    local worldBoundsID = self._boundsID
    self._bounds = self._localBounds
    local bounds = self:getBounds(false, rect)
    self.parent = parentRef
    self.transform = transformRef
    self._bounds = worldBounds
    local ____self__bounds_0, ____updateID_1 = self._bounds, "updateID"
    ____self__bounds_0[____updateID_1] = ____self__bounds_0[____updateID_1] + (self._boundsID - worldBoundsID)
    return bounds
end
function DisplayObject.prototype.toGlobal(self, position, point, skipUpdate)
    if skipUpdate == nil then
        skipUpdate = false
    end
    if not skipUpdate then
        self:_recursivePostUpdateTransform()
        if not self.parent then
            self.parent = self._tempDisplayObjectParent
            self:displayObjectUpdateTransform()
            self.parent = nil
        else
            self:displayObjectUpdateTransform()
        end
    end
    return self.worldTransform:apply(position, point)
end
function DisplayObject.prototype.toLocal(self, position, from, point, skipUpdate)
    if from then
        position = from:toGlobal(position, point, skipUpdate)
    end
    if not skipUpdate then
        self:_recursivePostUpdateTransform()
        if not self.parent then
            self.parent = self._tempDisplayObjectParent
            self:displayObjectUpdateTransform()
            self.parent = nil
        else
            self:displayObjectUpdateTransform()
        end
    end
    return self.worldTransform:applyInverse(position, point)
end
function DisplayObject.prototype.setParent(self, container)
    if not container or not container.addChild then
        error(
            __TS__New(Error, "setParent: Argument must be a Container"),
            0
        )
    end
    container:addChild(self)
    return container
end
function DisplayObject.prototype.removeFromParent(self)
    local ____opt_2 = self.parent
    if ____opt_2 ~= nil then
        ____opt_2:removeChild(self)
    end
end
function DisplayObject.prototype.setTransform(self, x, y, scaleX, scaleY, rotation, skewX, skewY, pivotX, pivotY)
    if x == nil then
        x = 0
    end
    if y == nil then
        y = 0
    end
    if scaleX == nil then
        scaleX = 1
    end
    if scaleY == nil then
        scaleY = 1
    end
    if rotation == nil then
        rotation = 0
    end
    if skewX == nil then
        skewX = 0
    end
    if skewY == nil then
        skewY = 0
    end
    if pivotX == nil then
        pivotX = 0
    end
    if pivotY == nil then
        pivotY = 0
    end
    self.position.x = x
    self.position.y = y
    self.scale.x = not scaleX and 1 or scaleX
    self.scale.y = not scaleY and 1 or scaleY
    self.rotation = rotation
    self.skew.x = skewX
    self.skew.y = skewY
    self.pivot.x = pivotX
    self.pivot.y = pivotY
    return self
end
function DisplayObject.prototype.destroy(self, _options)
    self:removeFromParent()
    self._destroyed = true
    self.parent = nil
    self.cullArea = nil
    local ____self = self
    if ____self.interactive ~= nil then
        ____self.interactive = false
        ____self.interactiveChildren = false
    end
    self:emit("destroyed")
    self:removeAllListeners()
end
function DisplayObject.prototype.enableTempParent(self)
    local myParent = self.parent
    self.parent = self._tempDisplayObjectParent
    return myParent
end
function DisplayObject.prototype.disableTempParent(self, cacheParent)
    self.parent = cacheParent
end
---
-- @private
____exports.TemporaryDisplayObject = __TS__Class()
local TemporaryDisplayObject = ____exports.TemporaryDisplayObject
TemporaryDisplayObject.name = "TemporaryDisplayObject"
__TS__ClassExtends(TemporaryDisplayObject, ____exports.DisplayObject)
function TemporaryDisplayObject.prototype.____constructor(self)
    TemporaryDisplayObject.____super.prototype.____constructor(self)
    self.sortDirty = false
    self.calculateBounds = noop
    self.removeChild = noop
    self.render = noop
    self.renderCanvas = noop
end
____exports.DisplayObject.prototype.displayObjectUpdateTransform = ____exports.DisplayObject.prototype.updateTransform
return ____exports
 end,
["display.Container"] = function(...) 
local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
local __TS__SetDescriptor = ____lualib.__TS__SetDescriptor
local Error = ____lualib.Error
local RangeError = ____lualib.RangeError
local ReferenceError = ____lualib.ReferenceError
local SyntaxError = ____lualib.SyntaxError
local TypeError = ____lualib.TypeError
local URIError = ____lualib.URIError
local __TS__New = ____lualib.__TS__New
local __TS__ArraySplice = ____lualib.__TS__ArraySplice
local __TS__ArrayIndexOf = ____lualib.__TS__ArrayIndexOf
local __TS__ArraySort = ____lualib.__TS__ArraySort
local ____exports = {}
local utils = require("utils.index")
local ____DisplayObject = require("display.DisplayObject")
local DisplayObject = ____DisplayObject.DisplayObject
local function sortChildren(self, a, b)
    if a.zIndex == b.zIndex then
        return a._lastSortedIndex - b._lastSortedIndex
    end
    return a.zIndex - b.zIndex
end
--- Container is a general-purpose display object that holds children. It also adds built-in support for advanced
-- rendering features like masking and filtering.
-- 
-- It is the base class of all display objects that act as a container for other objects, including Graphics
-- and Sprite.
-- 
-- @example import { BlurFilter, Container, Graphics, Sprite } from 'pixi.js';
-- 
-- const container = new Container();
-- const sprite = Sprite.from('https://s3-us-west-2.amazonaws.com/s.cdpn.io/693612/IaUrttj.png');
-- 
-- sprite.width = 512;
-- sprite.height = 512;
-- 
-- // Adds a sprite as a child to this container. As a result, the sprite will be rendered whenever the container
-- // is rendered.
-- container.addChild(sprite);
-- 
-- // Blurs whatever is rendered by the container
-- container.filters = [new BlurFilter()];
-- 
-- // Only the contents within a circle at the center should be rendered onto the screen.
-- container.mask = new Graphics()
--     .beginFill(0xffffff)
--     .drawCircle(sprite.width / 2, sprite.height / 2, Math.min(sprite.width, sprite.height) / 2)
--     .endFill();
-- @memberof PIXI
____exports.Container = __TS__Class()
local Container = ____exports.Container
Container.name = "Container"
__TS__ClassExtends(Container, DisplayObject)
function Container.prototype.____constructor(self)
    DisplayObject.prototype.____constructor(self)
    self.children = {}
    self.sortableChildren = ____exports.Container.defaultSortableChildren
    self.sortDirty = false
    self._width = 0
    self._height = 0
end
__TS__SetDescriptor(
    Container.prototype,
    "width",
    {
        get = function(self)
            return self.scale.x * self:getLocalBounds().width
        end,
        set = function(self, value)
            local width = self:getLocalBounds().width
            if width ~= 0 then
                self.scale.x = value / width
            else
                self.scale.x = 1
            end
            self._width = value
        end
    },
    true
)
__TS__SetDescriptor(
    Container.prototype,
    "height",
    {
        get = function(self)
            return self.scale.y * self:getLocalBounds().height
        end,
        set = function(self, value)
            local height = self:getLocalBounds().height
            if height ~= 0 then
                self.scale.y = value / height
            else
                self.scale.y = 1
            end
            self._height = value
        end
    },
    true
)
function Container.prototype.onChildrenChange(self, _length)
end
function Container.prototype.addChild(self, ...)
    local children = {...}
    if #children > 1 then
        do
            local i = 0
            while i < #children do
                self:addChild(children[i + 1])
                i = i + 1
            end
        end
    else
        local child = children[1]
        if child.parent then
            child.parent:removeChild(child)
        end
        child.parent = self
        self.sortDirty = true
        child.transform._parentID = -1
        local ____self_children_0 = self.children
        ____self_children_0[#____self_children_0 + 1] = child
        self._boundsID = self._boundsID + 1
        self:onChildrenChange(#self.children - 1)
        self:emit("childAdded", child, self, #self.children - 1)
        child:emit("added", self)
    end
    return children[1]
end
function Container.prototype.addChildAt(self, child, index)
    if index < 0 or index > #self.children then
        error(
            __TS__New(
                Error,
                (((tostring(child) .. "addChildAt: The index ") .. tostring(index)) .. " supplied is out of bounds ") .. tostring(#self.children)
            ),
            0
        )
    end
    if child.parent then
        child.parent:removeChild(child)
    end
    child.parent = self
    self.sortDirty = true
    child.transform._parentID = -1
    __TS__ArraySplice(self.children, index, 0, child)
    self._boundsID = self._boundsID + 1
    self:onChildrenChange(index)
    child:emit("added", self)
    self:emit("childAdded", child, self, index)
    return child
end
function Container.prototype.swapChildren(self, child, child2)
    if child == child2 then
        return
    end
    local index1 = self:getChildIndex(child)
    local index2 = self:getChildIndex(child2)
    self.children[index1 + 1] = child2
    self.children[index2 + 1] = child
    self:onChildrenChange(index1 < index2 and index1 or index2)
end
function Container.prototype.getChildIndex(self, child)
    local index = __TS__ArrayIndexOf(self.children, child)
    if index == -1 then
        error(
            __TS__New(Error, "The supplied DisplayObject must be a child of the caller"),
            0
        )
    end
    return index
end
function Container.prototype.setChildIndex(self, child, index)
    if index < 0 or index >= #self.children then
        error(
            __TS__New(
                Error,
                (("The index " .. tostring(index)) .. " supplied is out of bounds ") .. tostring(#self.children)
            ),
            0
        )
    end
    local currentIndex = self:getChildIndex(child)
    utils:removeItems(self.children, currentIndex, 1)
    __TS__ArraySplice(self.children, index, 0, child)
    self:onChildrenChange(index)
end
function Container.prototype.getChildAt(self, index)
    if index < 0 or index >= #self.children then
        error(
            __TS__New(
                Error,
                ("getChildAt: Index (" .. tostring(index)) .. ") does not exist."
            ),
            0
        )
    end
    return self.children[index + 1]
end
function Container.prototype.removeChild(self, ...)
    local children = {...}
    if #children > 1 then
        do
            local i = 0
            while i < #children do
                self:removeChild(children[i + 1])
                i = i + 1
            end
        end
    else
        local child = children[1]
        local index = __TS__ArrayIndexOf(self.children, child)
        if index == -1 then
            return nil
        end
        child.parent = nil
        child.transform._parentID = -1
        utils:removeItems(self.children, index, 1)
        self._boundsID = self._boundsID + 1
        self:onChildrenChange(index)
        child:emit("removed", self)
        self:emit("childRemoved", child, self, index)
    end
    return children[1]
end
function Container.prototype.removeChildAt(self, index)
    local child = self:getChildAt(index)
    child.parent = nil
    child.transform._parentID = -1
    utils:removeItems(self.children, index, 1)
    self._boundsID = self._boundsID + 1
    self:onChildrenChange(index)
    child:emit("removed", self)
    self:emit("childRemoved", child, self, index)
    return child
end
function Container.prototype.removeChildren(self, beginIndex, endIndex)
    if beginIndex == nil then
        beginIndex = 0
    end
    if endIndex == nil then
        endIndex = #self.children
    end
    local begin = beginIndex
    local ____end = endIndex
    local range = ____end - begin
    local removed
    if range > 0 and range <= ____end then
        removed = __TS__ArraySplice(self.children, begin, range)
        do
            local i = 0
            while i < #removed do
                removed[i + 1].parent = nil
                if removed[i + 1].transform ~= nil then
                    removed[i + 1].transform._parentID = -1
                end
                i = i + 1
            end
        end
        self._boundsID = self._boundsID + 1
        self:onChildrenChange(beginIndex)
        do
            local i = 0
            while i < #removed do
                removed[i + 1]:emit("removed", self)
                self:emit("childRemoved", removed[i + 1], self, i)
                i = i + 1
            end
        end
        return removed
    elseif range == 0 and #self.children == 0 then
        return {}
    end
    error(
        __TS__New(RangeError, "removeChildren: numeric values are outside the acceptable range."),
        0
    )
end
function Container.prototype.sortChildren(self)
    local sortRequired = false
    do
        local i = 0
        local j = #self.children
        while i < j do
            local child = self.children[i + 1]
            child._lastSortedIndex = i
            if not sortRequired and child.zIndex ~= 0 then
                sortRequired = true
            end
            i = i + 1
        end
    end
    if sortRequired and #self.children > 1 then
        __TS__ArraySort(self.children, sortChildren)
    end
    self.sortDirty = false
end
function Container.prototype.updateTransform(self)
    if self.sortableChildren and self.sortDirty then
        self:sortChildren()
    end
    self._boundsID = self._boundsID + 1
    self.transform:updateTransform(self.parent.transform)
    self.worldAlpha = self.alpha * self.parent.worldAlpha
    do
        local i = 0
        local j = #self.children
        while i < j do
            local child = self.children[i + 1]
            if child.visible then
                child:updateTransform()
            end
            i = i + 1
        end
    end
end
function Container.prototype.containerUpdateTransform(self)
    self:updateTransform()
end
function Container.prototype.calculateBounds(self)
    self._bounds:clear()
    self:_calculateBounds()
    do
        local i = 0
        while i < #self.children do
            do
                local child = self.children[i + 1]
                if not child.visible or not child.renderable then
                    goto __continue52
                end
                child:calculateBounds()
                self._bounds:addBounds(child._bounds)
            end
            ::__continue52::
            i = i + 1
        end
    end
    self._bounds.updateID = self._boundsID
end
function Container.prototype.getLocalBounds(self, rect, skipChildrenUpdate)
    if skipChildrenUpdate == nil then
        skipChildrenUpdate = false
    end
    local result = DisplayObject.prototype.getLocalBounds(self, rect)
    if not skipChildrenUpdate then
        do
            local i = 0
            local j = #self.children
            while i < j do
                local child = self.children[i + 1]
                if child.visible then
                    child:updateTransform()
                end
                i = i + 1
            end
        end
    end
    return result
end
function Container.prototype._calculateBounds(self)
end
function Container.prototype.render(self, renderer)
    if not self.visible or self.worldAlpha <= 0 or not self.renderable then
        return
    end
    self:_render(renderer)
    do
        local i = 0
        local j = #self.children
        while i < j do
            self.children[i + 1]:render(renderer)
            i = i + 1
        end
    end
end
function Container.prototype._renderCanvas(self, _renderer)
end
function Container.prototype.renderCanvas(self, renderer)
    if not self.visible or self.worldAlpha <= 0 or not self.renderable then
        return
    end
    self:_renderCanvas(renderer)
    do
        local i = 0
        local j = #self.children
        while i < j do
            self.children[i + 1]:renderCanvas(renderer)
            i = i + 1
        end
    end
end
function Container.prototype._render(self, _renderer)
end
function Container.prototype.destroy(self, options)
    DisplayObject.prototype.destroy(self)
    self.sortDirty = false
    local ____temp_3
    if type(options) == "boolean" then
        ____temp_3 = options
    else
        ____temp_3 = options and options.children
    end
    local destroyChildren = ____temp_3
    local oldChildren = self:removeChildren(0, #self.children)
    if destroyChildren then
        do
            local i = 0
            while i < #oldChildren do
                oldChildren[i + 1]:destroy(options)
                i = i + 1
            end
        end
    end
end
Container.defaultSortableChildren = false
return ____exports
 end,
["display.index"] = function(...) 
--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
local ____exports = {}
do
    local ____export = require("display.Bounds")
    for ____exportKey, ____exportValue in pairs(____export) do
        if ____exportKey ~= "default" then
            ____exports[____exportKey] = ____exportValue
        end
    end
end
do
    local ____export = require("display.Container")
    for ____exportKey, ____exportValue in pairs(____export) do
        if ____exportKey ~= "default" then
            ____exports[____exportKey] = ____exportValue
        end
    end
end
do
    local ____export = require("display.DisplayObject")
    for ____exportKey, ____exportValue in pairs(____export) do
        if ____exportKey ~= "default" then
            ____exports[____exportKey] = ____exportValue
        end
    end
end
return ____exports
 end,
["core.ICanvas"] = function(...) 
--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
local ____exports = {}
return ____exports
 end,
["core.IRenderer"] = function(...) 
--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
local ____exports = {}
return ____exports
 end,
["core.system.SystemManager"] = function(...) 
local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
local Error = ____lualib.Error
local RangeError = ____lualib.RangeError
local ReferenceError = ____lualib.ReferenceError
local SyntaxError = ____lualib.SyntaxError
local TypeError = ____lualib.TypeError
local URIError = ____lualib.URIError
local __TS__New = ____lualib.__TS__New
local __TS__ArrayForEach = ____lualib.__TS__ArrayForEach
local __TS__ObjectKeys = ____lualib.__TS__ObjectKeys
local __TS__ArrayFind = ____lualib.__TS__ArrayFind
local __TS__ObjectValues = ____lualib.__TS__ObjectValues
local ____exports = {}
local ____systems = require("core.systems")
local systems = ____systems.default
local ____runner = require("runner.index")
local Runner = ____runner.Runner
local ____eventemitter3 = require("eventemitter3.index")
local EventEmitter = ____eventemitter3.EventEmitter
--- The SystemManager is a class that provides functions for managing a set of systems
-- This is a base class, that is generic (no render code or knowledge at all)
-- 
-- @memberof PIXI
____exports.SystemManager = __TS__Class()
local SystemManager = ____exports.SystemManager
SystemManager.name = "SystemManager"
__TS__ClassExtends(SystemManager, EventEmitter)
function SystemManager.prototype.____constructor(self, ...)
    EventEmitter.prototype.____constructor(self, ...)
    self.runners = {}
    self.systemsByName = {}
end
function SystemManager.prototype.get(self, name)
    return self.systemsByName[name]
end
function SystemManager.prototype.setup(self, config)
    self:addRunners(unpack(config.runners))
    for ____, name in ipairs(config.priority) do
        local system = systems:get(name)
        if system == nil then
            error(
                __TS__New(Error, "Missing system: " .. name),
                0
            )
        end
        self:addSystem(system, name)
    end
end
function SystemManager.prototype.addRunners(self, ...)
    local runnerIds = {...}
    __TS__ArrayForEach(
        runnerIds,
        function(____, runnerId)
            self.runners[runnerId] = __TS__New(Runner, runnerId)
        end
    )
end
function SystemManager.prototype.addSystem(self, ClassRef, name)
    local system = __TS__New(ClassRef, self)
    if self[name] then
        error(
            __TS__New(Error, ("Whoops! The name \"" .. name) .. "\" is already in use"),
            0
        )
    end
    self[name] = system
    self.systemsByName[name] = system
    for i in pairs(self.runners) do
        self.runners[i]:add(system)
    end
    return self
end
function SystemManager.prototype.emitWithCustomOptions(self, runner, options)
    local systemHashKeys = __TS__ObjectKeys(self.systemsByName)
    __TS__ArrayForEach(
        runner.items,
        function(____, system)
            local systemName = __TS__ArrayFind(
                systemHashKeys,
                function(____, systemId) return self.systemsByName[systemId] == system end
            ) or "unset"
            system[runner.name](system, options[systemName])
        end
    )
end
function SystemManager.prototype.destroy(self)
    __TS__ArrayForEach(
        __TS__ObjectValues(self.runners),
        function(____, runner)
            runner:destroy()
        end
    )
    self.systemsByName = {}
end
return ____exports
 end,
["canvas-renderer.CanvasObjectRendererSystem"] = function(...) 
local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local ____exports = {}
local systems = require("core.systems")
local ____constants = require("constants.index")
local BLEND_MODES = ____constants.BLEND_MODES
--- system that provides a render function that focussing on rendering Pixi Scene Graph objects
-- to either the main view or to a renderTexture. Used for Canvas `2d` contexts
-- 
-- @memberof PIXI
____exports.CanvasObjectRendererSystem = __TS__Class()
local CanvasObjectRendererSystem = ____exports.CanvasObjectRendererSystem
CanvasObjectRendererSystem.name = "CanvasObjectRendererSystem"
function CanvasObjectRendererSystem.prototype.____constructor(self, renderer)
    self.renderer = renderer
    self.renderingToScreen = true
    self.lastObjectRendered = nil
end
function CanvasObjectRendererSystem.prototype.render(self, displayObject, options)
    local renderer = self.renderer
    if not renderer.view then
        return
    end
    local _context = renderer.canvasContext
    local renderTexture = nil
    local clear = false
    local transform = nil
    local skipUpdateTransform = false
    if options then
        renderTexture = nil
        local ____options_clear_0 = options.clear
        if ____options_clear_0 == nil then
            ____options_clear_0 = clear
        end
        clear = ____options_clear_0
        transform = options.transform or transform
        local ____options_skipUpdateTransform_1 = options.skipUpdateTransform
        if ____options_skipUpdateTransform_1 == nil then
            ____options_skipUpdateTransform_1 = skipUpdateTransform
        end
        skipUpdateTransform = ____options_skipUpdateTransform_1
    end
    self.renderingToScreen = not renderTexture
    renderer:emit("prerender")
    local rootResolution = 1
    _context.activeContext = _context.rootContext
    _context.activeResolution = rootResolution
    local context2D = _context.activeContext
    _context._projTransform = transform or nil
    if not renderTexture then
        self.lastObjectRendered = displayObject
    end
    if not skipUpdateTransform then
        local cacheParent = displayObject:enableTempParent()
        displayObject:updateTransform()
        displayObject:disableTempParent(cacheParent)
    end
    context2D:save()
    context2D:setTransform(
        1,
        0,
        0,
        1,
        0,
        0
    )
    context2D.globalAlpha = 1
    _context._activeBlendMode = BLEND_MODES.NORMAL
    _context._outerBlend = false
    context2D.globalCompositeOperation = _context.blendModes[BLEND_MODES.NORMAL + 1]
    local tempContext = _context.activeContext
    _context.activeContext = context2D
    displayObject:renderCanvas(renderer)
    _context.activeContext = tempContext
    context2D:restore()
    _context.activeResolution = rootResolution
    _context._projTransform = nil
    renderer:emit("postrender")
end
function CanvasObjectRendererSystem.prototype.destroy(self)
    self.lastObjectRendered = nil
    self.render = nil
end
systems:register("objectRenderer", ____exports.CanvasObjectRendererSystem)
return ____exports
 end,
["canvas-renderer.CanvasRenderer"] = function(...) 
local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
local __TS__ObjectAssign = ____lualib.__TS__ObjectAssign
local __TS__SetDescriptor = ____lualib.__TS__SetDescriptor
local __TS__ArrayReverse = ____lualib.__TS__ArrayReverse
local ____exports = {}
local ____settings = require("settings")
local settings = ____settings.default
local ____SystemManager = require("core.system.SystemManager")
local SystemManager = ____SystemManager.SystemManager
local ____constants = require("constants.index")
local RENDERER_TYPE = ____constants.RENDERER_TYPE
--- The CanvasRenderer draws the scene and all its content onto a 2d canvas.
-- 
-- This renderer should be used for browsers that support WebGL.
-- 
-- This renderer should be used for browsers that do not support WebGL.
-- Don't forget to add the view to your DOM or you will not see anything!
-- 
-- Renderer is composed of systems that manage specific tasks. The following systems are added by default
-- whenever you create a renderer:
-- 
-- | System                               | Description                                                                   |
-- | ------------------------------------ | ----------------------------------------------------------------------------- |
-- 
-- | Generic Systems                      | Systems that manage functionality that all renderer types share               |
-- | ------------------------------------ | ----------------------------------------------------------------------------- |
-- | {link PIXI.ViewSystem}              | This manages the main view of the renderer usually a Canvas                   |
-- | {link PIXI.PluginSystem}            | This manages plugins for the renderer                                         |
-- | {link PIXI.BackgroundSystem}        | This manages the main views background color and alpha                        |
-- | {link PIXI.StartupSystem}           | Boots up a renderer and initiatives all the systems                           |
-- | {link PIXI.EventSystem}             | This manages UI events.                                                       |
-- | {link PIXI.GenerateTextureSystem}   | This adds the ability to generate textures from any PIXI.DisplayObject        |
-- 
-- | PixiJS High-Level Systems            | Set of specific systems designed to work with PixiJS objects                  |
-- | ------------------------------------ | ----------------------------------------------------------------------------- |
-- | {link PIXI.CanvasContextSystem}     | This manages the canvas `2d` contexts and their state                         |
-- | {link PIXI.CanvasMaskSystem}        | This manages masking operations.                                              |
-- | {link PIXI.CanvasRenderSystem}      | This adds the ability to render a PIXI.DisplayObject                          |
-- | {link PIXI.CanvasExtract}           | This extracts image data from a PIXI.DisplayObject                            |
-- | {link PIXI.CanvasPrepare}           | This prepares a PIXI.DisplayObject async for rendering                        |
-- 
-- The breadth of the API surface provided by the renderer is contained within these systems.
-- 
-- @class
-- @memberof PIXI
____exports.CanvasRenderer = __TS__Class()
local CanvasRenderer = ____exports.CanvasRenderer
CanvasRenderer.name = "CanvasRenderer"
__TS__ClassExtends(CanvasRenderer, SystemManager)
function CanvasRenderer.prototype.____constructor(self, options)
    SystemManager.prototype.____constructor(self)
    self.resolution = 1
    self.rendererLogId = "Canvas"
    self.canvasContext = nil
    self.objectRenderer = nil
    options = __TS__ObjectAssign({}, settings.RENDER_OPTIONS, options)
    local systemConfig = {runners = {
        "init",
        "destroy",
        "contextChange",
        "resolutionChange",
        "reset",
        "update",
        "postrender",
        "prerender",
        "resize"
    }, systems = ____exports.CanvasRenderer.__systems, priority = {
        "background",
        "_view",
        "startup",
        "canvasContext",
        "objectRenderer",
        "graphics"
    }}
    self.background = nil
    self.startup = nil
    self._view = nil
    self:setup(systemConfig)
    local ____temp_1 = options.backgroundAlpha or 1
    local ____temp_2 = options.background or options.backgroundColor or 16777215
    local ____options_clearBeforeRender_0 = options.clearBeforeRender
    if ____options_clearBeforeRender_0 == nil then
        ____options_clearBeforeRender_0 = false
    end
    local startupOptions = {background = {alpha = ____temp_1, color = ____temp_2, clearBeforeRender = ____options_clearBeforeRender_0}, _view = {height = options.height or 100, width = options.width or 100, view = options.view}}
    self.type = RENDERER_TYPE.CANVAS
    self.options = options
    self.startup:run(startupOptions)
end
__TS__SetDescriptor(
    CanvasRenderer.prototype,
    "width",
    {get = function(self)
        return self._view.element.width
    end},
    true
)
__TS__SetDescriptor(
    CanvasRenderer.prototype,
    "height",
    {get = function(self)
        return self._view.element.height
    end},
    true
)
__TS__SetDescriptor(
    CanvasRenderer.prototype,
    "view",
    {get = function(self)
        return self._view.element
    end},
    true
)
__TS__SetDescriptor(
    CanvasRenderer.prototype,
    "screen",
    {get = function(self)
        return self._view.screen
    end},
    true
)
__TS__SetDescriptor(
    CanvasRenderer.prototype,
    "lastObjectRendered",
    {get = function(self)
        return self.objectRenderer.lastObjectRendered
    end},
    true
)
__TS__SetDescriptor(
    CanvasRenderer.prototype,
    "renderingToScreen",
    {get = function(self)
        return self.objectRenderer.renderingToScreen
    end},
    true
)
__TS__SetDescriptor(
    CanvasRenderer.prototype,
    "clearBeforeRender",
    {get = function(self)
        return self.background.clearBeforeRender
    end},
    true
)
function CanvasRenderer.test(self)
    return true
end
function CanvasRenderer.prototype.reset(self)
end
function CanvasRenderer.prototype.render(self, displayObject, options)
    print("Renderer#render")
    self.objectRenderer:render(displayObject, options)
    self.canvasContext.rootContext.surface:flush()
end
function CanvasRenderer.prototype.clear(self)
    self.canvasContext:clear()
end
function CanvasRenderer.prototype.destroy(self, removeView)
    __TS__ArrayReverse(self.runners.destroy.items)
    self:emitWithCustomOptions(self.runners.destroy, {_view = removeView})
    SystemManager.prototype.destroy(self)
end
function CanvasRenderer.prototype.resize(self, desiredScreenWidth, desiredScreenHeight)
    self._view:resizeView(desiredScreenWidth, desiredScreenHeight)
end
CanvasRenderer.__systems = {}
return ____exports
 end,
["canvas-renderer.CanvasContextSystem"] = function(...) 
local ____lualib = require("lualib_bundle")
local __TS__New = ____lualib.__TS__New
local __TS__Class = ____lualib.__TS__Class
local __TS__ArrayIndexOf = ____lualib.__TS__ArrayIndexOf
local ____exports = {}
local systems = require("core.systems")
local ____math = require("math.index")
local Matrix = ____math.Matrix
local ____constants = require("constants.index")
local BLEND_MODES = ____constants.BLEND_MODES
local ____color = require("color.index")
local Color = ____color.Color
local ____mapCanvasBlendModesToPixi = require("canvas-renderer.utils.mapCanvasBlendModesToPixi")
local mapCanvasBlendModesToPixi = ____mapCanvasBlendModesToPixi.mapCanvasBlendModesToPixi
local ____context2d = require("context2d.index")
local Context2D = ____context2d.Context2D
local tempMatrix = __TS__New(Matrix)
--- System that manages the canvas `2d` contexts
-- 
-- @memberof PIXI
____exports.CanvasContextSystem = __TS__Class()
local CanvasContextSystem = ____exports.CanvasContextSystem
CanvasContextSystem.name = "CanvasContextSystem"
function CanvasContextSystem.prototype.____constructor(self, renderer)
    self.activeResolution = 1
    self.blendModes = mapCanvasBlendModesToPixi(nil)
    self._projTransform = nil
    self._outerBlend = false
    self._activeBlendMode = BLEND_MODES.NORMAL
    self.renderer = renderer
    self.rootContext = nil
    self.activeContext = nil
end
function CanvasContextSystem.prototype.init(self)
    self.rootContext = __TS__New(Context2D, self.renderer.view.width, self.renderer.view.height)
    if self.renderer.background.alpha < 1 then
        self.rootContext.globalAlpha = self.renderer.background.alpha
    end
    self.activeContext = self.rootContext
end
function CanvasContextSystem.prototype.setContextTransform(self, transform, roundPixels, localResolution)
    local mat = transform
    local proj = self._projTransform
    local contextResolution = self.activeResolution
    localResolution = localResolution or contextResolution
    if proj then
        mat = tempMatrix
        mat:copyFrom(transform)
        mat:prepend(proj)
    end
    if roundPixels then
        self.activeContext:setTransform(
            mat.a * localResolution,
            mat.b * localResolution,
            mat.c * localResolution,
            mat.d * localResolution,
            bit.bor(mat.tx * contextResolution, 0),
            bit.bor(mat.ty * contextResolution, 0)
        )
    else
        self.activeContext:setTransform(
            mat.a * localResolution,
            mat.b * localResolution,
            mat.c * localResolution,
            mat.d * localResolution,
            mat.tx * contextResolution,
            mat.ty * contextResolution
        )
    end
end
function CanvasContextSystem.prototype.clear(self, clearColor, alpha)
    local context = self.activeContext
    local renderer = self.renderer
    local fillColor = clearColor and Color.shared:setValue(clearColor) or self.renderer.background.backgroundColor
    context:clearRect(0, 0, renderer.width, renderer.height)
    if clearColor then
        context.globalAlpha = alpha or self.renderer.background.alpha
        context.fillStyle = fillColor:toHex()
        context:fillRect(0, 0, renderer.width, renderer.height)
        context.globalAlpha = 1
    end
end
function CanvasContextSystem.prototype.setBlendMode(self, blendMode, readyForOuterBlend)
    local outerBlend = blendMode == BLEND_MODES.SRC_IN or blendMode == BLEND_MODES.SRC_OUT or blendMode == BLEND_MODES.DST_IN or blendMode == BLEND_MODES.DST_ATOP
    if not readyForOuterBlend and outerBlend then
        blendMode = BLEND_MODES.NORMAL
    end
    if self._activeBlendMode == blendMode then
        return
    end
    self._activeBlendMode = blendMode
    self._outerBlend = outerBlend
    self.activeContext.globalCompositeOperation = self.blendModes[blendMode + 1]
end
function CanvasContextSystem.prototype.resize(self)
end
function CanvasContextSystem.prototype.invalidateBlendMode(self)
    self._activeBlendMode = __TS__ArrayIndexOf(self.blendModes, self.activeContext.globalCompositeOperation)
end
function CanvasContextSystem.prototype.destroy(self)
    local ____self = self
    ____self.renderer = nil
    ____self.rootContext = nil
    ____self.activeContext = nil
end
systems:register("canvasContext", ____exports.CanvasContextSystem)
return ____exports
 end,
["canvas-renderer.CanvasMaskSystem"] = function(...) 
--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
local ____exports = {}
____exports.placeholder = 0
return ____exports
 end,
["canvas-renderer.canvasUtils"] = function(...) 
--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
local ____exports = {}
--- Utility methods for Sprite/Texture tinting.
-- 
-- Tinting with the CanvasRenderer involves creating a new canvas to use as a texture,
-- so be aware of the performance implications.
-- 
-- @namespace PIXI.canvasUtils
-- @memberof PIXI
____exports.canvasUtils = {}
return ____exports
 end,
["canvas-renderer.index"] = function(...) 
--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
local ____exports = {}
require("canvas-renderer.BaseTexture")
do
    local ____export = require("canvas-renderer.CanvasContextSystem")
    for ____exportKey, ____exportValue in pairs(____export) do
        if ____exportKey ~= "default" then
            ____exports[____exportKey] = ____exportValue
        end
    end
end
do
    local ____export = require("canvas-renderer.CanvasMaskSystem")
    for ____exportKey, ____exportValue in pairs(____export) do
        if ____exportKey ~= "default" then
            ____exports[____exportKey] = ____exportValue
        end
    end
end
do
    local ____export = require("canvas-renderer.CanvasObjectRendererSystem")
    for ____exportKey, ____exportValue in pairs(____export) do
        if ____exportKey ~= "default" then
            ____exports[____exportKey] = ____exportValue
        end
    end
end
do
    local ____export = require("canvas-renderer.CanvasRenderer")
    for ____exportKey, ____exportValue in pairs(____export) do
        if ____exportKey ~= "default" then
            ____exports[____exportKey] = ____exportValue
        end
    end
end
do
    local ____export = require("canvas-renderer.canvasUtils")
    for ____exportKey, ____exportValue in pairs(____export) do
        if ____exportKey ~= "default" then
            ____exports[____exportKey] = ____exportValue
        end
    end
end
do
    local ____export = require("canvas-renderer.utils.canUseNewCanvasBlendModes")
    for ____exportKey, ____exportValue in pairs(____export) do
        if ____exportKey ~= "default" then
            ____exports[____exportKey] = ____exportValue
        end
    end
end
return ____exports
 end,
["core.Renderer"] = function(...) 
--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
local ____exports = {}
do
    local ____canvas_2Drenderer = require("canvas-renderer.index")
    local Renderer = ____canvas_2Drenderer.CanvasRenderer
    ____exports.Renderer = Renderer
end
return ____exports
 end,
["core.system.ISystem"] = function(...) 
--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
local ____exports = {}
return ____exports
 end,
["core.background.BackgroundSystem"] = function(...) 
local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__New = ____lualib.__TS__New
local __TS__SetDescriptor = ____lualib.__TS__SetDescriptor
local ____exports = {}
local systems = require("core.systems")
local ____color = require("color.index")
local Color = ____color.Color
--- The background system manages the background color and alpha of the main view.
-- 
-- @memberof PIXI
____exports.BackgroundSystem = __TS__Class()
local BackgroundSystem = ____exports.BackgroundSystem
BackgroundSystem.name = "BackgroundSystem"
function BackgroundSystem.prototype.____constructor(self)
    self.clearBeforeRender = true
    self._backgroundColor = __TS__New(Color, 0)
    self.alpha = 1
end
__TS__SetDescriptor(
    BackgroundSystem.prototype,
    "color",
    {
        get = function(self)
            return self._backgroundColor.value
        end,
        set = function(self, value)
            self._backgroundColor:setValue(value)
        end
    },
    true
)
__TS__SetDescriptor(
    BackgroundSystem.prototype,
    "alpha",
    {
        get = function(self)
            return self._backgroundColor.alpha
        end,
        set = function(self, value)
            self._backgroundColor:setAlpha(value)
        end
    },
    true
)
__TS__SetDescriptor(
    BackgroundSystem.prototype,
    "backgroundColor",
    {get = function(self)
        return self._backgroundColor
    end},
    true
)
function BackgroundSystem.prototype.init(self, options)
    self.clearBeforeRender = options.clearBeforeRender
    if options.color ~= nil then
        self.color = options.color
    end
    self.alpha = options.alpha
end
function BackgroundSystem.prototype.destroy(self)
end
systems:register("background", ____exports.BackgroundSystem)
return ____exports
 end,
["core.batch.BatchTextureArray"] = function(...) 
local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local ____exports = {}
--- Used by the batcher to build texture batches.
-- Holds list of textures and their respective locations.
-- 
-- @memberof PIXI
____exports.BatchTextureArray = __TS__Class()
local BatchTextureArray = ____exports.BatchTextureArray
BatchTextureArray.name = "BatchTextureArray"
function BatchTextureArray.prototype.____constructor(self)
    self.elements = {}
    self.ids = {}
    self.count = 0
end
function BatchTextureArray.prototype.clear(self)
    do
        local i = 0
        while i < self.count do
            self.elements[i + 1] = nil
            i = i + 1
        end
    end
    self.count = 0
end
return ____exports
 end,
["core.batch.BatchDrawCall"] = function(...) 
local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local ____exports = {}
local ____constants = require("constants.index")
local DRAW_MODES = ____constants.DRAW_MODES
--- Used by the batcher to draw batches.
-- Each one of these contains all information required to draw a bound geometry.
-- 
-- @memberof PIXI
____exports.BatchDrawCall = __TS__Class()
local BatchDrawCall = ____exports.BatchDrawCall
BatchDrawCall.name = "BatchDrawCall"
function BatchDrawCall.prototype.____constructor(self)
    self.texArray = nil
    self.blend = 0
    self.type = DRAW_MODES.TRIANGLES
    self.start = 0
    self.size = 0
    self.data = nil
end
return ____exports
 end,
["core.geometry.Buffer"] = function(...) 
local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__New = ____lualib.__TS__New
local __TS__SetDescriptor = ____lualib.__TS__SetDescriptor
local __TS__InstanceOf = ____lualib.__TS__InstanceOf
local ____exports = {}
local ____constants = require("constants.index")
local BUFFER_TYPE = ____constants.BUFFER_TYPE
local ____runner = require("runner.index")
local Runner = ____runner.Runner
local UID = 0
--- A wrapper for data so that it can be used and uploaded by WebGL
-- 
-- @memberof PIXI
____exports.Buffer = __TS__Class()
local Buffer = ____exports.Buffer
Buffer.name = "Buffer"
function Buffer.prototype.____constructor(self, data, _static, index)
    if _static == nil then
        _static = true
    end
    if index == nil then
        index = false
    end
    self.type = BUFFER_TYPE.ELEMENT_ARRAY_BUFFER
    self.data = data or __TS__New(Float32Array, 1)
    self.index = index
    self.static = _static
    local ____UID_0 = UID
    UID = ____UID_0 + 1
    self.id = ____UID_0
    self.disposeRunner = __TS__New(Runner, "disposeBuffer")
end
__TS__SetDescriptor(
    Buffer.prototype,
    "index",
    {
        get = function(self)
            return self.type == BUFFER_TYPE.ELEMENT_ARRAY_BUFFER
        end,
        set = function(self, value)
            self.type = value and BUFFER_TYPE.ELEMENT_ARRAY_BUFFER or BUFFER_TYPE.ARRAY_BUFFER
        end
    },
    true
)
function Buffer.prototype.update(self, data)
    if __TS__InstanceOf(data, Array) then
        data = __TS__New(Float32Array, data)
    end
    self.data = data or self.data
end
function Buffer.prototype.dispose(self)
    self.disposeRunner:emit(self, false)
end
function Buffer.prototype.destroy(self)
    self:dispose()
    self.data = nil
end
function Buffer.from(self, data)
    if __TS__InstanceOf(data, Array) then
        data = __TS__New(Float32Array, data)
    end
    return __TS__New(____exports.Buffer, data)
end
return ____exports
 end,
["core.geometry.Attribute"] = function(...) 
local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__New = ____lualib.__TS__New
local ____exports = {}
local ____constants = require("constants.index")
local TYPES = ____constants.TYPES
--- Holds the information for a single attribute structure required to render geometry.
-- 
-- This does not contain the actual data, but instead has a buffer id that maps to a {_link PIXI.Buffer}
-- This can include anything from positions, uvs, normals, colors etc.
-- 
-- @memberof PIXI
____exports.Attribute = __TS__Class()
local Attribute = ____exports.Attribute
Attribute.name = "Attribute"
function Attribute.prototype.____constructor(self, buffer, size, normalized, ____type, stride, start, instance, divisor)
    if size == nil then
        size = 0
    end
    if normalized == nil then
        normalized = false
    end
    if ____type == nil then
        ____type = TYPES.FLOAT
    end
    if stride == nil then
        stride = 0
    end
    if start == nil then
        start = 0
    end
    if instance == nil then
        instance = false
    end
    if divisor == nil then
        divisor = 1
    end
    self.buffer = buffer
    self.size = size
    self.normalized = normalized
    self.type = ____type
    self.stride = stride
    self.start = start
    self.instance = instance
    self.divisor = divisor
end
function Attribute.prototype.destroy(self)
    self.buffer = nil
end
function Attribute.from(self, buffer, size, normalized, ____type, stride)
    return __TS__New(
        ____exports.Attribute,
        buffer,
        size,
        normalized,
        ____type,
        stride
    )
end
return ____exports
 end,
["core.geometry.utils.interleaveTypedArrays"] = function(...) 
local ____lualib = require("lualib_bundle")
local __TS__New = ____lualib.__TS__New
local ____exports = {}
local ____utils = require("utils.index")
local getBufferType = ____utils.getBufferType
local map = {Float32Array = Float32Array, Uint32Array = Uint32Array, Int32Array = Int32Array, Uint8Array = Uint8Array}
function ____exports.interleaveTypedArrays(self, arrays, sizes)
    local outSize = 0
    local stride = 0
    local views = {}
    do
        local i = 0
        while i < #arrays do
            stride = stride + sizes[i + 1]
            outSize = outSize + arrays[i + 1].length
            i = i + 1
        end
    end
    local buffer = __TS__New(ArrayBuffer, outSize * 4)
    local out = nil
    local littleOffset = 0
    do
        local i = 0
        while i < #arrays do
            local size = sizes[i + 1]
            local array = arrays[i + 1]
            local ____type = getBufferType(nil, array)
            if not views[____type] then
                views[____type] = __TS__New(map[____type], buffer)
            end
            out = views[____type]
            do
                local j = 0
                while j < array.length do
                    local indexStart = bit.bor(j / size, 0) * stride + littleOffset
                    local index = j % size
                    out[indexStart + index] = array[j]
                    j = j + 1
                end
            end
            littleOffset = littleOffset + size
            i = i + 1
        end
    end
    return __TS__New(Float32Array, buffer)
end
return ____exports
 end,
["core.geometry.Geometry"] = function(...) 
local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__New = ____lualib.__TS__New
local Error = ____lualib.Error
local RangeError = ____lualib.RangeError
local ReferenceError = ____lualib.ReferenceError
local SyntaxError = ____lualib.SyntaxError
local TypeError = ____lualib.TypeError
local URIError = ____lualib.URIError
local __TS__InstanceOf = ____lualib.__TS__InstanceOf
local __TS__StringSplit = ____lualib.__TS__StringSplit
local __TS__ArrayIndexOf = ____lualib.__TS__ArrayIndexOf
local __TS__ArrayIncludes = ____lualib.__TS__ArrayIncludes
local ____exports = {}
local ____constants = require("constants.index")
local BUFFER_TYPE = ____constants.BUFFER_TYPE
local ____runner = require("runner.index")
local Runner = ____runner.Runner
local ____utils = require("utils.index")
local getBufferType = ____utils.getBufferType
local ____Attribute = require("core.geometry.Attribute")
local Attribute = ____Attribute.Attribute
local ____Buffer = require("core.geometry.Buffer")
local Buffer = ____Buffer.Buffer
local ____interleaveTypedArrays = require("core.geometry.utils.interleaveTypedArrays")
local interleaveTypedArrays = ____interleaveTypedArrays.interleaveTypedArrays
local byteSizeMap = {[5126] = 4, [5123] = 2, [5121] = 1}
local UID = 0
local map = {
    Float32Array = Float32Array,
    Uint32Array = Uint32Array,
    Int32Array = Int32Array,
    Uint8Array = Uint8Array,
    Uint16Array = Uint16Array
}
--- The Geometry represents a model. It consists of two components:
-- - GeometryStyle - The structure of the model such as the attributes layout
-- - GeometryData - the data of the model - this consists of buffers.
-- This can include anything from positions, uvs, normals, colors etc.
-- 
-- Geometry can be defined without passing in a style or data if required (thats how I prefer!)
-- 
-- @example import { Geometry } from 'pixi.js';
-- 
-- const geometry = new Geometry();
-- 
-- geometry.addAttribute('positions', [0, 0, 100, 0, 100, 100, 0, 100], 2);
-- geometry.addAttribute('uvs', [0, 0, 1, 0, 1, 1, 0, 1], 2);
-- geometry.addIndex([0, 1, 2, 1, 3, 2]);
-- @memberof PIXI
____exports.Geometry = __TS__Class()
local Geometry = ____exports.Geometry
Geometry.name = "Geometry"
function Geometry.prototype.____constructor(self, buffers, attributes)
    if buffers == nil then
        buffers = {}
    end
    if attributes == nil then
        attributes = {}
    end
    self.buffers = buffers
    self.indexBuffer = nil
    self.attributes = attributes
    local ____UID_0 = UID
    UID = ____UID_0 + 1
    self.id = ____UID_0
    self.instanced = false
    self.instanceCount = 1
    self.disposeRunner = __TS__New(Runner, "disposeGeometry")
    self.refCount = 0
end
function Geometry.prototype.addAttribute(self, id, buffer, size, normalized, ____type, stride, start, instance)
    if size == nil then
        size = 0
    end
    if normalized == nil then
        normalized = false
    end
    if instance == nil then
        instance = false
    end
    if not buffer then
        error(
            __TS__New(Error, "You must pass a buffer when creating an attribute"),
            0
        )
    end
    if not __TS__InstanceOf(buffer, Buffer) then
        if __TS__InstanceOf(buffer, Array) then
            buffer = __TS__New(Float32Array, buffer)
        end
        buffer = __TS__New(Buffer, buffer)
    end
    local ids = __TS__StringSplit(id, "|")
    if #ids > 1 then
        do
            local i = 0
            while i < #ids do
                self:addAttribute(
                    ids[i + 1],
                    buffer,
                    size,
                    normalized,
                    ____type
                )
                i = i + 1
            end
        end
        return self
    end
    local bufferIndex = __TS__ArrayIndexOf(self.buffers, buffer)
    if bufferIndex == -1 then
        local ____self_buffers_1 = self.buffers
        ____self_buffers_1[#____self_buffers_1 + 1] = buffer
        bufferIndex = #self.buffers - 1
    end
    self.attributes[id] = __TS__New(
        Attribute,
        bufferIndex,
        size,
        normalized,
        ____type,
        stride,
        start,
        instance
    )
    self.instanced = self.instanced or instance
    return self
end
function Geometry.prototype.getAttribute(self, id)
    return self.attributes[id]
end
function Geometry.prototype.getBuffer(self, id)
    return self.buffers[self:getAttribute(id).buffer + 1]
end
function Geometry.prototype.addIndex(self, buffer)
    if not __TS__InstanceOf(buffer, Buffer) then
        if __TS__InstanceOf(buffer, Array) then
            buffer = __TS__New(Uint16Array, buffer)
        end
        buffer = __TS__New(Buffer, buffer or nil)
    end
    buffer.type = BUFFER_TYPE.ELEMENT_ARRAY_BUFFER
    self.indexBuffer = buffer
    if not __TS__ArrayIncludes(self.buffers, buffer) then
        local ____self_buffers_2 = self.buffers
        ____self_buffers_2[#____self_buffers_2 + 1] = buffer
    end
    return self
end
function Geometry.prototype.getIndex(self)
    return self.indexBuffer
end
function Geometry.prototype.interleave(self)
    if #self.buffers == 1 or #self.buffers == 2 and self.indexBuffer then
        return self
    end
    local arrays = {}
    local sizes = {}
    local interleavedBuffer = __TS__New(Buffer, nil)
    local i
    for ____value in pairs(self.attributes) do
        i = ____value
        local attribute = self.attributes[i]
        local buffer = self.buffers[attribute.buffer + 1]
        arrays[#arrays + 1] = buffer.data
        sizes[#sizes + 1] = attribute.size * byteSizeMap[attribute.type] / 4
        attribute.buffer = 0
    end
    interleavedBuffer.data = interleaveTypedArrays(nil, arrays, sizes)
    do
        i = 0
        while i < #self.buffers do
            if self.buffers[i + 1] ~= self.indexBuffer then
                self.buffers[i + 1]:destroy()
            end
            i = i + 1
        end
    end
    self.buffers = {interleavedBuffer}
    if self.indexBuffer then
        local ____self_buffers_3 = self.buffers
        ____self_buffers_3[#____self_buffers_3 + 1] = self.indexBuffer
    end
    return self
end
function Geometry.prototype.getSize(self)
    for i in pairs(self.attributes) do
        local attribute = self.attributes[i]
        local buffer = self.buffers[attribute.buffer + 1]
        return buffer.data.length / (attribute.stride / 4 or attribute.size)
    end
    return 0
end
function Geometry.prototype.dispose(self)
    self.disposeRunner:emit(self, false)
end
function Geometry.prototype.destroy(self)
    self:dispose()
    self.buffers = nil
    self.indexBuffer = nil
    self.attributes = nil
end
function Geometry.prototype.clone(self)
    local geometry = __TS__New(____exports.Geometry)
    do
        local i = 0
        while i < #self.buffers do
            geometry.buffers[i + 1] = __TS__New(
                Buffer,
                self.buffers[i + 1].data:slice(0)
            )
            i = i + 1
        end
    end
    for i in pairs(self.attributes) do
        local attrib = self.attributes[i]
        geometry.attributes[i] = __TS__New(
            Attribute,
            attrib.buffer,
            attrib.size,
            attrib.normalized,
            attrib.type,
            attrib.stride,
            attrib.start,
            attrib.instance
        )
    end
    if self.indexBuffer then
        geometry.indexBuffer = geometry.buffers[__TS__ArrayIndexOf(self.buffers, self.indexBuffer) + 1]
        geometry.indexBuffer.type = BUFFER_TYPE.ELEMENT_ARRAY_BUFFER
    end
    return geometry
end
function Geometry.merge(self, geometries)
    local geometryOut = __TS__New(____exports.Geometry)
    local arrays = {}
    local sizes = {}
    local offsets = {}
    local geometry
    do
        local i = 0
        while i < #geometries do
            geometry = geometries[i + 1]
            do
                local j = 0
                while j < #geometry.buffers do
                    sizes[j + 1] = sizes[j + 1] or 0
                    local ____sizes_4, ____temp_5 = sizes, j + 1
                    ____sizes_4[____temp_5] = ____sizes_4[____temp_5] + geometry.buffers[j + 1].data.length
                    offsets[j + 1] = 0
                    j = j + 1
                end
            end
            i = i + 1
        end
    end
    if geometry == nil then
        error(
            __TS__New(Error, "Could not merge geometries"),
            0
        )
    end
    do
        local i = 0
        while i < #geometry.buffers do
            arrays[i + 1] = __TS__New(
                map[getBufferType(nil, geometry.buffers[i + 1].data)],
                sizes[i + 1]
            )
            geometryOut.buffers[i + 1] = __TS__New(Buffer, arrays[i + 1])
            i = i + 1
        end
    end
    do
        local i = 0
        while i < #geometries do
            geometry = geometries[i + 1]
            do
                local j = 0
                while j < #geometry.buffers do
                    arrays[j + 1]:set(geometry.buffers[j + 1].data, offsets[j + 1])
                    local ____offsets_6, ____temp_7 = offsets, j + 1
                    ____offsets_6[____temp_7] = ____offsets_6[____temp_7] + geometry.buffers[j + 1].data.length
                    j = j + 1
                end
            end
            i = i + 1
        end
    end
    geometryOut.attributes = geometry.attributes
    if geometry.indexBuffer then
        geometryOut.indexBuffer = geometryOut.buffers[__TS__ArrayIndexOf(geometry.buffers, geometry.indexBuffer) + 1]
        geometryOut.indexBuffer.type = BUFFER_TYPE.ELEMENT_ARRAY_BUFFER
        local offset = 0
        local stride = 0
        local offset2 = 0
        local bufferIndexToCount = 0
        do
            local i = 0
            while i < #geometry.buffers do
                if geometry.buffers[i + 1] ~= geometry.indexBuffer then
                    bufferIndexToCount = i
                    break
                end
                i = i + 1
            end
        end
        for i in pairs(geometry.attributes) do
            local attribute = geometry.attributes[i]
            if bit.bor(attribute.buffer, 0) == bufferIndexToCount then
                stride = stride + attribute.size * byteSizeMap[attribute.type] / 4
            end
        end
        do
            local i = 0
            while i < #geometries do
                local indexBufferData = geometries[i + 1].indexBuffer.data
                do
                    local j = 0
                    while j < indexBufferData.length do
                        local ____geometryOut_indexBuffer_data_8, ____temp_9 = geometryOut.indexBuffer.data, j + offset2
                        ____geometryOut_indexBuffer_data_8[____temp_9] = ____geometryOut_indexBuffer_data_8[____temp_9] + offset
                        j = j + 1
                    end
                end
                offset = offset + geometries[i + 1].buffers[bufferIndexToCount + 1].data.length / stride
                offset2 = offset2 + indexBufferData.length
                i = i + 1
            end
        end
    end
    return geometryOut
end
return ____exports
 end,
["core.batch.BatchGeometry"] = function(...) 
local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
local __TS__New = ____lualib.__TS__New
local ____exports = {}
local ____constants = require("constants.index")
local TYPES = ____constants.TYPES
local ____Buffer = require("core.geometry.Buffer")
local Buffer = ____Buffer.Buffer
local ____Geometry = require("core.geometry.Geometry")
local Geometry = ____Geometry.Geometry
--- Geometry used to batch standard PIXI content (e.g. Mesh, Sprite, Graphics objects).
-- 
-- @memberof PIXI
____exports.BatchGeometry = __TS__Class()
local BatchGeometry = ____exports.BatchGeometry
BatchGeometry.name = "BatchGeometry"
__TS__ClassExtends(BatchGeometry, Geometry)
function BatchGeometry.prototype.____constructor(self, _static)
    if _static == nil then
        _static = false
    end
    Geometry.prototype.____constructor(self)
    self._buffer = __TS__New(Buffer, nil, _static, false)
    self._indexBuffer = __TS__New(Buffer, nil, _static, true)
    self:addAttribute(
        "aVertexPosition",
        self._buffer,
        2,
        false,
        TYPES.FLOAT
    ):addAttribute(
        "aTextureCoord",
        self._buffer,
        2,
        false,
        TYPES.FLOAT
    ):addAttribute(
        "aColor",
        self._buffer,
        4,
        true,
        TYPES.UNSIGNED_BYTE
    ):addAttribute(
        "aTextureId",
        self._buffer,
        1,
        true,
        TYPES.FLOAT
    ):addIndex(self._indexBuffer)
end
return ____exports
 end,
["core.batch.ObjectRenderer"] = function(...) 
local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local ____exports = {}
--- Base for a common object renderer that can be used as a
-- system renderer plugin.
-- 
-- @memberof PIXI
____exports.ObjectRenderer = __TS__Class()
local ObjectRenderer = ____exports.ObjectRenderer
ObjectRenderer.name = "ObjectRenderer"
function ObjectRenderer.prototype.____constructor(self, renderer)
    self.renderer = renderer
end
function ObjectRenderer.prototype.flush(self)
end
function ObjectRenderer.prototype.destroy(self)
    self.renderer = nil
end
function ObjectRenderer.prototype.start(self)
end
function ObjectRenderer.prototype.stop(self)
    self:flush()
end
function ObjectRenderer.prototype.render(self, _object)
end
return ____exports
 end,
["core.batch.BatchSystem"] = function(...) 
local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__New = ____lualib.__TS__New
local ____exports = {}
local systems = require("core.systems")
local ____ObjectRenderer = require("core.batch.ObjectRenderer")
local ObjectRenderer = ____ObjectRenderer.ObjectRenderer
--- System plugin to the renderer to manage batching.
-- 
-- @memberof PIXI
____exports.BatchSystem = __TS__Class()
local BatchSystem = ____exports.BatchSystem
BatchSystem.name = "BatchSystem"
function BatchSystem.prototype.____constructor(self, renderer)
    self.renderer = renderer
    self.emptyRenderer = __TS__New(ObjectRenderer, renderer)
    self.currentRenderer = self.emptyRenderer
end
function BatchSystem.prototype.setObjectRenderer(self, objectRenderer)
    if self.currentRenderer == objectRenderer then
        return
    end
    self.currentRenderer:stop()
    self.currentRenderer = objectRenderer
    self.currentRenderer:start()
end
function BatchSystem.prototype.flush(self)
    self:setObjectRenderer(self.emptyRenderer)
end
function BatchSystem.prototype.reset(self)
    self:setObjectRenderer(self.emptyRenderer)
end
function BatchSystem.prototype.destroy(self)
    self.renderer = nil
end
BatchSystem.systemName = "batch"
systems:register(____exports.BatchSystem.systemName, ____exports.BatchSystem)
return ____exports
 end,
["core.view.ViewSystem"] = function(...) 
local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__New = ____lualib.__TS__New
local Error = ____lualib.Error
local RangeError = ____lualib.RangeError
local ReferenceError = ____lualib.ReferenceError
local SyntaxError = ____lualib.SyntaxError
local TypeError = ____lualib.TypeError
local URIError = ____lualib.URIError
local ____exports = {}
local systems = require("core.systems")
local ____math = require("math.index")
local Rectangle = ____math.Rectangle
local ____settings = require("settings")
local settings = ____settings.settings
--- The view system manages the main canvas that is attached to the DOM.
-- This main role is to deal with how the holding the view reference and dealing with how it is resized.
-- 
-- @memberof PIXI
____exports.ViewSystem = __TS__Class()
local ViewSystem = ____exports.ViewSystem
ViewSystem.name = "ViewSystem"
function ViewSystem.prototype.____constructor(self, renderer)
    self.renderer = renderer
    self.screen = nil
    self.element = nil
end
function ViewSystem.prototype.init(self, options)
    self.screen = __TS__New(
        Rectangle,
        0,
        0,
        options.width,
        options.height
    )
    self.element = options.view or settings.ADAPTER:createCanvas(options.width, options.height)
end
function ViewSystem.prototype.resizeView(self, desiredScreenWidth, desiredScreenHeight)
    self.element.width = math.floor(desiredScreenWidth + 0.5)
    self.element.height = math.floor(desiredScreenHeight + 0.5)
    local screenWidth = self.element.width
    local screenHeight = self.element.height
    self.screen.width = screenWidth
    self.screen.height = screenHeight
    self.renderer:emit("resize", screenWidth, screenHeight)
    self.renderer.runners.resize:emit(self.screen.width, self.screen.height)
end
function ViewSystem.prototype.destroy(self, removeView)
    error(
        __TS__New(Error, "unimplemented"),
        0
    )
end
systems:register("_view", ____exports.ViewSystem)
return ____exports
 end,
["core.startup.StartupSystem"] = function(...) 
local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local ____exports = {}
local systems = require("core.systems")
--- A simple system responsible for initiating the renderer.
-- 
-- @memberof PIXI
____exports.StartupSystem = __TS__Class()
local StartupSystem = ____exports.StartupSystem
StartupSystem.name = "StartupSystem"
function StartupSystem.prototype.____constructor(self, renderer)
    self.renderer = renderer
end
function StartupSystem.prototype.run(self, options)
    local renderer = self.renderer
    renderer:emitWithCustomOptions(renderer.runners.init, options)
    renderer:resize(self.renderer.screen.width, self.renderer.screen.height)
end
function StartupSystem.prototype.destroy(self)
end
systems:register("startup", ____exports.StartupSystem)
return ____exports
 end,
["core.textures.resources.Resource"] = function(...) 
local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__New = ____lualib.__TS__New
local __TS__SetDescriptor = ____lualib.__TS__SetDescriptor
local __TS__Promise = ____lualib.__TS__Promise
local ____exports = {}
local ____runner = require("runner.index")
local Runner = ____runner.Runner
--- Base resource class for textures that manages validation and uploading, depending on its type.
-- 
-- Uploading of a base texture to the GPU is required.
-- 
-- @memberof PIXI
____exports.Resource = __TS__Class()
local Resource = ____exports.Resource
Resource.name = "Resource"
function Resource.prototype.____constructor(self, width, height)
    if width == nil then
        width = 0
    end
    if height == nil then
        height = 0
    end
    self.src = "unset"
    self._width = width
    self._height = height
    self.destroyed = false
    self.internal = false
    self.onResize = __TS__New(Runner, "setRealSize")
    self.onUpdate = __TS__New(Runner, "update")
    self.onError = __TS__New(Runner, "onError")
end
__TS__SetDescriptor(
    Resource.prototype,
    "valid",
    {get = function(self)
        return not not self._width and not not self._height
    end},
    true
)
__TS__SetDescriptor(
    Resource.prototype,
    "width",
    {get = function(self)
        return self._width
    end},
    true
)
__TS__SetDescriptor(
    Resource.prototype,
    "height",
    {get = function(self)
        return self._height
    end},
    true
)
function Resource.prototype.bind(self, baseTexture)
    self.onResize:add(baseTexture)
    self.onUpdate:add(baseTexture)
    self.onError:add(baseTexture)
    if self._width > 0 or self._height > 0 then
        self.onResize:emit(self._width, self._height)
    end
end
function Resource.prototype.unbind(self, baseTexture)
    self.onResize:remove(baseTexture)
    self.onUpdate:remove(baseTexture)
    self.onError:remove(baseTexture)
end
function Resource.prototype.resize(self, width, height)
    if width ~= self._width or height ~= self._height then
        self._width = width
        self._height = height
        self.onResize:emit(width, height)
    end
end
function Resource.prototype.update(self)
    if not self.destroyed then
        self.onUpdate:emit()
    end
end
function Resource.prototype.load(self)
    return __TS__Promise.resolve(self)
end
function Resource.prototype.style(self, _renderer, _baseTexture)
    return false
end
function Resource.prototype.dispose(self)
end
function Resource.prototype.destroy(self)
    if not self.destroyed then
        self.destroyed = true
        self:dispose()
        self.onError:removeAll()
        self.onError = nil
        self.onResize:removeAll()
        self.onResize = nil
        self.onUpdate:removeAll()
        self.onUpdate = nil
    end
end
function Resource.test(self, _source, _extension)
    return false
end
return ____exports
 end,
["core.textures.resources.BufferResource"] = function(...) 
local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
local Error = ____lualib.Error
local RangeError = ____lualib.RangeError
local ReferenceError = ____lualib.ReferenceError
local SyntaxError = ____lualib.SyntaxError
local TypeError = ____lualib.TypeError
local URIError = ____lualib.URIError
local __TS__New = ____lualib.__TS__New
local __TS__InstanceOf = ____lualib.__TS__InstanceOf
local ____exports = {}
local ____Resource = require("core.textures.resources.Resource")
local Resource = ____Resource.Resource
--- Buffer resource with data of typed array.
-- 
-- @memberof PIXI
____exports.BufferResource = __TS__Class()
local BufferResource = ____exports.BufferResource
BufferResource.name = "BufferResource"
__TS__ClassExtends(BufferResource, Resource)
function BufferResource.prototype.____constructor(self, source, options)
    local ____temp_0 = options or ({})
    local width = ____temp_0.width
    local height = ____temp_0.height
    if not width or not height then
        error(
            __TS__New(Error, "BufferResource width or height invalid"),
            0
        )
    end
    Resource.prototype.____constructor(self, width, height)
    self.data = source
end
function BufferResource.prototype.dispose(self)
    self.data = nil
end
function BufferResource.test(self, source)
    return __TS__InstanceOf(source, Float32Array) or __TS__InstanceOf(source, Uint8Array) or __TS__InstanceOf(source, Uint32Array)
end
return ____exports
 end,
["core.textures.resources.autoDetectResource"] = function(...) 
local ____lualib = require("lualib_bundle")
local Error = ____lualib.Error
local RangeError = ____lualib.RangeError
local ReferenceError = ____lualib.ReferenceError
local SyntaxError = ____lualib.SyntaxError
local TypeError = ____lualib.TypeError
local URIError = ____lualib.URIError
local __TS__New = ____lualib.__TS__New
local ____exports = {}
--- Collection of installed resource types, class must extend {@link PIXI.Resource }.
-- 
-- @example class CustomResource extends PIXI.Resource {
--     // MUST have source, options constructor signature
--     // for auto-detected resources to be created.
--     constructor(source, options) {
--         super();
--     }
--     upload(renderer, baseTexture, glTexture) {
--         // Upload with GL
--         return true;
--     }
--     // Used to auto-detect resource
--     static test(source, extension) {
--         return extension === 'xyz' || source instanceof SomeClass;
--     }
-- }
-- // Install the new resource type
-- PIXI.INSTALLED.push(CustomResource);
-- @memberof PIXI
-- @type {Array<PIXI.IResourcePlugin>}
-- @static
-- @readonly
____exports.INSTALLED = {}
--- Create a resource element from a single source element. This
-- auto-detects which type of resource to create. All resources that
-- are auto-detectable must have a static `test` method and a constructor
-- with the arguments `(source, options?)`. Currently, the supported
-- resources for auto-detection include:
--  - {@link PIXI.ImageResource }
--  - {@link PIXI.CanvasResource }
--  - {@link PIXI.VideoResource }
--  - {@link PIXI.SVGResource }
--  - {@link PIXI.BufferResource }
-- 
-- @static
-- @memberof PIXI
-- @function autoDetectResource
-- @param source - Resource source, this can be the URL to the resource,
-- a typed-array (for BufferResource), HTMLVideoElement, SVG data-uri
-- or any other resource that can be auto-detected. If not resource is
-- detected, it's assumed to be an ImageResource.
-- @param options - Pass-through options to use for Resource
-- @returns The created resource.
function ____exports.autoDetectResource(self, source, options)
    if source == nil then
        error(
            __TS__New(Error, "autoDetectResource: invalid source type"),
            0
        )
    end
    do
        local i = #____exports.INSTALLED - 1
        while i >= 0 do
            local ResourcePlugin = ____exports.INSTALLED[i + 1]
            if ResourcePlugin.test and ResourcePlugin:test(source) then
                return __TS__New(ResourcePlugin, source, options)
            end
            i = i - 1
        end
    end
    error(
        __TS__New(Error, "Unrecognized source type to auto-detect Resource"),
        0
    )
end
return ____exports
 end,
["core.textures.BaseTexture"] = function(...) 
local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
local __TS__ObjectAssign = ____lualib.__TS__ObjectAssign
local __TS__InstanceOf = ____lualib.__TS__InstanceOf
local __TS__SetDescriptor = ____lualib.__TS__SetDescriptor
local Error = ____lualib.Error
local RangeError = ____lualib.RangeError
local ReferenceError = ____lualib.ReferenceError
local SyntaxError = ____lualib.SyntaxError
local TypeError = ____lualib.TypeError
local URIError = ____lualib.URIError
local __TS__New = ____lualib.__TS__New
local __TS__Delete = ____lualib.__TS__Delete
local __TS__ArrayIncludes = ____lualib.__TS__ArrayIncludes
local __TS__ArrayIndexOf = ____lualib.__TS__ArrayIndexOf
local __TS__ArraySplice = ____lualib.__TS__ArraySplice
local __TS__ArraySetLength = ____lualib.__TS__ArraySetLength
local ____exports = {}
local ____constants = require("constants.index")
local ALPHA_MODES = ____constants.ALPHA_MODES
local FORMATS = ____constants.FORMATS
local MIPMAP_MODES = ____constants.MIPMAP_MODES
local SCALE_MODES = ____constants.SCALE_MODES
local TARGETS = ____constants.TARGETS
local TYPES = ____constants.TYPES
local WRAP_MODES = ____constants.WRAP_MODES
local ____settings = require("settings")
local settings = ____settings.settings
local ____utils = require("utils.index")
local BaseTextureCache = ____utils.BaseTextureCache
local EventEmitter = ____utils.EventEmitter
local isPow2 = ____utils.isPow2
local TextureCache = ____utils.TextureCache
local uid = ____utils.uid
local ____BufferResource = require("core.textures.resources.BufferResource")
local BufferResource = ____BufferResource.BufferResource
local ____Resource = require("core.textures.resources.Resource")
local Resource = ____Resource.Resource
local ____autoDetectResource = require("core.textures.resources.autoDetectResource")
local autoDetectResource = ____autoDetectResource.autoDetectResource
local defaultBufferOptions = {scaleMode = SCALE_MODES.NEAREST, format = FORMATS.RGBA, alphaMode = ALPHA_MODES.NPM}
--- A Texture stores the information that represents an image.
-- All textures have a base texture, which contains information about the source.
-- Therefore you can have many textures all using a single BaseTexture
-- 
-- @memberof PIXI
-- @typeParam R - The BaseTexture's Resource type.
-- @typeParam RO - The options for constructing resource.
____exports.BaseTexture = __TS__Class()
local BaseTexture = ____exports.BaseTexture
BaseTexture.name = "BaseTexture"
__TS__ClassExtends(BaseTexture, EventEmitter)
function BaseTexture.prototype.____constructor(self, resource, options)
    if resource == nil then
        resource = nil
    end
    if options == nil then
        options = nil
    end
    EventEmitter.prototype.____constructor(self)
    self._canvasRenderTarget = nil
    options = __TS__ObjectAssign({}, ____exports.BaseTexture.defaultOptions, options)
    local ____options_0 = options
    local alphaMode = ____options_0.alphaMode
    local mipmap = ____options_0.mipmap
    if mipmap == nil then
        mipmap = nil
    end
    local anisotropicLevel = ____options_0.anisotropicLevel
    local scaleMode = ____options_0.scaleMode
    if scaleMode == nil then
        scaleMode = nil
    end
    local width = ____options_0.width
    if width == nil then
        width = 0
    end
    local height = ____options_0.height
    if height == nil then
        height = 0
    end
    local wrapMode = ____options_0.wrapMode
    if wrapMode == nil then
        wrapMode = nil
    end
    local format = ____options_0.format
    local ____type = ____options_0.type
    local target = ____options_0.target
    local resolution = ____options_0.resolution
    local resourceOptions = ____options_0.resourceOptions
    if resource and not __TS__InstanceOf(resource, Resource) then
        resource = autoDetectResource(nil, resource, resourceOptions)
        resource.internal = true
    end
    self.resolution = resolution or settings.RESOLUTION
    self.width = math.floor((width or 0) * self.resolution + 0.5) / self.resolution
    self.height = math.floor((height or 0) * self.resolution + 0.5) / self.resolution
    self.anisotropicLevel = anisotropicLevel
    self.format = format
    self.type = ____type
    self.target = target
    self.alphaMode = alphaMode
    self.uid = uid(nil)
    self.touched = 0
    self.isPowerOfTwo = false
    self:_refreshPOT()
    self.dirtyId = 0
    self.dirtyStyleId = 0
    self.cacheId = nil
    self.valid = width > 0 and height > 0
    self.textureCacheIds = {}
    self.destroyed = false
    self.resource = nil
    self._batchEnabled = 0
    self._batchLocation = 0
    self._mipmap = mipmap
    self._wrapMode = wrapMode
    self._scaleMode = scaleMode
    self:setResource(resource)
end
__TS__SetDescriptor(
    BaseTexture.prototype,
    "realWidth",
    {get = function(self)
        return math.floor(self.width * self.resolution + 0.5)
    end},
    true
)
__TS__SetDescriptor(
    BaseTexture.prototype,
    "realHeight",
    {get = function(self)
        return math.floor(self.height * self.resolution + 0.5)
    end},
    true
)
__TS__SetDescriptor(
    BaseTexture.prototype,
    "mipmap",
    {
        get = function(self)
            return self._mipmap
        end,
        set = function(self, value)
            if self._mipmap ~= value then
                self._mipmap = value
                self.dirtyStyleId = self.dirtyStyleId + 1
            end
        end
    },
    true
)
__TS__SetDescriptor(
    BaseTexture.prototype,
    "scaleMode",
    {
        get = function(self)
            return self._scaleMode
        end,
        set = function(self, value)
            if self._scaleMode ~= value then
                self._scaleMode = value
                self.dirtyStyleId = self.dirtyStyleId + 1
            end
        end
    },
    true
)
__TS__SetDescriptor(
    BaseTexture.prototype,
    "wrapMode",
    {
        get = function(self)
            return self._wrapMode
        end,
        set = function(self, value)
            if self._wrapMode ~= value then
                self._wrapMode = value
                self.dirtyStyleId = self.dirtyStyleId + 1
            end
        end
    },
    true
)
function BaseTexture.prototype.getDrawableSource(self)
    local resource = self.resource
    local ____resource_1
    if resource then
        ____resource_1 = resource.bitmap or resource.source
    else
        ____resource_1 = nil
    end
    return ____resource_1
end
function BaseTexture.prototype.setStyle(self, scaleMode, mipmap)
    local dirty
    if scaleMode ~= nil and scaleMode ~= self.scaleMode then
        self.scaleMode = scaleMode
        dirty = true
    end
    if mipmap ~= nil and mipmap ~= self.mipmap then
        self.mipmap = mipmap
        dirty = true
    end
    if dirty then
        self.dirtyStyleId = self.dirtyStyleId + 1
    end
    return self
end
function BaseTexture.prototype.setSize(self, desiredWidth, desiredHeight, resolution)
    resolution = resolution or self.resolution
    return self:setRealSize(desiredWidth * resolution, desiredHeight * resolution, resolution)
end
function BaseTexture.prototype.setRealSize(self, realWidth, realHeight, resolution)
    self.resolution = resolution or self.resolution
    self.width = math.floor(realWidth + 0.5) / self.resolution
    self.height = math.floor(realHeight + 0.5) / self.resolution
    self:_refreshPOT()
    self:update()
    return self
end
function BaseTexture.prototype._refreshPOT(self)
    self.isPowerOfTwo = isPow2(nil, self.realWidth) and isPow2(nil, self.realHeight)
end
function BaseTexture.prototype.setResolution(self, resolution)
    local oldResolution = self.resolution
    if oldResolution == resolution then
        return self
    end
    self.resolution = resolution
    if self.valid then
        self.width = math.floor(self.width * oldResolution + 0.5) / resolution
        self.height = math.floor(self.height * oldResolution + 0.5) / resolution
        self:emit("update", self)
    end
    self:_refreshPOT()
    return self
end
function BaseTexture.prototype.setResource(self, resource)
    if self.resource == resource then
        return self
    end
    if self.resource ~= nil then
        error(
            __TS__New(Error, "Resource can be set only once"),
            0
        )
    end
    resource:bind(self)
    self.resource = resource
    return self
end
function BaseTexture.prototype.update(self)
    if not self.valid then
        if self.width > 0 and self.height > 0 then
            self.valid = true
            self:emit("loaded", self)
            self:emit("update", self)
        end
    else
        self.dirtyId = self.dirtyId + 1
        self.dirtyStyleId = self.dirtyStyleId + 1
        self:emit("update", self)
    end
end
function BaseTexture.prototype.onError(self, event)
    self:emit("error", self, event)
end
function BaseTexture.prototype.destroy(self)
    if self.resource ~= nil then
        self.resource:unbind(self)
        if self.resource.internal then
            self.resource:destroy()
        end
        self.resource = nil
    end
    if self.cacheId ~= nil then
        __TS__Delete(BaseTextureCache, self.cacheId)
        __TS__Delete(TextureCache, self.cacheId)
        self.cacheId = nil
    end
    self:dispose()
    ____exports.BaseTexture:removeFromCache(self)
    self.textureCacheIds = nil
    self.destroyed = true
end
function BaseTexture.prototype.dispose(self)
    self:emit("dispose", self)
end
function BaseTexture.prototype.castToBaseTexture(self)
    return self
end
function BaseTexture.from(self, source, options)
    local isFrame = type(source) == "string"
    local cacheId = nil
    if isFrame then
        cacheId = source
    else
        if not source._pixiId then
            local prefix = options and options.pixiIdPrefix or "pixiid"
            source._pixiId = (prefix .. "_") .. tostring(uid(nil))
        end
        cacheId = source._pixiId
    end
    local baseTexture = BaseTextureCache[cacheId]
    if isFrame and not baseTexture then
        error(
            __TS__New(
                Error,
                ("The cacheId \"" .. tostring(cacheId)) .. "\" does not exist in BaseTextureCache."
            ),
            0
        )
    end
    if not baseTexture then
        baseTexture = __TS__New(____exports.BaseTexture, source, options)
        baseTexture.cacheId = cacheId
        ____exports.BaseTexture:addToCache(baseTexture, cacheId)
    end
    return baseTexture
end
function BaseTexture.fromBuffer(self, buffer, width, height, options)
    buffer = buffer or __TS__New(Float32Array, width * height * 4)
    local resource = __TS__New(BufferResource, buffer, {width = width, height = height})
    local ____type = __TS__InstanceOf(buffer, Float32Array) and TYPES.FLOAT or TYPES.UNSIGNED_BYTE
    return __TS__New(
        ____exports.BaseTexture,
        resource,
        __TS__ObjectAssign({}, defaultBufferOptions, options or ({width = width, height = height, type = ____type}))
    )
end
function BaseTexture.addToCache(self, baseTexture, id)
    if id ~= "" then
        if not __TS__ArrayIncludes(baseTexture.textureCacheIds, id) then
            local ____baseTexture_textureCacheIds_4 = baseTexture.textureCacheIds
            ____baseTexture_textureCacheIds_4[#____baseTexture_textureCacheIds_4 + 1] = id
        end
        if BaseTextureCache[id] and BaseTextureCache[id] ~= baseTexture then
            print(("BaseTexture added to the cache with an id [" .. id) .. "] that already had an entry")
        end
        BaseTextureCache[id] = baseTexture
    end
end
function BaseTexture.removeFromCache(self, baseTexture)
    if type(baseTexture) == "string" then
        local baseTextureFromCache = BaseTextureCache[baseTexture]
        if baseTextureFromCache ~= nil then
            local index = __TS__ArrayIndexOf(baseTextureFromCache.textureCacheIds, baseTexture)
            if index > -1 then
                __TS__ArraySplice(baseTextureFromCache.textureCacheIds, index, 1)
            end
            __TS__Delete(BaseTextureCache, baseTexture)
            return baseTextureFromCache
        end
    elseif (baseTexture and baseTexture.textureCacheIds) ~= nil then
        do
            local i = 0
            while i < #baseTexture.textureCacheIds do
                __TS__Delete(BaseTextureCache, baseTexture.textureCacheIds[i + 1])
                i = i + 1
            end
        end
        __TS__ArraySetLength(baseTexture.textureCacheIds, 0)
        return baseTexture
    end
    return nil
end
BaseTexture.defaultOptions = {
    mipmap = MIPMAP_MODES.POW2,
    anisotropicLevel = 0,
    scaleMode = SCALE_MODES.LINEAR,
    wrapMode = WRAP_MODES.CLAMP,
    alphaMode = ALPHA_MODES.UNPACK,
    target = TARGETS.TEXTURE_2D,
    format = FORMATS.RGBA,
    type = TYPES.UNSIGNED_BYTE
}
BaseTexture._globalBatch = 0
return ____exports
 end,
["core.textures.TextureUvs"] = function(...) 
local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__New = ____lualib.__TS__New
local ____exports = {}
local ____math = require("math.index")
local groupD8 = ____math.groupD8
--- Stores a texture's frame in UV coordinates, in
-- which everything lies in the rectangle `[(0,0), (1,0),
-- (1,1), (0,1)]`.
-- 
-- | Corner       | Coordinates |
-- |--------------|-------------|
-- | Top-Left     | `(x0,y0)`   |
-- | Top-Right    | `(x1,y1)`   |
-- | Bottom-Right | `(x2,y2)`   |
-- | Bottom-Left  | `(x3,y3)`   |
-- 
-- @protected
-- @memberof PIXI
____exports.TextureUvs = __TS__Class()
local TextureUvs = ____exports.TextureUvs
TextureUvs.name = "TextureUvs"
function TextureUvs.prototype.____constructor(self)
    self.x0 = 0
    self.y0 = 0
    self.x1 = 1
    self.y1 = 0
    self.x2 = 1
    self.y2 = 1
    self.x3 = 0
    self.y3 = 1
    self.uvsFloat32 = __TS__New(Float32Array, 8)
end
function TextureUvs.prototype.set(self, frame, baseFrame, rotate)
    local tw = baseFrame.width
    local th = baseFrame.height
    if rotate ~= 0 then
        local w2 = frame.width / 2 / tw
        local h2 = frame.height / 2 / th
        local cX = frame.x / tw + w2
        local cY = frame.y / th + h2
        rotate = groupD8:add(rotate, groupD8.NW)
        self.x0 = cX + w2 * groupD8:uX(rotate)
        self.y0 = cY + h2 * groupD8:uY(rotate)
        rotate = groupD8:add(rotate, 2)
        self.x1 = cX + w2 * groupD8:uX(rotate)
        self.y1 = cY + h2 * groupD8:uY(rotate)
        rotate = groupD8:add(rotate, 2)
        self.x2 = cX + w2 * groupD8:uX(rotate)
        self.y2 = cY + h2 * groupD8:uY(rotate)
        rotate = groupD8:add(rotate, 2)
        self.x3 = cX + w2 * groupD8:uX(rotate)
        self.y3 = cY + h2 * groupD8:uY(rotate)
    else
        self.x0 = frame.x / tw
        self.y0 = frame.y / th
        self.x1 = (frame.x + frame.width) / tw
        self.y1 = frame.y / th
        self.x2 = (frame.x + frame.width) / tw
        self.y2 = (frame.y + frame.height) / th
        self.x3 = frame.x / tw
        self.y3 = (frame.y + frame.height) / th
    end
    self.uvsFloat32[0] = self.x0
    self.uvsFloat32[1] = self.y0
    self.uvsFloat32[2] = self.x1
    self.uvsFloat32[3] = self.y1
    self.uvsFloat32[4] = self.x2
    self.uvsFloat32[5] = self.y2
    self.uvsFloat32[6] = self.x3
    self.uvsFloat32[7] = self.y3
end
function TextureUvs.prototype.__tostring(self)
    return ((("[src/core:TextureUvs " .. ((("x0=" .. tostring(self.x0)) .. " y0=") .. tostring(self.y0)) .. " ") .. ((((("x1=" .. tostring(self.x1)) .. " y1=") .. tostring(self.y1)) .. " x2=") .. tostring(self.x2)) .. " ") .. (((("y2=" .. tostring(self.y2)) .. " x3=") .. tostring(self.x3)) .. " y3=") .. tostring(self.y3)) .. "]"
end
return ____exports
 end,
["core.textures.resources.BaseImageResource"] = function(...) 
local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
local ____exports = {}
local ____Resource = require("core.textures.resources.Resource")
local Resource = ____Resource.Resource
--- Base for all the image/canvas resources.
-- 
-- @memberof PIXI
____exports.BaseImageResource = __TS__Class()
local BaseImageResource = ____exports.BaseImageResource
BaseImageResource.name = "BaseImageResource"
__TS__ClassExtends(BaseImageResource, Resource)
function BaseImageResource.prototype.____constructor(self, source)
    local sourceAny = source
    local width = sourceAny.naturalWidth or sourceAny.videoWidth or sourceAny.width
    local height = sourceAny.naturalHeight or sourceAny.videoHeight or sourceAny.height
    Resource.prototype.____constructor(self, width, height)
    self.source = source
    self.noSubImage = false
end
function BaseImageResource.prototype.update(self)
    if self.destroyed then
        return
    end
    local source = self.source
    local width = source.naturalWidth or source.videoWidth or source.width
    local height = source.naturalHeight or source.videoHeight or source.height
    self:resize(width, height)
    Resource.prototype.update(self)
end
function BaseImageResource.prototype.dispose(self)
    self.source = nil
end
return ____exports
 end,
["core.textures.resources.CanvasResource"] = function(...) 
local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
local __TS__InstanceOf = ____lualib.__TS__InstanceOf
local ____exports = {}
local ____BaseImageResource = require("core.textures.resources.BaseImageResource")
local BaseImageResource = ____BaseImageResource.BaseImageResource
local ____context2d = require("context2d.index")
local Canvas = ____context2d.Canvas
--- Resource type for HTMLCanvasElement and OffscreenCanvas.
-- 
-- @memberof PIXI
____exports.CanvasResource = __TS__Class()
local CanvasResource = ____exports.CanvasResource
CanvasResource.name = "CanvasResource"
__TS__ClassExtends(CanvasResource, BaseImageResource)
function CanvasResource.prototype.____constructor(self, source)
    BaseImageResource.prototype.____constructor(self, source)
end
function CanvasResource.test(self, source)
    if __TS__InstanceOf(source, Canvas) then
        return true
    end
    return false
end
return ____exports
 end,
["core.textures.TextureMatrix"] = function(...) 
local ____lualib = require("lualib_bundle")
local __TS__New = ____lualib.__TS__New
local __TS__Class = ____lualib.__TS__Class
local __TS__SetDescriptor = ____lualib.__TS__SetDescriptor
local ____exports = {}
local ____math = require("math.index")
local Matrix = ____math.Matrix
local tempMat = __TS__New(Matrix)
--- Class controls uv mapping from Texture normal space to BaseTexture normal space.
-- 
-- Takes `trim` and `rotate` into account. May contain clamp settings for Meshes and TilingSprite.
-- 
-- Can be used in Texture `uvMatrix` field, or separately, you can use different clamp settings on the same texture.
-- If you want to add support for texture region of certain feature or filter, that's what you're looking for.
-- 
-- Takes track of Texture changes through `_lastTextureID` private field.
-- Use `update()` method call to track it from outside.
-- 
-- @see PIXI.Texture *
-- @see PIXI.Mesh *
-- @see PIXI.TilingSprite *
-- @memberof PIXI
____exports.TextureMatrix = __TS__Class()
local TextureMatrix = ____exports.TextureMatrix
TextureMatrix.name = "TextureMatrix"
function TextureMatrix.prototype.____constructor(self, texture, clampMargin)
    self._texture = texture
    self.mapCoord = __TS__New(Matrix)
    self.uClampFrame = __TS__New(Float32Array, 4)
    self.uClampOffset = __TS__New(Float32Array, 2)
    self._textureID = -1
    self._updateID = 0
    self.clampOffset = 0
    self.clampMargin = type(clampMargin) == "nil" and 0.5 or clampMargin
    self.isSimple = false
end
__TS__SetDescriptor(
    TextureMatrix.prototype,
    "texture",
    {
        get = function(self)
            return self._texture
        end,
        set = function(self, value)
            self._texture = value
            self._textureID = -1
        end
    },
    true
)
function TextureMatrix.prototype.multiplyUvs(self, uvs, out)
    if out == nil then
        out = uvs
    end
    local mat = self.mapCoord
    do
        local i = 0
        while i < uvs.length do
            local x = uvs[i]
            local y = uvs[i + 1]
            out[i] = x * mat.a + y * mat.c + mat.tx
            out[i + 1] = x * mat.b + y * mat.d + mat.ty
            i = i + 2
        end
    end
    return out
end
function TextureMatrix.prototype.update(self, forceUpdate)
    local tex = self._texture
    if not tex or not tex.valid then
        return false
    end
    if not forceUpdate and self._textureID == tex._updateID then
        return false
    end
    self._textureID = tex._updateID
    self._updateID = self._updateID + 1
    local uvs = tex._uvs
    self.mapCoord:set(
        uvs.x1 - uvs.x0,
        uvs.y1 - uvs.y0,
        uvs.x3 - uvs.x0,
        uvs.y3 - uvs.y0,
        uvs.x0,
        uvs.y0
    )
    local orig = tex.orig
    local trim = tex.trim
    if trim then
        tempMat:set(
            orig.width / trim.width,
            0,
            0,
            orig.height / trim.height,
            -trim.x / trim.width,
            -trim.y / trim.height
        )
        self.mapCoord:append(tempMat)
    end
    local texBase = tex.baseTexture
    local frame = self.uClampFrame
    local margin = self.clampMargin / texBase.resolution
    local offset = self.clampOffset
    frame[0] = (tex._frame.x + margin + offset) / texBase.width
    frame[1] = (tex._frame.y + margin + offset) / texBase.height
    frame[2] = (tex._frame.x + tex._frame.width - margin + offset) / texBase.width
    frame[3] = (tex._frame.y + tex._frame.height - margin + offset) / texBase.height
    self.uClampOffset[0] = offset / texBase.realWidth
    self.uClampOffset[1] = offset / texBase.realHeight
    self.isSimple = tex._frame.width == texBase.width and tex._frame.height == texBase.height and tex.rotate == 0
    return true
end
return ____exports
 end,
["core.textures.Texture"] = function(...) 
local ____lualib = require("lualib_bundle")
local __TS__New = ____lualib.__TS__New
local __TS__Class = ____lualib.__TS__Class
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
local __TS__InstanceOf = ____lualib.__TS__InstanceOf
local __TS__Number = ____lualib.__TS__Number
local Error = ____lualib.Error
local RangeError = ____lualib.RangeError
local ReferenceError = ____lualib.ReferenceError
local SyntaxError = ____lualib.SyntaxError
local TypeError = ____lualib.TypeError
local URIError = ____lualib.URIError
local __TS__SetDescriptor = ____lualib.__TS__SetDescriptor
local __TS__ObjectDefineProperty = ____lualib.__TS__ObjectDefineProperty
local __TS__ObjectAssign = ____lualib.__TS__ObjectAssign
local __TS__Promise = ____lualib.__TS__Promise
local __TS__ArrayIncludes = ____lualib.__TS__ArrayIncludes
local __TS__ArrayIndexOf = ____lualib.__TS__ArrayIndexOf
local __TS__ArraySplice = ____lualib.__TS__ArraySplice
local __TS__Delete = ____lualib.__TS__Delete
local __TS__ArraySetLength = ____lualib.__TS__ArraySetLength
local ____exports = {}
local ____math = require("math.index")
local Point = ____math.Point
local Rectangle = ____math.Rectangle
local ____settings = require("settings")
local settings = ____settings.settings
local ____utils = require("utils.index")
local EventEmitter = ____utils.EventEmitter
local TextureCache = ____utils.TextureCache
local uid = ____utils.uid
local ____BaseTexture = require("core.textures.BaseTexture")
local BaseTexture = ____BaseTexture.BaseTexture
local ____TextureUvs = require("core.textures.TextureUvs")
local TextureUvs = ____TextureUvs.TextureUvs
local DEFAULT_UVS = __TS__New(TextureUvs)
--- Used to remove listeners from WHITE and EMPTY Textures
-- 
-- @ignore
local function removeAllHandlers(self, tex)
    tex.destroy = function(self)
    end
    tex.on = function(self)
    end
    tex.once = function(self)
    end
    tex.emit = function(self)
    end
end
--- A texture stores the information that represents an image or part of an image.
-- 
-- It cannot be added to the display list directly; instead use it as the texture for a Sprite.
-- If no frame is provided for a texture, then the whole image is used.
-- 
-- You can directly create a texture from an image and then reuse it multiple times like this :
-- 
-- ```js
-- import { Sprite, Texture } from 'pixi.js';
-- 
-- const texture = Texture.from('assets/image.png');
-- const sprite1 = new Sprite(texture);
-- const sprite2 = new Sprite(texture);
-- ```
-- 
-- If you didnt pass the texture frame to constructor, it enables `noFrame` mode:
-- it subscribes on baseTexture events, it automatically resizes at the same time as baseTexture.
-- 
-- Textures made from SVGs, loaded or not, cannot be used before the file finishes processing.
-- You can check for this by checking the sprite's _textureID property.
-- 
-- ```js
-- import { Sprite, Texture } from 'pixi.js';
-- 
-- const texture = Texture.from('assets/image.svg');
-- const sprite1 = new Sprite(texture);
-- // sprite1._textureID should not be undefined if the texture has finished processing the SVG file
-- ```
-- 
-- You can use a ticker or rAF to ensure your sprites load the finished textures after processing.
-- See issue [#3085]{_link https://github.com/pixijs/pixijs/issues/3085}.
-- 
-- @memberof PIXI
-- @typeParam R - The BaseTexture's Resource type.
____exports.Texture = __TS__Class()
local Texture = ____exports.Texture
Texture.name = "Texture"
__TS__ClassExtends(Texture, EventEmitter)
function Texture.prototype.____constructor(self, baseTexture, frame, orig, trim, rotate, anchor)
    EventEmitter.prototype.____constructor(self)
    self.noFrame = false
    if not frame then
        self.noFrame = true
        frame = __TS__New(
            Rectangle,
            0,
            0,
            1,
            1
        )
    end
    if __TS__InstanceOf(baseTexture, ____exports.Texture) then
        baseTexture = baseTexture.baseTexture
    end
    self.baseTexture = baseTexture
    self._frame = frame
    self.trim = trim or nil
    self.valid = false
    self._uvs = DEFAULT_UVS
    self.uvMatrix = nil
    self.orig = orig or frame
    self._rotate = __TS__Number(rotate or 0)
    if rotate == true then
        self._rotate = 2
    elseif self._rotate % 2 ~= 0 then
        error(
            __TS__New(Error, "attempt to use diamond-shaped UVs. If you are sure, set rotation manually"),
            0
        )
    end
    self.defaultAnchor = anchor and __TS__New(Point, anchor.x, anchor.y) or __TS__New(Point, 0, 0)
    self._updateID = 0
    self.textureCacheIds = {}
    if not baseTexture.valid then
        baseTexture:once("loaded", self.onBaseTextureUpdated, self)
    elseif self.noFrame then
        if baseTexture.valid then
            self:onBaseTextureUpdated(baseTexture)
        end
    else
        self.frame = frame
    end
    if self.noFrame then
        baseTexture:on("update", self.onBaseTextureUpdated, self)
    end
end
__TS__SetDescriptor(
    Texture.prototype,
    "resolution",
    {get = function(self)
        return self.baseTexture.resolution
    end},
    true
)
__TS__SetDescriptor(
    Texture.prototype,
    "frame",
    {
        get = function(self)
            return self._frame
        end,
        set = function(self, frame)
            self._frame = frame
            self.noFrame = false
            local ____frame_0 = frame
            local x = ____frame_0.x
            local y = ____frame_0.y
            local width = ____frame_0.width
            local height = ____frame_0.height
            local xNotFit = x + width > self.baseTexture.width
            local yNotFit = y + height > self.baseTexture.height
            if xNotFit or yNotFit then
                local relationship = xNotFit and yNotFit and "and" or "or"
                local errorX = (((((("X: " .. tostring(x)) .. " + ") .. tostring(width)) .. " = ") .. tostring(x + width)) .. " > ") .. tostring(self.baseTexture.width)
                local errorY = (((((("Y: " .. tostring(y)) .. " + ") .. tostring(height)) .. " = ") .. tostring(y + height)) .. " > ") .. tostring(self.baseTexture.height)
                error(
                    __TS__New(Error, "Texture Error: frame does not fit inside the base Texture dimensions: " .. (((errorX .. " ") .. relationship) .. " ") .. errorY),
                    0
                )
            end
            self.valid = Boolean(nil, width and height and self.baseTexture.valid)
            if not self.trim and not self.rotate then
                self.orig = frame
            end
            if self.valid then
                self:updateUvs()
            end
        end
    },
    true
)
__TS__SetDescriptor(
    Texture.prototype,
    "rotate",
    {
        get = function(self)
            return self._rotate
        end,
        set = function(self, rotate)
            self._rotate = rotate
            if self.valid then
                self:updateUvs()
            end
        end
    },
    true
)
__TS__SetDescriptor(
    Texture.prototype,
    "width",
    {get = function(self)
        return self.orig.width
    end},
    true
)
__TS__SetDescriptor(
    Texture.prototype,
    "height",
    {get = function(self)
        return self.orig.height
    end},
    true
)
__TS__ObjectDefineProperty(
    Texture,
    "EMPTY",
    {get = function(self)
        if not ____exports.Texture._EMPTY then
            ____exports.Texture._EMPTY = __TS__New(
                ____exports.Texture,
                __TS__New(BaseTexture)
            )
            removeAllHandlers(nil, ____exports.Texture._EMPTY)
            removeAllHandlers(nil, ____exports.Texture._EMPTY.baseTexture)
        end
        return ____exports.Texture._EMPTY
    end}
)
__TS__ObjectDefineProperty(
    Texture,
    "WHITE",
    {get = function(self)
        if not ____exports.Texture._WHITE then
            local canvas = settings.ADAPTER:createCanvas(16, 16)
            local context = canvas:getContext("2d")
            canvas.width = 16
            canvas.height = 16
            context.fillStyle = "white"
            context:fillRect(0, 0, 16, 16)
            ____exports.Texture._WHITE = __TS__New(
                ____exports.Texture,
                BaseTexture:from(canvas)
            )
            removeAllHandlers(nil, ____exports.Texture._WHITE)
            removeAllHandlers(nil, ____exports.Texture._WHITE.baseTexture)
        end
        return ____exports.Texture._WHITE
    end}
)
function Texture.prototype.update(self)
    local ____opt_1 = self.baseTexture
    if (____opt_1 and ____opt_1.resource) ~= nil then
        self.baseTexture.resource:update()
    end
end
function Texture.prototype.onBaseTextureUpdated(self, baseTexture)
    if self.noFrame then
        if not self.baseTexture.valid then
            return
        end
        self._frame.width = baseTexture.width
        self._frame.height = baseTexture.height
        self.valid = true
        self:updateUvs()
    else
        self.frame = self._frame
    end
    self:emit("update", self)
end
function Texture.prototype.destroy(self, destroyBase)
    if self.baseTexture ~= nil then
        self.baseTexture:off("loaded", self.onBaseTextureUpdated, self)
        self.baseTexture:off("update", self.onBaseTextureUpdated, self)
        self.baseTexture = nil
    end
    self._frame = nil
    self._uvs = nil
    self.trim = nil
    self.orig = nil
    self.valid = false
    ____exports.Texture:removeFromCache(self)
    self.textureCacheIds = nil
end
function Texture.prototype.clone(self)
    local clonedFrame = self._frame:clone()
    local clonedOrig = self._frame == self.orig and clonedFrame or self.orig:clone()
    local ____exports_Texture_7 = ____exports.Texture
    local ____self_baseTexture_5 = self.baseTexture
    local ____temp_6 = not self.noFrame and clonedFrame or nil
    local ____opt_3 = self.trim
    local clonedTexture = __TS__New(
        ____exports_Texture_7,
        ____self_baseTexture_5,
        ____temp_6,
        clonedOrig,
        ____opt_3 and ____opt_3:clone(),
        self.rotate,
        self.defaultAnchor
    )
    if self.noFrame then
        clonedTexture._frame = clonedFrame
    end
    return clonedTexture
end
function Texture.prototype.updateUvs(self)
    if self._uvs == DEFAULT_UVS then
        self._uvs = __TS__New(TextureUvs)
    end
    self._uvs:set(self._frame, self.baseTexture, self.rotate)
    self._updateID = self._updateID + 1
end
function Texture.from(self, source, options)
    if options == nil then
        options = {}
    end
    local isFrame = type(source) == "string"
    local cacheId = nil
    if isFrame then
        cacheId = source
    elseif __TS__InstanceOf(source, BaseTexture) then
        if not source.cacheId then
            local prefix = options and options.pixiIdPrefix or "pixiid"
            source.cacheId = (prefix .. "-") .. tostring(uid(nil))
            BaseTexture:addToCache(source, source.cacheId)
        end
        cacheId = source.cacheId
    else
        if not source._pixiId then
            local prefix = options and options.pixiIdPrefix or "pixiid"
            source._pixiId = (prefix .. "_") .. tostring(uid(nil))
        end
        cacheId = source._pixiId
    end
    local texture = TextureCache[cacheId]
    if isFrame and not texture then
        error(
            __TS__New(
                Error,
                ("The cacheId \"" .. tostring(cacheId)) .. "\" does not exist in TextureCache."
            ),
            0
        )
    end
    if not texture and not __TS__InstanceOf(source, BaseTexture) then
        if not options.resolution then
            options.resolution = 1
        end
        texture = __TS__New(
            ____exports.Texture,
            __TS__New(BaseTexture, source, options)
        )
        texture.baseTexture.cacheId = cacheId
        BaseTexture:addToCache(texture.baseTexture, cacheId)
        ____exports.Texture:addToCache(texture, cacheId)
    elseif not texture and __TS__InstanceOf(source, BaseTexture) then
        texture = __TS__New(____exports.Texture, source)
        ____exports.Texture:addToCache(texture, cacheId)
    end
    return texture
end
function Texture.fromURL(self, url, options)
    local resourceOptions = __TS__ObjectAssign({autoLoad = false}, options and options.resourceOptions)
    local texture = ____exports.Texture:from(
        url,
        __TS__ObjectAssign({resourceOptions = resourceOptions}, options)
    )
    local resource = texture.baseTexture.resource
    if texture.baseTexture.valid then
        return __TS__Promise.resolve(texture)
    end
    local ____self_14 = resource:load()
    return ____self_14["then"](
        ____self_14,
        function() return __TS__Promise.resolve(texture) end
    )
end
function Texture.fromBuffer(self, buffer, width, height, options)
    return __TS__New(
        ____exports.Texture,
        BaseTexture:fromBuffer(buffer, width, height, options)
    )
end
function Texture.fromLoader(self, source, imageUrl, name, options)
    local baseTexture = __TS__New(
        BaseTexture,
        source,
        __TS__ObjectAssign({scaleMode = BaseTexture.defaultOptions.scaleMode, resolution = 1}, options)
    )
    local texture = __TS__New(____exports.Texture, baseTexture)
    if not name then
        name = imageUrl
    end
    BaseTexture:addToCache(texture.baseTexture, name)
    ____exports.Texture:addToCache(texture, name)
    if name ~= imageUrl then
        BaseTexture:addToCache(texture.baseTexture, imageUrl)
        ____exports.Texture:addToCache(texture, imageUrl)
    end
    if texture.baseTexture.valid then
        return __TS__Promise.resolve(texture)
    end
    return __TS__New(
        __TS__Promise,
        function(____, resolve)
            texture.baseTexture:once(
                "loaded",
                function() return resolve(nil, texture) end
            )
        end
    )
end
function Texture.addToCache(self, texture, id)
    if id ~= nil and id ~= "" then
        if not __TS__ArrayIncludes(texture.textureCacheIds, id) then
            local ____texture_textureCacheIds_15 = texture.textureCacheIds
            ____texture_textureCacheIds_15[#____texture_textureCacheIds_15 + 1] = id
        end
        if TextureCache[id] and TextureCache[id] ~= texture then
            print(("Texture added to the cache with an id [" .. id) .. "] that already had an entry")
        end
        TextureCache[id] = texture
    end
end
function Texture.removeFromCache(self, texture)
    if type(texture) == "string" then
        local textureFromCache = TextureCache[texture]
        if textureFromCache ~= nil then
            local index = __TS__ArrayIndexOf(textureFromCache.textureCacheIds, texture)
            if index > -1 then
                __TS__ArraySplice(textureFromCache.textureCacheIds, index, 1)
            end
            __TS__Delete(TextureCache, texture)
            return textureFromCache
        end
    elseif (texture and texture.textureCacheIds) ~= nil then
        do
            local i = 0
            while i < #texture.textureCacheIds do
                if TextureCache[texture.textureCacheIds[i + 1]] == texture then
                    __TS__Delete(TextureCache, texture.textureCacheIds[i + 1])
                end
                i = i + 1
            end
        end
        __TS__ArraySetLength(texture.textureCacheIds, 0)
        return texture
    end
    return nil
end
function Texture.prototype.castToBaseTexture(self)
    return self.baseTexture
end
return ____exports
 end,
["core.textures.resources.index"] = function(...) 
local ____lualib = require("lualib_bundle")
local __TS__ArrayPush = ____lualib.__TS__ArrayPush
local ____exports = {}
local ____autoDetectResource = require("core.textures.resources.autoDetectResource")
local INSTALLED = ____autoDetectResource.INSTALLED
local ____BufferResource = require("core.textures.resources.BufferResource")
local BufferResource = ____BufferResource.BufferResource
local ____CanvasResource = require("core.textures.resources.CanvasResource")
local CanvasResource = ____CanvasResource.CanvasResource
do
    local ____export = require("core.textures.resources.BaseImageResource")
    for ____exportKey, ____exportValue in pairs(____export) do
        if ____exportKey ~= "default" then
            ____exports[____exportKey] = ____exportValue
        end
    end
end
do
    local ____export = require("core.textures.resources.Resource")
    for ____exportKey, ____exportValue in pairs(____export) do
        if ____exportKey ~= "default" then
            ____exports[____exportKey] = ____exportValue
        end
    end
end
__TS__ArrayPush(INSTALLED, BufferResource, CanvasResource)
do
    local ____export = require("core.textures.resources.autoDetectResource")
    for ____exportKey, ____exportValue in pairs(____export) do
        if ____exportKey ~= "default" then
            ____exports[____exportKey] = ____exportValue
        end
    end
end
do
    local ____export = require("core.textures.resources.BufferResource")
    for ____exportKey, ____exportValue in pairs(____export) do
        if ____exportKey ~= "default" then
            ____exports[____exportKey] = ____exportValue
        end
    end
end
do
    local ____export = require("core.textures.resources.CanvasResource")
    for ____exportKey, ____exportValue in pairs(____export) do
        if ____exportKey ~= "default" then
            ____exports[____exportKey] = ____exportValue
        end
    end
end
return ____exports
 end,
["core.index"] = function(...) 
--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
local ____exports = {}
--- String of the current PIXI version.
-- 
-- @memberof PIXI
____exports.VERSION = "$_VERSION"
do
    local ____export = require("color.index")
    for ____exportKey, ____exportValue in pairs(____export) do
        if ____exportKey ~= "default" then
            ____exports[____exportKey] = ____exportValue
        end
    end
end
do
    local ____export = require("constants.index")
    for ____exportKey, ____exportValue in pairs(____export) do
        if ____exportKey ~= "default" then
            ____exports[____exportKey] = ____exportValue
        end
    end
end
do
    local ____export = require("math.index")
    for ____exportKey, ____exportValue in pairs(____export) do
        if ____exportKey ~= "default" then
            ____exports[____exportKey] = ____exportValue
        end
    end
end
do
    local ____export = require("runner.index")
    for ____exportKey, ____exportValue in pairs(____export) do
        if ____exportKey ~= "default" then
            ____exports[____exportKey] = ____exportValue
        end
    end
end
do
    local ____export = require("settings")
    for ____exportKey, ____exportValue in pairs(____export) do
        if ____exportKey ~= "default" then
            ____exports[____exportKey] = ____exportValue
        end
    end
end
____exports.utils = require("utils.index")
do
    local ____export = require("core.background.BackgroundSystem")
    for ____exportKey, ____exportValue in pairs(____export) do
        if ____exportKey ~= "default" then
            ____exports[____exportKey] = ____exportValue
        end
    end
end
do
    local ____export = require("core.batch.BatchDrawCall")
    for ____exportKey, ____exportValue in pairs(____export) do
        if ____exportKey ~= "default" then
            ____exports[____exportKey] = ____exportValue
        end
    end
end
do
    local ____export = require("core.batch.BatchGeometry")
    for ____exportKey, ____exportValue in pairs(____export) do
        if ____exportKey ~= "default" then
            ____exports[____exportKey] = ____exportValue
        end
    end
end
do
    local ____export = require("core.batch.BatchSystem")
    for ____exportKey, ____exportValue in pairs(____export) do
        if ____exportKey ~= "default" then
            ____exports[____exportKey] = ____exportValue
        end
    end
end
do
    local ____export = require("core.batch.BatchTextureArray")
    for ____exportKey, ____exportValue in pairs(____export) do
        if ____exportKey ~= "default" then
            ____exports[____exportKey] = ____exportValue
        end
    end
end
do
    local ____export = require("core.batch.ObjectRenderer")
    for ____exportKey, ____exportValue in pairs(____export) do
        if ____exportKey ~= "default" then
            ____exports[____exportKey] = ____exportValue
        end
    end
end
do
    local ____export = require("core.Renderer")
    for ____exportKey, ____exportValue in pairs(____export) do
        if ____exportKey ~= "default" then
            ____exports[____exportKey] = ____exportValue
        end
    end
end
do
    local ____export = require("core.startup.StartupSystem")
    for ____exportKey, ____exportValue in pairs(____export) do
        if ____exportKey ~= "default" then
            ____exports[____exportKey] = ____exportValue
        end
    end
end
do
    local ____export = require("core.system.SystemManager")
    for ____exportKey, ____exportValue in pairs(____export) do
        if ____exportKey ~= "default" then
            ____exports[____exportKey] = ____exportValue
        end
    end
end
____exports.systems = require("core.systems")
do
    local ____export = require("core.textures.BaseTexture")
    for ____exportKey, ____exportValue in pairs(____export) do
        if ____exportKey ~= "default" then
            ____exports[____exportKey] = ____exportValue
        end
    end
end
do
    local ____export = require("core.textures.Texture")
    for ____exportKey, ____exportValue in pairs(____export) do
        if ____exportKey ~= "default" then
            ____exports[____exportKey] = ____exportValue
        end
    end
end
do
    local ____export = require("core.textures.resources.index")
    for ____exportKey, ____exportValue in pairs(____export) do
        if ____exportKey ~= "default" then
            ____exports[____exportKey] = ____exportValue
        end
    end
end
do
    local ____export = require("core.view.ViewSystem")
    for ____exportKey, ____exportValue in pairs(____export) do
        if ____exportKey ~= "default" then
            ____exports[____exportKey] = ____exportValue
        end
    end
end
return ____exports
 end,
["graphics.styles.FillStyle"] = function(...) 
local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__New = ____lualib.__TS__New
local ____exports = {}
--- Fill style object for Graphics.
-- 
-- @memberof PIXI
____exports.FillStyle = __TS__Class()
local FillStyle = ____exports.FillStyle
FillStyle.name = "FillStyle"
function FillStyle.prototype.____constructor(self)
    self.color = 16777215
    self.alpha = 1
    self.matrix = nil
    self.visible = false
    self:reset()
end
function FillStyle.prototype.clone(self)
    local obj = __TS__New(____exports.FillStyle)
    obj.color = self.color
    obj.alpha = self.alpha
    obj.matrix = self.matrix
    obj.visible = self.visible
    return obj
end
function FillStyle.prototype.reset(self)
    self.color = 16777215
    self.alpha = 1
    self.matrix = nil
    self.visible = false
end
function FillStyle.prototype.destroy(self)
    self.matrix = nil
end
return ____exports
 end,
["graphics.const"] = function(...) 
local ____lualib = require("lualib_bundle")
local __TS__Number = ____lualib.__TS__Number
local __TS__NumberIsNaN = ____lualib.__TS__NumberIsNaN
local ____exports = {}
--- Supported line joints in `PIXI.LineStyle` for graphics.
-- 
-- @see PIXI.Graphics#lineStyle *
-- @see https ://graphicdesign.stackexchange.com/questions/59018/what-is-a-bevel-join-of-two-lines-exactly-illustrator
-- @name LINE_JOIN
-- @memberof PIXI
-- @static
-- @enum *
-- @property {string} MITER - 'miter': make a sharp corner where outer part of lines meet
-- @property {string} BEVEL - 'bevel': add a square butt at each end of line segment and fill the triangle at turn
-- @property {string} ROUND - 'round': add an arc at the joint
____exports.LINE_JOIN = LINE_JOIN or ({})
____exports.LINE_JOIN.MITER = "miter"
____exports.LINE_JOIN.BEVEL = "bevel"
____exports.LINE_JOIN.ROUND = "round"
--- Support line caps in `PIXI.LineStyle` for graphics.
-- 
-- @see PIXI.Graphics#lineStyle *
-- @name LINE_CAP
-- @memberof PIXI
-- @static
-- @enum *
-- @property {string} BUTT - 'butt': don't add any cap at line ends (leaves orthogonal edges)
-- @property {string} ROUND - 'round': add semicircle at ends
-- @property {string} SQUARE - 'square': add square at end (like `BUTT` except more length at end)
____exports.LINE_CAP = LINE_CAP or ({})
____exports.LINE_CAP.BUTT = "butt"
____exports.LINE_CAP.ROUND = "round"
____exports.LINE_CAP.SQUARE = "square"
---
-- @private
____exports.curves = {
    adaptive = true,
    maxLength = 10,
    minSegments = 8,
    maxSegments = 2048,
    epsilon = 0.0001,
    _segmentsCount = function(self, length, defaultSegments)
        if defaultSegments == nil then
            defaultSegments = 20
        end
        if not self.adaptive or not length or __TS__NumberIsNaN(__TS__Number(length)) then
            return defaultSegments
        end
        local result = math.ceil(length / self.maxLength)
        if result < self.minSegments then
            result = self.minSegments
        elseif result > self.maxSegments then
            result = self.maxSegments
        end
        return result
    end
}
---
-- @static
-- @readonly
-- @memberof PIXI
-- @name GRAPHICS_CURVES
-- @type {object}
-- @deprecated since 7.1.0
-- @see PIXI.Graphics.curves
____exports.GRAPHICS_CURVES = ____exports.curves
return ____exports
 end,
["graphics.styles.LineStyle"] = function(...) 
local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
local __TS__New = ____lualib.__TS__New
local ____exports = {}
local ____const = require("graphics.const")
local LINE_CAP = ____const.LINE_CAP
local LINE_JOIN = ____const.LINE_JOIN
local ____FillStyle = require("graphics.styles.FillStyle")
local FillStyle = ____FillStyle.FillStyle
--- Represents the line style for Graphics.
-- 
-- @memberof PIXI
____exports.LineStyle = __TS__Class()
local LineStyle = ____exports.LineStyle
LineStyle.name = "LineStyle"
__TS__ClassExtends(LineStyle, FillStyle)
function LineStyle.prototype.____constructor(self, ...)
    FillStyle.prototype.____constructor(self, ...)
    self.width = 0
    self.alignment = 0.5
    self.native = false
    self.cap = LINE_CAP.BUTT
    self.join = LINE_JOIN.MITER
    self.miterLimit = 10
end
function LineStyle.prototype.clone(self)
    local obj = __TS__New(____exports.LineStyle)
    obj.color = self.color
    obj.alpha = self.alpha
    obj.matrix = self.matrix
    obj.visible = self.visible
    obj.width = self.width
    obj.alignment = self.alignment
    obj.native = self.native
    obj.cap = self.cap
    obj.join = self.join
    obj.miterLimit = self.miterLimit
    return obj
end
function LineStyle.prototype.reset(self)
    FillStyle.prototype.reset(self)
    self.color = 0
    self.alignment = 0.5
    self.width = 0
    self.native = false
end
return ____exports
 end,
["graphics.GraphicsData"] = function(...) 
local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__New = ____lualib.__TS__New
local __TS__ArraySetLength = ____lualib.__TS__ArraySetLength
local ____exports = {}
--- A class to contain data useful for Graphics objects
-- 
-- @memberof PIXI
____exports.GraphicsData = __TS__Class()
local GraphicsData = ____exports.GraphicsData
GraphicsData.name = "GraphicsData"
function GraphicsData.prototype.____constructor(self, shape, fillStyle, lineStyle, matrix)
    if fillStyle == nil then
        fillStyle = nil
    end
    if lineStyle == nil then
        lineStyle = nil
    end
    if matrix == nil then
        matrix = nil
    end
    self.points = {}
    self.holes = {}
    self.shape = shape
    self.lineStyle = lineStyle
    self.fillStyle = fillStyle
    self.matrix = matrix
    self.type = shape.type
end
function GraphicsData.prototype.clone(self)
    return __TS__New(
        ____exports.GraphicsData,
        self.shape,
        self.fillStyle,
        self.lineStyle,
        self.matrix
    )
end
function GraphicsData.prototype.destroy(self)
    self.shape = nil
    __TS__ArraySetLength(self.holes, 0)
    self.holes = nil
    __TS__ArraySetLength(self.points, 0)
    self.points = nil
    self.lineStyle = nil
    self.fillStyle = nil
end
return ____exports
 end,
["graphics.GraphicsGeometry"] = function(...) 
local ____lualib = require("lualib_bundle")
local __TS__New = ____lualib.__TS__New
local __TS__Class = ____lualib.__TS__Class
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
local __TS__SetDescriptor = ____lualib.__TS__SetDescriptor
local __TS__ArraySetLength = ____lualib.__TS__ArraySetLength
local Error = ____lualib.Error
local RangeError = ____lualib.RangeError
local ReferenceError = ____lualib.ReferenceError
local SyntaxError = ____lualib.SyntaxError
local TypeError = ____lualib.TypeError
local URIError = ____lualib.URIError
local ____exports = {}
local ____core = require("core.index")
local BatchGeometry = ____core.BatchGeometry
local Color = ____core.Color
local Point = ____core.Point
local utils = ____core.utils
local ____display = require("display.index")
local Bounds = ____display.Bounds
local ____GraphicsData = require("graphics.GraphicsData")
local GraphicsData = ____GraphicsData.GraphicsData
local ____utils = require("graphics.utils.index")
local BATCH_POOL = ____utils.BATCH_POOL
local BatchPart = ____utils.BatchPart
local buildLine = ____utils.buildLine
local buildPoly = ____utils.buildPoly
local DRAW_CALL_POOL = ____utils.DRAW_CALL_POOL
local FILL_COMMANDS = ____utils.FILL_COMMANDS
local tmpPoint = __TS__New(Point)
--- The Graphics class contains methods used to draw primitive shapes such as lines, circles and
-- rectangles to the display, and to color and fill them.
-- 
-- GraphicsGeometry is designed to not be continually updating the geometry since it's expensive
-- to re-tesselate using **earcut**. Consider using {_link PIXI.Mesh} for this use-case, it's much faster.
-- 
-- @memberof PIXI
____exports.GraphicsGeometry = __TS__Class()
local GraphicsGeometry = ____exports.GraphicsGeometry
GraphicsGeometry.name = "GraphicsGeometry"
__TS__ClassExtends(GraphicsGeometry, BatchGeometry)
function GraphicsGeometry.prototype.____constructor(self)
    BatchGeometry.prototype.____constructor(self)
    self.closePointEps = 0.0001
    self.boundsPadding = 0
    self.uvsFloat32 = nil
    self.indicesUint16 = nil
    self.batchable = false
    self.points = {}
    self.colors = {}
    self.uvs = {}
    self.indices = {}
    self.textureIds = {}
    self.graphicsData = {}
    self.drawCalls = {}
    self.batchDirty = -1
    self.batches = {}
    self.dirty = 0
    self.cacheDirty = -1
    self.clearDirty = 0
    self.shapeIndex = 0
    self._bounds = __TS__New(Bounds)
    self.boundsDirty = -1
end
__TS__SetDescriptor(
    GraphicsGeometry.prototype,
    "bounds",
    {get = function(self)
        self:updateBatches()
        if self.boundsDirty ~= self.dirty then
            self.boundsDirty = self.dirty
            self:calculateBounds()
        end
        return self._bounds
    end},
    true
)
function GraphicsGeometry.prototype.invalidate(self)
    self.boundsDirty = -1
    self.dirty = self.dirty + 1
    self.batchDirty = self.batchDirty + 1
    self.shapeIndex = 0
    __TS__ArraySetLength(self.points, 0)
    __TS__ArraySetLength(self.colors, 0)
    __TS__ArraySetLength(self.uvs, 0)
    __TS__ArraySetLength(self.indices, 0)
    __TS__ArraySetLength(self.textureIds, 0)
    do
        local i = 0
        while i < #self.drawCalls do
            self.drawCalls[i + 1].texArray:clear()
            DRAW_CALL_POOL[#DRAW_CALL_POOL + 1] = self.drawCalls[i + 1]
            i = i + 1
        end
    end
    __TS__ArraySetLength(self.drawCalls, 0)
    do
        local i = 0
        while i < #self.batches do
            local batchPart = self.batches[i + 1]
            batchPart:reset()
            BATCH_POOL[#BATCH_POOL + 1] = batchPart
            i = i + 1
        end
    end
    __TS__ArraySetLength(self.batches, 0)
end
function GraphicsGeometry.prototype.clear(self)
    if #self.graphicsData > 0 then
        self:invalidate()
        self.clearDirty = self.clearDirty + 1
        __TS__ArraySetLength(self.graphicsData, 0)
    end
    return self
end
function GraphicsGeometry.prototype.drawShape(self, shape, fillStyle, lineStyle, matrix)
    if fillStyle == nil then
        fillStyle = nil
    end
    if lineStyle == nil then
        lineStyle = nil
    end
    if matrix == nil then
        matrix = nil
    end
    local data = __TS__New(
        GraphicsData,
        shape,
        fillStyle,
        lineStyle,
        matrix
    )
    local ____self_graphicsData_0 = self.graphicsData
    ____self_graphicsData_0[#____self_graphicsData_0 + 1] = data
    self.dirty = self.dirty + 1
    return self
end
function GraphicsGeometry.prototype.drawHole(self, shape, matrix)
    if matrix == nil then
        matrix = nil
    end
    if not #self.graphicsData then
        return nil
    end
    local data = __TS__New(
        GraphicsData,
        shape,
        nil,
        nil,
        matrix
    )
    local lastShape = self.graphicsData[#self.graphicsData]
    data.lineStyle = lastShape.lineStyle
    local ____lastShape_holes_1 = lastShape.holes
    ____lastShape_holes_1[#____lastShape_holes_1 + 1] = data
    self.dirty = self.dirty + 1
    return self
end
function GraphicsGeometry.prototype.destroy(self)
    BatchGeometry.prototype.destroy(self)
    do
        local i = 0
        while i < #self.graphicsData do
            self.graphicsData[i + 1]:destroy()
            i = i + 1
        end
    end
    __TS__ArraySetLength(self.points, 0)
    self.points = nil
    __TS__ArraySetLength(self.colors, 0)
    self.colors = nil
    __TS__ArraySetLength(self.uvs, 0)
    self.uvs = nil
    __TS__ArraySetLength(self.indices, 0)
    self.indices = nil
    local ____opt_2 = self.indexBuffer
    if ____opt_2 ~= nil then
        ____opt_2:destroy()
    end
    self.indexBuffer = nil
    __TS__ArraySetLength(self.graphicsData, 0)
    self.graphicsData = nil
    __TS__ArraySetLength(self.drawCalls, 0)
    self.drawCalls = nil
    __TS__ArraySetLength(self.batches, 0)
    self.batches = nil
    self._bounds = nil
end
function GraphicsGeometry.prototype.containsPoint(self, point)
    local graphicsData = self.graphicsData
    do
        local i = 0
        while i < #graphicsData do
            do
                local data = graphicsData[i + 1]
                local ____opt_4 = data.fillStyle
                if not (____opt_4 and ____opt_4.visible) then
                    goto __continue16
                end
                if data.shape ~= nil then
                    if data.matrix then
                        data.matrix:applyInverse(point, tmpPoint)
                    else
                        tmpPoint:copyFrom(point)
                    end
                    if data.shape:contains(tmpPoint.x, tmpPoint.y) then
                        local hitHole = false
                        if data.holes ~= nil then
                            do
                                local i = 0
                                while i < #data.holes do
                                    local hole = data.holes[i + 1]
                                    if hole.shape:contains(tmpPoint.x, tmpPoint.y) then
                                        hitHole = true
                                        break
                                    end
                                    i = i + 1
                                end
                            end
                        end
                        if not hitHole then
                            return true
                        end
                    end
                end
            end
            ::__continue16::
            i = i + 1
        end
    end
    return false
end
function GraphicsGeometry.prototype.updateBatches(self)
    if not #self.graphicsData then
        self.batchable = true
        return
    end
    if not self:validateBatching() then
        return
    end
    self.cacheDirty = self.dirty
    local uvs = self.uvs
    local graphicsData = self.graphicsData
    local batchPart = nil
    local currentStyle = nil
    if #self.batches > 0 then
        batchPart = self.batches[#self.batches]
        currentStyle = batchPart.style
    end
    do
        local i = self.shapeIndex
        while i < #graphicsData do
            self.shapeIndex = self.shapeIndex + 1
            local data = graphicsData[i + 1]
            local fillStyle = data.fillStyle
            local lineStyle = data.lineStyle
            local command = FILL_COMMANDS[data.type]
            command:build(data)
            if data.matrix then
                self:transformPoints(data.points, data.matrix)
            end
            if fillStyle and fillStyle.visible or lineStyle and lineStyle.visible then
                self:processHoles(data.holes)
            end
            do
                local j = 0
                while j < 2 do
                    do
                        local ____temp_10
                        if j == 0 then
                            ____temp_10 = fillStyle
                        else
                            ____temp_10 = lineStyle
                        end
                        local style = ____temp_10
                        if not (style and style.visible) then
                            goto __continue33
                        end
                        local index = #self.indices
                        local attribIndex = #self.points / 2
                        if j == 0 then
                            self:processFill(data)
                        else
                            self:processLine(data)
                        end
                        local size = #self.points / 2 - attribIndex
                        if size == 0 then
                            goto __continue33
                        end
                        if batchPart and not self:_compareStyles(currentStyle, style) then
                            batchPart["end"](batchPart, index, attribIndex)
                            batchPart = nil
                        end
                        if not batchPart then
                            batchPart = table.remove(BATCH_POOL) or __TS__New(BatchPart)
                            batchPart:begin(style, index, attribIndex)
                            local ____self_batches_13 = self.batches
                            ____self_batches_13[#____self_batches_13 + 1] = batchPart
                            currentStyle = style
                        end
                    end
                    ::__continue33::
                    j = j + 1
                end
            end
            i = i + 1
        end
    end
    local index = #self.indices
    local attrib = #self.points / 2
    if batchPart then
        batchPart["end"](batchPart, index, attrib)
    end
    if #self.batches == 0 then
        self.batchable = true
        return
    end
    local need32 = attrib > 65535
    if self.indicesUint16 and #self.indices == self.indicesUint16.length and need32 == (self.indicesUint16.BYTES_PER_ELEMENT > 2) then
        self.indicesUint16:set(self.indices)
    else
        self.indicesUint16 = need32 and __TS__New(Uint32Array, self.indices) or __TS__New(Uint16Array, self.indices)
    end
    self.batchable = self:isBatchable()
    if self.batchable then
        self:packBatches()
    else
        self:buildDrawCalls()
    end
end
function GraphicsGeometry.prototype._compareStyles(self, styleA, styleB)
    if not styleA or not styleB then
        return false
    end
    if styleA.color + styleA.alpha ~= styleB.color + styleB.alpha then
        return false
    end
    if not not styleA.native ~= not not styleB.native then
        return false
    end
    return true
end
function GraphicsGeometry.prototype.validateBatching(self)
    if self.dirty == self.cacheDirty or not #self.graphicsData then
        return false
    end
    return true
end
function GraphicsGeometry.prototype.packBatches(self)
    self.batchDirty = self.batchDirty + 1
    self.uvsFloat32 = __TS__New(Float32Array, self.uvs)
    local batches = self.batches
    do
        local i = 0
        local l = #batches
        while i < l do
            local batch = batches[i + 1]
            do
                local j = 0
                while j < batch.size do
                    local index = batch.start + j
                    self.indicesUint16[index] = self.indicesUint16[index] - batch.attribStart
                    j = j + 1
                end
            end
            i = i + 1
        end
    end
end
function GraphicsGeometry.prototype.isBatchable(self)
    if #self.points > 65535 * 2 then
        return false
    end
    local batches = self.batches
    do
        local i = 0
        while i < #batches do
            if batches[i + 1].style.native then
                return false
            end
            i = i + 1
        end
    end
    return #self.points < ____exports.GraphicsGeometry.BATCHABLE_SIZE * 2
end
function GraphicsGeometry.prototype.buildDrawCalls(self)
    error(
        __TS__New(Error, "buildDrawCalls unimplemented"),
        0
    )
end
function GraphicsGeometry.prototype.packAttributes(self)
    local verts = self.points
    local uvs = self.uvs
    local colors = self.colors
    local textureIds = self.textureIds
    local glPoints = __TS__New(ArrayBuffer, #verts * 3 * 4)
    local f32 = __TS__New(Float32Array, glPoints)
    local u32 = __TS__New(Uint32Array, glPoints)
    local p = 0
    do
        local i = 0
        while i < #verts / 2 do
            local ____p_14 = p
            p = ____p_14 + 1
            f32[____p_14] = verts[i * 2 + 1]
            local ____p_15 = p
            p = ____p_15 + 1
            f32[____p_15] = verts[i * 2 + 1 + 1]
            local ____p_16 = p
            p = ____p_16 + 1
            f32[____p_16] = uvs[i * 2 + 1]
            local ____p_17 = p
            p = ____p_17 + 1
            f32[____p_17] = uvs[i * 2 + 1 + 1]
            local ____p_18 = p
            p = ____p_18 + 1
            u32[____p_18] = colors[i + 1]
            local ____p_19 = p
            p = ____p_19 + 1
            f32[____p_19] = textureIds[i + 1]
            i = i + 1
        end
    end
    self._buffer:update(glPoints)
    self._indexBuffer:update(self.indicesUint16)
end
function GraphicsGeometry.prototype.processFill(self, data)
    if #data.holes > 0 then
        buildPoly:triangulate(data, self)
    else
        local command = FILL_COMMANDS[data.type]
        command:triangulate(data, self)
    end
end
function GraphicsGeometry.prototype.processLine(self, data)
    buildLine(nil, data, self)
    do
        local i = 0
        while i < #data.holes do
            buildLine(nil, data.holes[i + 1], self)
            i = i + 1
        end
    end
end
function GraphicsGeometry.prototype.processHoles(self, holes)
    do
        local i = 0
        while i < #holes do
            local hole = holes[i + 1]
            local command = FILL_COMMANDS[hole.type]
            command:build(hole)
            if hole.matrix then
                self:transformPoints(hole.points, hole.matrix)
            end
            i = i + 1
        end
    end
end
function GraphicsGeometry.prototype.calculateBounds(self)
    local bounds = self._bounds
    bounds:clear()
    bounds:addVertexData(self.points, 0, #self.points)
    bounds:pad(self.boundsPadding, self.boundsPadding)
end
function GraphicsGeometry.prototype.transformPoints(self, points, matrix)
    do
        local i = 0
        while i < #points / 2 do
            local x = points[i * 2 + 1]
            local y = points[i * 2 + 1 + 1]
            points[i * 2 + 1] = matrix.a * x + matrix.c * y + matrix.tx
            points[i * 2 + 1 + 1] = matrix.b * x + matrix.d * y + matrix.ty
            i = i + 1
        end
    end
end
function GraphicsGeometry.prototype.addColors(self, colors, color, alpha, size, offset)
    if offset == nil then
        offset = 0
    end
    local rgb = Color.shared:setValue(color):toLittleEndianNumber()
    local rgba = utils:premultiplyTint(rgb, alpha)
    __TS__ArraySetLength(
        colors,
        math.max(#colors, offset + size)
    )
    do
        local i = 0
        while i < size do
            colors[offset + i + 1] = rgba
            i = i + 1
        end
    end
end
function GraphicsGeometry.prototype.addTextureIds(self, textureIds, id, size, offset)
    if offset == nil then
        offset = 0
    end
    __TS__ArraySetLength(
        textureIds,
        math.max(#textureIds, offset + size)
    )
    do
        local i = 0
        while i < size do
            textureIds[offset + i + 1] = id
            i = i + 1
        end
    end
end
GraphicsGeometry.BATCHABLE_SIZE = 100
return ____exports
 end,
["graphics.utils.IShapeBuildCommand"] = function(...) 
--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
local ____exports = {}
return ____exports
 end,
["graphics.utils.buildCircle"] = function(...) 
local ____lualib = require("lualib_bundle")
local __TS__ArraySetLength = ____lualib.__TS__ArraySetLength
local __TS__ArrayPush = ____lualib.__TS__ArrayPush
local ____exports = {}
local ____core = require("core.index")
local SHAPES = ____core.SHAPES
--- Builds a circle to draw
-- 
-- Ignored from docs since it is not directly exposed.
-- 
-- @ignore
-- @private
-- @param graphicsData - The graphics object to draw
-- @param webGLData - an object containing all the WebGL-specific information to create this shape
-- @param webGLDataNativeLines - an object containing all the WebGL-specific information to create nativeLines
____exports.buildCircle = {
    build = function(self, graphicsData)
        local points = graphicsData.points
        local x
        local y
        local dx
        local dy
        local rx
        local ry
        if graphicsData.type == SHAPES.CIRC then
            local circle = graphicsData.shape
            x = circle.x
            y = circle.y
            ry = circle.radius
            rx = ry
            dy = 0
            dx = dy
        elseif graphicsData.type == SHAPES.ELIP then
            local ellipse = graphicsData.shape
            x = ellipse.x
            y = ellipse.y
            rx = ellipse.width
            ry = ellipse.height
            dy = 0
            dx = dy
        else
            local roundedRect = graphicsData.shape
            local halfWidth = roundedRect.width / 2
            local halfHeight = roundedRect.height / 2
            x = roundedRect.x + halfWidth
            y = roundedRect.y + halfHeight
            ry = math.max(
                0,
                math.min(
                    roundedRect.radius,
                    math.min(halfWidth, halfHeight)
                )
            )
            rx = ry
            dx = halfWidth - rx
            dy = halfHeight - ry
        end
        if not (rx >= 0 and ry >= 0 and dx >= 0 and dy >= 0) then
            __TS__ArraySetLength(points, 0)
            return
        end
        local n = math.ceil(2.3 * math.sqrt(rx + ry))
        local m = n * 8 + (dx and dx ~= 0 and 4 or 0) + (dy and dy ~= 0 and 4 or 0)
        __TS__ArraySetLength(points, m)
        if m == 0 then
            return
        end
        if n == 0 then
            __TS__ArraySetLength(points, 8)
            local ____temp_0 = x + dx
            points[7] = ____temp_0
            points[1] = ____temp_0
            local ____temp_1 = y + dy
            points[4] = ____temp_1
            points[2] = ____temp_1
            local ____temp_2 = x - dx
            points[5] = ____temp_2
            points[3] = ____temp_2
            local ____temp_3 = y - dy
            points[8] = ____temp_3
            points[6] = ____temp_3
            return
        end
        local j1 = 0
        local j2 = n * 4 + (dx and dx ~= 0 and 2 or 0) + 2
        local j3 = j2
        local j4 = m
        do
            local x0 = dx + rx
            local y0 = dy
            local x1 = x + x0
            local x2 = x - x0
            local y1 = y + y0
            local ____j1_4 = j1
            j1 = ____j1_4 + 1
            points[____j1_4 + 1] = x1
            local ____j1_5 = j1
            j1 = ____j1_5 + 1
            points[____j1_5 + 1] = y1
            j2 = j2 - 1
            points[j2 + 1] = y1
            j2 = j2 - 1
            points[j2 + 1] = x2
            if dy ~= nil then
                local y2 = y - y0
                local ____j3_6 = j3
                j3 = ____j3_6 + 1
                points[____j3_6 + 1] = x2
                local ____j3_7 = j3
                j3 = ____j3_7 + 1
                points[____j3_7 + 1] = y2
                j4 = j4 - 1
                points[j4 + 1] = y2
                j4 = j4 - 1
                points[j4 + 1] = x1
            end
        end
        do
            local i = 1
            while i < n do
                local a = math.pi / 2 * (i / n)
                local x0 = dx + math.cos(a) * rx
                local y0 = dy + math.sin(a) * ry
                local x1 = x + x0
                local x2 = x - x0
                local y1 = y + y0
                local y2 = y - y0
                local ____j1_8 = j1
                j1 = ____j1_8 + 1
                points[____j1_8 + 1] = x1
                local ____j1_9 = j1
                j1 = ____j1_9 + 1
                points[____j1_9 + 1] = y1
                j2 = j2 - 1
                points[j2 + 1] = y1
                j2 = j2 - 1
                points[j2 + 1] = x2
                local ____j3_10 = j3
                j3 = ____j3_10 + 1
                points[____j3_10 + 1] = x2
                local ____j3_11 = j3
                j3 = ____j3_11 + 1
                points[____j3_11 + 1] = y2
                j4 = j4 - 1
                points[j4 + 1] = y2
                j4 = j4 - 1
                points[j4 + 1] = x1
                i = i + 1
            end
        end
        do
            local x0 = dx
            local y0 = dy + ry
            local x1 = x + x0
            local x2 = x - x0
            local y1 = y + y0
            local y2 = y - y0
            local ____j1_12 = j1
            j1 = ____j1_12 + 1
            points[____j1_12 + 1] = x1
            local ____j1_13 = j1
            j1 = ____j1_13 + 1
            points[____j1_13 + 1] = y1
            j4 = j4 - 1
            points[j4 + 1] = y2
            j4 = j4 - 1
            points[j4 + 1] = x1
            if dx and dx ~= 0 then
                local ____j1_14 = j1
                j1 = ____j1_14 + 1
                points[____j1_14 + 1] = x2
                local ____j1_15 = j1
                j1 = ____j1_15 + 1
                points[____j1_15 + 1] = y1
                j4 = j4 - 1
                points[j4 + 1] = y2
                j4 = j4 - 1
                points[j4 + 1] = x2
            end
        end
    end,
    triangulate = function(self, graphicsData, graphicsGeometry)
        local points = graphicsData.points
        local verts = graphicsGeometry.points
        local indices = graphicsGeometry.indices
        if #points == 0 then
            return
        end
        local vertPos = #verts / 2
        local center = vertPos
        local x
        local y
        if graphicsData.type ~= SHAPES.RREC then
            local circle = graphicsData.shape
            x = circle.x
            y = circle.y
        else
            local roundedRect = graphicsData.shape
            x = roundedRect.x + roundedRect.width / 2
            y = roundedRect.y + roundedRect.height / 2
        end
        local matrix = graphicsData.matrix
        if not matrix then
            return
        end
        __TS__ArrayPush(verts, graphicsData.matrix and matrix.a * x + matrix.c * y + matrix.tx or x, graphicsData.matrix and matrix.b * x + matrix.d * y + matrix.ty or y)
        vertPos = vertPos + 1
        __TS__ArrayPush(verts, points[1], points[2])
        do
            local i = 2
            while i < #points do
                __TS__ArrayPush(verts, points[i + 1], points[i + 1 + 1])
                local ____vertPos_16 = vertPos
                vertPos = ____vertPos_16 + 1
                __TS__ArrayPush(indices, ____vertPos_16, center, vertPos)
                i = i + 2
            end
        end
        __TS__ArrayPush(indices, center + 1, center, vertPos)
    end
}
return ____exports
 end,
["earcut.index"] = function(...) 
local ____lualib = require("lualib_bundle")
local __TS__ArraySort = ____lualib.__TS__ArraySort
local __TS__New = ____lualib.__TS__New
local __TS__Class = ____lualib.__TS__Class
local ____exports = {}
local linkedList, filterPoints, earcutLinked, isEar, isEarHashed, cureLocalIntersections, splitEarcut, eliminateHoles, compareX, eliminateHole, findHoleBridge, sectorContainsSector, indexCurve, sortLinked, zOrder, getLeftmost, pointInTriangle, isValidDiagonal, area, equals, intersects, onSegment, sign, intersectsPolygon, locallyInside, middleInside, splitPolygon, insertNode, removeNode, signedArea, Node
____exports.earcut = setmetatable(
    {},
    {__call = function(____, self, data, holeIndices, dim)
        dim = dim or 2
        local hasHoles = holeIndices and #holeIndices
        local outerLen = holeIndices and #holeIndices and holeIndices[1] * dim or #data
        local outerNode = linkedList(
            nil,
            data,
            0,
            outerLen,
            dim,
            true
        )
        local triangles = {}
        if not outerNode or outerNode.next == outerNode.prev then
            return triangles
        end
        local minX
        local minY
        local maxX
        local maxY
        local x
        local y
        local invSize
        if hasHoles then
            outerNode = eliminateHoles(
                nil,
                data,
                holeIndices,
                outerNode,
                dim
            )
        end
        if #data > 80 * dim then
            maxX = data[1]
            minX = maxX
            maxY = data[2]
            minY = maxY
            do
                local i = dim
                while i < outerLen do
                    x = data[i + 1]
                    y = data[i + 1 + 1]
                    if x < minX then
                        minX = x
                    end
                    if y < minY then
                        minY = y
                    end
                    if x > maxX then
                        maxX = x
                    end
                    if y > maxY then
                        maxY = y
                    end
                    i = i + dim
                end
            end
            invSize = math.max(maxX - minX, maxY - minY)
            invSize = invSize ~= 0 and 32767 / invSize or 0
        end
        earcutLinked(
            nil,
            outerNode,
            triangles,
            dim,
            minX,
            minY,
            invSize,
            0
        )
        return triangles
    end}
)
function linkedList(self, data, start, ____end, dim, clockwise)
    local i
    local last
    if clockwise == (signedArea(
        nil,
        data,
        start,
        ____end,
        dim
    ) > 0) then
        do
            i = start
            while i < ____end do
                last = insertNode(
                    nil,
                    i,
                    data[i],
                    data[i + 1],
                    last
                )
                i = i + dim
            end
        end
    else
        do
            i = ____end - dim
            while i >= start do
                last = insertNode(
                    nil,
                    i,
                    data[i],
                    data[i + 1],
                    last
                )
                i = i - dim
            end
        end
    end
    if last and equals(nil, last, last.next) then
        removeNode(nil, last)
        last = last.next
    end
    return last
end
function filterPoints(self, start, ____end)
    if not start then
        return start
    end
    if not ____end then
        ____end = start
    end
    local p = start
    local again
    repeat
        do
            again = false
            if not p.steiner and (equals(nil, p, p.next) or area(nil, p.prev, p, p.next) == 0) then
                removeNode(nil, p)
                ____end = p.prev
                p = ____end
                if p == p.next then
                    break
                end
                again = true
            else
                p = p.next
            end
        end
    until not (again or p ~= ____end)
    return ____end
end
function earcutLinked(self, ear, triangles, dim, minX, minY, invSize, pass)
    if not ear then
        return
    end
    if not pass and invSize then
        indexCurve(
            nil,
            ear,
            minX,
            minY,
            invSize
        )
    end
    local stop = ear
    local prev
    local next
    while ear.prev ~= ear.next do
        do
            prev = ear.prev
            next = ear.next
            local ____invSize_0
            if invSize then
                ____invSize_0 = isEarHashed(
                    nil,
                    ear,
                    minX,
                    minY,
                    invSize
                )
            else
                ____invSize_0 = isEar(nil, ear)
            end
            if ____invSize_0 then
                triangles:push(bit.bor(prev.i / dim, 0))
                triangles:push(bit.bor(ear.i / dim, 0))
                triangles:push(bit.bor(next.i / dim, 0))
                removeNode(nil, ear)
                ear = next.next
                stop = next.next
                goto __continue27
            end
            ear = next
            if ear == stop then
                if not pass then
                    earcutLinked(
                        nil,
                        filterPoints(nil, ear),
                        triangles,
                        dim,
                        minX,
                        minY,
                        invSize,
                        1
                    )
                elseif pass == 1 then
                    ear = cureLocalIntersections(
                        nil,
                        filterPoints(nil, ear),
                        triangles,
                        dim
                    )
                    earcutLinked(
                        nil,
                        ear,
                        triangles,
                        dim,
                        minX,
                        minY,
                        invSize,
                        2
                    )
                elseif pass == 2 then
                    splitEarcut(
                        nil,
                        ear,
                        triangles,
                        dim,
                        minX,
                        minY,
                        invSize
                    )
                end
                break
            end
        end
        ::__continue27::
    end
end
function isEar(self, ear)
    local a = ear.prev
    local b = ear
    local c = ear.next
    if area(nil, a, b, c) >= 0 then
        return false
    end
    local ax = a.x
    local bx = b.x
    local cx = c.x
    local ay = a.y
    local by = b.y
    local cy = c.y
    local ____temp_3
    if ax < bx then
        local ____temp_1
        if ax < cx then
            ____temp_1 = ax
        else
            ____temp_1 = cx
        end
        ____temp_3 = ____temp_1
    else
        local ____temp_2
        if bx < cx then
            ____temp_2 = bx
        else
            ____temp_2 = cx
        end
        ____temp_3 = ____temp_2
    end
    local ____temp_6
    if ay < by then
        local ____temp_4
        if ay < cy then
            ____temp_4 = ay
        else
            ____temp_4 = cy
        end
        ____temp_6 = ____temp_4
    else
        local ____temp_5
        if by < cy then
            ____temp_5 = by
        else
            ____temp_5 = cy
        end
        ____temp_6 = ____temp_5
    end
    local ____temp_9
    if ax > bx then
        local ____temp_7
        if ax > cx then
            ____temp_7 = ax
        else
            ____temp_7 = cx
        end
        ____temp_9 = ____temp_7
    else
        local ____temp_8
        if bx > cx then
            ____temp_8 = bx
        else
            ____temp_8 = cx
        end
        ____temp_9 = ____temp_8
    end
    local ____temp_12
    if ay > by then
        local ____temp_10
        if ay > cy then
            ____temp_10 = ay
        else
            ____temp_10 = cy
        end
        ____temp_12 = ____temp_10
    else
        local ____temp_11
        if by > cy then
            ____temp_11 = by
        else
            ____temp_11 = cy
        end
        ____temp_12 = ____temp_11
    end
    local x0 = ____temp_3
    local y0 = ____temp_6
    local x1 = ____temp_9
    local y1 = ____temp_12
    local p = c.next
    while p ~= a do
        if p.x >= x0 and p.x <= x1 and p.y >= y0 and p.y <= y1 and pointInTriangle(
            nil,
            ax,
            ay,
            bx,
            by,
            cx,
            cy,
            p.x,
            p.y
        ) and area(nil, p.prev, p, p.next) >= 0 then
            return false
        end
        p = p.next
    end
    return true
end
function isEarHashed(self, ear, minX, minY, invSize)
    local a = ear.prev
    local b = ear
    local c = ear.next
    if area(nil, a, b, c) >= 0 then
        return false
    end
    local ax = a.x
    local bx = b.x
    local cx = c.x
    local ay = a.y
    local by = b.y
    local cy = c.y
    local ____temp_15
    if ax < bx then
        local ____temp_13
        if ax < cx then
            ____temp_13 = ax
        else
            ____temp_13 = cx
        end
        ____temp_15 = ____temp_13
    else
        local ____temp_14
        if bx < cx then
            ____temp_14 = bx
        else
            ____temp_14 = cx
        end
        ____temp_15 = ____temp_14
    end
    local ____temp_18
    if ay < by then
        local ____temp_16
        if ay < cy then
            ____temp_16 = ay
        else
            ____temp_16 = cy
        end
        ____temp_18 = ____temp_16
    else
        local ____temp_17
        if by < cy then
            ____temp_17 = by
        else
            ____temp_17 = cy
        end
        ____temp_18 = ____temp_17
    end
    local ____temp_21
    if ax > bx then
        local ____temp_19
        if ax > cx then
            ____temp_19 = ax
        else
            ____temp_19 = cx
        end
        ____temp_21 = ____temp_19
    else
        local ____temp_20
        if bx > cx then
            ____temp_20 = bx
        else
            ____temp_20 = cx
        end
        ____temp_21 = ____temp_20
    end
    local ____temp_24
    if ay > by then
        local ____temp_22
        if ay > cy then
            ____temp_22 = ay
        else
            ____temp_22 = cy
        end
        ____temp_24 = ____temp_22
    else
        local ____temp_23
        if by > cy then
            ____temp_23 = by
        else
            ____temp_23 = cy
        end
        ____temp_24 = ____temp_23
    end
    local x0 = ____temp_15
    local y0 = ____temp_18
    local x1 = ____temp_21
    local y1 = ____temp_24
    local minZ = zOrder(
        nil,
        x0,
        y0,
        minX,
        minY,
        invSize
    )
    local maxZ = zOrder(
        nil,
        x1,
        y1,
        minX,
        minY,
        invSize
    )
    local p = ear.prevZ
    local n = ear.nextZ
    while p and p.z >= minZ and n and n.z <= maxZ do
        if p.x >= x0 and p.x <= x1 and p.y >= y0 and p.y <= y1 and p ~= a and p ~= c and pointInTriangle(
            nil,
            ax,
            ay,
            bx,
            by,
            cx,
            cy,
            p.x,
            p.y
        ) and area(nil, p.prev, p, p.next) >= 0 then
            return false
        end
        p = p.prevZ
        if n.x >= x0 and n.x <= x1 and n.y >= y0 and n.y <= y1 and n ~= a and n ~= c and pointInTriangle(
            nil,
            ax,
            ay,
            bx,
            by,
            cx,
            cy,
            n.x,
            n.y
        ) and area(nil, n.prev, n, n.next) >= 0 then
            return false
        end
        n = n.nextZ
    end
    while p and p.z >= minZ do
        if p.x >= x0 and p.x <= x1 and p.y >= y0 and p.y <= y1 and p ~= a and p ~= c and pointInTriangle(
            nil,
            ax,
            ay,
            bx,
            by,
            cx,
            cy,
            p.x,
            p.y
        ) and area(nil, p.prev, p, p.next) >= 0 then
            return false
        end
        p = p.prevZ
    end
    while n and n.z <= maxZ do
        if n.x >= x0 and n.x <= x1 and n.y >= y0 and n.y <= y1 and n ~= a and n ~= c and pointInTriangle(
            nil,
            ax,
            ay,
            bx,
            by,
            cx,
            cy,
            n.x,
            n.y
        ) and area(nil, n.prev, n, n.next) >= 0 then
            return false
        end
        n = n.nextZ
    end
    return true
end
function cureLocalIntersections(self, start, triangles, dim)
    local p = start
    repeat
        do
            local a = p.prev
            local b = p.next.next
            if not equals(nil, a, b) and intersects(
                nil,
                a,
                p,
                p.next,
                b
            ) and locallyInside(nil, a, b) and locallyInside(nil, b, a) then
                triangles:push(bit.bor(a.i / dim, 0))
                triangles:push(bit.bor(p.i / dim, 0))
                triangles:push(bit.bor(b.i / dim, 0))
                removeNode(nil, p)
                removeNode(nil, p.next)
                start = b
                p = start
            end
            p = p.next
        end
    until not (p ~= start)
    return filterPoints(nil, p)
end
function splitEarcut(self, start, triangles, dim, minX, minY, invSize)
    local a = start
    repeat
        do
            local b = a.next.next
            while b ~= a.prev do
                if a.i ~= b.i and isValidDiagonal(nil, a, b) then
                    local c = splitPolygon(nil, a, b)
                    a = filterPoints(nil, a, a.next)
                    c = filterPoints(nil, c, c.next)
                    earcutLinked(
                        nil,
                        a,
                        triangles,
                        dim,
                        minX,
                        minY,
                        invSize,
                        0
                    )
                    earcutLinked(
                        nil,
                        c,
                        triangles,
                        dim,
                        minX,
                        minY,
                        invSize,
                        0
                    )
                    return
                end
                b = b.next
            end
            a = a.next
        end
    until not (a ~= start)
end
function eliminateHoles(self, data, holeIndices, outerNode, dim)
    local queue = {}
    local i
    local len
    local start
    local ____end
    local list
    do
        do
            i = 0
            len = holeIndices.length
        end
        while i < len do
            start = holeIndices[i] * dim
            ____end = i < len - 1 and holeIndices[i + 1] * dim or data.length
            list = linkedList(
                nil,
                data,
                start,
                ____end,
                dim,
                false
            )
            if list == list.next then
                list.steiner = true
            end
            queue[#queue + 1] = getLeftmost(nil, list)
            i = i + 1
        end
    end
    __TS__ArraySort(queue, compareX)
    do
        i = 0
        while i < #queue do
            outerNode = eliminateHole(nil, queue[i + 1], outerNode)
            i = i + 1
        end
    end
    return outerNode
end
function compareX(self, a, b)
    return a.x - b.x
end
function eliminateHole(self, hole, outerNode)
    local bridge = findHoleBridge(nil, hole, outerNode)
    if not bridge then
        return outerNode
    end
    local bridgeReverse = splitPolygon(nil, bridge, hole)
    filterPoints(nil, bridgeReverse, bridgeReverse.next)
    return filterPoints(nil, bridge, bridge.next)
end
function findHoleBridge(self, hole, outerNode)
    local p = outerNode
    local hx = hole.x
    local hy = hole.y
    local qx = -math.huge
    local m
    repeat
        do
            if hy <= p.y and hy >= p.next.y and p.next.y ~= p.y then
                local x = p.x + (hy - p.y) * (p.next.x - p.x) / (p.next.y - p.y)
                if x <= hx and x > qx then
                    qx = x
                    local ____temp_25
                    if p.x < p.next.x then
                        ____temp_25 = p
                    else
                        ____temp_25 = p.next
                    end
                    m = ____temp_25
                    if x == hx then
                        return m
                    end
                end
            end
            p = p.next
        end
    until not (p ~= outerNode)
    if not m then
        return nil
    end
    local stop = m
    local mx = m.x
    local my = m.y
    local tanMin = math.huge
    local tan
    p = m
    repeat
        do
            local ____temp_28 = hx >= p.x and p.x >= mx and hx ~= p.x
            if ____temp_28 then
                local ____pointInTriangle_27 = pointInTriangle
                local ____temp_26
                if hy < my then
                    ____temp_26 = hx
                else
                    ____temp_26 = qx
                end
                ____temp_28 = ____pointInTriangle_27(
                    nil,
                    ____temp_26,
                    hy,
                    mx,
                    my,
                    hy < my and qx or hx,
                    hy,
                    p.x,
                    p.y
                )
            end
            if ____temp_28 then
                tan = math.abs(hy - p.y) / (hx - p.x)
                if locallyInside(nil, p, hole) and (tan < tanMin or tan == tanMin and (p.x > m.x or p.x == m.x and sectorContainsSector(nil, m, p))) then
                    m = p
                    tanMin = tan
                end
            end
            p = p.next
        end
    until not (p ~= stop)
    return m
end
function sectorContainsSector(self, m, p)
    return area(nil, m.prev, m, p.prev) < 0 and area(nil, p.next, m, m.next) < 0
end
function indexCurve(self, start, minX, minY, invSize)
    local p = start
    repeat
        do
            if p.z == 0 then
                p.z = zOrder(
                    nil,
                    p.x,
                    p.y,
                    minX,
                    minY,
                    invSize
                )
            end
            p.prevZ = p.prev
            p.nextZ = p.next
            p = p.next
        end
    until not (p ~= start)
    p.prevZ.nextZ = nil
    p.prevZ = nil
    sortLinked(nil, p)
end
function sortLinked(self, list)
    local i
    local p
    local q
    local e
    local tail
    local numMerges
    local pSize
    local qSize
    local inSize = 1
    repeat
        do
            p = list
            list = nil
            tail = nil
            numMerges = 0
            while p do
                numMerges = numMerges + 1
                q = p
                pSize = 0
                do
                    i = 0
                    while i < inSize do
                        pSize = pSize + 1
                        q = q.nextZ
                        if not q then
                            break
                        end
                        i = i + 1
                    end
                end
                qSize = inSize
                while pSize > 0 or qSize > 0 and q do
                    if pSize ~= 0 and (qSize == 0 or not q or p.z <= q.z) then
                        e = p
                        p = p.nextZ
                        pSize = pSize - 1
                    else
                        e = q
                        q = q.nextZ
                        qSize = qSize - 1
                    end
                    if tail then
                        tail.nextZ = e
                    else
                        list = e
                    end
                    e.prevZ = tail
                    tail = e
                end
                p = q
            end
            tail.nextZ = nil
            inSize = inSize * 2
        end
    until not (numMerges > 1)
    return list
end
function zOrder(self, x, y, minX, minY, invSize)
    x = bit.bor((x - minX) * invSize, 0)
    y = bit.bor((y - minY) * invSize, 0)
    x = bit.band(
        bit.bor(
            x,
            bit.lshift(x, 8)
        ),
        16711935
    )
    x = bit.band(
        bit.bor(
            x,
            bit.lshift(x, 4)
        ),
        252645135
    )
    x = bit.band(
        bit.bor(
            x,
            bit.lshift(x, 2)
        ),
        858993459
    )
    x = bit.band(
        bit.bor(
            x,
            bit.lshift(x, 1)
        ),
        1431655765
    )
    y = bit.band(
        bit.bor(
            y,
            bit.lshift(y, 8)
        ),
        16711935
    )
    y = bit.band(
        bit.bor(
            y,
            bit.lshift(y, 4)
        ),
        252645135
    )
    y = bit.band(
        bit.bor(
            y,
            bit.lshift(y, 2)
        ),
        858993459
    )
    y = bit.band(
        bit.bor(
            y,
            bit.lshift(y, 1)
        ),
        1431655765
    )
    return bit.bor(
        x,
        bit.lshift(y, 1)
    )
end
function getLeftmost(self, start)
    local p = start
    local leftmost = start
    repeat
        do
            if p.x < leftmost.x or p.x == leftmost.x and p.y < leftmost.y then
                leftmost = p
            end
            p = p.next
        end
    until not (p ~= start)
    return leftmost
end
function pointInTriangle(self, ax, ay, bx, by, cx, cy, px, py)
    return (cx - px) * (ay - py) >= (ax - px) * (cy - py) and (ax - px) * (by - py) >= (bx - px) * (ay - py) and (bx - px) * (cy - py) >= (cx - px) * (by - py)
end
function isValidDiagonal(self, a, b)
    return a.next.i ~= b.i and a.prev.i ~= b.i and not intersectsPolygon(nil, a, b) and (locallyInside(nil, a, b) and locallyInside(nil, b, a) and middleInside(nil, a, b) and (area(nil, a.prev, a, b.prev) or area(nil, a, b.prev, b)) or equals(nil, a, b) and area(nil, a.prev, a, a.next) > 0 and area(nil, b.prev, b, b.next) > 0)
end
function area(self, p, q, r)
    return (q.y - p.y) * (r.x - q.x) - (q.x - p.x) * (r.y - q.y)
end
function equals(self, p1, p2)
    return p1.x == p2.x and p1.y == p2.y
end
function intersects(self, p1, q1, p2, q2)
    local o1 = sign(
        nil,
        area(nil, p1, q1, p2)
    )
    local o2 = sign(
        nil,
        area(nil, p1, q1, q2)
    )
    local o3 = sign(
        nil,
        area(nil, p2, q2, p1)
    )
    local o4 = sign(
        nil,
        area(nil, p2, q2, q1)
    )
    if o1 ~= o2 and o3 ~= o4 then
        return true
    end
    if o1 == 0 and onSegment(nil, p1, p2, q1) then
        return true
    end
    if o2 == 0 and onSegment(nil, p1, q2, q1) then
        return true
    end
    if o3 == 0 and onSegment(nil, p2, p1, q2) then
        return true
    end
    if o4 == 0 and onSegment(nil, p2, q1, q2) then
        return true
    end
    return false
end
function onSegment(self, p, q, r)
    return q.x <= math.max(p.x, r.x) and q.x >= math.min(p.x, r.x) and q.y <= math.max(p.y, r.y) and q.y >= math.min(p.y, r.y)
end
function sign(self, num)
    return num > 0 and 1 or (num < 0 and -1 or 0)
end
function intersectsPolygon(self, a, b)
    local p = a
    repeat
        do
            if p.i ~= a.i and p.next.i ~= a.i and p.i ~= b.i and p.next.i ~= b.i and intersects(
                nil,
                p,
                p.next,
                a,
                b
            ) then
                return true
            end
            p = p.next
        end
    until not (p ~= a)
    return false
end
function locallyInside(self, a, b)
    local ____temp_29
    if area(nil, a.prev, a, a.next) < 0 then
        ____temp_29 = area(nil, a, b, a.next) >= 0 and area(nil, a, a.prev, b) >= 0
    else
        ____temp_29 = area(nil, a, b, a.prev) < 0 or area(nil, a, a.next, b) < 0
    end
    return ____temp_29
end
function middleInside(self, a, b)
    local p = a
    local inside = false
    local px = (a.x + b.x) / 2
    local py = (a.y + b.y) / 2
    repeat
        do
            if p.y > py ~= (p.next.y > py) and p.next.y ~= p.y and px < (p.next.x - p.x) * (py - p.y) / (p.next.y - p.y) + p.x then
                inside = not inside
            end
            p = p.next
        end
    until not (p ~= a)
    return inside
end
function splitPolygon(self, a, b)
    local a2 = __TS__New(Node, a.i, a.x, a.y)
    local b2 = __TS__New(Node, b.i, b.x, b.y)
    local an = a.next
    local bp = b.prev
    a.next = b
    b.prev = a
    a2.next = an
    an.prev = a2
    b2.next = a2
    a2.prev = b2
    bp.next = b2
    b2.prev = bp
    return b2
end
function insertNode(self, i, x, y, last)
    local p = __TS__New(Node, i, x, y)
    if not last then
        p.prev = p
        p.next = p
    else
        p.next = last.next
        p.prev = last
        last.next.prev = p
        last.next = p
    end
    return p
end
function removeNode(self, p)
    p.next.prev = p.prev
    p.prev.next = p.next
    if p.prevZ then
        p.prevZ.nextZ = p.nextZ
    end
    if p.nextZ then
        p.nextZ.prevZ = p.prevZ
    end
end
function signedArea(self, data, start, ____end, dim)
    local sum = 0
    do
        local i = start
        local j = ____end - dim
        while i < ____end do
            sum = sum + (data[j] - data[i]) * (data[i + 1] + data[j + 1])
            j = i
            i = i + dim
        end
    end
    return sum
end
____exports.default = ____exports.earcut
Node = __TS__Class()
Node.name = "Node"
function Node.prototype.____constructor(self, i, x, y)
    self.i = i
    self.x = x
    self.y = y
    self.prev = nil
    self.next = nil
    self.z = 0
    self.prevZ = nil
    self.nextZ = nil
    self.steiner = false
end
____exports.earcut.deviation = function(self, data, holeIndices, dim, triangles)
    local hasHoles = holeIndices and holeIndices.length
    local outerLen = hasHoles and holeIndices[0] * dim or data.length
    local polygonArea = math.abs(signedArea(
        nil,
        data,
        0,
        outerLen,
        dim
    ))
    if hasHoles then
        do
            local i = 0
            local len = holeIndices.length
            while i < len do
                local start = holeIndices[i] * dim
                local ____end = i < len - 1 and holeIndices[i + 1] * dim or data.length
                polygonArea = polygonArea - math.abs(signedArea(
                    nil,
                    data,
                    start,
                    ____end,
                    dim
                ))
                i = i + 1
            end
        end
    end
    local trianglesArea = 0
    do
        local i = 0
        while i < triangles.length do
            local a = triangles[i] * dim
            local b = triangles[i + 1] * dim
            local c = triangles[i + 2] * dim
            trianglesArea = trianglesArea + math.abs((data[a] - data[c]) * (data[b + 1] - data[a + 1]) - (data[a] - data[b]) * (data[c + 1] - data[a + 1]))
            i = i + 3
        end
    end
    return polygonArea == 0 and trianglesArea == 0 and 0 or math.abs((trianglesArea - polygonArea) / polygonArea)
end
____exports.earcut.flatten = function(self, data)
    local dim = data[0][0].length
    local result = {vertices = {}, holes = {}, dimensions = dim}
    local holeIndex = 0
    do
        local i = 0
        while i < data.length do
            do
                local j = 0
                while j < data[i].length do
                    do
                        local d = 0
                        while d < dim do
                            local ____result_vertices_30 = result.vertices
                            ____result_vertices_30[#____result_vertices_30 + 1] = data[i][j][d]
                            d = d + 1
                        end
                    end
                    j = j + 1
                end
            end
            if i > 0 then
                holeIndex = holeIndex + data[i - 1].length
                local ____result_holes_31 = result.holes
                ____result_holes_31[#____result_holes_31 + 1] = holeIndex
            end
            i = i + 1
        end
    end
    return result
end
return ____exports
 end,
["graphics.utils.buildPoly"] = function(...) 
local ____lualib = require("lualib_bundle")
local __TS__ArraySlice = ____lualib.__TS__ArraySlice
local __TS__ArrayConcat = ____lualib.__TS__ArrayConcat
local ____exports = {}
local ____earcut = require("earcut.index")
local earcut = ____earcut.default
local function fixOrientation(self, points, hole)
    if hole == nil then
        hole = false
    end
    local m = #points
    if m < 6 then
        return
    end
    local area = 0
    do
        local i = 0
        local x1 = points[m - 2 + 1]
        local y1 = points[m]
        while i < m do
            local x2 = points[i + 1]
            local y2 = points[i + 1 + 1]
            area = area + (x2 - x1) * (y2 + y1)
            x1 = x2
            y1 = y2
            i = i + 2
        end
    end
    if not hole and area > 0 or hole and area <= 0 then
        local n = m / 2
        do
            local i = n + n % 2
            while i < m do
                local i1 = m - i - 2
                local i2 = m - i - 1
                local i3 = i
                local i4 = i + 1
                local ____temp_0 = {points[i3 + 1], points[i1 + 1]}
                points[i1 + 1] = ____temp_0[1]
                points[i3 + 1] = ____temp_0[2]
                local ____temp_1 = {points[i4 + 1], points[i2 + 1]}
                points[i2 + 1] = ____temp_1[1]
                points[i4 + 1] = ____temp_1[2]
                i = i + 2
            end
        end
    end
end
--- Builds a polygon to draw
-- 
-- Ignored from docs since it is not directly exposed.
-- 
-- @ignore
-- @private
-- @param graphicsData - The graphics object containing all the necessary properties
-- @param webGLData - an object containing all the WebGL-specific information to create this shape
-- @param webGLDataNativeLines - an object containing all the WebGL-specific information to create nativeLines
____exports.buildPoly = {
    build = function(self, graphicsData)
        graphicsData.points = __TS__ArraySlice(graphicsData.shape.points)
    end,
    triangulate = function(self, graphicsData, graphicsGeometry)
        local points = graphicsData.points
        local holes = graphicsData.holes
        local verts = graphicsGeometry.points
        local indices = graphicsGeometry.indices
        if #points >= 6 then
            fixOrientation(nil, points, false)
            local holeArray = {}
            do
                local i = 0
                while i < #holes do
                    local hole = holes[i + 1]
                    fixOrientation(nil, hole.points, true)
                    holeArray[#holeArray + 1] = #points / 2
                    points = __TS__ArrayConcat(points, hole.points)
                    i = i + 1
                end
            end
            local triangles = earcut(nil, points, holeArray, 2)
            if not triangles then
                return
            end
            local vertPos = #verts / 2
            do
                local i = 0
                while i < #triangles do
                    indices[#indices + 1] = triangles[i + 1] + vertPos
                    indices[#indices + 1] = triangles[i + 1 + 1] + vertPos
                    indices[#indices + 1] = triangles[i + 2 + 1] + vertPos
                    i = i + 3
                end
            end
            do
                local i = 0
                while i < #points do
                    verts[#verts + 1] = points[i + 1]
                    i = i + 1
                end
            end
        end
    end
}
return ____exports
 end,
["graphics.utils.buildRectangle"] = function(...) 
local ____lualib = require("lualib_bundle")
local __TS__ArraySetLength = ____lualib.__TS__ArraySetLength
local __TS__ArrayPush = ____lualib.__TS__ArrayPush
local ____exports = {}
--- Builds a rectangle to draw
-- 
-- Ignored from docs since it is not directly exposed.
-- 
-- @ignore
-- @private
-- @param graphicsData - The graphics object containing all the necessary properties
-- @param webGLData - an object containing all the WebGL-specific information to create this shape
-- @param webGLDataNativeLines - an object containing all the WebGL-specific information to create nativeLines
____exports.buildRectangle = {
    build = function(self, graphicsData)
        local rectData = graphicsData.shape
        local x = rectData.x
        local y = rectData.y
        local width = rectData.width
        local height = rectData.height
        local points = graphicsData.points
        __TS__ArraySetLength(points, 0)
        if not (width >= 0 and height >= 0) then
            return
        end
        __TS__ArrayPush(
            points,
            x,
            y,
            x + width,
            y,
            x + width,
            y + height,
            x,
            y + height
        )
    end,
    triangulate = function(self, graphicsData, graphicsGeometry)
        local points = graphicsData.points
        local verts = graphicsGeometry.points
        if #points == 0 then
            return
        end
        local vertPos = #verts / 2
        __TS__ArrayPush(
            verts,
            points[1],
            points[2],
            points[3],
            points[4],
            points[7],
            points[8],
            points[5],
            points[6]
        )
        __TS__ArrayPush(
            graphicsGeometry.indices,
            vertPos,
            vertPos + 1,
            vertPos + 2,
            vertPos + 1,
            vertPos + 2,
            vertPos + 3
        )
    end
}
return ____exports
 end,
["graphics.utils.buildRoundedRectangle"] = function(...) 
--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
local ____exports = {}
local ____buildCircle = require("graphics.utils.buildCircle")
local buildCircle = ____buildCircle.buildCircle
--- Builds a rounded rectangle to draw
-- 
-- Ignored from docs since it is not directly exposed.
-- 
-- @ignore
-- @private
-- @param graphicsData - The graphics object containing all the necessary properties
-- @param webGLData - an object containing all the WebGL-specific information to create this shape
-- @param webGLDataNativeLines - an object containing all the WebGL-specific information to create nativeLines
____exports.buildRoundedRectangle = {
    build = function(self, graphicsData)
        buildCircle:build(graphicsData)
    end,
    triangulate = function(self, graphicsData, graphicsGeometry)
        buildCircle:triangulate(graphicsData, graphicsGeometry)
    end
}
return ____exports
 end,
["graphics.utils.BatchPart"] = function(...) 
local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local ____exports = {}
--- A structure to hold interim batch objects for Graphics.
-- 
-- @memberof PIXI.graphicsUtils
____exports.BatchPart = __TS__Class()
local BatchPart = ____exports.BatchPart
BatchPart.name = "BatchPart"
function BatchPart.prototype.____constructor(self)
    self.style = nil
    self.size = 0
    self.start = 0
    self.attribStart = 0
    self.attribSize = 0
end
function BatchPart.prototype.begin(self, style, startIndex, attribStart)
    self:reset()
    self.style = style
    self.start = startIndex
    self.attribStart = attribStart
end
BatchPart.prototype["end"] = function(self, endIndex, endAttrib)
    self.attribSize = endAttrib - self.attribStart
    self.size = endIndex - self.start
end
function BatchPart.prototype.reset(self)
    self.style = nil
    self.size = 0
    self.start = 0
    self.attribStart = 0
    self.attribSize = 0
end
return ____exports
 end,
["graphics.utils.ArcUtils"] = function(...) 
local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ArrayPush = ____lualib.__TS__ArrayPush
local ____exports = {}
local ____math = require("math.index")
local TAU = ____math.TAU
local ____const = require("graphics.const")
local curves = ____const.curves
--- Utilities for arc curves.
-- 
-- @private
____exports.ArcUtils = __TS__Class()
local ArcUtils = ____exports.ArcUtils
ArcUtils.name = "ArcUtils"
function ArcUtils.prototype.____constructor(self)
end
function ArcUtils.curveTo(self, x1, y1, x2, y2, radius, points)
    local fromX = points[#points - 2 + 1]
    local fromY = points[#points]
    local a1 = fromY - y1
    local b1 = fromX - x1
    local a2 = y2 - y1
    local b2 = x2 - x1
    local mm = math.abs(a1 * b2 - b1 * a2)
    if mm < 1e-8 or radius == 0 then
        if points[#points - 2 + 1] ~= x1 or points[#points] ~= y1 then
            __TS__ArrayPush(points, x1, y1)
        end
        return nil
    end
    local dd = a1 * a1 + b1 * b1
    local cc = a2 * a2 + b2 * b2
    local tt = a1 * a2 + b1 * b2
    local k1 = radius * math.sqrt(dd) / mm
    local k2 = radius * math.sqrt(cc) / mm
    local j1 = k1 * tt / dd
    local j2 = k2 * tt / cc
    local cx = k1 * b2 + k2 * b1
    local cy = k1 * a2 + k2 * a1
    local px = b1 * (k2 + j1)
    local py = a1 * (k2 + j1)
    local qx = b2 * (k1 + j2)
    local qy = a2 * (k1 + j2)
    local startAngle = math.atan2(py - cy, px - cx)
    local endAngle = math.atan2(qy - cy, qx - cx)
    return {
        cx = cx + x1,
        cy = cy + y1,
        radius = radius,
        startAngle = startAngle,
        endAngle = endAngle,
        anticlockwise = b1 * a2 > b2 * a1
    }
end
function ArcUtils.arc(self, _startX, _startY, cx, cy, radius, startAngle, endAngle, _anticlockwise, points)
    local sweep = endAngle - startAngle
    local n = curves:_segmentsCount(
        math.abs(sweep) * radius,
        math.ceil(math.abs(sweep) / TAU) * 40
    )
    local theta = sweep / (n * 2)
    local theta2 = theta * 2
    local cTheta = math.cos(theta)
    local sTheta = math.sin(theta)
    local segMinus = n - 1
    local remainder = segMinus % 1 / segMinus
    do
        local i = 0
        while i <= segMinus do
            local real = i + remainder * i
            local angle = theta + startAngle + theta2 * real
            local c = math.cos(angle)
            local s = -math.sin(angle)
            __TS__ArrayPush(points, (cTheta * c + sTheta * s) * radius + cx, (cTheta * -s + sTheta * c) * radius + cy)
            i = i + 1
        end
    end
end
return ____exports
 end,
["graphics.utils.BezierUtils"] = function(...) 
local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ArraySetLength = ____lualib.__TS__ArraySetLength
local __TS__ArrayPush = ____lualib.__TS__ArrayPush
local ____exports = {}
local ____const = require("graphics.const")
local curves = ____const.curves
--- Utilities for bezier curves
-- 
-- @private
____exports.BezierUtils = __TS__Class()
local BezierUtils = ____exports.BezierUtils
BezierUtils.name = "BezierUtils"
function BezierUtils.prototype.____constructor(self)
end
function BezierUtils.curveLength(self, fromX, fromY, cpX, cpY, cpX2, cpY2, toX, toY)
    local n = 10
    local result = 0
    local t = 0
    local t2 = 0
    local t3 = 0
    local nt = 0
    local nt2 = 0
    local nt3 = 0
    local x = 0
    local y = 0
    local dx = 0
    local dy = 0
    local prevX = fromX
    local prevY = fromY
    do
        local i = 1
        while i <= n do
            t = i / n
            t2 = t * t
            t3 = t2 * t
            nt = 1 - t
            nt2 = nt * nt
            nt3 = nt2 * nt
            x = nt3 * fromX + 3 * nt2 * t * cpX + 3 * nt * t2 * cpX2 + t3 * toX
            y = nt3 * fromY + 3 * nt2 * t * cpY + 3 * nt * t2 * cpY2 + t3 * toY
            dx = prevX - x
            dy = prevY - y
            prevX = x
            prevY = y
            result = result + math.sqrt(dx * dx + dy * dy)
            i = i + 1
        end
    end
    return result
end
function BezierUtils.curveTo(self, cpX, cpY, cpX2, cpY2, toX, toY, points)
    local fromX = points[#points - 2 + 1]
    local fromY = points[#points]
    __TS__ArraySetLength(points, #points - 2)
    local n = curves:_segmentsCount(____exports.BezierUtils:curveLength(
        fromX,
        fromY,
        cpX,
        cpY,
        cpX2,
        cpY2,
        toX,
        toY
    ))
    local dt = 0
    local dt2 = 0
    local dt3 = 0
    local t2 = 0
    local t3 = 0
    __TS__ArrayPush(points, fromX, fromY)
    do
        local i = 1
        local j = 0
        while i <= n do
            j = i / n
            dt = 1 - j
            dt2 = dt * dt
            dt3 = dt2 * dt
            t2 = j * j
            t3 = t2 * j
            __TS__ArrayPush(points, dt3 * fromX + 3 * dt2 * j * cpX + 3 * dt * t2 * cpX2 + t3 * toX, dt3 * fromY + 3 * dt2 * j * cpY + 3 * dt * t2 * cpY2 + t3 * toY)
            i = i + 1
        end
    end
end
return ____exports
 end,
["graphics.utils.buildLine"] = function(...) 
local ____lualib = require("lualib_bundle")
local __TS__ArrayPush = ____lualib.__TS__ArrayPush
local __TS__ArraySlice = ____lualib.__TS__ArraySlice
local __TS__New = ____lualib.__TS__New
local __TS__ArrayUnshift = ____lualib.__TS__ArrayUnshift
local ____exports = {}
local ____core = require("core.index")
local Point = ____core.Point
local SHAPES = ____core.SHAPES
local ____const = require("graphics.const")
local curves = ____const.curves
local LINE_CAP = ____const.LINE_CAP
local LINE_JOIN = ____const.LINE_JOIN
--- Buffers vertices to draw a square cap.
-- 
-- Ignored from docs since it is not directly exposed.
-- 
-- @ignore
-- @private
-- @param x - X-coord of end point
-- @param y - Y-coord of end point
-- @param nx - X-coord of line normal pointing inside
-- @param ny - Y-coord of line normal pointing inside
-- @param innerWeight - Weight of inner points
-- @param outerWeight - Weight of outer points
-- @param clockwise - Whether the cap is drawn clockwise
-- @param verts - vertex buffer
-- @returns - no. of vertices pushed
local function square(self, x, y, nx, ny, innerWeight, outerWeight, clockwise, verts)
    local ix = x - nx * innerWeight
    local iy = y - ny * innerWeight
    local ox = x + nx * outerWeight
    local oy = y + ny * outerWeight
    local exx
    local eyy
    if clockwise then
        exx = ny
        eyy = -nx
    else
        exx = -ny
        eyy = nx
    end
    local eix = ix + exx
    local eiy = iy + eyy
    local eox = ox + exx
    local eoy = oy + eyy
    __TS__ArrayPush(verts, eix, eiy)
    __TS__ArrayPush(verts, eox, eoy)
    return 2
end
--- Buffers vertices to draw an arc at the line joint or cap.
-- 
-- Ignored from docs since it is not directly exposed.
-- 
-- @ignore
-- @private
-- @param cx - X-coord of center
-- @param cy - Y-coord of center
-- @param sx - X-coord of arc start
-- @param sy - Y-coord of arc start
-- @param ex - X-coord of arc end
-- @param ey - Y-coord of arc end
-- @param verts - buffer of vertices
-- @param clockwise - orientation of vertices
-- @returns - no. of vertices pushed
local function round(self, cx, cy, sx, sy, ex, ey, verts, clockwise)
    local cx2p0x = sx - cx
    local cy2p0y = sy - cy
    local angle0 = math.atan2(cx2p0x, cy2p0y)
    local angle1 = math.atan2(ex - cx, ey - cy)
    if clockwise and angle0 < angle1 then
        angle0 = angle0 + math.pi * 2
    elseif not clockwise and angle0 > angle1 then
        angle1 = angle1 + math.pi * 2
    end
    local startAngle = angle0
    local angleDiff = angle1 - angle0
    local absAngleDiff = math.abs(angleDiff)
    local radius = math.sqrt(cx2p0x * cx2p0x + cy2p0y * cy2p0y)
    local segCount = bit.arshift(
        15 * absAngleDiff * math.sqrt(radius) / math.pi,
        0
    ) + 1
    local angleInc = angleDiff / segCount
    startAngle = startAngle + angleInc
    if clockwise then
        __TS__ArrayPush(verts, cx, cy)
        __TS__ArrayPush(verts, sx, sy)
        do
            local i = 1
            local angle = startAngle
            while i < segCount do
                __TS__ArrayPush(verts, cx, cy)
                __TS__ArrayPush(
                    verts,
                    cx + math.sin(angle) * radius,
                    cy + math.cos(angle) * radius
                )
                do
                    i = i + 1
                    angle = angle + angleInc
                end
            end
        end
        __TS__ArrayPush(verts, cx, cy)
        __TS__ArrayPush(verts, ex, ey)
    else
        __TS__ArrayPush(verts, sx, sy)
        __TS__ArrayPush(verts, cx, cy)
        do
            local i = 1
            local angle = startAngle
            while i < segCount do
                __TS__ArrayPush(
                    verts,
                    cx + math.sin(angle) * radius,
                    cy + math.cos(angle) * radius
                )
                __TS__ArrayPush(verts, cx, cy)
                do
                    i = i + 1
                    angle = angle + angleInc
                end
            end
        end
        __TS__ArrayPush(verts, ex, ey)
        __TS__ArrayPush(verts, cx, cy)
    end
    return segCount * 2
end
--- Builds a line to draw using the polygon method.
-- 
-- Ignored from docs since it is not directly exposed.
-- 
-- @ignore
-- @private
-- @param graphicsData - The graphics object containing all the necessary properties
-- @param graphicsGeometry - Geometry where to append output
local function buildNonNativeLine(self, graphicsData, graphicsGeometry)
    local shape = graphicsData.shape
    local points = graphicsData.points or __TS__ArraySlice(shape.points)
    local eps = graphicsGeometry.closePointEps
    if #points == 0 then
        return
    end
    local style = graphicsData.lineStyle
    if not style then
        return
    end
    local firstPoint = __TS__New(Point, points[1], points[2])
    local lastPoint = __TS__New(Point, points[#points - 2 + 1], points[#points])
    local closedShape = shape.type ~= SHAPES.POLY or shape.closeStroke
    local closedPath = math.abs(firstPoint.x - lastPoint.x) < eps and math.abs(firstPoint.y - lastPoint.y) < eps
    if closedShape then
        points = __TS__ArraySlice(points)
        if closedPath then
            table.remove(points)
            table.remove(points)
            lastPoint:set(points[#points - 2 + 1], points[#points])
        end
        local midPointX = (firstPoint.x + lastPoint.x) * 0.5
        local midPointY = (lastPoint.y + firstPoint.y) * 0.5
        __TS__ArrayUnshift(points, midPointX, midPointY)
        __TS__ArrayPush(points, midPointX, midPointY)
    end
    local verts = graphicsGeometry.points
    local length = #points / 2
    local indexCount = #points
    local indexStart = #verts / 2
    local width = style.width / 2
    local widthSquared = width * width
    local miterLimitSquared = style.miterLimit * style.miterLimit
    local x0 = points[1]
    local y0 = points[2]
    local x1 = points[3]
    local y1 = points[4]
    local x2 = 0
    local y2 = 0
    local perpx = -(y0 - y1)
    local perpy = x0 - x1
    local perp1x = 0
    local perp1y = 0
    local dist = math.sqrt(perpx * perpx + perpy * perpy)
    perpx = perpx / dist
    perpy = perpy / dist
    perpx = perpx * width
    perpy = perpy * width
    local ratio = style.alignment
    local innerWeight = (1 - ratio) * 2
    local outerWeight = ratio * 2
    if not closedShape then
        if style.cap == LINE_CAP.ROUND then
            indexCount = indexCount + (round(
                nil,
                x0 - perpx * (innerWeight - outerWeight) * 0.5,
                y0 - perpy * (innerWeight - outerWeight) * 0.5,
                x0 - perpx * innerWeight,
                y0 - perpy * innerWeight,
                x0 + perpx * outerWeight,
                y0 + perpy * outerWeight,
                verts,
                true
            ) + 2)
        elseif style.cap == LINE_CAP.SQUARE then
            indexCount = indexCount + square(
                nil,
                x0,
                y0,
                perpx,
                perpy,
                innerWeight,
                outerWeight,
                true,
                verts
            )
        end
    end
    __TS__ArrayPush(verts, x0 - perpx * innerWeight, y0 - perpy * innerWeight)
    __TS__ArrayPush(verts, x0 + perpx * outerWeight, y0 + perpy * outerWeight)
    do
        local i = 1
        while i < length - 1 do
            do
                x0 = points[(i - 1) * 2 + 1]
                y0 = points[(i - 1) * 2 + 1 + 1]
                x1 = points[i * 2 + 1]
                y1 = points[i * 2 + 1 + 1]
                x2 = points[(i + 1) * 2 + 1]
                y2 = points[(i + 1) * 2 + 1 + 1]
                perpx = -(y0 - y1)
                perpy = x0 - x1
                dist = math.sqrt(perpx * perpx + perpy * perpy)
                perpx = perpx / dist
                perpy = perpy / dist
                perpx = perpx * width
                perpy = perpy * width
                perp1x = -(y1 - y2)
                perp1y = x1 - x2
                dist = math.sqrt(perp1x * perp1x + perp1y * perp1y)
                perp1x = perp1x / dist
                perp1y = perp1y / dist
                perp1x = perp1x * width
                perp1y = perp1y * width
                local dx0 = x1 - x0
                local dy0 = y0 - y1
                local dx1 = x1 - x2
                local dy1 = y2 - y1
                local dot = dx0 * dx1 + dy0 * dy1
                local cross = dy0 * dx1 - dy1 * dx0
                local clockwise = cross < 0
                if math.abs(cross) < 0.001 * math.abs(dot) then
                    __TS__ArrayPush(verts, x1 - perpx * innerWeight, y1 - perpy * innerWeight)
                    __TS__ArrayPush(verts, x1 + perpx * outerWeight, y1 + perpy * outerWeight)
                    if dot >= 0 then
                        if style.join == LINE_JOIN.ROUND then
                            indexCount = indexCount + (round(
                                nil,
                                x1,
                                y1,
                                x1 - perpx * innerWeight,
                                y1 - perpy * innerWeight,
                                x1 - perp1x * innerWeight,
                                y1 - perp1y * innerWeight,
                                verts,
                                false
                            ) + 4)
                        else
                            indexCount = indexCount + 2
                        end
                        __TS__ArrayPush(verts, x1 - perp1x * outerWeight, y1 - perp1y * outerWeight)
                        __TS__ArrayPush(verts, x1 + perp1x * innerWeight, y1 + perp1y * innerWeight)
                    end
                    goto __continue20
                end
                local c1 = (-perpx + x0) * (-perpy + y1) - (-perpx + x1) * (-perpy + y0)
                local c2 = (-perp1x + x2) * (-perp1y + y1) - (-perp1x + x1) * (-perp1y + y2)
                local px = (dx0 * c2 - dx1 * c1) / cross
                local py = (dy1 * c1 - dy0 * c2) / cross
                local pdist = (px - x1) * (px - x1) + (py - y1) * (py - y1)
                local imx = x1 + (px - x1) * innerWeight
                local imy = y1 + (py - y1) * innerWeight
                local omx = x1 - (px - x1) * outerWeight
                local omy = y1 - (py - y1) * outerWeight
                local smallerInsideSegmentSq = math.min(dx0 * dx0 + dy0 * dy0, dx1 * dx1 + dy1 * dy1)
                local insideWeight = clockwise and innerWeight or outerWeight
                local smallerInsideDiagonalSq = smallerInsideSegmentSq + insideWeight * insideWeight * widthSquared
                local insideMiterOk = pdist <= smallerInsideDiagonalSq
                if insideMiterOk then
                    if style.join == LINE_JOIN.BEVEL or pdist / widthSquared > miterLimitSquared then
                        if clockwise then
                            __TS__ArrayPush(verts, imx, imy)
                            __TS__ArrayPush(verts, x1 + perpx * outerWeight, y1 + perpy * outerWeight)
                            __TS__ArrayPush(verts, imx, imy)
                            __TS__ArrayPush(verts, x1 + perp1x * outerWeight, y1 + perp1y * outerWeight)
                        else
                            __TS__ArrayPush(verts, x1 - perpx * innerWeight, y1 - perpy * innerWeight)
                            __TS__ArrayPush(verts, omx, omy)
                            __TS__ArrayPush(verts, x1 - perp1x * innerWeight, y1 - perp1y * innerWeight)
                            __TS__ArrayPush(verts, omx, omy)
                        end
                        indexCount = indexCount + 2
                    elseif style.join == LINE_JOIN.ROUND then
                        if clockwise then
                            __TS__ArrayPush(verts, imx, imy)
                            __TS__ArrayPush(verts, x1 + perpx * outerWeight, y1 + perpy * outerWeight)
                            indexCount = indexCount + (round(
                                nil,
                                x1,
                                y1,
                                x1 + perpx * outerWeight,
                                y1 + perpy * outerWeight,
                                x1 + perp1x * outerWeight,
                                y1 + perp1y * outerWeight,
                                verts,
                                true
                            ) + 4)
                            __TS__ArrayPush(verts, imx, imy)
                            __TS__ArrayPush(verts, x1 + perp1x * outerWeight, y1 + perp1y * outerWeight)
                        else
                            __TS__ArrayPush(verts, x1 - perpx * innerWeight, y1 - perpy * innerWeight)
                            __TS__ArrayPush(verts, omx, omy)
                            indexCount = indexCount + (round(
                                nil,
                                x1,
                                y1,
                                x1 - perpx * innerWeight,
                                y1 - perpy * innerWeight,
                                x1 - perp1x * innerWeight,
                                y1 - perp1y * innerWeight,
                                verts,
                                false
                            ) + 4)
                            __TS__ArrayPush(verts, x1 - perp1x * innerWeight, y1 - perp1y * innerWeight)
                            __TS__ArrayPush(verts, omx, omy)
                        end
                    else
                        __TS__ArrayPush(verts, imx, imy)
                        __TS__ArrayPush(verts, omx, omy)
                    end
                else
                    __TS__ArrayPush(verts, x1 - perpx * innerWeight, y1 - perpy * innerWeight)
                    __TS__ArrayPush(verts, x1 + perpx * outerWeight, y1 + perpy * outerWeight)
                    if style.join == LINE_JOIN.ROUND then
                        if clockwise then
                            indexCount = indexCount + (round(
                                nil,
                                x1,
                                y1,
                                x1 + perpx * outerWeight,
                                y1 + perpy * outerWeight,
                                x1 + perp1x * outerWeight,
                                y1 + perp1y * outerWeight,
                                verts,
                                true
                            ) + 2)
                        else
                            indexCount = indexCount + (round(
                                nil,
                                x1,
                                y1,
                                x1 - perpx * innerWeight,
                                y1 - perpy * innerWeight,
                                x1 - perp1x * innerWeight,
                                y1 - perp1y * innerWeight,
                                verts,
                                false
                            ) + 2)
                        end
                    elseif style.join == LINE_JOIN.MITER and pdist / widthSquared <= miterLimitSquared then
                        if clockwise then
                            __TS__ArrayPush(verts, omx, omy)
                            __TS__ArrayPush(verts, omx, omy)
                        else
                            __TS__ArrayPush(verts, imx, imy)
                            __TS__ArrayPush(verts, imx, imy)
                        end
                        indexCount = indexCount + 2
                    end
                    __TS__ArrayPush(verts, x1 - perp1x * innerWeight, y1 - perp1y * innerWeight)
                    __TS__ArrayPush(verts, x1 + perp1x * outerWeight, y1 + perp1y * outerWeight)
                    indexCount = indexCount + 2
                end
            end
            ::__continue20::
            i = i + 1
        end
    end
    x0 = points[(length - 2) * 2 + 1]
    y0 = points[(length - 2) * 2 + 1 + 1]
    x1 = points[(length - 1) * 2 + 1]
    y1 = points[(length - 1) * 2 + 1 + 1]
    perpx = -(y0 - y1)
    perpy = x0 - x1
    dist = math.sqrt(perpx * perpx + perpy * perpy)
    perpx = perpx / dist
    perpy = perpy / dist
    perpx = perpx * width
    perpy = perpy * width
    __TS__ArrayPush(verts, x1 - perpx * innerWeight, y1 - perpy * innerWeight)
    __TS__ArrayPush(verts, x1 + perpx * outerWeight, y1 + perpy * outerWeight)
    if not closedShape then
        if style.cap == LINE_CAP.ROUND then
            indexCount = indexCount + (round(
                nil,
                x1 - perpx * (innerWeight - outerWeight) * 0.5,
                y1 - perpy * (innerWeight - outerWeight) * 0.5,
                x1 - perpx * innerWeight,
                y1 - perpy * innerWeight,
                x1 + perpx * outerWeight,
                y1 + perpy * outerWeight,
                verts,
                false
            ) + 2)
        elseif style.cap == LINE_CAP.SQUARE then
            indexCount = indexCount + square(
                nil,
                x1,
                y1,
                perpx,
                perpy,
                innerWeight,
                outerWeight,
                false,
                verts
            )
        end
    end
    local indices = graphicsGeometry.indices
    local eps2 = curves.epsilon * curves.epsilon
    do
        local i = indexStart
        while i < indexCount + indexStart - 2 do
            do
                x0 = verts[i * 2 + 1]
                y0 = verts[i * 2 + 1 + 1]
                x1 = verts[(i + 1) * 2 + 1]
                y1 = verts[(i + 1) * 2 + 1 + 1]
                x2 = verts[(i + 2) * 2 + 1]
                y2 = verts[(i + 2) * 2 + 1 + 1]
                if math.abs(x0 * (y1 - y2) + x1 * (y2 - y0) + x2 * (y0 - y1)) < eps2 then
                    goto __continue43
                end
                __TS__ArrayPush(indices, i, i + 1, i + 2)
            end
            ::__continue43::
            i = i + 1
        end
    end
end
--- Builds a line to draw using the gl.drawArrays(gl.LINES) method
-- 
-- Ignored from docs since it is not directly exposed.
-- 
-- @ignore
-- @private
-- @param graphicsData - The graphics object containing all the necessary properties
-- @param graphicsGeometry - Geometry where to append output
local function buildNativeLine(self, graphicsData, graphicsGeometry)
    local i = 0
    local shape = graphicsData.shape
    local points = graphicsData.points or shape.points
    local closedShape = shape.type ~= SHAPES.POLY or shape.closeStroke
    if #points == 0 then
        return
    end
    local verts = graphicsGeometry.points
    local indices = graphicsGeometry.indices
    local length = #points / 2
    local startIndex = #verts / 2
    local currentIndex = startIndex
    __TS__ArrayPush(verts, points[1], points[2])
    do
        i = 1
        while i < length do
            __TS__ArrayPush(verts, points[i * 2 + 1], points[i * 2 + 1 + 1])
            __TS__ArrayPush(indices, currentIndex, currentIndex + 1)
            currentIndex = currentIndex + 1
            i = i + 1
        end
    end
    if closedShape then
        __TS__ArrayPush(indices, currentIndex, startIndex)
    end
end
--- Builds a line to draw
-- 
-- Ignored from docs since it is not directly exposed.
-- 
-- @ignore
-- @private
-- @param graphicsData - The graphics object containing all the necessary properties
-- @param graphicsGeometry - Geometry where to append output
function ____exports.buildLine(self, graphicsData, graphicsGeometry)
    local ____opt_0 = graphicsData.lineStyle
    if ____opt_0 and ____opt_0.native then
        buildNativeLine(nil, graphicsData, graphicsGeometry)
    else
        buildNonNativeLine(nil, graphicsData, graphicsGeometry)
    end
end
return ____exports
 end,
["graphics.utils.QuadraticUtils"] = function(...) 
local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ArrayPush = ____lualib.__TS__ArrayPush
local ____exports = {}
local ____const = require("graphics.const")
local curves = ____const.curves
--- Utilities for quadratic curves.
-- 
-- @private
____exports.QuadraticUtils = __TS__Class()
local QuadraticUtils = ____exports.QuadraticUtils
QuadraticUtils.name = "QuadraticUtils"
function QuadraticUtils.prototype.____constructor(self)
end
function QuadraticUtils.curveLength(self, fromX, fromY, cpX, cpY, toX, toY)
    local ax = fromX - 2 * cpX + toX
    local ay = fromY - 2 * cpY + toY
    local bx = 2 * cpX - 2 * fromX
    local by = 2 * cpY - 2 * fromY
    local a = 4 * (ax * ax + ay * ay)
    local b = 4 * (ax * bx + ay * by)
    local c = bx * bx + by * by
    local s = 2 * math.sqrt(a + b + c)
    local a2 = math.sqrt(a)
    local a32 = 2 * a * a2
    local c2 = 2 * math.sqrt(c)
    local ba = b / a2
    return (a32 * s + a2 * b * (s - c2) + (4 * c * a - b * b) * math.log((2 * a2 + ba + s) / (ba + c2))) / (4 * a32)
end
function QuadraticUtils.curveTo(self, cpX, cpY, toX, toY, points)
    local fromX = points[#points - 2 + 1]
    local fromY = points[#points]
    local n = curves:_segmentsCount(____exports.QuadraticUtils:curveLength(
        fromX,
        fromY,
        cpX,
        cpY,
        toX,
        toY
    ))
    local xa = 0
    local ya = 0
    do
        local i = 1
        while i <= n do
            local j = i / n
            xa = fromX + (cpX - fromX) * j
            ya = fromY + (cpY - fromY) * j
            __TS__ArrayPush(points, xa + (cpX + (toX - cpX) * j - xa) * j, ya + (cpY + (toY - cpY) * j - ya) * j)
            i = i + 1
        end
    end
end
return ____exports
 end,
["graphics.utils.index"] = function(...) 
--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
local ____exports = {}
local ____core = require("core.index")
local SHAPES = ____core.SHAPES
local ____buildCircle = require("graphics.utils.buildCircle")
local buildCircle = ____buildCircle.buildCircle
local ____buildPoly = require("graphics.utils.buildPoly")
local buildPoly = ____buildPoly.buildPoly
local ____buildRectangle = require("graphics.utils.buildRectangle")
local buildRectangle = ____buildRectangle.buildRectangle
local ____buildRoundedRectangle = require("graphics.utils.buildRoundedRectangle")
local buildRoundedRectangle = ____buildRoundedRectangle.buildRoundedRectangle
do
    local ____export = require("graphics.utils.ArcUtils")
    for ____exportKey, ____exportValue in pairs(____export) do
        if ____exportKey ~= "default" then
            ____exports[____exportKey] = ____exportValue
        end
    end
end
do
    local ____export = require("graphics.utils.BatchPart")
    for ____exportKey, ____exportValue in pairs(____export) do
        if ____exportKey ~= "default" then
            ____exports[____exportKey] = ____exportValue
        end
    end
end
do
    local ____export = require("graphics.utils.BezierUtils")
    for ____exportKey, ____exportValue in pairs(____export) do
        if ____exportKey ~= "default" then
            ____exports[____exportKey] = ____exportValue
        end
    end
end
do
    local ____export = require("graphics.utils.buildCircle")
    for ____exportKey, ____exportValue in pairs(____export) do
        if ____exportKey ~= "default" then
            ____exports[____exportKey] = ____exportValue
        end
    end
end
do
    local ____export = require("graphics.utils.buildLine")
    for ____exportKey, ____exportValue in pairs(____export) do
        if ____exportKey ~= "default" then
            ____exports[____exportKey] = ____exportValue
        end
    end
end
do
    local ____export = require("graphics.utils.buildPoly")
    for ____exportKey, ____exportValue in pairs(____export) do
        if ____exportKey ~= "default" then
            ____exports[____exportKey] = ____exportValue
        end
    end
end
do
    local ____export = require("graphics.utils.buildRectangle")
    for ____exportKey, ____exportValue in pairs(____export) do
        if ____exportKey ~= "default" then
            ____exports[____exportKey] = ____exportValue
        end
    end
end
do
    local ____export = require("graphics.utils.buildRoundedRectangle")
    for ____exportKey, ____exportValue in pairs(____export) do
        if ____exportKey ~= "default" then
            ____exports[____exportKey] = ____exportValue
        end
    end
end
do
    local ____export = require("graphics.utils.QuadraticUtils")
    for ____exportKey, ____exportValue in pairs(____export) do
        if ____exportKey ~= "default" then
            ____exports[____exportKey] = ____exportValue
        end
    end
end
--- Map of fill commands for each shape type.
-- 
-- @memberof PIXI.graphicsUtils
-- @member {object} FILL_COMMANDS
____exports.FILL_COMMANDS = {
    [SHAPES.POLY] = buildPoly,
    [SHAPES.CIRC] = buildCircle,
    [SHAPES.ELIP] = buildCircle,
    [SHAPES.RECT] = buildRectangle,
    [SHAPES.RREC] = buildRoundedRectangle
}
--- Batch pool, stores unused batches for preventing allocations.
-- 
-- @memberof PIXI.graphicsUtils
-- @member {Array<PIXI.graphicsUtils.BatchPart>} BATCH_POOL
____exports.BATCH_POOL = {}
--- Draw call pool, stores unused draw calls for preventing allocations.
-- 
-- @memberof PIXI.graphicsUtils
-- @member {Array<PIXI.BatchDrawCall>} DRAW_CALL_POOL
____exports.DRAW_CALL_POOL = {}
return ____exports
 end,
["graphics.utils.PolygonUtils"] = function(...) 
local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ArrayPushArray = ____lualib.__TS__ArrayPushArray
local ____exports = {}
--- Utilities for polygon
-- 
-- @class
-- @private
____exports.PolygonUtils = __TS__Class()
local PolygonUtils = ____exports.PolygonUtils
PolygonUtils.name = "PolygonUtils"
function PolygonUtils.prototype.____constructor(self)
end
function PolygonUtils.offsetPolygon(self, points, offset)
    local offsetPoints = {}
    local length = #points
    offset = ____exports.PolygonUtils:isPolygonClockwise(points) and offset or -1 * offset
    do
        local j = 0
        while j < length do
            local i = j - 2
            if i < 0 then
                i = i + length
            end
            local k = (j + 2) % length
            local v1x = points[j + 1] - points[i + 1]
            local v1y = points[j + 1 + 1] - points[i + 1 + 1]
            local len = math.sqrt(v1x * v1x + v1y * v1y)
            v1x = v1x / len
            v1y = v1y / len
            v1x = v1x * offset
            v1y = v1y * offset
            local norm1x = -v1y
            local norm1y = v1x
            local pij1 = {points[i + 1] + norm1x, points[i + 1 + 1] + norm1y}
            local pij2 = {points[j + 1] + norm1x, points[j + 1 + 1] + norm1y}
            local v2x = points[k + 1] - points[j + 1]
            local v2y = points[k + 1 + 1] - points[j + 1 + 1]
            len = math.sqrt(v2x * v2x + v2y * v2y)
            v2x = v2x / len
            v2y = v2y / len
            v2x = v2x * offset
            v2y = v2y * offset
            local norm2x = -v2y
            local norm2y = v2x
            local pjk1 = {points[j + 1] + norm2x, points[j + 1 + 1] + norm2y}
            local pjk2 = {points[k + 1] + norm2x, points[k + 1 + 1] + norm2y}
            local intersectPoint = ____exports.PolygonUtils:findIntersection(
                pij1[1],
                pij1[2],
                pij2[1],
                pij2[2],
                pjk1[1],
                pjk1[2],
                pjk2[1],
                pjk2[2]
            )
            if intersectPoint then
                __TS__ArrayPushArray(offsetPoints, intersectPoint)
            end
            j = j + 2
        end
    end
    return offsetPoints
end
function PolygonUtils.findIntersection(self, x1, y1, x2, y2, x3, y3, x4, y4)
    local denominator = (y4 - y3) * (x2 - x1) - (x4 - x3) * (y2 - y1)
    local numeratorA = (x4 - x3) * (y1 - y3) - (y4 - y3) * (x1 - x3)
    local numeratorB = (x2 - x1) * (y1 - y3) - (y2 - y1) * (x1 - x3)
    if denominator == 0 then
        if numeratorA == 0 and numeratorB == 0 then
            return {(x1 + x2) / 2, (y1 + y2) / 2}
        end
        return nil
    end
    local uA = numeratorA / denominator
    return {x1 + uA * (x2 - x1), y1 + uA * (y2 - y1)}
end
function PolygonUtils.isPolygonClockwise(self, polygon)
    local sum = 0
    do
        local i = 0
        local j = #polygon - 2
        while i < #polygon do
            sum = sum + (polygon[i + 1] - polygon[j + 1]) * (polygon[i + 1 + 1] + polygon[j + 1 + 1])
            do
                j = i
                i = i + 2
            end
        end
    end
    return sum > 0
end
return ____exports
 end,
["graphics.GraphicsRenderer"] = function(...) 
local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__New = ____lualib.__TS__New
local __TS__NumberToString = ____lualib.__TS__NumberToString
local ____exports = {}
local systems = require("core.systems")
local ____core = require("core.index")
local Color = ____core.Color
local Matrix = ____core.Matrix
local SHAPES = ____core.SHAPES
local ____PolygonUtils = require("graphics.utils.PolygonUtils")
local PolygonUtils = ____PolygonUtils.PolygonUtils
--- Renderer dedicated to drawing and batching graphics objects.
-- 
-- @class
-- @protected
-- @memberof PIXI
____exports.CanvasGraphicsRenderer = __TS__Class()
local CanvasGraphicsRenderer = ____exports.CanvasGraphicsRenderer
CanvasGraphicsRenderer.name = "CanvasGraphicsRenderer"
function CanvasGraphicsRenderer.prototype.____constructor(self, renderer)
    self._tempMatrix = __TS__New(Matrix)
    self.renderer = renderer
end
function CanvasGraphicsRenderer.prototype._calcCanvasStyle(self, style, tint)
    local res
    res = "#" .. string.sub(
        "00000" .. __TS__NumberToString(
            bit.bor(tint, 0),
            16
        ),
        -6
    )
    return res
end
function CanvasGraphicsRenderer.prototype.render(self, graphics)
    local renderer = self.renderer
    local context = renderer.canvasContext.activeContext
    local worldAlpha = graphics.worldAlpha
    local transform = graphics.transform.worldTransform
    renderer.canvasContext:setContextTransform(transform)
    local graphicsData = graphics.geometry.graphicsData
    local contextFillStyle
    local contextStrokeStyle
    local tint = Color.shared:setValue(graphics.tint):toArray()
    do
        local i = 0
        while i < #graphicsData do
            local data = graphicsData[i + 1]
            local shape = data.shape
            local fillStyle = data.fillStyle
            local lineStyle = data.lineStyle
            if data.matrix then
                renderer.canvasContext:setContextTransform(transform:copyTo(self._tempMatrix):append(data.matrix))
            end
            if fillStyle and fillStyle.visible then
                contextFillStyle = self:_calcCanvasStyle(
                    fillStyle,
                    Color.shared:setValue(fillStyle.color):multiply(tint):toNumber()
                )
            end
            if lineStyle and lineStyle.visible then
                contextStrokeStyle = self:_calcCanvasStyle(
                    lineStyle,
                    Color.shared:setValue(lineStyle.color):multiply(tint):toNumber()
                )
            end
            if lineStyle ~= nil then
                context.lineWidth = lineStyle.width
                context.lineCap = lineStyle.cap
                context.lineJoin = lineStyle.join
                context.miterLimit = lineStyle.miterLimit
            end
            if data.type == SHAPES.POLY then
                context:beginPath()
                local tempShape = shape
                local points = tempShape.points
                local holes = data.holes
                local outerArea
                local innerArea
                local px
                local py
                local holesDirection = {}
                context:moveTo(points[1], points[2])
                do
                    local j = 2
                    while j < #points do
                        context:lineTo(points[j + 1], points[j + 1 + 1])
                        j = j + 2
                    end
                end
                if tempShape.closeStroke then
                    context:closePath()
                end
                if #holes > 0 then
                    holesDirection = {}
                    outerArea = 0
                    px = points[1]
                    py = points[2]
                    do
                        local j = 2
                        while j + 2 < #points do
                            outerArea = outerArea + ((points[j + 1] - px) * (points[j + 3 + 1] - py) - (points[j + 2 + 1] - px) * (points[j + 1 + 1] - py))
                            j = j + 2
                        end
                    end
                    do
                        local k = 0
                        while k < #holes do
                            do
                                points = holes[k + 1].shape.points
                                if not points then
                                    goto __continue15
                                end
                                innerArea = 0
                                px = points[1]
                                py = points[2]
                                do
                                    local j = 2
                                    while j + 2 < #points do
                                        innerArea = innerArea + ((points[j + 1] - px) * (points[j + 3 + 1] - py) - (points[j + 2 + 1] - px) * (points[j + 1 + 1] - py))
                                        j = j + 2
                                    end
                                end
                                if innerArea * outerArea < 0 then
                                    context:moveTo(points[1], points[2])
                                    do
                                        local j = 2
                                        while j < #points do
                                            context:lineTo(points[j + 1], points[j + 1 + 1])
                                            j = j + 2
                                        end
                                    end
                                else
                                    context:moveTo(points[#points - 2 + 1], points[#points])
                                    do
                                        local j = #points - 4
                                        while j >= 0 do
                                            context:lineTo(points[j + 1], points[j + 1 + 1])
                                            j = j - 2
                                        end
                                    end
                                end
                                if holes[k + 1].shape.closeStroke then
                                    context:closePath()
                                end
                                holesDirection[k + 1] = innerArea * outerArea < 0
                            end
                            ::__continue15::
                            k = k + 1
                        end
                    end
                end
                if fillStyle and fillStyle.visible then
                    context.globalAlpha = fillStyle.alpha * worldAlpha
                    context.fillStyle = contextFillStyle
                    context:fill()
                end
                if lineStyle and lineStyle.visible then
                    self:paintPolygonStroke(
                        tempShape,
                        lineStyle,
                        contextStrokeStyle,
                        holes,
                        holesDirection,
                        worldAlpha,
                        context
                    )
                end
            elseif data.type == SHAPES.RECT then
                local tempShape = shape
                if fillStyle and fillStyle.visible then
                    context.globalAlpha = fillStyle.alpha * worldAlpha
                    context.fillStyle = contextFillStyle
                    context:fillRect(tempShape.x, tempShape.y, tempShape.width, tempShape.height)
                end
                if lineStyle and lineStyle.visible then
                    local alignmentOffset = lineStyle.width * (0.5 - (1 - lineStyle.alignment))
                    local width = tempShape.width + 2 * alignmentOffset
                    local height = tempShape.height + 2 * alignmentOffset
                    context.globalAlpha = lineStyle.alpha * worldAlpha
                    context.strokeStyle = contextStrokeStyle
                    context:strokeRect(tempShape.x - alignmentOffset, tempShape.y - alignmentOffset, width, height)
                end
            elseif data.type == SHAPES.CIRC then
                local tempShape = shape
                context:beginPath()
                context:arc(
                    tempShape.x,
                    tempShape.y,
                    tempShape.radius,
                    0,
                    2 * math.pi
                )
                context:closePath()
                if fillStyle and fillStyle.visible then
                    context.globalAlpha = fillStyle.alpha * worldAlpha
                    context.fillStyle = contextFillStyle
                    context:fill()
                end
                if lineStyle and lineStyle.visible then
                    if lineStyle.alignment ~= 0.5 then
                        local alignmentOffset = lineStyle.width * (0.5 - (1 - lineStyle.alignment))
                        context:beginPath()
                        context:arc(
                            tempShape.x,
                            tempShape.y,
                            tempShape.radius + alignmentOffset,
                            0,
                            2 * math.pi
                        )
                        context:closePath()
                    end
                    context.globalAlpha = lineStyle.alpha * worldAlpha
                    context.strokeStyle = contextStrokeStyle
                    context:stroke()
                end
            elseif data.type == SHAPES.ELIP then
                local tempShape = shape
                local drawShapeOverStroke = (lineStyle and lineStyle.alignment) == 1
                if not drawShapeOverStroke then
                    self:paintEllipse(
                        tempShape,
                        fillStyle,
                        lineStyle,
                        contextFillStyle,
                        worldAlpha,
                        context
                    )
                end
                if lineStyle and lineStyle.visible then
                    if lineStyle.alignment ~= 0.5 then
                        local kappa = 0.5522848
                        local alignmentOffset = lineStyle.width * (0.5 - (1 - lineStyle.alignment))
                        local sW = (tempShape.width + alignmentOffset) * 2
                        local sH = (tempShape.height + alignmentOffset) * 2
                        local sX = tempShape.x - sW / 2
                        local sY = tempShape.y - sH / 2
                        local sOx = sW / 2 * kappa
                        local sOy = sH / 2 * kappa
                        local sXe = sX + sW
                        local sYe = sY + sH
                        local sXm = sX + sW / 2
                        local sYm = sY + sH / 2
                        context:beginPath()
                        context:moveTo(sX, sYm)
                        context:bezierCurveTo(
                            sX,
                            sYm - sOy,
                            sXm - sOx,
                            sY,
                            sXm,
                            sY
                        )
                        context:bezierCurveTo(
                            sXm + sOx,
                            sY,
                            sXe,
                            sYm - sOy,
                            sXe,
                            sYm
                        )
                        context:bezierCurveTo(
                            sXe,
                            sYm + sOy,
                            sXm + sOx,
                            sYe,
                            sXm,
                            sYe
                        )
                        context:bezierCurveTo(
                            sXm - sOx,
                            sYe,
                            sX,
                            sYm + sOy,
                            sX,
                            sYm
                        )
                        context:closePath()
                    end
                    context.globalAlpha = lineStyle.alpha * worldAlpha
                    context.strokeStyle = contextStrokeStyle
                    context:stroke()
                end
                if drawShapeOverStroke then
                    self:paintEllipse(
                        tempShape,
                        fillStyle,
                        lineStyle,
                        contextFillStyle,
                        worldAlpha,
                        context
                    )
                end
            elseif data.type == SHAPES.RREC then
                local tempShape = shape
                local drawShapeOverStroke = (lineStyle and lineStyle.alignment) == 1
                if not drawShapeOverStroke then
                    self:paintRoundedRectangle(
                        tempShape,
                        fillStyle,
                        lineStyle,
                        contextFillStyle,
                        worldAlpha,
                        context
                    )
                end
                if lineStyle and lineStyle.visible then
                    if lineStyle.alignment ~= 0.5 then
                        local width = tempShape.width
                        local height = tempShape.height
                        local alignmentOffset = lineStyle.width * (0.5 - (1 - lineStyle.alignment))
                        local sRx = tempShape.x - alignmentOffset
                        local sRy = tempShape.y - alignmentOffset
                        local sWidth = tempShape.width + 2 * alignmentOffset
                        local sHeight = tempShape.height + 2 * alignmentOffset
                        local radiusOffset = alignmentOffset * (lineStyle.alignment >= 1 and math.min(sWidth / width, sHeight / height) or math.min(width / sWidth, height / sHeight))
                        local sRadius = tempShape.radius + radiusOffset
                        local sMaxRadius = math.min(sWidth, sHeight) / 2
                        sRadius = sRadius > sMaxRadius and sMaxRadius or sRadius
                        context:beginPath()
                        context:moveTo(sRx, sRy + sRadius)
                        context:lineTo(sRx, sRy + sHeight - sRadius)
                        context:quadraticCurveTo(sRx, sRy + sHeight, sRx + sRadius, sRy + sHeight)
                        context:lineTo(sRx + sWidth - sRadius, sRy + sHeight)
                        context:quadraticCurveTo(sRx + sWidth, sRy + sHeight, sRx + sWidth, sRy + sHeight - sRadius)
                        context:lineTo(sRx + sWidth, sRy + sRadius)
                        context:quadraticCurveTo(sRx + sWidth, sRy, sRx + sWidth - sRadius, sRy)
                        context:lineTo(sRx + sRadius, sRy)
                        context:quadraticCurveTo(sRx, sRy, sRx, sRy + sRadius)
                        context:closePath()
                    end
                    context.globalAlpha = lineStyle.alpha * worldAlpha
                    context.strokeStyle = contextStrokeStyle
                    context:stroke()
                end
                if drawShapeOverStroke then
                    self:paintRoundedRectangle(
                        tempShape,
                        fillStyle,
                        lineStyle,
                        contextFillStyle,
                        worldAlpha,
                        context
                    )
                end
            end
            i = i + 1
        end
    end
end
function CanvasGraphicsRenderer.prototype.paintPolygonStroke(self, shape, lineStyle, contextStrokeStyle, holes, holesDirection, worldAlpha, context)
    if lineStyle.alignment ~= 0.5 then
        local alignmentOffset = lineStyle.width * (0.5 - (1 - lineStyle.alignment))
        local offsetPoints = PolygonUtils:offsetPolygon(shape.points, alignmentOffset)
        local points
        context:beginPath()
        context:moveTo(offsetPoints[1], offsetPoints[2])
        do
            local j = 2
            while j < #offsetPoints do
                context:lineTo(offsetPoints[j + 1], offsetPoints[j + 1 + 1])
                j = j + 2
            end
        end
        if shape.closeStroke then
            context:closePath()
        end
        do
            local k = 0
            while k < #holes do
                points = holes[k + 1].shape.points
                offsetPoints = PolygonUtils:offsetPolygon(points, alignmentOffset)
                if holesDirection[k + 1] then
                    context:moveTo(offsetPoints[1], offsetPoints[2])
                    do
                        local j = 2
                        while j < #offsetPoints do
                            context:lineTo(offsetPoints[j + 1], offsetPoints[j + 1 + 1])
                            j = j + 2
                        end
                    end
                else
                    context:moveTo(offsetPoints[#offsetPoints - 2 + 1], offsetPoints[#offsetPoints])
                    do
                        local j = #offsetPoints - 4
                        while j >= 0 do
                            context:lineTo(offsetPoints[j + 1], offsetPoints[j + 1 + 1])
                            j = j - 2
                        end
                    end
                end
                if holes[k + 1].shape.closeStroke then
                    context:closePath()
                end
                k = k + 1
            end
        end
    end
    context.globalAlpha = lineStyle.alpha * worldAlpha
    context.strokeStyle = contextStrokeStyle
    context:stroke()
end
function CanvasGraphicsRenderer.prototype.paintEllipse(self, shape, fillStyle, lineStyle, contextFillStyle, worldAlpha, context)
    local w = shape.width * 2
    local h = shape.height * 2
    local x = shape.x - w / 2
    local y = shape.y - h / 2
    local kappa = 0.5522848
    local ox = w / 2 * kappa
    local oy = h / 2 * kappa
    local xe = x + w
    local ye = y + h
    local xm = x + w / 2
    local ym = y + h / 2
    if (lineStyle and lineStyle.alignment) == 0 then
        context:save()
    end
    context:beginPath()
    context:moveTo(x, ym)
    context:bezierCurveTo(
        x,
        ym - oy,
        xm - ox,
        y,
        xm,
        y
    )
    context:bezierCurveTo(
        xm + ox,
        y,
        xe,
        ym - oy,
        xe,
        ym
    )
    context:bezierCurveTo(
        xe,
        ym + oy,
        xm + ox,
        ye,
        xm,
        ye
    )
    context:bezierCurveTo(
        xm - ox,
        ye,
        x,
        ym + oy,
        x,
        ym
    )
    context:closePath()
    if (lineStyle and lineStyle.alignment) == 0 then
        context:clip()
    end
    if fillStyle and fillStyle.visible then
        context.globalAlpha = fillStyle.alpha * worldAlpha
        context.fillStyle = contextFillStyle
        context:fill()
    end
    if (lineStyle and lineStyle.alignment) == 0 then
        context:restore()
    end
end
function CanvasGraphicsRenderer.prototype.paintRoundedRectangle(self, shape, fillStyle, lineStyle, contextFillStyle, worldAlpha, context)
    local rx = shape.x
    local ry = shape.y
    local width = shape.width
    local height = shape.height
    local radius = shape.radius
    local maxRadius = math.min(width, height) / 2
    radius = radius > maxRadius and maxRadius or radius
    if (lineStyle and lineStyle.alignment) == 0 then
        context:save()
    end
    context:beginPath()
    context:moveTo(rx, ry + radius)
    context:lineTo(rx, ry + height - radius)
    context:quadraticCurveTo(rx, ry + height, rx + radius, ry + height)
    context:lineTo(rx + width - radius, ry + height)
    context:quadraticCurveTo(rx + width, ry + height, rx + width, ry + height - radius)
    context:lineTo(rx + width, ry + radius)
    context:quadraticCurveTo(rx + width, ry, rx + width - radius, ry)
    context:lineTo(rx + radius, ry)
    context:quadraticCurveTo(rx, ry, rx, ry + radius)
    context:closePath()
    if (lineStyle and lineStyle.alignment) == 0 then
        context:clip()
    end
    if fillStyle and fillStyle.visible then
        context.globalAlpha = fillStyle.alpha * worldAlpha
        context.fillStyle = contextFillStyle
        context:fill()
    end
    if (lineStyle and lineStyle.alignment) == 0 then
        context:restore()
    end
end
function CanvasGraphicsRenderer.prototype.destroy(self)
    self.renderer = nil
    self._tempMatrix = nil
end
CanvasGraphicsRenderer.systemName = "graphics"
systems:register("graphics", ____exports.CanvasGraphicsRenderer)
return ____exports
 end,
["graphics.Graphics"] = function(...) 
local ____lualib = require("lualib_bundle")
local __TS__New = ____lualib.__TS__New
local __TS__Class = ____lualib.__TS__Class
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
local __TS__SetDescriptor = ____lualib.__TS__SetDescriptor
local __TS__ObjectAssign = ____lualib.__TS__ObjectAssign
local __TS__ArrayPush = ____lualib.__TS__ArrayPush
local __TS__ArraySetLength = ____lualib.__TS__ArraySetLength
local __TS__ArrayIsArray = ____lualib.__TS__ArrayIsArray
local Error = ____lualib.Error
local RangeError = ____lualib.RangeError
local ReferenceError = ____lualib.ReferenceError
local SyntaxError = ____lualib.SyntaxError
local TypeError = ____lualib.TypeError
local URIError = ____lualib.URIError
local ____exports = {}
local ____core = require("core.index")
local Circle = ____core.Circle
local Color = ____core.Color
local Ellipse = ____core.Ellipse
local Matrix = ____core.Matrix
local PI_2 = ____core.PI_2
local Point = ____core.Point
local Polygon = ____core.Polygon
local Rectangle = ____core.Rectangle
local RoundedRectangle = ____core.RoundedRectangle
local SHAPES = ____core.SHAPES
local ____display = require("display.index")
local Container = ____display.Container
local ____const = require("graphics.const")
local curves = ____const.curves
local LINE_CAP = ____const.LINE_CAP
local LINE_JOIN = ____const.LINE_JOIN
local ____GraphicsGeometry = require("graphics.GraphicsGeometry")
local GraphicsGeometry = ____GraphicsGeometry.GraphicsGeometry
local ____FillStyle = require("graphics.styles.FillStyle")
local FillStyle = ____FillStyle.FillStyle
local ____LineStyle = require("graphics.styles.LineStyle")
local LineStyle = ____LineStyle.LineStyle
local ____utils = require("graphics.utils.index")
local ArcUtils = ____utils.ArcUtils
local BezierUtils = ____utils.BezierUtils
local QuadraticUtils = ____utils.QuadraticUtils
local canvasRenderer
local tempMatrix = __TS__New(Matrix)
local temp = __TS__New(Float32Array, 3)
--- The Graphics class is primarily used to render primitive shapes such as lines, circles and
-- rectangles to the display, and to color and fill them.  However, you can also use a Graphics
-- object to build a list of primitives to use as a mask, or as a complex hitArea.
-- 
-- Please note that due to legacy naming conventions, the behavior of some functions in this class
-- can be confusing.  Each call to `drawRect()`, `drawPolygon()`, etc. actually stores that primitive
-- in the Geometry class's GraphicsGeometry object for later use in rendering or hit testing - the
-- functions do not directly draw anything to the screen.  Similarly, the `clear()` function doesn't
-- change the screen, it simply resets the list of primitives, which can be useful if you want to
-- rebuild the contents of an existing Graphics object.
-- 
-- Once a GraphicsGeometry list is built, you can re-use it in other Geometry objects as
-- an optimization, by passing it into a new Geometry object's constructor.  Because of this
-- ability, it's important to call `destroy()` on Geometry objects once you are done with them, to
-- properly dereference each GraphicsGeometry and prevent memory leaks.
-- 
-- @memberof PIXI
____exports.Graphics = __TS__Class()
local Graphics = ____exports.Graphics
Graphics.name = "Graphics"
__TS__ClassExtends(Graphics, Container)
function Graphics.prototype.____constructor(self, geometry)
    if geometry == nil then
        geometry = nil
    end
    Container.prototype.____constructor(self)
    self.pluginName = "batch"
    self.currentPath = nil
    self.batches = {}
    self.batchTint = -1
    self.batchDirty = -1
    self.vertexData = nil
    self._fillStyle = __TS__New(FillStyle)
    self._lineStyle = __TS__New(LineStyle)
    self._matrix = nil
    self._holeMode = false
    self._tint = 16777215
    self.cachedGraphicsData = {}
    self._geometry = geometry or __TS__New(GraphicsGeometry)
    local ____self__geometry_0, ____refCount_1 = self._geometry, "refCount"
    ____self__geometry_0[____refCount_1] = ____self__geometry_0[____refCount_1] + 1
    self._transformID = -1
    self.tint = 16777215
end
__TS__SetDescriptor(
    Graphics.prototype,
    "geometry",
    {get = function(self)
        return self._geometry
    end},
    true
)
__TS__SetDescriptor(
    Graphics.prototype,
    "tint",
    {
        get = function(self)
            return self._tint
        end,
        set = function(self, value)
            self._tint = value
        end
    },
    true
)
__TS__SetDescriptor(
    Graphics.prototype,
    "fill",
    {get = function(self)
        return self._fillStyle
    end},
    true
)
__TS__SetDescriptor(
    Graphics.prototype,
    "line",
    {get = function(self)
        return self._lineStyle
    end},
    true
)
function Graphics.prototype.clone(self)
    self:finishPoly()
    return __TS__New(____exports.Graphics, self._geometry)
end
function Graphics.prototype.lineStyle(self, options, color, alpha, alignment, native)
    if color == nil then
        color = 0
    end
    if alignment == nil then
        alignment = 0.5
    end
    if native == nil then
        native = false
    end
    if type(options) == "number" then
        options = {
            width = options,
            color = color,
            alpha = alpha,
            alignment = alignment,
            native = native
        }
    end
    return self:lineTextureStyle(options)
end
function Graphics.prototype.lineTextureStyle(self, options)
    local defaultLineStyleOptions = {
        width = 0,
        color = 0,
        matrix = nil,
        alignment = 0.5,
        native = false,
        cap = LINE_CAP.BUTT,
        join = LINE_JOIN.MITER,
        miterLimit = 10
    }
    options = __TS__ObjectAssign(defaultLineStyleOptions, options)
    self:normalizeColor(options)
    if self.currentPath then
        self:startPoly()
    end
    local visible = options.width and options.width > 0 and options.alpha and options.alpha > 0
    if not visible then
        self._lineStyle:reset()
    else
        if options.matrix then
            options.matrix = options.matrix:clone()
            options.matrix:invert()
        end
        __TS__ObjectAssign(self._lineStyle, {visible = visible}, options)
    end
    return self
end
function Graphics.prototype.startPoly(self)
    if self.currentPath then
        local points = self.currentPath.points
        local len = #self.currentPath.points
        if len > 2 then
            self:drawShape(self.currentPath)
            self.currentPath = __TS__New(Polygon)
            self.currentPath.closeStroke = false
            __TS__ArrayPush(self.currentPath.points, points[len - 2 + 1], points[len])
        end
    else
        self.currentPath = __TS__New(Polygon)
        self.currentPath.closeStroke = false
    end
end
function Graphics.prototype.finishPoly(self)
    if self.currentPath then
        if #self.currentPath.points > 2 then
            self:drawShape(self.currentPath)
            self.currentPath = nil
        else
            __TS__ArraySetLength(self.currentPath.points, 0)
        end
    end
end
function Graphics.prototype.moveTo(self, x, y)
    self:startPoly()
    self.currentPath.points[1] = x
    self.currentPath.points[2] = y
    return self
end
function Graphics.prototype.lineTo(self, x, y)
    if not self.currentPath then
        self:moveTo(0, 0)
    end
    local points = self.currentPath.points
    local fromX = points[#points - 2 + 1]
    local fromY = points[#points]
    if fromX ~= x or fromY ~= y then
        __TS__ArrayPush(points, x, y)
    end
    return self
end
function Graphics.prototype._initCurve(self, x, y)
    if x == nil then
        x = 0
    end
    if y == nil then
        y = 0
    end
    if self.currentPath then
        if #self.currentPath.points == 0 then
            self.currentPath.points = {x, y}
        end
    else
        self:moveTo(x, y)
    end
end
function Graphics.prototype.quadraticCurveTo(self, cpX, cpY, toX, toY)
    self:_initCurve()
    local points = self.currentPath.points
    if #points == 0 then
        self:moveTo(0, 0)
    end
    QuadraticUtils:curveTo(
        cpX,
        cpY,
        toX,
        toY,
        points
    )
    return self
end
function Graphics.prototype.bezierCurveTo(self, cpX, cpY, cpX2, cpY2, toX, toY)
    self:_initCurve()
    BezierUtils:curveTo(
        cpX,
        cpY,
        cpX2,
        cpY2,
        toX,
        toY,
        self.currentPath.points
    )
    return self
end
function Graphics.prototype.arcTo(self, x1, y1, x2, y2, radius)
    self:_initCurve(x1, y1)
    local points = self.currentPath.points
    local result = ArcUtils:curveTo(
        x1,
        y1,
        x2,
        y2,
        radius,
        points
    )
    if result then
        local cx = result.cx
        local cy = result.cy
        local radius = result.radius
        local startAngle = result.startAngle
        local endAngle = result.endAngle
        local anticlockwise = result.anticlockwise
        self:arc(
            cx,
            cy,
            radius,
            startAngle,
            endAngle,
            anticlockwise
        )
    end
    return self
end
function Graphics.prototype.arc(self, cx, cy, radius, startAngle, endAngle, anticlockwise)
    if anticlockwise == nil then
        anticlockwise = false
    end
    if startAngle == endAngle then
        return self
    end
    if not anticlockwise and endAngle <= startAngle then
        endAngle = endAngle + PI_2
    elseif anticlockwise and startAngle <= endAngle then
        startAngle = startAngle + PI_2
    end
    local sweep = endAngle - startAngle
    if sweep == 0 then
        return self
    end
    local startX = cx + math.cos(startAngle) * radius
    local startY = cy + math.sin(startAngle) * radius
    local eps = self._geometry.closePointEps
    local points = self.currentPath and self.currentPath.points or nil
    if points then
        local xDiff = math.abs(points[#points - 2 + 1] - startX)
        local yDiff = math.abs(points[#points] - startY)
        if xDiff < eps and yDiff < eps then
        else
            __TS__ArrayPush(points, startX, startY)
        end
    else
        self:moveTo(startX, startY)
        points = self.currentPath.points
    end
    ArcUtils:arc(
        startX,
        startY,
        cx,
        cy,
        radius,
        startAngle,
        endAngle,
        anticlockwise,
        points
    )
    return self
end
function Graphics.prototype.beginFill(self, color, alpha)
    if color == nil then
        color = 0
    end
    return self:beginTextureFill({color = color, alpha = alpha})
end
function Graphics.prototype.normalizeColor(self, options)
    local temp = Color.shared:setValue(options.color)
    options.color = temp:toNumber()
    if options.alpha == nil then
        options.alpha = temp.alpha
    end
end
function Graphics.prototype.beginTextureFill(self, options)
    local defaultOptions = {color = 16777215, matrix = nil}
    options = __TS__ObjectAssign(defaultOptions, options)
    self:normalizeColor(options)
    if self.currentPath then
        self:startPoly()
    end
    local visible = options.alpha and options.alpha > 0
    if not visible then
        self._fillStyle:reset()
    else
        if options.matrix then
            options.matrix = options.matrix:clone()
            options.matrix:invert()
        end
        __TS__ObjectAssign(self._fillStyle, {visible = visible}, options)
    end
    return self
end
function Graphics.prototype.endFill(self)
    self:finishPoly()
    self._fillStyle:reset()
    return self
end
function Graphics.prototype.drawRect(self, x, y, width, height)
    return self:drawShape(__TS__New(
        Rectangle,
        x,
        y,
        width,
        height
    ))
end
function Graphics.prototype.drawRoundedRect(self, x, y, width, height, radius)
    return self:drawShape(__TS__New(
        RoundedRectangle,
        x,
        y,
        width,
        height,
        radius
    ))
end
function Graphics.prototype.drawCircle(self, x, y, radius)
    return self:drawShape(__TS__New(Circle, x, y, radius))
end
function Graphics.prototype.drawEllipse(self, x, y, width, height)
    return self:drawShape(__TS__New(
        Ellipse,
        x,
        y,
        width,
        height
    ))
end
function Graphics.prototype.drawPolygon(self, ...)
    local path = {...}
    local points
    local closeStroke = true
    local poly = path[1]
    if poly.points ~= nil then
        closeStroke = poly.closeStroke
        points = poly.points
    elseif __TS__ArrayIsArray(path[1]) then
        points = path[1]
    else
        points = path
    end
    local shape = __TS__New(Polygon, points)
    shape.closeStroke = closeStroke
    self:drawShape(shape)
    return self
end
function Graphics.prototype.drawShape(self, shape)
    if not self._holeMode then
        self._geometry:drawShape(
            shape,
            self._fillStyle:clone(),
            self._lineStyle:clone(),
            self._matrix
        )
    else
        self._geometry:drawHole(shape, self._matrix)
    end
    return self
end
function Graphics.prototype.clear(self)
    self._geometry:clear()
    self._lineStyle:reset()
    self._fillStyle:reset()
    self._boundsID = self._boundsID + 1
    self._matrix = nil
    self._holeMode = false
    self.currentPath = nil
    return self
end
function Graphics.prototype.isFastRect(self)
    local data = self._geometry.graphicsData
    return #data == 1 and data[1].shape.type == SHAPES.RECT and not data[1].matrix and not #data[1].holes and not (data[1].lineStyle.visible and data[1].lineStyle.width)
end
function Graphics.prototype._render(self, _renderer)
    error(
        __TS__New(Error, "Graphics#_render is invalid"),
        0
    )
end
function Graphics.prototype.generateCanvasTexture(self, scaleMode, resolution)
    if resolution == nil then
        resolution = 1
    end
    error(
        __TS__New(Error, "generateCanvasTexture unimplemented"),
        0
    )
end
function Graphics.prototype._renderCanvas(self, renderer)
    self:finishPoly()
    renderer:get("graphics"):render(self)
end
function Graphics.prototype._calculateBounds(self)
    self:finishPoly()
    local geometry = self._geometry
    if not #geometry.graphicsData then
        return
    end
    local ____geometry_bounds_2 = geometry.bounds
    local minX = ____geometry_bounds_2.minX
    local minY = ____geometry_bounds_2.minY
    local maxX = ____geometry_bounds_2.maxX
    local maxY = ____geometry_bounds_2.maxY
    self._bounds:addFrame(
        self.transform,
        minX,
        minY,
        maxX,
        maxY
    )
end
function Graphics.prototype.containsPoint(self, point)
    self.worldTransform:applyInverse(point, ____exports.Graphics._TEMP_POINT)
    return self._geometry:containsPoint(____exports.Graphics._TEMP_POINT)
end
function Graphics.prototype.calculateTints(self)
    if self.batchTint ~= self.tint then
        self.batchTint = self.tint
        local tintRGB = Color.shared:setValue(self.tint):toRgbArray(temp)
        do
            local i = 0
            while i < #self.batches do
                local batch = self.batches[i + 1]
                batch._tintRGB = Color.shared:setValue(tintRGB):multiply(batch._batchRGB):toLittleEndianNumber()
                i = i + 1
            end
        end
    end
end
function Graphics.prototype.calculateVertices(self)
    local wtID = self.transform._worldID
    if self._transformID == wtID then
        return
    end
    self._transformID = wtID
    local wt = self.transform.worldTransform
    local a = wt.a
    local b = wt.b
    local c = wt.c
    local d = wt.d
    local tx = wt.tx
    local ty = wt.ty
    local data = self._geometry.points
    local vertexData = self.vertexData
    if not vertexData then
        return
    end
    local count = 0
    do
        local i = 0
        while i < #data do
            local x = data[i + 1]
            local y = data[i + 1 + 1]
            local ____count_3 = count
            count = ____count_3 + 1
            vertexData[____count_3] = a * x + c * y + tx
            local ____count_4 = count
            count = ____count_4 + 1
            vertexData[____count_4] = d * y + b * x + ty
            i = i + 2
        end
    end
end
function Graphics.prototype.closePath(self)
    local currentPath = self.currentPath
    if currentPath then
        currentPath.closeStroke = true
        self:finishPoly()
    end
    return self
end
function Graphics.prototype.setMatrix(self, matrix)
    self._matrix = matrix
    return self
end
function Graphics.prototype.beginHole(self)
    self:finishPoly()
    self._holeMode = true
    return self
end
function Graphics.prototype.endHole(self)
    self:finishPoly()
    self._holeMode = false
    return self
end
function Graphics.prototype.destroy(self, options)
    local ____self__geometry_5, ____refCount_6 = self._geometry, "refCount"
    ____self__geometry_5[____refCount_6] = ____self__geometry_5[____refCount_6] - 1
    if self._geometry.refCount == 0 then
        self._geometry:dispose()
    end
    self._matrix = nil
    self.currentPath = nil
    self._lineStyle:destroy()
    self._lineStyle = nil
    self._fillStyle:destroy()
    self._fillStyle = nil
    self._geometry = nil
    self.vertexData = nil
    __TS__ArraySetLength(self.batches, 0)
    self.batches = nil
    Container.prototype.destroy(self, options)
end
Graphics.curves = curves
Graphics._TEMP_POINT = __TS__New(Point)
return ____exports
 end,
["graphics.index"] = function(...) 
--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
local ____exports = {}
local ____utils = require("graphics.utils.index")
local ArcUtils = ____utils.ArcUtils
local BATCH_POOL = ____utils.BATCH_POOL
local BatchPart = ____utils.BatchPart
local BezierUtils = ____utils.BezierUtils
local buildCircle = ____utils.buildCircle
local buildLine = ____utils.buildLine
local buildPoly = ____utils.buildPoly
local buildRectangle = ____utils.buildRectangle
local buildRoundedRectangle = ____utils.buildRoundedRectangle
local DRAW_CALL_POOL = ____utils.DRAW_CALL_POOL
local FILL_COMMANDS = ____utils.FILL_COMMANDS
local QuadraticUtils = ____utils.QuadraticUtils
do
    local ____export = require("graphics.const")
    for ____exportKey, ____exportValue in pairs(____export) do
        if ____exportKey ~= "default" then
            ____exports[____exportKey] = ____exportValue
        end
    end
end
do
    local ____export = require("graphics.Graphics")
    for ____exportKey, ____exportValue in pairs(____export) do
        if ____exportKey ~= "default" then
            ____exports[____exportKey] = ____exportValue
        end
    end
end
do
    local ____export = require("graphics.GraphicsData")
    for ____exportKey, ____exportValue in pairs(____export) do
        if ____exportKey ~= "default" then
            ____exports[____exportKey] = ____exportValue
        end
    end
end
do
    local ____export = require("graphics.GraphicsGeometry")
    for ____exportKey, ____exportValue in pairs(____export) do
        if ____exportKey ~= "default" then
            ____exports[____exportKey] = ____exportValue
        end
    end
end
do
    local ____export = require("graphics.GraphicsRenderer")
    for ____exportKey, ____exportValue in pairs(____export) do
        if ____exportKey ~= "default" then
            ____exports[____exportKey] = ____exportValue
        end
    end
end
do
    local ____export = require("graphics.styles.FillStyle")
    for ____exportKey, ____exportValue in pairs(____export) do
        if ____exportKey ~= "default" then
            ____exports[____exportKey] = ____exportValue
        end
    end
end
do
    local ____export = require("graphics.styles.LineStyle")
    for ____exportKey, ____exportValue in pairs(____export) do
        if ____exportKey ~= "default" then
            ____exports[____exportKey] = ____exportValue
        end
    end
end
____exports.graphicsUtils = {
    buildPoly = buildPoly,
    buildCircle = buildCircle,
    buildRectangle = buildRectangle,
    buildRoundedRectangle = buildRoundedRectangle,
    buildLine = buildLine,
    ArcUtils = ArcUtils,
    BezierUtils = BezierUtils,
    QuadraticUtils = QuadraticUtils,
    BatchPart = BatchPart,
    FILL_COMMANDS = FILL_COMMANDS,
    BATCH_POOL = BATCH_POOL,
    DRAW_CALL_POOL = DRAW_CALL_POOL
}
return ____exports
 end,
["text.const"] = function(...) 
--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
local ____exports = {}
--- Constants that define the type of gradient on text.
-- 
-- @static
-- @name TEXT_GRADIENT
-- @memberof PIXI
-- @type {object}
-- @property {number} LINEAR_VERTICAL Vertical gradient
-- @property {number} LINEAR_HORIZONTAL Linear gradient
____exports.TEXT_GRADIENT = TEXT_GRADIENT or ({})
____exports.TEXT_GRADIENT.LINEAR_VERTICAL = 0
____exports.TEXT_GRADIENT[____exports.TEXT_GRADIENT.LINEAR_VERTICAL] = "LINEAR_VERTICAL"
____exports.TEXT_GRADIENT.LINEAR_HORIZONTAL = 1
____exports.TEXT_GRADIENT[____exports.TEXT_GRADIENT.LINEAR_HORIZONTAL] = "LINEAR_HORIZONTAL"
return ____exports
 end,
["sprite.Sprite"] = function(...) 
local ____lualib = require("lualib_bundle")
local __TS__New = ____lualib.__TS__New
local __TS__Class = ____lualib.__TS__Class
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
local __TS__SetDescriptor = ____lualib.__TS__SetDescriptor
local __TS__InstanceOf = ____lualib.__TS__InstanceOf
local ____exports = {}
local ____core = require("core.index")
local BLEND_MODES = ____core.BLEND_MODES
local Color = ____core.Color
local ObservablePoint = ____core.ObservablePoint
local Point = ____core.Point
local Rectangle = ____core.Rectangle
local groupD8 = ____core.groupD8
local settings = ____core.settings
local Texture = ____core.Texture
local utils = ____core.utils
local ____math = require("math.index")
local Matrix = ____math.Matrix
local ____display = require("display.index")
local Bounds = ____display.Bounds
local Container = ____display.Container
local tempPoint = __TS__New(Point)
local indices = __TS__New(Uint16Array, {
    0,
    1,
    2,
    0,
    2,
    3
})
local canvasRenderWorldTransform = __TS__New(Matrix)
--- The Sprite object is the base for all textured objects that are rendered to the screen
-- 
-- A sprite can be created directly from an image like this:
-- 
-- ```js
-- import { Sprite } from 'pixi.js';
-- 
-- const sprite = Sprite.from('assets/image.png');
-- ```
-- 
-- The more efficient way to create sprites is using a {_link PIXI.Spritesheet},
-- as swapping base textures when rendering to the screen is inefficient.
-- 
-- ```js
-- import { Assets, Sprite } from 'pixi.js';
-- 
-- const sheet = await Assets.load('assets/spritesheet.json');
-- const sprite = new Sprite(sheet.textures['image.png']);
-- ```
-- 
-- @memberof PIXI
____exports.Sprite = __TS__Class()
local Sprite = ____exports.Sprite
Sprite.name = "Sprite"
__TS__ClassExtends(Sprite, Container)
function Sprite.prototype.____constructor(self, texture)
    Container.prototype.____constructor(self)
    self._tintedCanvas = nil
    self._anchor = __TS__New(
        ObservablePoint,
        self._onAnchorUpdate,
        self,
        texture and texture.defaultAnchor.x or 0,
        texture and texture.defaultAnchor.y or 0
    )
    self._texture = nil
    self._width = 0
    self._height = 0
    self._tint = nil
    self._tintRGB = nil
    self.tint = 16777215
    self.blendMode = BLEND_MODES.NORMAL
    self._cachedTint = 16777215
    self.uvs = nil
    self.texture = texture or Texture.EMPTY
    self.vertexData = __TS__New(Float32Array, 8)
    self.vertexTrimmedData = nil
    self._transformID = -1
    self._textureID = -1
    self._transformTrimmedID = -1
    self._textureTrimmedID = -1
    self.indices = indices
    self.pluginName = "batch"
    self.isSprite = true
    self._roundPixels = settings.ROUND_PIXELS
end
__TS__SetDescriptor(
    Sprite.prototype,
    "roundPixels",
    {
        get = function(self)
            return self._roundPixels
        end,
        set = function(self, value)
            if self._roundPixels ~= value then
                self._transformID = -1
            end
            self._roundPixels = value
        end
    },
    true
)
__TS__SetDescriptor(
    Sprite.prototype,
    "width",
    {
        get = function(self)
            return math.abs(self.scale.x) * self._texture.orig.width
        end,
        set = function(self, value)
            local s = utils:sign(self.scale.x) or 1
            self.scale.x = s * value / self._texture.orig.width
            self._width = value
        end
    },
    true
)
__TS__SetDescriptor(
    Sprite.prototype,
    "height",
    {
        get = function(self)
            return math.abs(self.scale.y) * self._texture.orig.height
        end,
        set = function(self, value)
            local s = utils:sign(self.scale.y) or 1
            self.scale.y = s * value / self._texture.orig.height
            self._height = value
        end
    },
    true
)
__TS__SetDescriptor(
    Sprite.prototype,
    "anchor",
    {
        get = function(self)
            return self._anchor
        end,
        set = function(self, value)
            self._anchor:copyFrom(value)
        end
    },
    true
)
__TS__SetDescriptor(
    Sprite.prototype,
    "tint",
    {
        get = function(self)
            return self._tint
        end,
        set = function(self, value)
            self._tint = value
            self._tintRGB = Color.shared:setValue(value):toLittleEndianNumber()
        end
    },
    true
)
__TS__SetDescriptor(
    Sprite.prototype,
    "texture",
    {
        get = function(self)
            return self._texture
        end,
        set = function(self, value)
            if self._texture == value then
                return
            end
            if self._texture ~= nil then
                self._texture:off("update", self._onTextureUpdate, self)
            end
            self._texture = value or Texture.EMPTY
            self._cachedTint = 16777215
            self._textureID = -1
            self._textureTrimmedID = -1
            if value ~= nil then
                if value.baseTexture.valid then
                    self:_onTextureUpdate()
                else
                    value:once("update", self._onTextureUpdate, self)
                end
            end
        end
    },
    true
)
function Sprite.prototype._renderCanvas(self, renderer)
    local texture = self._texture
    local context = renderer.canvasContext.activeContext
    local activeResolution = renderer.canvasContext.activeResolution
    if not texture.valid then
        return
    end
    local sourceWidth = texture._frame.width
    local sourceHeight = texture._frame.height
    local destWidth = texture._frame.width
    local destHeight = texture._frame.height
    if texture.trim then
        destWidth = texture.trim.width
        destHeight = texture.trim.height
    end
    local wt = self.transform.worldTransform
    local dx = 0
    local dy = 0
    local source = texture.baseTexture:getDrawableSource()
    if texture.orig.width <= 0 or texture.orig.height <= 0 or not texture.valid or not source then
        return
    end
    renderer.canvasContext:setBlendMode(self.blendMode, true)
    context.globalAlpha = self.worldAlpha
    if texture.trim then
        dx = texture.trim.width / 2 + texture.trim.x - self.anchor.x * texture.orig.width
        dy = texture.trim.height / 2 + texture.trim.y - self.anchor.y * texture.orig.height
    else
        dx = (0.5 - self.anchor.x) * texture.orig.width
        dy = (0.5 - self.anchor.y) * texture.orig.height
    end
    if texture.rotate ~= 0 then
        wt:copyTo(canvasRenderWorldTransform)
        wt = canvasRenderWorldTransform
        groupD8:matrixAppendRotationInv(wt, texture.rotate, dx, dy)
        dx = 0
        dy = 0
    end
    dx = dx - destWidth / 2
    dy = dy - destHeight / 2
    renderer.canvasContext:setContextTransform(wt, self.roundPixels, 1)
    if self.roundPixels then
        dx = bit.bor(dx, 0)
        dy = bit.bor(dy, 0)
    end
    local resolution = texture.baseTexture.resolution
    local outerBlend = renderer.canvasContext._outerBlend
    if outerBlend then
        context:save()
        context:beginPath()
        context:rect(dx * activeResolution, dy * activeResolution, destWidth * activeResolution, destHeight * activeResolution)
        context:clip()
    end
    context:drawImage(
        source,
        texture._frame.x * resolution,
        texture._frame.y * resolution,
        math.floor(sourceWidth * resolution),
        math.floor(sourceHeight * resolution),
        math.floor(dx * activeResolution),
        math.floor(dy * activeResolution),
        math.floor(destWidth * activeResolution),
        math.floor(destHeight * activeResolution)
    )
    if outerBlend then
        context:restore()
    end
    renderer.canvasContext:setBlendMode(BLEND_MODES.NORMAL)
end
function Sprite.prototype._onTextureUpdate(self)
    self._textureID = -1
    self._textureTrimmedID = -1
    self._cachedTint = 16777215
    if self._width > 0 then
        self.scale.x = utils:sign(self.scale.x) * self._width / self._texture.orig.width
    end
    if self._height > 0 then
        self.scale.y = utils:sign(self.scale.y) * self._height / self._texture.orig.height
    end
end
function Sprite.prototype._onAnchorUpdate(self)
    self._transformID = -1
    self._transformTrimmedID = -1
end
function Sprite.prototype.calculateVertices(self)
    local texture = self._texture
    if self._transformID == self.transform._worldID and self._textureID == texture._updateID then
        return
    end
    if self._textureID ~= texture._updateID then
        self.uvs = self._texture._uvs.uvsFloat32
    end
    self._transformID = self.transform._worldID
    self._textureID = texture._updateID
    local wt = self.transform.worldTransform
    local a = wt.a
    local b = wt.b
    local c = wt.c
    local d = wt.d
    local tx = wt.tx
    local ty = wt.ty
    local vertexData = self.vertexData
    local trim = texture.trim
    local orig = texture.orig
    local anchor = self._anchor
    local w0 = 0
    local w1 = 0
    local h0 = 0
    local h1 = 0
    if trim then
        w1 = trim.x - anchor._x * orig.width
        w0 = w1 + trim.width
        h1 = trim.y - anchor._y * orig.height
        h0 = h1 + trim.height
    else
        w1 = -anchor._x * orig.width
        w0 = w1 + orig.width
        h1 = -anchor._y * orig.height
        h0 = h1 + orig.height
    end
    vertexData[0] = a * w1 + c * h1 + tx
    vertexData[1] = d * h1 + b * w1 + ty
    vertexData[2] = a * w0 + c * h1 + tx
    vertexData[3] = d * h1 + b * w0 + ty
    vertexData[4] = a * w0 + c * h0 + tx
    vertexData[5] = d * h0 + b * w0 + ty
    vertexData[6] = a * w1 + c * h0 + tx
    vertexData[7] = d * h0 + b * w1 + ty
    if self._roundPixels then
        local resolution = settings.RESOLUTION
        do
            local i = 0
            while i < vertexData.length do
                vertexData[i] = math.floor(vertexData[i] * resolution + 0.5) / resolution
                i = i + 1
            end
        end
    end
end
function Sprite.prototype.calculateTrimmedVertices(self)
    if not self.vertexTrimmedData then
        self.vertexTrimmedData = __TS__New(Float32Array, 8)
    elseif self._transformTrimmedID == self.transform._worldID and self._textureTrimmedID == self._texture._updateID then
        return
    end
    self._transformTrimmedID = self.transform._worldID
    self._textureTrimmedID = self._texture._updateID
    local texture = self._texture
    local vertexData = self.vertexTrimmedData
    local orig = texture.orig
    local anchor = self._anchor
    local wt = self.transform.worldTransform
    local a = wt.a
    local b = wt.b
    local c = wt.c
    local d = wt.d
    local tx = wt.tx
    local ty = wt.ty
    local w1 = -anchor._x * orig.width
    local w0 = w1 + orig.width
    local h1 = -anchor._y * orig.height
    local h0 = h1 + orig.height
    vertexData[0] = a * w1 + c * h1 + tx
    vertexData[1] = d * h1 + b * w1 + ty
    vertexData[2] = a * w0 + c * h1 + tx
    vertexData[3] = d * h1 + b * w0 + ty
    vertexData[4] = a * w0 + c * h0 + tx
    vertexData[5] = d * h0 + b * w0 + ty
    vertexData[6] = a * w1 + c * h0 + tx
    vertexData[7] = d * h0 + b * w1 + ty
end
function Sprite.prototype._calculateBounds(self)
    local trim = self._texture.trim
    local orig = self._texture.orig
    if not trim or trim.width == orig.width and trim.height == orig.height then
        self:calculateVertices()
        self._bounds:addQuad(self.vertexData)
    else
        self:calculateTrimmedVertices()
        self._bounds:addQuad(self.vertexTrimmedData)
    end
end
function Sprite.prototype.getLocalBounds(self, rect)
    if #self.children == 0 then
        if not self._localBounds then
            self._localBounds = __TS__New(Bounds)
        end
        self._localBounds.minX = self._texture.orig.width * -self._anchor._x
        self._localBounds.minY = self._texture.orig.height * -self._anchor._y
        self._localBounds.maxX = self._texture.orig.width * (1 - self._anchor._x)
        self._localBounds.maxY = self._texture.orig.height * (1 - self._anchor._y)
        if not rect then
            if not self._localBoundsRect then
                self._localBoundsRect = __TS__New(Rectangle)
            end
            rect = self._localBoundsRect
        end
        return self._localBounds:getRectangle(rect)
    end
    return Container.prototype.getLocalBounds(self, rect)
end
function Sprite.prototype.containsPoint(self, point)
    self.worldTransform:applyInverse(point, tempPoint)
    local width = self._texture.orig.width
    local height = self._texture.orig.height
    local x1 = -width * self.anchor.x
    local y1 = 0
    if tempPoint.x >= x1 and tempPoint.x < x1 + width then
        y1 = -height * self.anchor.y
        if tempPoint.y >= y1 and tempPoint.y < y1 + height then
            return true
        end
    end
    return false
end
function Sprite.prototype.destroy(self, options)
    Container.prototype.destroy(self, options)
    self._texture:off("update", self._onTextureUpdate, self)
    self._anchor = nil
    local ____temp_2
    if type(options) == "boolean" then
        ____temp_2 = options
    else
        ____temp_2 = options and options.texture
    end
    local destroyTexture = ____temp_2
    if destroyTexture then
        local ____temp_5
        if type(options) == "boolean" then
            ____temp_5 = options
        else
            ____temp_5 = options and options.baseTexture
        end
        local destroyBaseTexture = ____temp_5
        self._texture:destroy(not not destroyBaseTexture)
    end
    self._texture = nil
end
function Sprite.from(self, source, options)
    local texture = __TS__InstanceOf(source, Texture) and source or Texture:from(source, options)
    return __TS__New(____exports.Sprite, texture)
end
return ____exports
 end,
["sprite.index"] = function(...) 
--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
local ____exports = {}
do
    local ____export = require("sprite.Sprite")
    for ____exportKey, ____exportValue in pairs(____export) do
        if ____exportKey ~= "default" then
            ____exports[____exportKey] = ____exportValue
        end
    end
end
return ____exports
 end,
["text.TextStyle"] = function(...) 
local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ObjectAssign = ____lualib.__TS__ObjectAssign
local __TS__SetDescriptor = ____lualib.__TS__SetDescriptor
local __TS__New = ____lualib.__TS__New
local __TS__ArrayIsArray = ____lualib.__TS__ArrayIsArray
local __TS__StringSplit = ____lualib.__TS__StringSplit
local __TS__StringTrim = ____lualib.__TS__StringTrim
local __TS__StringStartsWith = ____lualib.__TS__StringStartsWith
local __TS__ArrayIncludes = ____lualib.__TS__ArrayIncludes
local __TS__ArrayMap = ____lualib.__TS__ArrayMap
local __TS__ArraySlice = ____lualib.__TS__ArraySlice
local ____exports = {}
local getColor, areArraysEqual, deepCopyProperties
local ____const = require("text.const")
local TEXT_GRADIENT = ____const.TEXT_GRADIENT
local ____core = require("core.index")
local Color = ____core.Color
function getColor(self, color)
    local temp = Color.shared
    if not __TS__ArrayIsArray(color) then
        return temp:setValue(color):toHex()
    else
        return __TS__ArrayMap(
            color,
            function(____, c) return temp:setValue(c):toHex() end
        )
    end
end
function areArraysEqual(self, array1, array2)
    if not __TS__ArrayIsArray(array1) or not __TS__ArrayIsArray(array2) then
        return false
    end
    if #array1 ~= #array2 then
        return false
    end
    do
        local i = 0
        while i < #array1 do
            if array1[i + 1] ~= array2[i + 1] then
                return false
            end
            i = i + 1
        end
    end
    return true
end
function deepCopyProperties(self, target, source, propertyObj)
    for prop in pairs(propertyObj) do
        local value = source[prop]
        if __TS__ArrayIsArray(value) then
            target[prop] = __TS__ArraySlice(value)
        else
            target[prop] = value
        end
    end
end
local genericFontFamilies = {
    "serif",
    "sans-serif",
    "monospace",
    "cursive",
    "fantasy",
    "system-ui"
}
--- A TextStyle Object contains information to decorate a Text objects.
-- 
-- An instance can be shared between multiple Text objects; then changing the style will update all text objects using it.
-- 
-- A tool can be used to generate a text style [here](https://pixijs.io/pixi-text-style).
-- 
-- @memberof PIXI
-- @example import { TextStyle } from 'pixi.js';
-- const style = new TextStyle({
--   fontFamily: ['Helvetica', 'Arial', 'sans-serif'],
--   fontSize: 36,
-- });
____exports.TextStyle = __TS__Class()
local TextStyle = ____exports.TextStyle
TextStyle.name = "TextStyle"
function TextStyle.prototype.____constructor(self, style)
    self.styleID = 0
    self:reset()
    deepCopyProperties(
        nil,
        self,
        __TS__ObjectAssign({}, ____exports.TextStyle.defaultStyle, style),
        ____exports.TextStyle.defaultStyle
    )
end
__TS__SetDescriptor(
    TextStyle.prototype,
    "align",
    {
        get = function(self)
            return self._align
        end,
        set = function(self, align)
            if self._align ~= align then
                self._align = align
                self.styleID = self.styleID + 1
            end
        end
    },
    true
)
__TS__SetDescriptor(
    TextStyle.prototype,
    "breakWords",
    {
        get = function(self)
            return self._breakWords
        end,
        set = function(self, breakWords)
            if self._breakWords ~= breakWords then
                self._breakWords = breakWords
                self.styleID = self.styleID + 1
            end
        end
    },
    true
)
__TS__SetDescriptor(
    TextStyle.prototype,
    "dropShadow",
    {
        get = function(self)
            return self._dropShadow
        end,
        set = function(self, dropShadow)
            if self._dropShadow ~= dropShadow then
                self._dropShadow = dropShadow
                self.styleID = self.styleID + 1
            end
        end
    },
    true
)
__TS__SetDescriptor(
    TextStyle.prototype,
    "dropShadowAlpha",
    {
        get = function(self)
            return self._dropShadowAlpha
        end,
        set = function(self, dropShadowAlpha)
            if self._dropShadowAlpha ~= dropShadowAlpha then
                self._dropShadowAlpha = dropShadowAlpha
                self.styleID = self.styleID + 1
            end
        end
    },
    true
)
__TS__SetDescriptor(
    TextStyle.prototype,
    "dropShadowAngle",
    {
        get = function(self)
            return self._dropShadowAngle
        end,
        set = function(self, dropShadowAngle)
            if self._dropShadowAngle ~= dropShadowAngle then
                self._dropShadowAngle = dropShadowAngle
                self.styleID = self.styleID + 1
            end
        end
    },
    true
)
__TS__SetDescriptor(
    TextStyle.prototype,
    "dropShadowBlur",
    {
        get = function(self)
            return self._dropShadowBlur
        end,
        set = function(self, dropShadowBlur)
            if self._dropShadowBlur ~= dropShadowBlur then
                self._dropShadowBlur = dropShadowBlur
                self.styleID = self.styleID + 1
            end
        end
    },
    true
)
__TS__SetDescriptor(
    TextStyle.prototype,
    "dropShadowColor",
    {
        get = function(self)
            return self._dropShadowColor
        end,
        set = function(self, dropShadowColor)
            local outputColor = getColor(nil, dropShadowColor)
            if self._dropShadowColor ~= outputColor then
                self._dropShadowColor = outputColor
                self.styleID = self.styleID + 1
            end
        end
    },
    true
)
__TS__SetDescriptor(
    TextStyle.prototype,
    "dropShadowDistance",
    {
        get = function(self)
            return self._dropShadowDistance
        end,
        set = function(self, dropShadowDistance)
            if self._dropShadowDistance ~= dropShadowDistance then
                self._dropShadowDistance = dropShadowDistance
                self.styleID = self.styleID + 1
            end
        end
    },
    true
)
__TS__SetDescriptor(
    TextStyle.prototype,
    "fill",
    {
        get = function(self)
            return self._fill
        end,
        set = function(self, fill)
            local outputColor = getColor(nil, fill)
            if self._fill ~= outputColor then
                self._fill = outputColor
                self.styleID = self.styleID + 1
            end
        end
    },
    true
)
__TS__SetDescriptor(
    TextStyle.prototype,
    "fillGradientType",
    {
        get = function(self)
            return self._fillGradientType
        end,
        set = function(self, fillGradientType)
            if self._fillGradientType ~= fillGradientType then
                self._fillGradientType = fillGradientType
                self.styleID = self.styleID + 1
            end
        end
    },
    true
)
__TS__SetDescriptor(
    TextStyle.prototype,
    "fillGradientStops",
    {
        get = function(self)
            return self._fillGradientStops
        end,
        set = function(self, fillGradientStops)
            if not areArraysEqual(nil, self._fillGradientStops, fillGradientStops) then
                self._fillGradientStops = fillGradientStops
                self.styleID = self.styleID + 1
            end
        end
    },
    true
)
__TS__SetDescriptor(
    TextStyle.prototype,
    "fontFamily",
    {
        get = function(self)
            return self._fontFamily
        end,
        set = function(self, fontFamily)
            if self.fontFamily ~= fontFamily then
                self._fontFamily = fontFamily
                self.styleID = self.styleID + 1
            end
        end
    },
    true
)
__TS__SetDescriptor(
    TextStyle.prototype,
    "fontSize",
    {
        get = function(self)
            return self._fontSize
        end,
        set = function(self, fontSize)
            if self._fontSize ~= fontSize then
                self._fontSize = fontSize
                self.styleID = self.styleID + 1
            end
        end
    },
    true
)
__TS__SetDescriptor(
    TextStyle.prototype,
    "fontStyle",
    {
        get = function(self)
            return self._fontStyle
        end,
        set = function(self, fontStyle)
            if self._fontStyle ~= fontStyle then
                self._fontStyle = fontStyle
                self.styleID = self.styleID + 1
            end
        end
    },
    true
)
__TS__SetDescriptor(
    TextStyle.prototype,
    "fontVariant",
    {
        get = function(self)
            return self._fontVariant
        end,
        set = function(self, fontVariant)
            if self._fontVariant ~= fontVariant then
                self._fontVariant = fontVariant
                self.styleID = self.styleID + 1
            end
        end
    },
    true
)
__TS__SetDescriptor(
    TextStyle.prototype,
    "fontWeight",
    {
        get = function(self)
            return self._fontWeight
        end,
        set = function(self, fontWeight)
            if self._fontWeight ~= fontWeight then
                self._fontWeight = fontWeight
                self.styleID = self.styleID + 1
            end
        end
    },
    true
)
__TS__SetDescriptor(
    TextStyle.prototype,
    "letterSpacing",
    {
        get = function(self)
            return self._letterSpacing
        end,
        set = function(self, letterSpacing)
            if self._letterSpacing ~= letterSpacing then
                self._letterSpacing = letterSpacing
                self.styleID = self.styleID + 1
            end
        end
    },
    true
)
__TS__SetDescriptor(
    TextStyle.prototype,
    "lineHeight",
    {
        get = function(self)
            return self._lineHeight
        end,
        set = function(self, lineHeight)
            if self._lineHeight ~= lineHeight then
                self._lineHeight = lineHeight
                self.styleID = self.styleID + 1
            end
        end
    },
    true
)
__TS__SetDescriptor(
    TextStyle.prototype,
    "leading",
    {
        get = function(self)
            return self._leading
        end,
        set = function(self, leading)
            if self._leading ~= leading then
                self._leading = leading
                self.styleID = self.styleID + 1
            end
        end
    },
    true
)
__TS__SetDescriptor(
    TextStyle.prototype,
    "lineJoin",
    {
        get = function(self)
            return self._lineJoin
        end,
        set = function(self, lineJoin)
            if self._lineJoin ~= lineJoin then
                self._lineJoin = lineJoin
                self.styleID = self.styleID + 1
            end
        end
    },
    true
)
__TS__SetDescriptor(
    TextStyle.prototype,
    "miterLimit",
    {
        get = function(self)
            return self._miterLimit
        end,
        set = function(self, miterLimit)
            if self._miterLimit ~= miterLimit then
                self._miterLimit = miterLimit
                self.styleID = self.styleID + 1
            end
        end
    },
    true
)
__TS__SetDescriptor(
    TextStyle.prototype,
    "padding",
    {
        get = function(self)
            return self._padding
        end,
        set = function(self, padding)
            if self._padding ~= padding then
                self._padding = padding
                self.styleID = self.styleID + 1
            end
        end
    },
    true
)
__TS__SetDescriptor(
    TextStyle.prototype,
    "stroke",
    {
        get = function(self)
            return self._stroke
        end,
        set = function(self, stroke)
            local outputColor = getColor(nil, stroke)
            if self._stroke ~= outputColor then
                self._stroke = outputColor
                self.styleID = self.styleID + 1
            end
        end
    },
    true
)
__TS__SetDescriptor(
    TextStyle.prototype,
    "strokeThickness",
    {
        get = function(self)
            return self._strokeThickness
        end,
        set = function(self, strokeThickness)
            if self._strokeThickness ~= strokeThickness then
                self._strokeThickness = strokeThickness
                self.styleID = self.styleID + 1
            end
        end
    },
    true
)
__TS__SetDescriptor(
    TextStyle.prototype,
    "textBaseline",
    {
        get = function(self)
            return self._textBaseline
        end,
        set = function(self, textBaseline)
            if self._textBaseline ~= textBaseline then
                self._textBaseline = textBaseline
                self.styleID = self.styleID + 1
            end
        end
    },
    true
)
__TS__SetDescriptor(
    TextStyle.prototype,
    "trim",
    {
        get = function(self)
            return self._trim
        end,
        set = function(self, trim)
            if self._trim ~= trim then
                self._trim = trim
                self.styleID = self.styleID + 1
            end
        end
    },
    true
)
__TS__SetDescriptor(
    TextStyle.prototype,
    "whiteSpace",
    {
        get = function(self)
            return self._whiteSpace
        end,
        set = function(self, whiteSpace)
            if self._whiteSpace ~= whiteSpace then
                self._whiteSpace = whiteSpace
                self.styleID = self.styleID + 1
            end
        end
    },
    true
)
__TS__SetDescriptor(
    TextStyle.prototype,
    "wordWrap",
    {
        get = function(self)
            return self._wordWrap
        end,
        set = function(self, wordWrap)
            if self._wordWrap ~= wordWrap then
                self._wordWrap = wordWrap
                self.styleID = self.styleID + 1
            end
        end
    },
    true
)
__TS__SetDescriptor(
    TextStyle.prototype,
    "wordWrapWidth",
    {
        get = function(self)
            return self._wordWrapWidth
        end,
        set = function(self, wordWrapWidth)
            if self._wordWrapWidth ~= wordWrapWidth then
                self._wordWrapWidth = wordWrapWidth
                self.styleID = self.styleID + 1
            end
        end
    },
    true
)
function TextStyle.prototype.clone(self)
    local clonedProperties = {}
    deepCopyProperties(nil, clonedProperties, self, ____exports.TextStyle.defaultStyle)
    return __TS__New(____exports.TextStyle, clonedProperties)
end
function TextStyle.prototype.reset(self)
    deepCopyProperties(nil, self, ____exports.TextStyle.defaultStyle, ____exports.TextStyle.defaultStyle)
end
function TextStyle.prototype.toFontString(self)
    local fontSizeString = type(self.fontSize) == "number" and tostring(self.fontSize) .. "px" or self.fontSize
    local fontFamilies = self.fontFamily
    if not __TS__ArrayIsArray(self.fontFamily) then
        fontFamilies = __TS__StringSplit(self.fontFamily, ",")
    end
    do
        local i = #fontFamilies - 1
        while i >= 0 do
            local fontFamily = __TS__StringTrim(fontFamilies[i + 1])
            if not __TS__StringStartsWith(fontFamily, "\"") and not __TS__StringStartsWith(fontFamily, "'") and not __TS__ArrayIncludes(genericFontFamilies, fontFamily) then
                fontFamily = ("\"" .. fontFamily) .. "\""
            end
            fontFamilies[i + 1] = fontFamily
            i = i - 1
        end
    end
    return (((((((self.fontStyle .. " ") .. self.fontVariant) .. " ") .. self.fontWeight) .. " ") .. fontSizeString) .. " ") .. table.concat(fontFamilies, ",")
end
TextStyle.defaultStyle = {
    align = "left",
    breakWords = false,
    dropShadow = false,
    dropShadowAlpha = 1,
    dropShadowAngle = math.pi / 6,
    dropShadowBlur = 0,
    dropShadowColor = "black",
    dropShadowDistance = 5,
    fill = "black",
    fillGradientType = TEXT_GRADIENT.LINEAR_VERTICAL,
    fillGradientStops = {},
    fontFamily = "Arial",
    fontSize = 26,
    fontStyle = "normal",
    fontVariant = "normal",
    fontWeight = "normal",
    leading = 0,
    letterSpacing = 0,
    lineHeight = 0,
    lineJoin = "miter",
    miterLimit = 10,
    padding = 0,
    stroke = "black",
    strokeThickness = 0,
    textBaseline = "alphabetic",
    trim = false,
    whiteSpace = "pre",
    wordWrap = false,
    wordWrapWidth = 100
}
return ____exports
 end,
["text.TextMetrics"] = function(...) 
local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ObjectDefineProperty = ____lualib.__TS__ObjectDefineProperty
local __TS__New = ____lualib.__TS__New
local __TS__Spread = ____lualib.__TS__Spread
local __TS__StringAccess = ____lualib.__TS__StringAccess
local __TS__ArrayIncludes = ____lualib.__TS__ArrayIncludes
local __TS__Delete = ____lualib.__TS__Delete
local ____exports = {}
local ____core = require("core.index")
local settings = ____core.settings
local ____context2d = require("context2d.index")
local Canvas = ____context2d.Canvas
--- The TextMetrics object represents the measurement of a block of text with a specified style.
-- 
-- @example import { TextMetrics, TextStyle } from 'pixi.js';
-- 
-- const style = new TextStyle({
--     fontFamily: 'Arial',
--     fontSize: 24,
--     fill: 0xff1010,
--     align: 'center',
-- });
-- const textMetrics = TextMetrics.measureText('Your text', style);
-- @memberof PIXI
____exports.TextMetrics = __TS__Class()
local TextMetrics = ____exports.TextMetrics
TextMetrics.name = "TextMetrics"
function TextMetrics.prototype.____constructor(self, text, style, width, height, lines, lineWidths, lineHeight, maxLineWidth, fontProperties)
    self.text = text
    self.style = style
    self.width = width
    self.height = height
    self.lines = lines
    self.lineWidths = lineWidths
    self.lineHeight = lineHeight
    self.maxLineWidth = maxLineWidth
    self.fontProperties = fontProperties
end
__TS__ObjectDefineProperty(
    TextMetrics,
    "experimentalLetterSpacingSupported",
    {get = function(self)
        local result = ____exports.TextMetrics._experimentalLetterSpacingSupported
        if result == nil then
            local proto = settings.ADAPTER:getCanvasRenderingContext2D().prototype
            local ____exports_TextMetrics_1 = ____exports.TextMetrics
            local ____temp_0 = proto.letterSpacing ~= nil or proto.textLetterSpacing ~= nil
            if ____temp_0 == nil then
                ____temp_0 = false
            end
            ____exports_TextMetrics_1._experimentalLetterSpacingSupported = ____temp_0
            result = ____temp_0
        end
        return result
    end}
)
__TS__ObjectDefineProperty(
    TextMetrics,
    "_canvas",
    {get = function(self)
        if not ____exports.TextMetrics.__canvas then
            ____exports.TextMetrics.__canvas = __TS__New(Canvas, 10, 10)
        end
        return ____exports.TextMetrics.__canvas
    end}
)
__TS__ObjectDefineProperty(
    TextMetrics,
    "_context",
    {get = function(self)
        if not ____exports.TextMetrics.__context then
            ____exports.TextMetrics.__context = ____exports.TextMetrics._canvas:getContext("2d")
        end
        return ____exports.TextMetrics.__context
    end}
)
function TextMetrics.measureText(self, text, style, wordWrap, canvas)
    if canvas == nil then
        canvas = ____exports.TextMetrics._canvas
    end
    local ____temp_2
    if wordWrap == nil or wordWrap == nil then
        ____temp_2 = style.wordWrap
    else
        ____temp_2 = wordWrap
    end
    wordWrap = ____temp_2
    local font = style:toFontString()
    local fontProperties = ____exports.TextMetrics:measureFont(font)
    if fontProperties.fontSize == 0 then
        fontProperties.fontSize = style.fontSize
        fontProperties.ascent = style.fontSize
    end
    local context = canvas:getContext("2d")
    context.font = font
    local outputText = wordWrap and ____exports.TextMetrics:wordWrap(text, style, canvas) or text
    local lines = vim.split(outputText, "\n")
    local lineWidths = {}
    local maxLineWidth = 0
    do
        local i = 0
        while i < #lines do
            local lineWidth = ____exports.TextMetrics:_measureText(lines[i + 1], style.letterSpacing, context)
            lineWidths[i + 1] = lineWidth
            maxLineWidth = math.max(maxLineWidth, lineWidth)
            i = i + 1
        end
    end
    local width = maxLineWidth + style.strokeThickness
    if style.dropShadow then
        width = width + style.dropShadowDistance
    end
    local lineHeight = style.lineHeight or fontProperties.fontSize + style.strokeThickness
    local height = math.max(lineHeight, fontProperties.fontSize + style.strokeThickness * 2) + (#lines - 1) * (lineHeight + style.leading)
    if style.dropShadow then
        height = height + style.dropShadowDistance
    end
    return __TS__New(
        ____exports.TextMetrics,
        text,
        style,
        width,
        height,
        lines,
        lineWidths,
        lineHeight + style.leading,
        maxLineWidth,
        fontProperties
    )
end
function TextMetrics._measureText(self, text, letterSpacing, context)
    local useExperimentalLetterSpacing = false
    if ____exports.TextMetrics.experimentalLetterSpacingSupported then
        if ____exports.TextMetrics.experimentalLetterSpacing then
            context.letterSpacing = tostring(letterSpacing) .. "px"
            useExperimentalLetterSpacing = true
        else
            context.letterSpacing = "0px"
        end
    end
    local width = context:measureText(text).width
    if width > 0 then
        if useExperimentalLetterSpacing then
            width = width - letterSpacing
        else
            width = width + (#____exports.TextMetrics:graphemeSegmenter(text) - 1) * letterSpacing
        end
    end
    return width
end
function TextMetrics.wordWrap(self, text, style, canvas)
    if canvas == nil then
        canvas = ____exports.TextMetrics._canvas
    end
    local context = canvas:getContext("2d")
    local width = 0
    local line = ""
    local lines = ""
    local cache = {}
    local ____style_3 = style
    local letterSpacing = ____style_3.letterSpacing
    local whiteSpace = ____style_3.whiteSpace
    local collapseSpaces = ____exports.TextMetrics:collapseSpaces(whiteSpace)
    local collapseNewlines = ____exports.TextMetrics:collapseNewlines(whiteSpace)
    local canPrependSpaces = not collapseSpaces
    local wordWrapWidth = style.wordWrapWidth + letterSpacing
    local tokens = ____exports.TextMetrics:tokenize(text)
    do
        local i = 0
        while i < #tokens do
            do
                local token = tokens[i + 1]
                if ____exports.TextMetrics:isNewline(token) then
                    if not collapseNewlines then
                        lines = lines .. ____exports.TextMetrics:addLine(line)
                        canPrependSpaces = not collapseSpaces
                        line = ""
                        width = 0
                        goto __continue24
                    end
                    token = " "
                end
                if collapseSpaces then
                    local currIsBreakingSpace = ____exports.TextMetrics:isBreakingSpace(token)
                    local lastIsBreakingSpace = ____exports.TextMetrics:isBreakingSpace(__TS__StringAccess(line, #line - 1))
                    if currIsBreakingSpace and lastIsBreakingSpace then
                        goto __continue24
                    end
                end
                local tokenWidth = ____exports.TextMetrics:getFromCache(token, letterSpacing, cache, context)
                if tokenWidth > wordWrapWidth then
                    if line ~= "" then
                        lines = lines .. ____exports.TextMetrics:addLine(line)
                        line = ""
                        width = 0
                    end
                    if ____exports.TextMetrics:canBreakWords(token, style.breakWords) then
                        local characters = ____exports.TextMetrics:wordWrapSplit(token)
                        do
                            local j = 0
                            while j < #characters do
                                local char = characters[j + 1]
                                local lastChar = char
                                local k = 1
                                while characters[j + k + 1] do
                                    local nextChar = characters[j + k + 1]
                                    if not ____exports.TextMetrics:canBreakChars(
                                        lastChar,
                                        nextChar,
                                        token,
                                        j,
                                        style.breakWords
                                    ) then
                                        char = char .. nextChar
                                    else
                                        break
                                    end
                                    lastChar = nextChar
                                    k = k + 1
                                end
                                j = j + (k - 1)
                                local characterWidth = ____exports.TextMetrics:getFromCache(char, letterSpacing, cache, context)
                                if characterWidth + width > wordWrapWidth then
                                    lines = lines .. ____exports.TextMetrics:addLine(line)
                                    canPrependSpaces = false
                                    line = ""
                                    width = 0
                                end
                                line = line .. char
                                width = width + characterWidth
                                j = j + 1
                            end
                        end
                    else
                        if #line > 0 then
                            lines = lines .. ____exports.TextMetrics:addLine(line)
                            line = ""
                            width = 0
                        end
                        local isLastToken = i == #tokens - 1
                        lines = lines .. ____exports.TextMetrics:addLine(token, not isLastToken)
                        canPrependSpaces = false
                        line = ""
                        width = 0
                    end
                else
                    if tokenWidth + width > wordWrapWidth then
                        canPrependSpaces = false
                        lines = lines .. ____exports.TextMetrics:addLine(line)
                        line = ""
                        width = 0
                    end
                    if #line > 0 or not ____exports.TextMetrics:isBreakingSpace(token) or canPrependSpaces then
                        line = line .. token
                        width = width + tokenWidth
                    end
                end
            end
            ::__continue24::
            i = i + 1
        end
    end
    lines = lines .. ____exports.TextMetrics:addLine(line, false)
    return lines
end
function TextMetrics.addLine(self, line, newLine)
    if newLine == nil then
        newLine = true
    end
    line = ____exports.TextMetrics:trimRight(line)
    line = newLine and line .. "\n" or line
    return line
end
function TextMetrics.getFromCache(self, key, letterSpacing, cache, context)
    local width = cache[key]
    if type(width) ~= "number" then
        width = ____exports.TextMetrics:_measureText(key, letterSpacing, context) + letterSpacing
        cache[key] = width
    end
    return width
end
function TextMetrics.collapseSpaces(self, whiteSpace)
    return whiteSpace == "normal" or whiteSpace == "pre-line"
end
function TextMetrics.collapseNewlines(self, whiteSpace)
    return whiteSpace == "normal"
end
function TextMetrics.trimRight(self, text)
    if type(text) ~= "string" then
        return ""
    end
    do
        local i = #text - 1
        while i >= 0 do
            local char = __TS__StringAccess(text, i)
            if not ____exports.TextMetrics:isBreakingSpace(char) then
                break
            end
            text = string.sub(text, 1, -2)
            i = i - 1
        end
    end
    return text
end
function TextMetrics.isNewline(self, char)
    if type(char) ~= "string" then
        return false
    end
    return __TS__ArrayIncludes(
        ____exports.TextMetrics._newlines,
        string.byte(char, 1) or 0 / 0
    )
end
function TextMetrics.isBreakingSpace(self, char, _nextChar)
    if type(char) ~= "string" then
        return false
    end
    return __TS__ArrayIncludes(
        ____exports.TextMetrics._breakingSpaces,
        string.byte(char, 1) or 0 / 0
    )
end
function TextMetrics.tokenize(self, text)
    local tokens = {}
    local token = ""
    if type(text) ~= "string" then
        return tokens
    end
    do
        local i = 0
        while i < #text do
            do
                local char = __TS__StringAccess(text, i)
                local nextChar = __TS__StringAccess(text, i + 1)
                if ____exports.TextMetrics:isBreakingSpace(char, nextChar) or ____exports.TextMetrics:isNewline(char) then
                    if token ~= "" then
                        tokens[#tokens + 1] = token
                        token = ""
                    end
                    tokens[#tokens + 1] = char
                    goto __continue57
                end
                token = token .. char
            end
            ::__continue57::
            i = i + 1
        end
    end
    if token ~= "" then
        tokens[#tokens + 1] = token
    end
    return tokens
end
function TextMetrics.canBreakWords(self, _token, breakWords)
    return breakWords
end
function TextMetrics.canBreakChars(self, _char, _nextChar, _token, _index, _breakWords)
    return true
end
function TextMetrics.wordWrapSplit(self, token)
    return ____exports.TextMetrics:graphemeSegmenter(token)
end
function TextMetrics.measureFont(self, font)
    if ____exports.TextMetrics._fonts[font] then
        return ____exports.TextMetrics._fonts[font]
    end
    local context = ____exports.TextMetrics._context
    context.font = font
    local extents = context:getFontExtents()
    local properties = {ascent = extents.ascent, descent = extents.descent, fontSize = extents.ascent + extents.descent}
    ____exports.TextMetrics._fonts[font] = properties
    return properties
end
function TextMetrics.clearMetrics(self, font)
    if font then
        __TS__Delete(____exports.TextMetrics._fonts, font)
    else
        ____exports.TextMetrics._fonts = {}
    end
end
TextMetrics.METRICS_STRING = "|ÉqÅ"
TextMetrics.BASELINE_SYMBOL = "M"
TextMetrics.BASELINE_MULTIPLIER = 1.4
TextMetrics.HEIGHT_MULTIPLIER = 2
TextMetrics.graphemeSegmenter = (function()
    return function(____, s) return {__TS__Spread(s)} end
end)(nil)
TextMetrics.experimentalLetterSpacing = false
TextMetrics._fonts = {}
TextMetrics._newlines = {10, 13}
TextMetrics._breakingSpaces = {
    9,
    32,
    8192,
    8193,
    8194,
    8195,
    8196,
    8197,
    8198,
    8200,
    8201,
    8202,
    8287,
    12288
}
return ____exports
 end,
["text.Text"] = function(...) 
local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
local __TS__New = ____lualib.__TS__New
local __TS__SetDescriptor = ____lualib.__TS__SetDescriptor
local __TS__InstanceOf = ____lualib.__TS__InstanceOf
local __TS__ArrayIsArray = ____lualib.__TS__ArrayIsArray
local Error = ____lualib.Error
local RangeError = ____lualib.RangeError
local ReferenceError = ____lualib.ReferenceError
local SyntaxError = ____lualib.SyntaxError
local TypeError = ____lualib.TypeError
local URIError = ____lualib.URIError
local __TS__ObjectAssign = ____lualib.__TS__ObjectAssign
local ____exports = {}
local ____core = require("core.index")
local Rectangle = ____core.Rectangle
local settings = ____core.settings
local Texture = ____core.Texture
local utils = ____core.utils
local ____sprite = require("sprite.index")
local Sprite = ____sprite.Sprite
local ____TextMetrics = require("text.TextMetrics")
local TextMetrics = ____TextMetrics.TextMetrics
local ____TextStyle = require("text.TextStyle")
local TextStyle = ____TextStyle.TextStyle
local defaultDestroyOptions = {texture = true, children = false, baseTexture = true}
--- A Text Object will create a line or multiple lines of text.
-- 
-- The text is created using the [Canvas API](https://developer.mozilla.org/en-US/docs/Web/API/Canvas_API).
-- 
-- The primary advantage of this class over BitmapText is that you have great control over the style of the text,
-- which you can change at runtime.
-- 
-- The primary disadvantages is that each piece of text has it's own texture, which can use more memory.
-- When text changes, this texture has to be re-generated and re-uploaded to the GPU, taking up time.
-- 
-- To split a line you can use '\n' in your text string, or, on the `style` object,
-- change its `wordWrap` property to true and and give the `wordWrapWidth` property a value.
-- 
-- A Text can be created directly from a string and a style object,
-- which can be generated [here](https://pixijs.io/pixi-text-style).
-- 
-- @example import { Text } from 'pixi.js';
-- 
-- const text = new Text('This is a PixiJS text', {
--     fontFamily: 'Arial',
--     fontSize: 24,
--     fill: 0xff1010,
--     align: 'center',
-- });
-- @memberof PIXI
____exports.Text = __TS__Class()
local Text = ____exports.Text
Text.name = "Text"
__TS__ClassExtends(Text, Sprite)
function Text.prototype.____constructor(self, text, style)
    local canvas = settings.ADAPTER:createCanvas(3, 3)
    local texture = Texture:from(canvas)
    texture.orig = __TS__New(Rectangle)
    texture.trim = __TS__New(Rectangle)
    Sprite.prototype.____constructor(self, texture)
    self.canvas = canvas
    self.context = canvas:getContext("2d")
    self._resolution = ____exports.Text.defaultResolution or settings.RESOLUTION
    self._autoResolution = ____exports.Text.defaultAutoResolution
    self._text = nil
    self._style = nil
    self._styleListener = nil
    self._font = ""
    self.text = text or ""
    self.style = style or ({})
    self.localStyleID = -1
    self.dirty = false
end
__TS__SetDescriptor(
    Text.prototype,
    "width",
    {
        get = function(self)
            self:updateText(true)
            return math.abs(self.scale.x) * self._texture.orig.width
        end,
        set = function(self, value)
            self:updateText(true)
            local s = utils:sign(self.scale.x) or 1
            self.scale.x = s * value / self._texture.orig.width
            self._width = value
        end
    },
    true
)
__TS__SetDescriptor(
    Text.prototype,
    "height",
    {
        get = function(self)
            self:updateText(true)
            return math.abs(self.scale.y) * self._texture.orig.height
        end,
        set = function(self, value)
            self:updateText(true)
            local s = utils:sign(self.scale.y) or 1
            self.scale.y = s * value / self._texture.orig.height
            self._height = value
        end
    },
    true
)
__TS__SetDescriptor(
    Text.prototype,
    "style",
    {
        get = function(self)
            return self._style
        end,
        set = function(self, style)
            if __TS__InstanceOf(style, TextStyle) then
                self._style = style
            else
                self._style = __TS__New(TextStyle, style)
            end
            self.localStyleID = -1
            self.dirty = true
        end
    },
    true
)
__TS__SetDescriptor(
    Text.prototype,
    "text",
    {
        get = function(self)
            return self._text
        end,
        set = function(self, text)
            text = (text == nil or text == nil) and "" or text
            text = type(text) == "number" and tostring(text) or text
            if self._text == text then
                return
            end
            self._text = text
            self.dirty = true
        end
    },
    true
)
__TS__SetDescriptor(
    Text.prototype,
    "resolution",
    {
        get = function(self)
            return self._resolution
        end,
        set = function(self, value)
            self._autoResolution = false
            if self._resolution == value then
                return
            end
            self._resolution = value
            self.dirty = true
        end
    },
    true
)
function Text.prototype.updateText(self, respectDirty)
    local style = self._style
    if self.localStyleID ~= style.styleID then
        self.dirty = true
        self.localStyleID = style.styleID
    end
    if not self.dirty and respectDirty then
        return
    end
    self._font = self._style:toFontString()
    local context = self.context
    local measured = TextMetrics:measureText(self._text or " ", self._style, self._style.wordWrap, self.canvas)
    local width = measured.width
    local height = measured.height
    local lines = measured.lines
    local lineHeight = measured.lineHeight
    local lineWidths = measured.lineWidths
    local maxLineWidth = measured.maxLineWidth
    local fontProperties = measured.fontProperties
    self.canvas:setDimensions(
        math.ceil(math.ceil(math.max(1, width) + style.padding * 2) * self._resolution),
        math.ceil(math.ceil(math.max(1, height) + style.padding * 2) * self._resolution)
    )
    context:scale(self._resolution, self._resolution)
    context:clearRect(0, 0, self.canvas.width, self.canvas.height)
    context.font = self._font
    context.lineWidth = style.strokeThickness
    context.lineJoin = style.lineJoin
    context.miterLimit = style.miterLimit
    local linePositionX
    local linePositionY
    local passesCount = style.dropShadow and 2 or 1
    do
        local i = 0
        while i < passesCount do
            local isShadowPass = style.dropShadow and i == 0
            local dsOffsetText = isShadowPass and math.ceil(math.max(1, height) + style.padding * 2) or 0
            if false then
            else
                context.fillStyle = self:_generateFillStyle(style, lines, measured)
                context.strokeStyle = style.stroke
            end
            local linePositionYShift = (lineHeight - fontProperties.fontSize) / 2
            if lineHeight - fontProperties.fontSize < 0 then
                linePositionYShift = 0
            end
            do
                local i = 0
                while i < #lines do
                    linePositionX = style.strokeThickness / 2
                    linePositionY = style.strokeThickness / 2 + i * lineHeight + fontProperties.ascent + linePositionYShift
                    if style.align == "right" then
                        linePositionX = linePositionX + (maxLineWidth - lineWidths[i + 1])
                    elseif style.align == "center" then
                        linePositionX = linePositionX + (maxLineWidth - lineWidths[i + 1]) / 2
                    end
                    if style.stroke ~= "" and style.stroke ~= 0 and style.strokeThickness ~= 0 then
                        self:drawLetterSpacing(lines[i + 1], linePositionX + style.padding, linePositionY + style.padding - dsOffsetText, true)
                    end
                    if style.fill ~= "" and style.fill ~= nil then
                        self:drawLetterSpacing(lines[i + 1], linePositionX + style.padding, linePositionY + style.padding - dsOffsetText)
                    end
                    i = i + 1
                end
            end
            i = i + 1
        end
    end
    self:updateTexture()
end
function Text.prototype.drawLetterSpacing(self, text, x, y, isStroke)
    if isStroke == nil then
        isStroke = false
    end
    local style = self._style
    local letterSpacing = style.letterSpacing
    local useExperimentalLetterSpacing = false
    if TextMetrics.experimentalLetterSpacingSupported then
        self.context.letterSpacing = "0px"
    end
    if letterSpacing == 0 or useExperimentalLetterSpacing then
        if isStroke then
            self.context:strokeText(text, x, y)
        else
            self.context:fillText(text, x, y)
        end
        return
    end
    local currentPosition = x
    local stringArray = TextMetrics:graphemeSegmenter(text)
    local previousWidth = self.context:measureText(text).width
    local currentWidth = 0
    do
        local i = 0
        while i < #stringArray do
            local currentChar = stringArray[i + 1]
            if isStroke then
                self.context:strokeText(currentChar, currentPosition, y)
            else
                self.context:fillText(currentChar, currentPosition, y)
            end
            local textStr = ""
            do
                local j = i + 1
                while j < #stringArray do
                    textStr = textStr .. stringArray[j + 1]
                    j = j + 1
                end
            end
            currentWidth = self.context:measureText(textStr).width
            currentPosition = currentPosition + (previousWidth - currentWidth + letterSpacing)
            previousWidth = currentWidth
            i = i + 1
        end
    end
end
function Text.prototype.updateTexture(self)
    local canvas = self.canvas
    if self._style.trim then
        local trimmed = utils:trimCanvas(canvas)
        if trimmed.data then
            canvas.width = trimmed.width
            canvas.height = trimmed.height
            self.context:putImageData(trimmed.data, 0, 0)
        end
    end
    local texture = self._texture
    local style = self._style
    local padding = style.trim and 0 or style.padding
    local baseTexture = texture.baseTexture
    if texture.trim then
        local ____texture_trim_1 = texture.trim
        local ____temp_0 = canvas.width / self._resolution
        texture._frame.width = ____temp_0
        ____texture_trim_1.width = ____temp_0
        local ____texture_trim_3 = texture.trim
        local ____temp_2 = canvas.height / self._resolution
        texture._frame.height = ____temp_2
        ____texture_trim_3.height = ____temp_2
        texture.trim.x = -padding
        texture.trim.y = -padding
    end
    texture.orig.width = texture._frame.width - padding * 2
    texture.orig.height = texture._frame.height - padding * 2
    self:_onTextureUpdate()
    baseTexture:setRealSize(canvas.width, canvas.height, self._resolution)
    self.dirty = false
end
function Text.prototype._renderCanvas(self, renderer)
    if self._autoResolution and self._resolution ~= renderer.resolution then
        self._resolution = renderer.resolution
        self.dirty = true
    end
    self:updateText(true)
    Sprite.prototype._renderCanvas(self, renderer)
end
function Text.prototype.updateTransform(self)
    self:updateText(true)
    Sprite.prototype.updateTransform(self)
end
function Text.prototype.getBounds(self, skipUpdate, rect)
    self:updateText(true)
    if self._textureID == -1 then
        skipUpdate = false
    end
    return Sprite.prototype.getBounds(self, skipUpdate, rect)
end
function Text.prototype.getLocalBounds(self, rect)
    self:updateText(true)
    return Sprite.prototype.getLocalBounds(self, rect)
end
function Text.prototype._calculateBounds(self)
    self:calculateVertices()
    self._bounds:addQuad(self.vertexData)
end
function Text.prototype._generateFillStyle(self, style, lines, metrics)
    local fillStyle = style.fill
    if not __TS__ArrayIsArray(fillStyle) then
        return fillStyle
    elseif #fillStyle == 1 then
        return fillStyle[1]
    end
    error(
        __TS__New(Error, "Gradient style unimplemented"),
        0
    )
end
function Text.prototype.destroy(self, options)
    if type(options) == "boolean" then
        options = {children = options}
    end
    options = __TS__ObjectAssign({}, defaultDestroyOptions, options)
    Sprite.prototype.destroy(self, options)
    self.context = nil
    self.canvas = nil
    self._style = nil
end
Text.defaultAutoResolution = true
return ____exports
 end,
["text.index"] = function(...) 
--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
local ____exports = {}
do
    local ____export = require("text.const")
    for ____exportKey, ____exportValue in pairs(____export) do
        if ____exportKey ~= "default" then
            ____exports[____exportKey] = ____exportValue
        end
    end
end
do
    local ____export = require("text.Text")
    for ____exportKey, ____exportValue in pairs(____export) do
        if ____exportKey ~= "default" then
            ____exports[____exportKey] = ____exportValue
        end
    end
end
do
    local ____export = require("text.TextMetrics")
    for ____exportKey, ____exportValue in pairs(____export) do
        if ____exportKey ~= "default" then
            ____exports[____exportKey] = ____exportValue
        end
    end
end
do
    local ____export = require("text.TextStyle")
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
require("setup")
require("typedarray.index")
require("graphics.index")
local h = require("kui.legacy")
local ____core = require("core.index")
local Renderer = ____core.Renderer
local ____display = require("display.index")
local Container = ____display.Container
local ____graphics = require("graphics.index")
local Graphics = ____graphics.Graphics
local ____text = require("text.index")
local Text = ____text.Text
function ____exports.setup(self)
    local renderer = __TS__New(Renderer, {width = 150, height = 80})
    local stage = __TS__New(Container)
    local content = stage:addChild(__TS__New(Graphics))
    content.x = 10
    content.y = 10
    content:beginFill(5873407)
    content:drawRoundedRect(
        0,
        0,
        50,
        10,
        5
    )
    content:endFill()
    local text = stage:addChild(__TS__New(Text, "Hello world", {fontSize = 12, fill = 16777215}))
    text.x = 10
    text.y = 20
    renderer:render(stage)
    h.setup()
    h.add_image(renderer.canvasContext.rootContext.surface, {buffer = 0, row = 0, col = 0})
end
return ____exports
 end,
["setup"] = function(...) 
--
-- setup.lua
--

local bit = 'bit'
_G.bit = require(bit)
 end,
["colord.colorModels.cmyk"] = function(...) 
local ____lualib = require("lualib_bundle")
local __TS__Number = ____lualib.__TS__Number
local __TS__NumberIsNaN = ____lualib.__TS__NumberIsNaN
local ____exports = {}
local ____constants = require("colord.constants")
local ALPHA_PRECISION = ____constants.ALPHA_PRECISION
local ____helpers = require("colord.helpers")
local clamp = ____helpers.clamp
local isPresent = ____helpers.isPresent
local round = ____helpers.round
--- Clamps the CMYK color object values.
____exports.clampCmyka = function(____, cmyka) return {
    c = clamp(nil, cmyka.c, 0, 100),
    m = clamp(nil, cmyka.m, 0, 100),
    y = clamp(nil, cmyka.y, 0, 100),
    k = clamp(nil, cmyka.k, 0, 100),
    a = clamp(nil, cmyka.a)
} end
--- Rounds the CMYK color object values.
____exports.roundCmyka = function(____, cmyka) return {
    c = round(nil, cmyka.c, 2),
    m = round(nil, cmyka.m, 2),
    y = round(nil, cmyka.y, 2),
    k = round(nil, cmyka.k, 2),
    a = round(nil, cmyka.a, ALPHA_PRECISION)
} end
--- Transforms the CMYK color object to RGB.
-- https://www.rapidtables.com/convert/color/cmyk-to-rgb.html
function ____exports.cmykaToRgba(self, cmyka)
    return {
        r = round(nil, 255 * (1 - cmyka.c / 100) * (1 - cmyka.k / 100)),
        g = round(nil, 255 * (1 - cmyka.m / 100) * (1 - cmyka.k / 100)),
        b = round(nil, 255 * (1 - cmyka.y / 100) * (1 - cmyka.k / 100)),
        a = cmyka.a
    }
end
--- Convert RGB Color Model object to CMYK.
-- https://www.rapidtables.com/convert/color/rgb-to-cmyk.html
function ____exports.rgbaToCmyka(self, rgba)
    local k = 1 - math.max(rgba.r / 255, rgba.g / 255, rgba.b / 255)
    local c = (1 - rgba.r / 255 - k) / (1 - k)
    local m = (1 - rgba.g / 255 - k) / (1 - k)
    local y = (1 - rgba.b / 255 - k) / (1 - k)
    return {
        c = __TS__NumberIsNaN(__TS__Number(c)) and 0 or round(nil, c * 100),
        m = __TS__NumberIsNaN(__TS__Number(m)) and 0 or round(nil, m * 100),
        y = __TS__NumberIsNaN(__TS__Number(y)) and 0 or round(nil, y * 100),
        k = round(nil, k * 100),
        a = rgba.a
    }
end
--- Parses the CMYK color object into RGB.
function ____exports.parseCmyka(self, ____bindingPattern0)
    local a
    local k
    local y
    local m
    local c
    c = ____bindingPattern0.c
    m = ____bindingPattern0.m
    y = ____bindingPattern0.y
    k = ____bindingPattern0.k
    a = ____bindingPattern0.a
    if a == nil then
        a = 1
    end
    if not isPresent(nil, c) or not isPresent(nil, m) or not isPresent(nil, y) or not isPresent(nil, k) then
        return nil
    end
    local cmyk = ____exports.clampCmyka(
        nil,
        {
            c = __TS__Number(c),
            m = __TS__Number(m),
            y = __TS__Number(y),
            k = __TS__Number(k),
            a = __TS__Number(a)
        }
    )
    return ____exports.cmykaToRgba(nil, cmyk)
end
return ____exports
 end,
["colord.colorModels.cmykString"] = function(...) 
local ____lualib = require("lualib_bundle")
local Error = ____lualib.Error
local RangeError = ____lualib.RangeError
local ReferenceError = ____lualib.ReferenceError
local SyntaxError = ____lualib.SyntaxError
local TypeError = ____lualib.TypeError
local URIError = ____lualib.URIError
local __TS__New = ____lualib.__TS__New
local ____exports = {}
local ____cmyk = require("colord.colorModels.cmyk")
local rgbaToCmyka = ____cmyk.rgbaToCmyka
local roundCmyka = ____cmyk.roundCmyka
--- Parses a valid CMYK CSS color function/string
-- https://www.w3.org/TR/css-color-4/#device-cmyk
____exports.parseCmykaString = function(____, input)
    error(
        __TS__New(Error, "unimplemented"),
        0
    )
end
function ____exports.rgbaToCmykaString(self, rgb)
    local ____roundCmyka_result_0 = roundCmyka(
        nil,
        rgbaToCmyka(nil, rgb)
    )
    local c = ____roundCmyka_result_0.c
    local m = ____roundCmyka_result_0.m
    local y = ____roundCmyka_result_0.y
    local k = ____roundCmyka_result_0.k
    local a = ____roundCmyka_result_0.a
    return a < 1 and ((((((((("device-cmyk(" .. tostring(c)) .. "% ") .. tostring(m)) .. "% ") .. tostring(y)) .. "% ") .. tostring(k)) .. "% / ") .. tostring(a)) .. ")" or ((((((("device-cmyk(" .. tostring(c)) .. "% ") .. tostring(m)) .. "% ") .. tostring(y)) .. "% ") .. tostring(k)) .. "%)"
end
return ____exports
 end,
["colord.colorModels.hwb"] = function(...) 
local ____lualib = require("lualib_bundle")
local __TS__Number = ____lualib.__TS__Number
local ____exports = {}
local ____constants = require("colord.constants")
local ALPHA_PRECISION = ____constants.ALPHA_PRECISION
local ____helpers = require("colord.helpers")
local clamp = ____helpers.clamp
local clampHue = ____helpers.clampHue
local round = ____helpers.round
local isPresent = ____helpers.isPresent
local ____hsv = require("colord.colorModels.hsv")
local hsvaToRgba = ____hsv.hsvaToRgba
local rgbaToHsva = ____hsv.rgbaToHsva
____exports.clampHwba = function(____, hwba) return {
    h = clampHue(nil, hwba.h),
    w = clamp(nil, hwba.w, 0, 100),
    b = clamp(nil, hwba.b, 0, 100),
    a = clamp(nil, hwba.a)
} end
____exports.roundHwba = function(____, hwba) return {
    h = round(nil, hwba.h),
    w = round(nil, hwba.w),
    b = round(nil, hwba.b),
    a = round(nil, hwba.a, ALPHA_PRECISION)
} end
____exports.rgbaToHwba = function(____, rgba)
    local ____rgbaToHsva_result_0 = rgbaToHsva(nil, rgba)
    local h = ____rgbaToHsva_result_0.h
    local w = math.min(rgba.r, rgba.g, rgba.b) / 255 * 100
    local b = 100 - math.max(rgba.r, rgba.g, rgba.b) / 255 * 100
    return {h = h, w = w, b = b, a = rgba.a}
end
____exports.hwbaToRgba = function(____, hwba)
    return hsvaToRgba(nil, {h = hwba.h, s = hwba.b == 100 and 0 or 100 - hwba.w / (100 - hwba.b) * 100, v = 100 - hwba.b, a = hwba.a})
end
____exports.parseHwba = function(____, ____bindingPattern0)
    local a
    local b
    local w
    local h
    h = ____bindingPattern0.h
    w = ____bindingPattern0.w
    b = ____bindingPattern0.b
    a = ____bindingPattern0.a
    if a == nil then
        a = 1
    end
    if not isPresent(nil, h) or not isPresent(nil, w) or not isPresent(nil, b) then
        return nil
    end
    local hwba = ____exports.clampHwba(
        nil,
        {
            h = __TS__Number(h),
            w = __TS__Number(w),
            b = __TS__Number(b),
            a = __TS__Number(a)
        }
    )
    return ____exports.hwbaToRgba(nil, hwba)
end
return ____exports
 end,
["colord.colorModels.hwbString"] = function(...) 
local ____lualib = require("lualib_bundle")
local Error = ____lualib.Error
local RangeError = ____lualib.RangeError
local ReferenceError = ____lualib.ReferenceError
local SyntaxError = ____lualib.SyntaxError
local TypeError = ____lualib.TypeError
local URIError = ____lualib.URIError
local __TS__New = ____lualib.__TS__New
local ____exports = {}
local ____hwb = require("colord.colorModels.hwb")
local rgbaToHwba = ____hwb.rgbaToHwba
local roundHwba = ____hwb.roundHwba
--- Parses a valid HWB[A] CSS color function/string
-- https://www.w3.org/TR/css-color-4/#the-hwb-notation
____exports.parseHwbaString = function(____, input)
    error(
        __TS__New(Error, "unimplemented"),
        0
    )
end
____exports.rgbaToHwbaString = function(____, rgba)
    local ____roundHwba_result_0 = roundHwba(
        nil,
        rgbaToHwba(nil, rgba)
    )
    local h = ____roundHwba_result_0.h
    local w = ____roundHwba_result_0.w
    local b = ____roundHwba_result_0.b
    local a = ____roundHwba_result_0.a
    return a < 1 and ((((((("hwb(" .. tostring(h)) .. " ") .. tostring(w)) .. "% ") .. tostring(b)) .. "% / ") .. tostring(a)) .. ")" or ((((("hwb(" .. tostring(h)) .. " ") .. tostring(w)) .. "% ") .. tostring(b)) .. "%)"
end
return ____exports
 end,
["colord.colorModels.xyz"] = function(...) 
local ____lualib = require("lualib_bundle")
local __TS__Number = ____lualib.__TS__Number
local ____exports = {}
local ____constants = require("colord.constants")
local ALPHA_PRECISION = ____constants.ALPHA_PRECISION
local ____helpers = require("colord.helpers")
local clamp = ____helpers.clamp
local isPresent = ____helpers.isPresent
local round = ____helpers.round
local ____rgb = require("colord.colorModels.rgb")
local clampRgba = ____rgb.clampRgba
local linearizeRgbChannel = ____rgb.linearizeRgbChannel
local unlinearizeRgbChannel = ____rgb.unlinearizeRgbChannel
____exports.D50 = {x = 96.422, y = 100, z = 82.521}
--- Limits XYZ axis values assuming XYZ is relative to D50.
____exports.clampXyza = function(____, xyza) return {
    x = clamp(nil, xyza.x, 0, ____exports.D50.x),
    y = clamp(nil, xyza.y, 0, ____exports.D50.y),
    z = clamp(nil, xyza.z, 0, ____exports.D50.z),
    a = clamp(nil, xyza.a)
} end
____exports.roundXyza = function(____, xyza) return {
    x = round(nil, xyza.x, 2),
    y = round(nil, xyza.y, 2),
    z = round(nil, xyza.z, 2),
    a = round(nil, xyza.a, ALPHA_PRECISION)
} end
____exports.parseXyza = function(____, ____bindingPattern0)
    local a
    local z
    local y
    local x
    x = ____bindingPattern0.x
    y = ____bindingPattern0.y
    z = ____bindingPattern0.z
    a = ____bindingPattern0.a
    if a == nil then
        a = 1
    end
    if not isPresent(nil, x) or not isPresent(nil, y) or not isPresent(nil, z) then
        return nil
    end
    local xyza = ____exports.clampXyza(
        nil,
        {
            x = __TS__Number(x),
            y = __TS__Number(y),
            z = __TS__Number(z),
            a = __TS__Number(a)
        }
    )
    return ____exports.xyzaToRgba(nil, xyza)
end
--- Performs Bradford chromatic adaptation from D65 to D50
____exports.adaptXyzaToD50 = function(____, xyza) return {x = xyza.x * 1.0478112 + xyza.y * 0.0228866 + xyza.z * -0.050127, y = xyza.x * 0.0295424 + xyza.y * 0.9904844 + xyza.z * -0.0170491, z = xyza.x * -0.0092345 + xyza.y * 0.0150436 + xyza.z * 0.7521316, a = xyza.a} end
--- Performs Bradford chromatic adaptation from D50 to D65
____exports.adaptXyzToD65 = function(____, xyza) return {x = xyza.x * 0.9555766 + xyza.y * -0.0230393 + xyza.z * 0.0631636, y = xyza.x * -0.0282895 + xyza.y * 1.0099416 + xyza.z * 0.0210077, z = xyza.x * 0.0122982 + xyza.y * -0.020483 + xyza.z * 1.3299098} end
--- Converts an CIE XYZ color (D50) to RGBA color space (D65)
-- https://www.w3.org/TR/css-color-4/#color-conversion-code
____exports.xyzaToRgba = function(____, sourceXyza)
    local xyz = ____exports.adaptXyzToD65(nil, sourceXyza)
    return clampRgba(
        nil,
        {
            r = unlinearizeRgbChannel(nil, 0.032404542 * xyz.x - 0.015371385 * xyz.y - 0.004985314 * xyz.z),
            g = unlinearizeRgbChannel(nil, -0.00969266 * xyz.x + 0.018760108 * xyz.y + 0.00041556 * xyz.z),
            b = unlinearizeRgbChannel(nil, 0.000556434 * xyz.x - 0.002040259 * xyz.y + 0.010572252 * xyz.z),
            a = sourceXyza.a
        }
    )
end
--- Converts an RGB color (D65) to CIE XYZ (D50)
-- https://image-engineering.de/library/technotes/958-how-to-convert-between-srgb-and-ciexyz
____exports.rgbaToXyza = function(____, rgba)
    local sRed = linearizeRgbChannel(nil, rgba.r)
    local sGreen = linearizeRgbChannel(nil, rgba.g)
    local sBlue = linearizeRgbChannel(nil, rgba.b)
    local xyza = {x = (sRed * 0.4124564 + sGreen * 0.3575761 + sBlue * 0.1804375) * 100, y = (sRed * 0.2126729 + sGreen * 0.7151522 + sBlue * 0.072175) * 100, z = (sRed * 0.0193339 + sGreen * 0.119192 + sBlue * 0.9503041) * 100, a = rgba.a}
    return ____exports.clampXyza(
        nil,
        ____exports.adaptXyzaToD50(nil, xyza)
    )
end
return ____exports
 end,
["colord.colorModels.lab"] = function(...) 
local ____lualib = require("lualib_bundle")
local __TS__Number = ____lualib.__TS__Number
local ____exports = {}
local ____constants = require("colord.constants")
local ALPHA_PRECISION = ____constants.ALPHA_PRECISION
local ____helpers = require("colord.helpers")
local clamp = ____helpers.clamp
local isPresent = ____helpers.isPresent
local round = ____helpers.round
local ____xyz = require("colord.colorModels.xyz")
local D50 = ____xyz.D50
local rgbaToXyza = ____xyz.rgbaToXyza
local xyzaToRgba = ____xyz.xyzaToRgba
local e = 216 / 24389
local k = 24389 / 27
local function cbrt(self, x)
    return x ^ (1 / 3)
end
--- Clamps LAB axis values as defined in CSS Color Level 4 specs.
-- https://www.w3.org/TR/css-color-4/#specifying-lab-lch
____exports.clampLaba = function(____, laba) return {
    l = clamp(nil, laba.l, 0, 400),
    a = laba.a,
    b = laba.b,
    alpha = clamp(nil, laba.alpha)
} end
____exports.roundLaba = function(____, laba) return {
    l = round(nil, laba.l, 2),
    a = round(nil, laba.a, 2),
    b = round(nil, laba.b, 2),
    alpha = round(nil, laba.alpha, ALPHA_PRECISION)
} end
____exports.parseLaba = function(____, ____bindingPattern0)
    local alpha
    local b
    local a
    local l
    l = ____bindingPattern0.l
    a = ____bindingPattern0.a
    b = ____bindingPattern0.b
    alpha = ____bindingPattern0.alpha
    if alpha == nil then
        alpha = 1
    end
    if not isPresent(nil, l) or not isPresent(nil, a) or not isPresent(nil, b) then
        return nil
    end
    local laba = ____exports.clampLaba(
        nil,
        {
            l = __TS__Number(l),
            a = __TS__Number(a),
            b = __TS__Number(b),
            alpha = __TS__Number(alpha)
        }
    )
    return ____exports.labaToRgba(nil, laba)
end
--- Performs RGB → CIEXYZ → LAB color conversion
-- https://www.w3.org/TR/css-color-4/#color-conversion-code
____exports.rgbaToLaba = function(____, rgba)
    local xyza = rgbaToXyza(nil, rgba)
    local x = xyza.x / D50.x
    local y = xyza.y / D50.y
    local z = xyza.z / D50.z
    x = x > e and cbrt(nil, x) or (k * x + 16) / 116
    y = y > e and cbrt(nil, y) or (k * y + 16) / 116
    z = z > e and cbrt(nil, z) or (k * z + 16) / 116
    return {l = 116 * y - 16, a = 500 * (x - y), b = 200 * (y - z), alpha = xyza.a}
end
--- Performs LAB → CIEXYZ → RGB color conversion
-- https://www.w3.org/TR/css-color-4/#color-conversion-code
____exports.labaToRgba = function(____, laba)
    local y = (laba.l + 16) / 116
    local x = laba.a / 500 + y
    local z = y - laba.b / 200
    return xyzaToRgba(nil, {x = (x ^ 3 > e and x ^ 3 or (116 * x - 16) / k) * D50.x, y = (laba.l > k * e and ((laba.l + 16) / 116) ^ 3 or laba.l / k) * D50.y, z = (z ^ 3 > e and z ^ 3 or (116 * z - 16) / k) * D50.z, a = laba.alpha})
end
return ____exports
 end,
["colord.colorModels.lch"] = function(...) 
local ____lualib = require("lualib_bundle")
local __TS__Number = ____lualib.__TS__Number
local ____exports = {}
local ____constants = require("colord.constants")
local ALPHA_PRECISION = ____constants.ALPHA_PRECISION
local ____helpers = require("colord.helpers")
local clamp = ____helpers.clamp
local clampHue = ____helpers.clampHue
local isPresent = ____helpers.isPresent
local round = ____helpers.round
local ____lab = require("colord.colorModels.lab")
local labaToRgba = ____lab.labaToRgba
local rgbaToLaba = ____lab.rgbaToLaba
--- Limits LCH axis values.
-- https://www.w3.org/TR/css-color-4/#specifying-lab-lch
-- https://lea.verou.me/2020/04/lch-colors-in-css-what-why-and-how/#how-does-lch-work
____exports.clampLcha = function(____, laba) return {
    l = clamp(nil, laba.l, 0, 100),
    c = laba.c,
    h = clampHue(nil, laba.h),
    a = laba.a
} end
____exports.roundLcha = function(____, laba) return {
    l = round(nil, laba.l, 2),
    c = round(nil, laba.c, 2),
    h = round(nil, laba.h, 2),
    a = round(nil, laba.a, ALPHA_PRECISION)
} end
____exports.parseLcha = function(____, ____bindingPattern0)
    local a
    local h
    local c
    local l
    l = ____bindingPattern0.l
    c = ____bindingPattern0.c
    h = ____bindingPattern0.h
    a = ____bindingPattern0.a
    if a == nil then
        a = 1
    end
    if not isPresent(nil, l) or not isPresent(nil, c) or not isPresent(nil, h) then
        return nil
    end
    local lcha = ____exports.clampLcha(
        nil,
        {
            l = __TS__Number(l),
            c = __TS__Number(c),
            h = __TS__Number(h),
            a = __TS__Number(a)
        }
    )
    return ____exports.lchaToRgba(nil, lcha)
end
--- Performs RGB → CIEXYZ → CIELAB → CIELCH color conversion
-- https://www.w3.org/TR/css-color-4/#color-conversion-code
____exports.rgbaToLcha = function(____, rgba)
    local laba = rgbaToLaba(nil, rgba)
    local a = round(nil, laba.a, 3)
    local b = round(nil, laba.b, 3)
    local hue = 180 * (math.atan2(b, a) / math.pi)
    return {
        l = laba.l,
        c = math.sqrt(a * a + b * b),
        h = hue < 0 and hue + 360 or hue,
        a = laba.alpha
    }
end
--- Performs CIELCH → CIELAB → CIEXYZ → RGB color conversion
-- https://www.w3.org/TR/css-color-4/#color-conversion-code
____exports.lchaToRgba = function(____, lcha)
    return labaToRgba(
        nil,
        {
            l = lcha.l,
            a = lcha.c * math.cos(lcha.h * math.pi / 180),
            b = lcha.c * math.sin(lcha.h * math.pi / 180),
            alpha = lcha.a
        }
    )
end
return ____exports
 end,
["colord.colorModels.lchString"] = function(...) 
local ____lualib = require("lualib_bundle")
local Error = ____lualib.Error
local RangeError = ____lualib.RangeError
local ReferenceError = ____lualib.ReferenceError
local SyntaxError = ____lualib.SyntaxError
local TypeError = ____lualib.TypeError
local URIError = ____lualib.URIError
local __TS__New = ____lualib.__TS__New
local ____exports = {}
local ____lch = require("colord.colorModels.lch")
local rgbaToLcha = ____lch.rgbaToLcha
local roundLcha = ____lch.roundLcha
--- Parses a valid LCH CSS color function/string
-- https://www.w3.org/TR/css-color-4/#specifying-lab-lch
____exports.parseLchaString = function(____, input)
    error(
        __TS__New(Error, "unimplemented"),
        0
    )
end
____exports.rgbaToLchaString = function(____, rgba)
    local ____roundLcha_result_0 = roundLcha(
        nil,
        rgbaToLcha(nil, rgba)
    )
    local l = ____roundLcha_result_0.l
    local c = ____roundLcha_result_0.c
    local h = ____roundLcha_result_0.h
    local a = ____roundLcha_result_0.a
    return a < 1 and ((((((("lch(" .. tostring(l)) .. "% ") .. tostring(c)) .. " ") .. tostring(h)) .. " / ") .. tostring(a)) .. ")" or ((((("lch(" .. tostring(l)) .. "% ") .. tostring(c)) .. " ") .. tostring(h)) .. ")"
end
return ____exports
 end,
["colord.get.getLuminance"] = function(...) 
--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
local ____exports = {}
local ____rgb = require("colord.colorModels.rgb")
local linearizeRgbChannel = ____rgb.linearizeRgbChannel
--- Returns the perceived luminance of a color [0-1] according to WCAG 2.0.
-- https://www.w3.org/TR/WCAG20/#relativeluminancedef
____exports.getLuminance = function(____, rgba)
    local sRed = linearizeRgbChannel(nil, rgba.r)
    local sGreen = linearizeRgbChannel(nil, rgba.g)
    local sBlue = linearizeRgbChannel(nil, rgba.b)
    return 0.2126 * sRed + 0.7152 * sGreen + 0.0722 * sBlue
end
return ____exports
 end,
["colord.get.getContrast"] = function(...) 
--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
local ____exports = {}
local ____getLuminance = require("colord.get.getLuminance")
local getLuminance = ____getLuminance.getLuminance
--- Returns a contrast ratio for a color pair [1-21].
-- http://www.w3.org/TR/WCAG20/#contrast-ratiodef
____exports.getContrast = function(____, rgb1, rgb2)
    local l1 = getLuminance(nil, rgb1)
    local l2 = getLuminance(nil, rgb2)
    return l1 > l2 and (l1 + 0.05) / (l2 + 0.05) or (l2 + 0.05) / (l1 + 0.05)
end
return ____exports
 end,
["colord.get.getPerceivedDifference"] = function(...) 
--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
local ____exports = {}
--- Calculates the perceived color difference according to [Delta E2000](https://en.wikipedia.org/wiki/Color_difference#CIEDE2000).
-- 
-- ΔE - (Delta E, dE) The measure of change in visual perception of two given colors.
-- 
-- Delta E is a metric for understanding how the human eye perceives color difference.
-- The term delta comes from mathematics, meaning change in a variable or function.
-- The suffix E references the German word Empfindung, which broadly means sensation.
-- 
-- On a typical scale, the Delta E value will range from 0 to 100.
-- 
-- | Delta E | Perception                             |
-- |---------|----------------------------------------|
-- | <= 1.0  | Not perceptible by human eyes          |
-- | 1 - 2   | Perceptible through close observation  |
-- | 2 - 10  | Perceptible at a glance                |
-- | 11 - 49 | Colors are more similar than opposite  |
-- | 100     | Colors are exact opposite              |
-- 
-- [Source](http://www.brucelindbloom.com/index.html?Eqn_DeltaE_CIE2000.html)
-- [Read about Delta E](https://zschuessler.github.io/DeltaE/learn/#toc-delta-e-2000)
function ____exports.getDeltaE00(self, color1, color2)
    local ____color1_0 = color1
    local l1 = ____color1_0.l
    local a1 = ____color1_0.a
    local b1 = ____color1_0.b
    local ____color2_1 = color2
    local l2 = ____color2_1.l
    local a2 = ____color2_1.a
    local b2 = ____color2_1.b
    local rad2deg = 180 / math.pi
    local deg2rad = math.pi / 180
    local c1 = (a1 ^ 2 + b1 ^ 2) ^ 0.5
    local c2 = (a2 ^ 2 + b2 ^ 2) ^ 0.5
    local mc = (c1 + c2) / 2
    local ml = (l1 + l2) / 2
    local c7 = mc ^ 7
    local g = 0.5 * (1 - (c7 / (c7 + 25 ^ 7)) ^ 0.5)
    local a11 = a1 * (1 + g)
    local a22 = a2 * (1 + g)
    local c11 = (a11 ^ 2 + b1 ^ 2) ^ 0.5
    local c22 = (a22 ^ 2 + b2 ^ 2) ^ 0.5
    local mc1 = (c11 + c22) / 2
    local h1 = a11 == 0 and b1 == 0 and 0 or math.atan2(b1, a11) * rad2deg
    local h2 = a22 == 0 and b2 == 0 and 0 or math.atan2(b2, a22) * rad2deg
    if h1 < 0 then
        h1 = h1 + 360
    end
    if h2 < 0 then
        h2 = h2 + 360
    end
    local dh = h2 - h1
    local dhAbs = math.abs(h2 - h1)
    if dhAbs > 180 and h2 <= h1 then
        dh = dh + 360
    elseif dhAbs > 180 and h2 > h1 then
        dh = dh - 360
    end
    local H = h1 + h2
    if dhAbs <= 180 then
        H = H / 2
    else
        H = (h1 + h2 < 360 and H + 360 or H - 360) / 2
    end
    local T = 1 - 0.17 * math.cos(deg2rad * (H - 30)) + 0.24 * math.cos(deg2rad * 2 * H) + 0.32 * math.cos(deg2rad * (3 * H + 6)) - 0.2 * math.cos(deg2rad * (4 * H - 63))
    local dL = l2 - l1
    local dC = c22 - c11
    local dH = 2 * math.sin(deg2rad * dh / 2) * (c11 * c22) ^ 0.5
    local sL = 1 + 0.015 * (ml - 50) ^ 2 / (20 + (ml - 50) ^ 2) ^ 0.5
    local sC = 1 + 0.045 * mc1
    local sH = 1 + 0.015 * mc1 * T
    local dTheta = 30 * math.exp(-1 * ((H - 275) / 25) ^ 2)
    local Rc = 2 * (c7 / (c7 + 25 ^ 7)) ^ 0.5
    local Rt = -Rc * math.sin(deg2rad * 2 * dTheta)
    local kl = 1
    local kc = 1
    local kh = 1
    return ((dL / kl / sL) ^ 2 + (dC / kc / sC) ^ 2 + (dH / kh / sH) ^ 2 + Rt * dC * dH / (kc * sC * kh * sH)) ^ 0.5
end
return ____exports
 end,
["colord.manipulate.mix"] = function(...) 
--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
local ____exports = {}
local ____lab = require("colord.colorModels.lab")
local clampLaba = ____lab.clampLaba
local labaToRgba = ____lab.labaToRgba
local rgbaToLaba = ____lab.rgbaToLaba
____exports.mix = function(____, rgba1, rgba2, ratio)
    local laba1 = rgbaToLaba(nil, rgba1)
    local laba2 = rgbaToLaba(nil, rgba2)
    local mixture = clampLaba(nil, {l = laba1.l * (1 - ratio) + laba2.l * ratio, a = laba1.a * (1 - ratio) + laba2.a * ratio, b = laba1.b * (1 - ratio) + laba2.b * ratio, alpha = laba1.alpha * (1 - ratio) + laba2.alpha * ratio})
    return labaToRgba(nil, mixture)
end
return ____exports
 end,
["colord.plugins.a11y"] = function(...) 
local ____lualib = require("lualib_bundle")
local __TS__InstanceOf = ____lualib.__TS__InstanceOf
local __TS__New = ____lualib.__TS__New
local ____exports = {}
local ____getContrast = require("colord.get.getContrast")
local getContrast = ____getContrast.getContrast
local ____getLuminance = require("colord.get.getLuminance")
local getLuminance = ____getLuminance.getLuminance
local ____helpers = require("colord.helpers")
local round = ____helpers.round
local floor = ____helpers.floor
--- A plugin adding accessibility and color contrast utilities.
-- Follows Web Content Accessibility Guidelines 2.0.
-- https://www.w3.org/TR/WCAG20/
local function a11yPlugin(____, ColordClass)
    --- Returns WCAG text color contrast requirement.
    -- Read explanation here https://webaim.org/resources/contrastchecker/
    local function getMinimalContrast(____, ____bindingPattern0)
        local size
        local level
        level = ____bindingPattern0.level
        if level == nil then
            level = "AA"
        end
        size = ____bindingPattern0.size
        if size == nil then
            size = "normal"
        end
        if level == "AAA" and size == "normal" then
            return 7
        end
        if level == "AA" and size == "large" then
            return 3
        end
        return 4.5
    end
    ColordClass.prototype.luminance = function(self)
        return round(
            nil,
            getLuminance(nil, self.rgba),
            2
        )
    end
    ColordClass.prototype.contrast = function(self, color2)
        if color2 == nil then
            color2 = "#FFF"
        end
        local instance2 = __TS__InstanceOf(color2, ColordClass) and color2 or __TS__New(ColordClass, color2)
        return floor(
            nil,
            getContrast(
                nil,
                self.rgba,
                instance2:toRgb()
            ),
            2
        )
    end
    ColordClass.prototype.isReadable = function(self, color2, options)
        if color2 == nil then
            color2 = "#FFF"
        end
        if options == nil then
            options = {}
        end
        return self:contrast(color2) >= getMinimalContrast(nil, options)
    end
end
____exports.default = a11yPlugin
return ____exports
 end,
["colord.plugins.cmyk"] = function(...) 
--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
local ____exports = {}
local ____cmyk = require("colord.colorModels.cmyk")
local parseCmyka = ____cmyk.parseCmyka
local roundCmyka = ____cmyk.roundCmyka
local rgbaToCmyka = ____cmyk.rgbaToCmyka
local ____cmykString = require("colord.colorModels.cmykString")
local parseCmykaString = ____cmykString.parseCmykaString
local rgbaToCmykaString = ____cmykString.rgbaToCmykaString
--- A plugin adding support for CMYK color space.
-- https://lea.verou.me/2009/03/cmyk-colors-in-css-useful-or-useless/
-- https://en.wikipedia.org/wiki/CMYK_color_model
local function cmykPlugin(____, ColordClass, parsers)
    ColordClass.prototype.toCmyk = function(self)
        return roundCmyka(
            nil,
            rgbaToCmyka(nil, self.rgba)
        )
    end
    ColordClass.prototype.toCmykString = function(self)
        return rgbaToCmykaString(nil, self.rgba)
    end
    local ____parsers_object_0 = parsers.object
    ____parsers_object_0[#____parsers_object_0 + 1] = {parseCmyka, "cmyk"}
    local ____parsers_string_1 = parsers.string
    ____parsers_string_1[#____parsers_string_1 + 1] = {parseCmykaString, "cmyk"}
end
____exports.default = cmykPlugin
return ____exports
 end,
["colord.plugins.harmonies"] = function(...) 
local ____lualib = require("lualib_bundle")
local __TS__ArrayMap = ____lualib.__TS__ArrayMap
local ____exports = {}
--- A plugin adding functionality to generate harmony colors.
-- https://en.wikipedia.org/wiki/Harmony_(color)
local function harmoniesPlugin(____, ColordClass)
    --- Harmony colors are colors with particular hue shift of the original color.
    local hueShifts = {
        analogous = {-30, 0, 30},
        complementary = {0, 180},
        ["double-split-complementary"] = {
            -30,
            0,
            30,
            150,
            210
        },
        rectangle = {0, 60, 180, 240},
        tetradic = {0, 90, 180, 270},
        triadic = {0, 120, 240},
        ["split-complementary"] = {0, 150, 210}
    }
    ColordClass.prototype.harmonies = function(self, ____type)
        if ____type == nil then
            ____type = "complementary"
        end
        return __TS__ArrayMap(
            hueShifts[____type],
            function(____, shift) return self:rotate(shift) end
        )
    end
end
____exports.default = harmoniesPlugin
return ____exports
 end,
["colord.plugins.hwb"] = function(...) 
--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
local ____exports = {}
local ____hwb = require("colord.colorModels.hwb")
local parseHwba = ____hwb.parseHwba
local rgbaToHwba = ____hwb.rgbaToHwba
local roundHwba = ____hwb.roundHwba
local ____hwbString = require("colord.colorModels.hwbString")
local parseHwbaString = ____hwbString.parseHwbaString
local rgbaToHwbaString = ____hwbString.rgbaToHwbaString
--- A plugin adding support for HWB (Hue-Whiteness-Blackness) color model.
-- https://en.wikipedia.org/wiki/HWB_color_model
-- https://www.w3.org/TR/css-color-4/#the-hwb-notation
local function hwbPlugin(____, ColordClass, parsers)
    ColordClass.prototype.toHwb = function(self)
        return roundHwba(
            nil,
            rgbaToHwba(nil, self.rgba)
        )
    end
    ColordClass.prototype.toHwbString = function(self)
        return rgbaToHwbaString(nil, self.rgba)
    end
    local ____parsers_string_0 = parsers.string
    ____parsers_string_0[#____parsers_string_0 + 1] = {parseHwbaString, "hwb"}
    local ____parsers_object_1 = parsers.object
    ____parsers_object_1[#____parsers_object_1 + 1] = {parseHwba, "hwb"}
end
____exports.default = hwbPlugin
return ____exports
 end,
["colord.plugins.lab"] = function(...) 
local ____lualib = require("lualib_bundle")
local __TS__InstanceOf = ____lualib.__TS__InstanceOf
local __TS__New = ____lualib.__TS__New
local ____exports = {}
local ____lab = require("colord.colorModels.lab")
local parseLaba = ____lab.parseLaba
local roundLaba = ____lab.roundLaba
local rgbaToLaba = ____lab.rgbaToLaba
local ____getPerceivedDifference = require("colord.get.getPerceivedDifference")
local getDeltaE00 = ____getPerceivedDifference.getDeltaE00
local ____helpers = require("colord.helpers")
local clamp = ____helpers.clamp
local round = ____helpers.round
--- A plugin adding support for CIELAB color space.
-- https://en.wikipedia.org/wiki/CIELAB_color_space
local function labPlugin(____, ColordClass, parsers)
    ColordClass.prototype.toLab = function(self)
        return roundLaba(
            nil,
            rgbaToLaba(nil, self.rgba)
        )
    end
    ColordClass.prototype.delta = function(self, color)
        if color == nil then
            color = "#FFF"
        end
        local compared = __TS__InstanceOf(color, ColordClass) and color or __TS__New(ColordClass, color)
        local delta = getDeltaE00(
            nil,
            self:toLab(),
            compared:toLab()
        ) / 100
        return clamp(
            nil,
            round(nil, delta, 3)
        )
    end
    local ____parsers_object_0 = parsers.object
    ____parsers_object_0[#____parsers_object_0 + 1] = {parseLaba, "lab"}
end
____exports.default = labPlugin
return ____exports
 end,
["colord.plugins.lch"] = function(...) 
--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
local ____exports = {}
local ____lch = require("colord.colorModels.lch")
local parseLcha = ____lch.parseLcha
local roundLcha = ____lch.roundLcha
local rgbaToLcha = ____lch.rgbaToLcha
local ____lchString = require("colord.colorModels.lchString")
local parseLchaString = ____lchString.parseLchaString
local rgbaToLchaString = ____lchString.rgbaToLchaString
--- A plugin adding support for CIELCH color space.
-- https://lea.verou.me/2020/04/lch-colors-in-css-what-why-and-how/
-- https://en.wikipedia.org/wiki/CIELAB_color_space#Cylindrical_model
local function lchPlugin(____, ColordClass, parsers)
    ColordClass.prototype.toLch = function(self)
        return roundLcha(
            nil,
            rgbaToLcha(nil, self.rgba)
        )
    end
    ColordClass.prototype.toLchString = function(self)
        return rgbaToLchaString(nil, self.rgba)
    end
    local ____parsers_string_0 = parsers.string
    ____parsers_string_0[#____parsers_string_0 + 1] = {parseLchaString, "lch"}
    local ____parsers_object_1 = parsers.object
    ____parsers_object_1[#____parsers_object_1 + 1] = {parseLcha, "lch"}
end
____exports.default = lchPlugin
return ____exports
 end,
["colord.plugins.minify"] = function(...) 
local ____lualib = require("lualib_bundle")
local __TS__StringSplit = ____lualib.__TS__StringSplit
local __TS__ParseInt = ____lualib.__TS__ParseInt
local __TS__StringReplace = ____lualib.__TS__StringReplace
local __TS__ObjectAssign = ____lualib.__TS__ObjectAssign
local ____exports = {}
local ____helpers = require("colord.helpers")
local round = ____helpers.round
--- A plugin adding a color minification utilities.
local function minifyPlugin(____, ColordClass)
    local function minifyHex(____, instance)
        local hex = instance:toHex()
        local alpha = instance:alpha()
        local ____, r1, r2, g1, g2, b1, b2, a1, a2 = unpack(__TS__StringSplit(hex, ""))
        if alpha > 0 and alpha < 1 and round(
            nil,
            __TS__ParseInt(a1 .. a2, 16) / 255,
            2
        ) ~= alpha then
            return nil
        end
        if r1 == r2 and g1 == g2 and b1 == b2 then
            if alpha == 1 then
                return (("#" .. r1) .. g1) .. b1
            elseif a1 == a2 then
                return ((("#" .. r1) .. g1) .. b1) .. a1
            end
        end
        return hex
    end
    local function findShortestString(____, variants)
        local shortest = variants[1]
        do
            local index = 1
            while index < #variants do
                if #variants[index + 1] < #shortest then
                    shortest = variants[index + 1]
                end
                index = index + 1
            end
        end
        return shortest
    end
    local function shortenNumber(____, number)
        if number > 0 and number < 1 then
            return __TS__StringReplace(
                tostring(number),
                "0.",
                "."
            )
        end
        return number
    end
    ColordClass.prototype.minify = function(self, options)
        if options == nil then
            options = {}
        end
        local rgb = self:toRgb()
        local r = shortenNumber(nil, rgb.r)
        local g = shortenNumber(nil, rgb.g)
        local b = shortenNumber(nil, rgb.b)
        local hsl = self:toHsl()
        local h = shortenNumber(nil, hsl.h)
        local s = shortenNumber(nil, hsl.s)
        local l = shortenNumber(nil, hsl.l)
        local a = shortenNumber(
            nil,
            self:alpha()
        )
        local defaults = {hex = true, rgb = true, hsl = true}
        local settings = __TS__ObjectAssign(defaults, options)
        local variants = {}
        if settings.hex and (a == 1 or settings.alphaHex) then
            local hex = minifyHex(nil, self)
            if hex then
                variants[#variants + 1] = hex
            end
        end
        if settings.rgb then
            variants[#variants + 1] = a == 1 and ((((("rgb(" .. tostring(r)) .. ",") .. tostring(g)) .. ",") .. tostring(b)) .. ")" or ((((((("rgba(" .. tostring(r)) .. ",") .. tostring(g)) .. ",") .. tostring(b)) .. ",") .. tostring(a)) .. ")"
        end
        if settings.hsl then
            variants[#variants + 1] = a == 1 and ((((("hsl(" .. tostring(h)) .. ",") .. tostring(s)) .. "%,") .. tostring(l)) .. "%)" or ((((((("hsla(" .. tostring(h)) .. ",") .. tostring(s)) .. "%,") .. tostring(l)) .. "%,") .. tostring(a)) .. ")"
        end
        if settings.transparent and r == 0 and g == 0 and b == 0 and a == 0 then
            variants[#variants + 1] = "transparent"
        elseif a == 1 and settings.name and type(self.toName) == "function" then
            local name = self:toName()
            if name then
                variants[#variants + 1] = name
            end
        end
        return findShortestString(nil, variants)
    end
end
____exports.default = minifyPlugin
return ____exports
 end,
["colord.plugins.mix"] = function(...) 
local ____lualib = require("lualib_bundle")
local __TS__InstanceOf = ____lualib.__TS__InstanceOf
local __TS__New = ____lualib.__TS__New
local ____exports = {}
local ____mix = require("colord.manipulate.mix")
local mix = ____mix.mix
--- A plugin adding a color mixing utilities.
local function mixPlugin(____, ColordClass)
    ColordClass.prototype.mix = function(self, color2, ratio)
        if ratio == nil then
            ratio = 0.5
        end
        local instance2 = __TS__InstanceOf(color2, ColordClass) and color2 or __TS__New(ColordClass, color2)
        local mixture = mix(
            nil,
            self:toRgb(),
            instance2:toRgb(),
            ratio
        )
        return __TS__New(ColordClass, mixture)
    end
    --- Generate a palette from mixing a source color with another.
    local function mixPalette(self, source, hex, count)
        if count == nil then
            count = 5
        end
        local palette = {}
        local step = 1 / (count - 1)
        do
            local i = 0
            while i <= count - 1 do
                palette[#palette + 1] = source:mix(hex, step * i)
                i = i + 1
            end
        end
        return palette
    end
    ColordClass.prototype.tints = function(self, count)
        return mixPalette(nil, self, "#fff", count)
    end
    ColordClass.prototype.shades = function(self, count)
        return mixPalette(nil, self, "#000", count)
    end
    ColordClass.prototype.tones = function(self, count)
        return mixPalette(nil, self, "#808080", count)
    end
end
____exports.default = mixPlugin
return ____exports
 end,
["colord.plugins.xyz"] = function(...) 
--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
local ____exports = {}
local ____xyz = require("colord.colorModels.xyz")
local parseXyza = ____xyz.parseXyza
local rgbaToXyza = ____xyz.rgbaToXyza
local roundXyza = ____xyz.roundXyza
--- A plugin adding support for CIE XYZ colorspace.
-- Wikipedia: https://en.wikipedia.org/wiki/CIE_1931_color_space
-- Helpful article: https://www.sttmedia.com/colormodel-xyz
local function xyzPlugin(____, ColordClass, parsers)
    ColordClass.prototype.toXyz = function(self)
        return roundXyza(
            nil,
            rgbaToXyza(nil, self.rgba)
        )
    end
    local ____parsers_object_0 = parsers.object
    ____parsers_object_0[#____parsers_object_0 + 1] = {parseXyza, "xyz"}
end
____exports.default = xyzPlugin
return ____exports
 end,
["core.batch.canUploadSameBuffer"] = function(...) 
--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
local ____exports = {}
--- Uploading the same buffer multiple times in a single frame can cause performance issues.
-- Apparent on iOS so only check for that at the moment
-- This check may become more complex if this issue pops up elsewhere.
-- 
-- @private
-- @returns `true` if the same buffer may be uploaded more than once.
function ____exports.canUploadSameBuffer(self)
    return true
end
return ____exports
 end,
["core.batch.maxRecommendedTextures"] = function(...) 
--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
local ____exports = {}
--- The maximum recommended texture units to use.
-- In theory the bigger the better, and for desktop we'll use as many as we can.
-- But some mobile devices slow down if there is to many branches in the shader.
-- So in practice there seems to be a sweet spot size that varies depending on the device.
-- 
-- In v4, all mobile devices were limited to 4 texture units because for this.
-- In v5, we allow all texture units to be used on modern Apple or Android devices.
-- 
-- @private
-- @param max
-- @returns The maximum recommended texture units to use.
function ____exports.maxRecommendedTextures(self, max)
    return max
end
return ____exports
 end,
["core.geometry.GeometrySystem"] = function(...) 
local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local ____exports = {}
local systems = require("core.systems")
--- System plugin to the renderer to manage geometry.
-- 
-- @memberof PIXI
____exports.GeometrySystem = __TS__Class()
local GeometrySystem = ____exports.GeometrySystem
GeometrySystem.name = "GeometrySystem"
function GeometrySystem.prototype.____constructor(self, renderer)
    self.renderer = renderer
    self._activeGeometry = nil
    self.hasVao = true
    self.hasInstance = true
    self.canUseUInt32ElementIndex = false
    self.managedGeometries = {}
end
function GeometrySystem.prototype.destroy(self)
    self.renderer = nil
end
GeometrySystem.systemName = "geometry"
systems:register(____exports.GeometrySystem.systemName, ____exports.GeometrySystem)
return ____exports
 end,
["core.geometry.ViewableBuffer"] = function(...) 
local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__New = ____lualib.__TS__New
local __TS__InstanceOf = ____lualib.__TS__InstanceOf
local __TS__SetDescriptor = ____lualib.__TS__SetDescriptor
local Error = ____lualib.Error
local RangeError = ____lualib.RangeError
local ReferenceError = ____lualib.ReferenceError
local SyntaxError = ____lualib.SyntaxError
local TypeError = ____lualib.TypeError
local URIError = ____lualib.URIError
local ____exports = {}
--- Flexible wrapper around `ArrayBuffer` that also provides typed array views on demand.
-- 
-- @memberof PIXI
____exports.ViewableBuffer = __TS__Class()
local ViewableBuffer = ____exports.ViewableBuffer
ViewableBuffer.name = "ViewableBuffer"
function ViewableBuffer.prototype.____constructor(self, sizeOrBuffer)
    self.size = 0
    self._int8View = nil
    self._uint8View = nil
    self._int16View = nil
    self._uint16View = nil
    self._int32View = nil
    if type(sizeOrBuffer) == "number" then
        self.rawBinaryData = __TS__New(ArrayBuffer, sizeOrBuffer)
    elseif __TS__InstanceOf(sizeOrBuffer, Uint8Array) then
        self.rawBinaryData = sizeOrBuffer.buffer
    else
        self.rawBinaryData = sizeOrBuffer
    end
    self.uint32View = __TS__New(Uint32Array, self.rawBinaryData)
    self.float32View = __TS__New(Float32Array, self.rawBinaryData)
end
__TS__SetDescriptor(
    ViewableBuffer.prototype,
    "int8View",
    {get = function(self)
        if not self._int8View then
            self._int8View = __TS__New(Int8Array, self.rawBinaryData)
        end
        return self._int8View
    end},
    true
)
__TS__SetDescriptor(
    ViewableBuffer.prototype,
    "uint8View",
    {get = function(self)
        if not self._uint8View then
            self._uint8View = __TS__New(Uint8Array, self.rawBinaryData)
        end
        return self._uint8View
    end},
    true
)
__TS__SetDescriptor(
    ViewableBuffer.prototype,
    "int16View",
    {get = function(self)
        if not self._int16View then
            self._int16View = __TS__New(Int16Array, self.rawBinaryData)
        end
        return self._int16View
    end},
    true
)
__TS__SetDescriptor(
    ViewableBuffer.prototype,
    "uint16View",
    {get = function(self)
        if not self._uint16View then
            self._uint16View = __TS__New(Uint16Array, self.rawBinaryData)
        end
        return self._uint16View
    end},
    true
)
__TS__SetDescriptor(
    ViewableBuffer.prototype,
    "int32View",
    {get = function(self)
        if not self._int32View then
            self._int32View = __TS__New(Int32Array, self.rawBinaryData)
        end
        return self._int32View
    end},
    true
)
function ViewableBuffer.prototype.view(self, ____type)
    return self[____type .. "View"]
end
function ViewableBuffer.prototype.destroy(self)
    self.rawBinaryData = nil
    self._int8View = nil
    self._uint8View = nil
    self._int16View = nil
    self._uint16View = nil
    self._int32View = nil
    self.uint32View = nil
    self.float32View = nil
end
function ViewableBuffer.sizeOf(self, ____type)
    repeat
        local ____switch19 = ____type
        local ____cond19 = ____switch19 == "int8" or ____switch19 == "uint8"
        if ____cond19 then
            return 1
        end
        ____cond19 = ____cond19 or (____switch19 == "int16" or ____switch19 == "uint16")
        if ____cond19 then
            return 2
        end
        ____cond19 = ____cond19 or (____switch19 == "int32" or ____switch19 == "uint32" or ____switch19 == "float32")
        if ____cond19 then
            return 4
        end
        do
            error(
                __TS__New(Error, ____type .. " isn't a valid view type"),
                0
            )
        end
    until true
end
return ____exports
 end,
}
return require("index", ...)
