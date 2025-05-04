function Opposite(inString)

	outString = ''
	
	for i = 1, string.len(inString) do

		oneChar = string.sub(inString, i, i)
		if oneChar == string.upper(oneChar) then
			outString = outString..string.lower(oneChar)
		else
			outString = outString..string.upper(oneChar)
		end

	end

	return outString

end

function AlternateL(inString)

	outString = ''
	altFlag = 0
	
	for i = 1, string.len(inString) do

		oneChar = string.sub(inString, i, i)
		if altFlag == 0 then 
			outString = outString..string.lower(oneChar)
		else 
			outString = outString..string.upper(oneChar)
		end
		
		if string.upper(oneChar) ~= string.lower(oneChar) then altFlag = 1-altFlag end

	end

	return outString

end