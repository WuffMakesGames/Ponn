/// @description Levels Panel

oka_new_panel()
.set_width(180)
.set_height("110%")
.set_color(style.background)
//.set_alpha(0.9)

levels_panel_list = oka_new_list()
.set_list_direction(OKA_LIST_DIRECTION.VERTICAL)
.set_width(180)
.set_y(app_sidepanels_top)
.set_padding(2)
.add_component(oka_new_text().set_text("Levels").set_x("50%").set_align_x(OKA_ALIGN_X.MIDDLE))
.set_can_hover(false)

// Options
oka_new_list(levels_panel_list)
.set_width("100%")
.set_height(32)
.set_padding(2)
.set_component_align_x(OKA_ALIGN_X.MIDDLE)
.add_component(everthorn_button(noone,levels_panel_list.static_width*0.5-1,"100%","Add",-1))
.add_component(everthorn_button(noone,levels_panel_list.static_width*0.5-1,"100%","Remove",-1))
.set_can_hover(false)

//levels_panel_list.add_component(everthorn_button(noone,"100%","32px","Rename",-1))

// Left Levels Tab
levels_panel = oka_new_panel(levels_panel_list)
.set_width("100%")
.set_height("auto")
.set_color(style.background_secondary)
.set_on_resize(function(c) {
	c.set_height(window_height-c.y)
})

levels_list = oka_new_list(levels_panel)
.set_list_direction(OKA_LIST_DIRECTION.VERTICAL)
.set_y(8)
.set_width("100%")
.set_height("100%")
