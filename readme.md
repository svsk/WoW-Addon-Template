# World of Warcraft Addon Template Project

A simple project for scaffolding an addon project for World of Warcraft. Contains boilerplate code for
the most rudimentary stuff an addons needs. Functionality such as

- Binding to events.
- Running code on every frame.
- Setting up slash commands.
- Saving data between sessions.

There is also an attempt at scoping code not only to prevent collisions with other addons running in WoW's
global scope, but also scoping code in the addon itself.

## Setup
Clone this repo into folder in your World of Warcraft directory so that the file structure looks like this:

```
_retail_/Interface/Addons/{YourDesiredAddonName}/
	|- AddonTemplate.lua
	|- Addontemplate.toc
	|- Logging.lua
	|- Storage.lua
	|- Init.js
```

Make sure you have [Node](https://nodejs.org/en/) installed and run `node ./Init.js` in this directory.
This will iterate through all the files and replace `AddonTemplate` with whatever you've named the addon directory
(where it says `{YourDesiredAddonName}`). It will also delete the `Init.js` file. And then you're good to go.

You can also just go through all the files and manually replace all instances of `AddonTemplate` with whatever you
want to name your addon and then delete the Init.js file. That is if you don't want to install Node.

## Logging.lua and Storage.lua

You can delete these files if you don't want/need them. They are merely meant as examples for how to split and scope
your code if you're going to be working on something big.

## .luaconfig and .vscode

I've purposfully included these two items in the project just to show what kind of tools you can use to help format
your code. The contents in the `.luaconfig` file are just my preferred settings. Feel free to edit them as you please.

I would recommend the following plugins for VSCode:
- [Lua](https://marketplace.visualstudio.com/items?itemName=sumneko.lua)
- [vscode-lua-format](https://marketplace.visualstudio.com/items?itemName=Koihik.vscode-lua-format)


## Disclaimer
I am _not_ a professional Lua developer by any stretch of the imagination. This project is as much for my own learning
as anything else.