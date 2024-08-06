local module = {}

function module:numberToBinary(numberw:number, AVal:string, BVal:string)
	AVal = AVal or "1"
	BVal = BVal or "0"
	local numDone = false
	local finishedNumber = {}
	local newNum = numberw
	repeat
		newNum /= 2
		local remainder = 0
		if math.floor(newNum) ~= newNum then
			remainder = 1
		end
		local floorNum = math.floor(newNum)
		newNum = floorNum
		if remainder == 1 then
			table.insert(finishedNumber, AVal)	
		end
		if remainder == 0 then
			table.insert(finishedNumber, BVal)
		end
		
		if floorNum == 0 then
			numDone = true
		end
		
	until numDone
	local newBin = ""
	for i = #finishedNumber, 1, -1 do
		newBin = newBin .. finishedNumber[i] -- flips the inversed binary
	end
	local newBinNum = newBin
	if tonumber(AVal) and tonumber(BVal) then
		newBinNum = tonumber(newBin)
	end
	return newBinNum
end

function module:binaryToNumber(Binary:string, AVal:string, BVal:string)
	AVal = AVal or "1"
	BVal = BVal or "0"
	
	local stringBin = tostring(Binary)
	local binTable = string.split(stringBin, "")
	local inverseBin = ""
	for i = #binTable, 1, -1 do
		inverseBin = inverseBin .. binTable[i] -- flips binary number to inverse
	end
	local inverseTable = string.split(inverseBin, "")
	local mult = 1
	local numString = 0
	
		for i, v in inverseTable do
			if tostring(v) == tostring(AVal) then
				inverseTable[i] = "1"
			elseif tostring(v) == tostring(BVal) then
				inverseTable[i] = "0"
			else
				error("Unknown Value In Binary: " .. v)
			end
		end
		for _, v in inverseTable do
			local numMult = tonumber(v) * mult
			numString += numMult
			mult *= 2
		end
		return numString
	
end

return module
