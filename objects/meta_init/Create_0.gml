/// @description 

window_set_caption(APP_NAME)

event_manager_initialize()

// instances
instance_create_depth(0,0,0,meta_cursor)
instance_create_depth(0,0,0,meta_view_manager)

// init
event_user(0) // shortcuts

// start
room_goto(rm_app)
