local _M = {}

function _M.opacity(value)
	local opacity = value or 55
	local alpha = string.format("%02X", math.floor(opacity / 100 * 255))

	return opacity, alpha
end

return _M
