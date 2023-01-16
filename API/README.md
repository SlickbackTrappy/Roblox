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

Function Data: (instance)

Example:
```lua
local api = loadstring(game:HttpGet("https://raw.githubusercontent.com/SlickbackTrappy/Roblox/main/API/main.lua"))()

--// Protects 'Part' from any client sided detections.
api:Protect(workspace.Part) 
```

<h3>GetPosInXSeconds</h3>
Returns the position in X amount of time. 

Function Data: (Current Position, MoveDirection, WalkSpeed, Time)

Example:
```lua
local api = loadstring(game:HttpGet("https://raw.githubusercontent.com/SlickbackTrappy/Roblox/main/API/main.lua"))()

local char = game:GetService("Players").LocalPlayer.Character

--// Returns The Expected Player Position In 3 Seconds.
api:GetPosInXSeconds(char.HumanoidRootPart.Position, char.Humanoid.MoveDirection, char.Humanoid.WalkSpeed, 3)
```

<h3>FixServiceNames</h3>
Resets the names of game services to their default names. 

Example:
```lua
local api = loadstring(game:HttpGet("https://raw.githubusercontent.com/SlickbackTrappy/Roblox/main/API/main.lua"))()

api:FixServiceNames()
```
<h3>Create</h3>
A more simple, easy way to create game instances. 

Function Data: (Class, Parent, Properties, Children)

Example:
```lua
local api = loadstring(game:HttpGet("https://raw.githubusercontent.com/SlickbackTrappy/Roblox/main/API/main.lua"))()

local coolPart = api:Create("Part", workspace, {
  Size = Vector3.new(3,3,3)
}) 
```
