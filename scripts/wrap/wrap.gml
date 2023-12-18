/// @function wrap
/// @description Wraps the given value within the specified range.
/// @param {real} value - The value to be wrapped.
/// @param {real} minimum - The minimum value of the range.
/// @param {real} maximum - The maximum value of the range.
/// @returns {real} The wrapped value within the specified range.
function wrap(value,minimum,maximum) {
	var range = maximum - minimum + 1
	value = ((value - minimum) % range + range) % range + minimum
	
	return value
}