function struct_get_default(struct,name,default_value) {
	if (struct_exists(struct,name)) return struct_get(struct,name)
	return default_value
}