-- TESTBED: open-source Roblox testing plugin
-- Entry point. Sets up the plugin toolbar, UI panel, and core runtime.
 
local toolbar = plugin:CreateToolbar("TESTBED")
local toggleButton = toolbar:CreateButton(
    "Open TESTBED",
    "Toggle the TESTBED test runner panel",
    "rbxasset://textures/AnimationEditor/button_control_setting_default@2x.png"
)
 
-- Track open/closed state
local isOpen = false
local pluginGui: DockWidgetPluginGui? = nil
 
local function createPluginGui(): DockWidgetPluginGui
    local info = DockWidgetPluginGuiInfo.new(
        Enum.InitialDockState.Right,  -- where it opens by default
        false,                         -- not initially enabled
        false,                         -- not enabled by default on restart
        400,                           -- preferred initial width
        600,                           -- preferred initial height
        300,                           -- minimum width
        400                            -- minimum height
    )
    local gui = plugin:CreateDockWidgetPluginGui("TESTBED_Main", info)
    gui.Title = "TESTBED"
    gui.Name = "TESTBED_Main"
    return gui
end
 
local function togglePanel()
    if not pluginGui then
        pluginGui = createPluginGui()
    end
    isOpen = not isOpen
    pluginGui.Enabled = isOpen
    toggleButton:SetActive(isOpen)
end
 
toggleButton.Click:Connect(togglePanel)
 
print("[TESTBED] Plugin loaded. Click toolbar button to open.")
