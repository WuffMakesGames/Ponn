
/// @desc Wraps a number between two given values
function wrap(val,minimum,maximum) {
	if (val < minimum) val = val % (maximum-minimum) + maximum
	return val % (maximum-minimum) + minimum
}
