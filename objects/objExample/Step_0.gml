// Memory Usage
if (tick++ % game_get_speed(gamespeed_fps) == 0) {
	var memory_new = debug_event("DumpMemory", true).totalUsed;
	memory_difference = memory_new - memory;
	memory = memory_new;
}

// Docking
if (enable_docking) imgui.DockSpaceOverViewport();

// Setup
if (!surface_exists(surf)) {
	surf = surface_create(128, 128);
	surface_set_target(surf);
	draw_clear_alpha(c_lime, 0.25);
	surface_reset_target();
}

// Menu
var exit_modal = false;
imgui.BeginMainMenuBar();
if (imgui.BeginMenu("File")) {
	if (imgui.MenuItem("Enable Viewport", undefined, enable_docking)) {
		enable_docking = !enable_docking;
	}
	
	imgui.Separator();
	
	if (imgui.MenuItem("Exit")) {
		exit_modal = true;
	}
	imgui.EndMenu();
}

if (exit_modal) imgui.OpenPopup("Exit?");

imgui.SetNextWindowPos(window_get_width() / 2, window_get_height () / 2, ImGuiCond.Appearing, 0.5, 0.5);
if (imgui.BeginPopupModal("Exit?", undefined, ImGuiWindowFlags.NoResize)) {
	imgui.Text("Are you sure you want to exit?");
	imgui.Separator();
	if (imgui.Button("Yes")) game_end();
	imgui.SameLine();
	if (imgui.Button("Nevermind")) imgui.CloseCurrentPopup();
	imgui.EndPopup();	
	
}

if (imgui.BeginMenu("Windows")) {
	if (imgui.MenuItem("Show Example Window", undefined, undefined, !main_open)) main_open = true;	
	if (imgui.MenuItem("Show Demo Window", undefined, undefined, !demo_open)) demo_open = true;	
	imgui.EndMenu();
}
imgui.EndMainMenuBar();

// Main Window
if (main_open) {
	imgui.SetNextWindowSize(room_width / 2, room_height / 2, ImGuiCond.Once);
	
	var ret = imgui.Begin("ImGui_GM Example", main_open, ImGuiWindowFlags.None, ImGuiReturnMask.Both);
	main_open = ret & ImGuiReturnMask.Pointer;
	
	if (ret & ImGuiReturnMask.Return) {
		var width = imgui.GetContentRegionAvailX(), height = 256;
		
		imgui.BeginChild("Inner_Internal", width, height / 2, true);
			imgui.Text("Internal");
			imgui.Separator();
			var _str = "ImGui_GM v" + IMGUI_GM_VERSION;
			for(var i = 0, _i = string_length(_str); i < _i; i++) {
				var _c = make_color_hsv(255 * (i / _i), 128, 255);
				imgui.TextColored(string_char_at(_str, i + 1), _c);
				if (i < _i - 1) imgui.SameLine();
			}
			imgui.TextColored("Developed by Nommiin!", c_aqua);
			imgui.Separator();
			if (!is_undefined(_static)) {
				_static.__Scale = max(0.5, imgui.InputDouble("imgui.__Scale", _static.__Scale, 0.1, 0.25));
			} else {
				imgui.BeginDisabled();
				imgui.InputDouble("imgui.__Scale", 1);
				imgui.EndDisabled();
				imgui.TextColored("(!)", c_white, 0.5);
				if (imgui.IsItemHovered()) {
					imgui.SetTooltip("Your GameMaker runtime version (" + GM_runtime_version + ") does not support static_get\nPlease update to a newer runtime if possible!");
				}
			}
			
			if (imgui.SmallButton("Restart")) {
				game_restart();	
			}
		imgui.EndChild();
		
		imgui.BeginChild("Inner_Text", width / 2, height, true);
			imgui.Text("Text");
			imgui.Separator();
			imgui.TextUnformatted("imgui::TextUnformatted");
			imgui.Text("imgui::Text");
			imgui.TextColored("imgui::TextColored", col);
			imgui.TextWrapped("imgui::TextWrapped - " + string_repeat("A", 24));
			imgui.TextDisabled("imgui::TextDisabled");
			imgui.LabelText("A Label", "imgui::LabelText");
			imgui.BulletText("imgui::BulletText");
		imgui.EndChild();
		
		imgui.SameLine();
		
		imgui.BeginChild("Inner_Buttons", width / 2, height, true);
			imgui.Text("Buttons");
			imgui.Separator();
			if (imgui.Button("imgui::Button")) show_message_async("nice, you pressed the button");
			if (imgui.SmallButton("imgui::SmallButton")) show_message_async("nice, you pressed the smaller button");
			if (imgui.InvisibleButton("imgui::InvisibleButton", imgui.GetContentRegionAvailX(), 24)) show_message_async("nice, you pressed the super secret invisible button");
			if (imgui.ArrowButton("imgui::ArrowButton", dir)) dir = (dir + 1) % 4;
			imgui.SameLine();
			imgui.Text("Direction: " + string(dir));
			imgui.ColorButton("imgui::ColorButton", c_orange, 0.5);
		imgui.EndChild();
		
		imgui.BeginChild("Inner_Textured", width / 2, height, true);
			imgui.Text("Textured Widgets");
			imgui.Separator();
			imgui.Text("imgui::Image");
			imgui.Image(sprExample, 0, col2);
			if (imgui.IsItemHovered()) {
				imgui.BeginTooltip();
				imgui.Text("Artwork by @Snoozercreation on Twitter!");
				imgui.EndTooltip();
			}
			
			imgui.Text("imgui::ImageButton");
			if (imgui.ImageButton("img_btn", sprExample, 0, c_white, 1, col4.Color(), col4.Alpha())) {
				show_message_async("nice, you clicked the red panda button :O");
			}
			
			imgui.Text("imgui::Surface");
			surface_set_target(surf);
			var xx = imgui.GetCursorScreenPosX(), yy = imgui.GetCursorScreenPosY();
			var c = make_colour_hsv(255 * ((current_time % 1000) / 1000), 128, 255);
			draw_circle_color(window_mouse_get_x() - xx, window_mouse_get_y() - yy, 4, c, c, false);
			surface_reset_target();
			imgui.Surface(surf);
		imgui.EndChild();
		
		imgui.SameLine();
		
		imgui.BeginChild("Inner_Tree", width / 2, height, true);
			imgui.Text("Tree");
			imgui.Separator();
			if (imgui.TreeNode("imgui::TreeNode")) {
				imgui.Text("Hello!\nThis is some content inside of a tree node :)");
				imgui.TreePop();
			}
		
			if (imgui.TreeNode("Another Node")) {
				imgui.Text("This is another tree node, for the sake of example!");
				imgui.Image(sprExample, 0, c_red, 1, sprite_get_width(sprExample) / 2, sprite_get_height(sprExample) / 2);
				imgui.TreePop();
			}
		
			var ret = imgui.CollapsingHeader("imgui::CollapsingHeader", header_visible, undefined, ImGuiReturnMask.Both);
			header_visible = ret & ImGuiReturnMask.Pointer;
			if (ret & ImGuiReturnMask.Return) {
				imgui.TextColored("hewwo", c_aqua, 0.5);
				imgui.Text("You can click the X icon at the side of the header to hide it!");
			}
		
			if (!header_visible) {
				if (imgui.Button("Restore Header")) {
					header_visible = true;		
				}
			}
		imgui.EndChild();
		
		imgui.BeginChild("Inner_Inputs", width / 2, height, true);
			imgui.Text("Inputs");
			imgui.Separator();
		
			input_val = imgui.InputText("imgui::InputText", input_val);
			input_val_ml = imgui.InputTextMultiline("imgui::InputTextMultiline", input_val_ml);
			input_hint = imgui.InputTextWithHint("imgui::InputTextWithHint", "This input has a hint value! It disappears whenever you enter something", input_hint);
		
			input_int = imgui.InputInt("imgui::InputInt", input_int, 1, 5);
			input_float = imgui.InputFloat("imgui::InputFloat", input_float, 0.1, 0.5);
			imgui.EndChild();
		
			imgui.SameLine();
		
			imgui.BeginChild("Inner_Colors", 0, height, true);
			imgui.Text("Colors");
			imgui.Separator();
		
			col3 = imgui.ColorPicker3("imgui::ColorPicker3", col3);
			imgui.Separator();
			imgui.ColorPicker4("imgui::ColorPicker4", col4);
			imgui.Separator();
			col5 = imgui.ColorEdit3("imgui::ColorEdit3", col5);
			imgui.Separator();
			imgui.ColorEdit4("imgui::ColorEdit4", col6);
		imgui.EndChild();
		
		imgui.SameLine();
		
		imgui.BeginChild("Inner_Table", width / 2, height, true);
			imgui.Text("Tables");
			imgui.Separator();
			if (imgui.BeginTable("table_test", 3)) {
				imgui.TableSetupColumn("One");
				imgui.TableSetupColumn("Two");
				imgui.TableSetupColumn("Three");
				imgui.TableHeadersRow();
				
				for(var i = 0; i < 5; i++) {
					imgui.TableNextRow();
					for(var j = 0; j < 3; j++) {
						imgui.TableSetColumnIndex(j);
						imgui.TableSetBgColor(ImGuiTableBgTarget.CellBg, make_color_hsv(255 * ((i + j) / 8), 128, 255), j);
						imgui.Text("Hello " + string(i + j));
					}
				}
				
				imgui.EndTable();	
			}
		imgui.EndChild();
		
		imgui.BeginChild("Inner_Tabs", width / 2, height, true);
			imgui.Text("Tabs");
			imgui.Separator();
			if (imgui.BeginTabBar("MyTabBar"))
            {
				var ret = imgui.BeginTabItem("Closable", tab1, undefined, ImGuiReturnMask.Both);
				tab1 = ret & ImGuiReturnMask.Pointer;
				if (ret & ImGuiReturnMask.Return) {
	                imgui.Text("This is a closable tab!\nblah blah blah blah blah");
	                imgui.EndTabItem();
				}
				
                if (imgui.BeginTabItem("Avocado"))
                {
                    imgui.Text("This is the Avocado tab!\nblah blah blah blah blah");
                    imgui.EndTabItem();
                }
                if (imgui.BeginTabItem("Broccoli"))
                {
                    imgui.Text("This is the Broccoli tab!\nblah blah blah blah blah");
                    imgui.EndTabItem();
                }
                if (imgui.BeginTabItem("Cucumber"))
                {
                    imgui.Text("This is the Cucumber tab!\nblah blah blah blah blah");
                    imgui.EndTabItem();
                }
                imgui.EndTabBar();
            }
		imgui.EndChild();
		
		imgui.SameLine();
		
		imgui.BeginChild("Inner_Plots", width / 2, height, true);
			imgui.Text("Plots");
			imgui.Separator();
			imgui.PlotLines("Line Plot", plot_val);
			imgui.PlotHistogram("Histogram Plot", plot_val2, 0, "Overlay Here!", undefined, undefined, undefined, 128);
		imgui.EndChild();
		
		imgui.BeginChild("Inner_Dock", width / 2, height, true);
			imgui.Text("Dock Space");
			imgui.Separator();
			var space_id = imgui.GetID("DockSpace");
			imgui.Text("You can drag any window into the space below to dock it!");
			imgui.DockSpace(space_id);
		imgui.EndChild();
		
		imgui.SameLine();
		
		imgui.BeginChild("Inner_DragDrop", width / 2, height, true);
			imgui.Text("Drag and Drop");
			imgui.Separator();
			if (imgui.RadioButton("Copy", drag_mode == 0)) {drag_mode = 0;} imgui.SameLine();
			if (imgui.RadioButton("Move", drag_mode == 1)) {drag_mode = 1;} imgui.SameLine();
			if (imgui.RadioButton("Swap", drag_mode == 2)) {drag_mode = 2;}
			
			for(var i = 0; i < array_length(drag_names); i++) {
				imgui.PushID(i);
				if (i % 3 != 0) {
					imgui.SameLine();	
				}
				
				imgui.Button(drag_names[i], 60, 60);
				if (imgui.BeginDragDropSource()) {
					imgui.SetDragDropPayload("DND_DEMO_CELL", i);
					
					var verb = "Copy";
					switch (drag_mode) {
						case 1: verb = "Move"; break;
						case 2: verb = "Swap"; break;
					}
					imgui.Text(verb + " " + string(drag_names[i]));
					imgui.EndDragDropSource();	
				}
				
				if (imgui.BeginDragDropTarget()) {
					var payload = imgui.AcceptDragDropPayload("DND_DEMO_CELL");
					if (payload != undefined) {
						switch (drag_mode) {
							// Copy
							case 0: {
								drag_names[i] = drag_names[payload];
								break;
							}
							
							// Move
							case 1: {
								drag_names[i] = drag_names[payload];
								drag_names[payload] = "";
								break;
							}
							
							// Swap
							case 2: {
								var temp = drag_names[i];
								drag_names[i] = drag_names[payload];
								drag_names[payload] = temp;
								break;	
							}
						}	
					}
					imgui.EndDragDropTarget();	
				}
				imgui.PopID();
			}
		imgui.EndChild();
		
		imgui.BeginChild("Inner_Fonts", width / 2, height, true);
			imgui.Text("Fonts");
			imgui.Separator();
			imgui.Text("You can load TTF/OTF font files from disk!");
			imgui.PushFont(font_roboto);
			imgui.TextColored("And use them wherever!", c_aqua);
			imgui.Text("Pretty neat, right?!");
			imgui.PopFont();
			imgui.Text("And back to the default font ^_^");
		imgui.EndChild();
		
		imgui.SameLine();
		
		imgui.BeginChild("Inner_DrawLists", width / 2, height, true);
			imgui.Text("Drawlists");
			imgui.Separator();
			var list = imgui.GetWindowDrawList(), xx = imgui.GetCursorScreenPosX(), yy = imgui.GetCursorScreenPosY();
			imgui.DrawListAddText(list, xx + (width / 4), yy + 4, "Hello from DrawListAddText!", col2);
			imgui.DrawListAddCircleFilled(list, xx + 52, yy + 32, 12, c_blue);
			imgui.DrawListAddBezierCubic(list, xx + 4, yy + 4, xx + (width / 4), yy + 24, xx + (width / 4) + 32, yy + 48, xx + (width / 4) + 24, yy + 64, c_purple, 3);
			var ix = xx + 24, iy = yy + (height / 3), iw = sprite_get_width(sprExample2), ih = sprite_get_height(sprExample2);
			imgui.DrawListAddImageRounded(list, sprExample2, current_time / 100, ix - (iw / 2), iy - (ih / 2), ix + (iw / 2), iy + (ih / 2), c_white, 32, ImDrawFlags.None);
			imgui.DrawListAddNgonFilled(list, xx + (width / 4), yy + (height / 2), 64, c_aqua, 5);
		imgui.EndChild();
	}
	imgui.End();
}

if (demo_open) {
	demo_open = imgui.ShowDemoWindow(demo_open);	
}