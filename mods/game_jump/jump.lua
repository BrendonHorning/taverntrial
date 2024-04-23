jumpButton = nil
jumpWindow = nil
button = nil -- trying to index the jump button

function init()
  jumpButton = modules.client_topmenu.addRightToggleButton('jumpButton', tr('Jump'), '/game_jump/game_jump/icon', closing)
  jumpButton:setOn(false)

  jumpWindow = g_ui.displayUI('jump')
  jumpWindow:setVisible(false)

  -- tutorial i used put these in and it breaks without it
  allTabs = jumpWindow:recursiveGetChildById('allTabs')
  allTabs:setContentWidget(jumpWindow:getChildById('optionsTabContent'))

  -- trying to set index here like above but always returns error of nil value
  button = allTabs:getChildById('jumpButton')
end

function jumping()
  button:setContentWidget(allTabs:getChildById('jumped')) -- when jump button pushed, should move the button.
  -- have tried attempting to edit style directly or setting button's style to a new button style but all return errors.
end

-- WOULD STILL BE NEEDED:
-- would need to edit otui style directly in some sort of persisting loop to get button to constantly move left.
-- would need to call jumping function if button is too far to the left. (hits edge of module)


function terminate()
  jumpButton:destroy()
  jumpWindow:destroy()
end

function closing()
  if jumpButton:isOn() then
    jumpWindow:setVisible(false)
    jumpButton:setOn(false)
  else
    jumpWindow:setVisible(true)
    jumpButton:setOn(true)
  end
end

function onMiniWindowClose()
  jumpButton:setOn(false)

end