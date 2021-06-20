
--[[
  Source: https://stackoverflow.com/questions/40986242/key-repeats-are-delayed-in-my-hammerspoon-script

  This introduces hyper home-row navigation without the need for Karabiner-Elements
--]]

local hyper = {"shift", "cmd", "alt", "ctrl"}

local fastKeyStroke = function(modifiers, character)
  local event = require("hs.eventtap").event
  event.newKeyEvent(modifiers, string.lower(character), true):post()
  event.newKeyEvent(modifiers, string.lower(character), false):post()
end

hs.fnutils.each({
  -- Movement
  { key='h', mod={}, direction='left'},
  { key='j', mod={}, direction='down'},
  { key='k', mod={}, direction='up'},
  { key='l', mod={}, direction='right'},
  { key='n', mod={'cmd'}, direction='left'},  -- beginning of line
  { key='p', mod={'cmd'}, direction='right'}, -- end of line
  { key='m', mod={'alt'}, direction='left'},  -- back word
  { key='.', mod={'alt'}, direction='right'}, -- forward word
}, function(hotkey)
  hs.hotkey.bind(hyper, hotkey.key, 
      function() fastKeyStroke(hotkey.mod, hotkey.direction) end,
      nil,
      function() fastKeyStroke(hotkey.mod, hotkey.direction) end
    )
  end
)
