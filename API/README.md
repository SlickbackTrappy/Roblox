<p align="center">
  <img src="https://avatars.githubusercontent.com/u/122176962?s=400&u=5c469eddd71bbfe804045e7756cc85761db865b2&v=4">
  <h3 align="center">"Bitch dependency is no laughing matter." - A Pimp Named Slickback</h3>
</p>

## Info
A simple, easy, and unique way to improve your Roblox Scripts.

Begin by inserting this snippet of code into your script:
```lua
local api = loadstring(game:HttpGet("https://raw.githubusercontent.com/SlickbackTrappy/Roblox/main/API/main.lua"))()
```

## Functions

<h3>RemoveConnectionsFromInstance</h3>
Removes all connection events on the specified instance.

Function Data: (instance, otherEvents)

Example:
```lua
local api = loadstring(game:HttpGet("https://raw.githubusercontent.com/SlickbackTrappy/Roblox/main/API/main.lua"))()

--// Any Humanoid Connections Are Removed
api:RemoveConnectionsFromInstance(game:GetService("Players").LocalPlayer.Character.Humanoid) 
```
<h3>Protect</h3>
Protects the listed part from any client detections. 

Function Data: (instance, parent)

Example:
```lua
local api = loadstring(game:HttpGet("https://raw.githubusercontent.com/SlickbackTrappy/Roblox/main/API/main.lua"))()

--// Protects 'Part' from any client sided detections.
api:Protect(workspace.Part, workspace) 
```
