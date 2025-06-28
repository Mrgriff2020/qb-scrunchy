# qb-scrunchy
A simple Scrunchy Script to help players put up there hair to what is set in the config.

This script is for QB Core only. I have no plans to allow this onto ESX as i dont have a esx server. Feel free to create a PR with a esx verison.

The script is a simple drag and drop. 

To edit where you change what hair is set, head to the config.lua Line #6 and #9

Instructions:
- Download Latest Release
- Add to your resources
- Open config.lua and change to how you desire.
- Add items to qb-core>shared>items.lua
```
scrunchy = {
    name = 'scrunchy',
    label = 'Hair Scrunchy',
    weight = 50,
    type = 'item',
    image = 'scrunchy.png',
    unique = false,
    useable = true,
    shouldClose = true,
    combinable = nil,
    description = 'Use this to tie your hair up.'
},
```
- Save and restart your server
