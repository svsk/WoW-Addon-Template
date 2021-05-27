-- Imports from WoW API
local CreateFrame, time, SlashCommands = _G.CreateFrame, _G.time, _G.SlashCmdList

-- Properties injected by the WoW API to the addon.
-- AddonName is the name of the addon as specficied in the .toc file.
-- AddonTable is an empty table injected to all .lua files of the addon. Can be used to store private
-- information.
local AddonName, AddonTable = ...

local savedVariables
local SlashCmdCount = 0
local Addon = AddonTable

function Addon.OnAddonLoaded(event, addon)
    if (addon == AddonName) then
        AddonTemplateSaved = AddonTemplateSaved or {}
        savedVariables = AddonTemplateSaved
        Addon.SetAddonLoaded()
    end
end

function Addon.SetAddonLoaded()
    local currentTime = time()
    print("AddonTemplate has loaded @ " .. currentTime .. "!")
    savedVariables.lastLoad = currentTime
end

function Addon.HandleEvent(self, event, addon)
    if (event == "ADDON_LOADED") then
        Addon.OnAddonLoaded(event, addon)
    end
end

function Addon.AddSlashCommand(command)
    SlashCommands[AddonName] = SlashCommands[AddonName] or Addon.HandleSlashCommand
    SlashCmdCount = SlashCmdCount + 1
    _G["SLASH_" .. AddonName .. SlashCmdCount] = command
end

function Addon.HandleSlashCommand(msg, editBox) print("Received slash command: " .. msg) end

function Addon.HandleUpdate()
    -- Code to run on every frame goes here.
end

-- Frames --
local AddonTemplateEventListener = CreateFrame("FRAME", "AddonTemplateEventListener")

-- Set up event handlers
AddonTemplateEventListener:SetScript("OnEvent", Addon.HandleEvent)
AddonTemplateEventListener:SetScript("OnUpdate", Addon.HandleUpdate)
AddonTemplateEventListener:RegisterEvent("ADDON_LOADED")

-- Set up slash command handler
Addon.AddSlashCommand("/AddonTemplate")
