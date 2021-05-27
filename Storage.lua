-- Properties injected by the WoW API to the addon.
-- AddonName is the name of the addon as specficied in the .toc file.
-- AddonTable is an empty table injected to all .lua files of the addon. Can be used to store private
-- information.
local AddonName, AddonTable = ...

AddonTable.Storage = {}

function AddonTable.Storage.ExampleFunction() end
