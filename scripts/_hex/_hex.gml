function from_hex(hex) {
	return real("0x"+hex)
}

function from_hex_swapnibbles(hex) {
	var dec = from_hex(hex)
	return floor(dec/16) + 16 * (dec % 16)
}