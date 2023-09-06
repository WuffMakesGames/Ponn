/// @desc Swaps two values in an array
function array_swap(array,index,new_index) {
	var _temp = array[index]
	array[@ index] = array[new_index]
	array[@ new_index] = _temp
}
