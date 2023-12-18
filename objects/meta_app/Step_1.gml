/// @description Imgui Setup
imgui.__Update();
global.viewport_dockspace_id = imgui.DockSpaceOverViewport(ImGuiDockNodeFlags.PassthruCentralNode)

// Style
imgui.PushStyleVar(ImGuiStyleVar.WindowRounding, 6)
imgui.PushStyleVar(ImGuiStyleVar.WindowTitleAlign, 0.5, 0.5)
imgui.PushStyleVar(ImGuiStyleVar.FrameRounding, 6)
imgui.PushStyleVar(ImGuiStyleVar.ChildRounding, 6)
imgui.PushStyleVar(ImGuiStyleVar.GrabRounding, 6)

imgui.PushStyleVar(ImGuiStyleVar.SelectableTextAlign, 0.5, 0.5)

// Colors
var opacity = 1.0
var make_style_color_solid = function(idx) {
	imgui.PushStyleColor(idx, imgui.GetStyleColor(idx), opacity)
}
imgui.PushStyleColor(ImGuiCol.FrameBg, #1f2c40, opacity)
imgui.PushStyleColor(ImGuiCol.FrameBgHovered, #26405e, opacity)
imgui.PushStyleColor(ImGuiCol.FrameBgActive, #305b90, opacity)

imgui.PushStyleColor(ImGuiCol.MenuBarBg, style.background_secondary, opacity)
imgui.PushStyleColor(ImGuiCol.WindowBg, style.background_secondary, opacity)

imgui.PushStyleColor(ImGuiCol.DockingEmptyBg, style.background, opacity)
imgui.PushStyleColor(ImGuiCol.ScrollbarBg, style.background, opacity)
imgui.PushStyleColor(ImGuiCol.Separator, style.background_alt, opacity)

imgui.PushStyleColor(ImGuiCol.Button, style.background_alt, opacity)
imgui.PushStyleColor(ImGuiCol.ButtonActive, style.low_emphasis, opacity)
imgui.PushStyleColor(ImGuiCol.ButtonHovered, style.medium_emphasis, opacity)

imgui.PushStyleColor(ImGuiCol.Header, style.background_alt, opacity)
imgui.PushStyleColor(ImGuiCol.HeaderHovered, style.medium_emphasis, opacity)
imgui.PushStyleColor(ImGuiCol.HeaderActive, style.low_emphasis, opacity)
