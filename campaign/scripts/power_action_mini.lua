-- 
-- Please see the license.html file included with this distribution for 
-- attribution and copyright information.
--

function onInit()
	local sNode = getDatabaseNode().getPath();
	DB.addHandler(sNode, "onChildUpdate", onDataChanged);
	onDataChanged();
end

function onClose()
	local sNode = getDatabaseNode().getPath();
	DB.removeHandler(sNode, "onChildUpdate", onDataChanged);
end

function onDataChanged()
	updateDisplay();
	updateViews();
end

function updateDisplay()
	local sType = DB.getValue(getDatabaseNode(), "type", "");
	
	if sType == "attempt" then
		button.setIcons("button_action_attempt", "button_action_attempt_down", "button_action_attempt_hover");
		--button.setStateIcons(3, "button_action_attempt", "button_action_attempt_down", "button_action_attempt_hover");
	elseif sType == "effort" then
		button.setIcons("button_action_effort", "button_action_effort_down", "button_action_effort_hover");
		--button.setStateIcons(3, "button_action_effort", "button_action_effort_down", "button_action_effort_hover");
	elseif sType == "heal" then
		button.setIcons("button_action_heal", "button_action_heal_down", "button_action_heal_hover");
		--button.setStateIcons(3, "button_action_heal", "button_action_heal_down", "button_action_heal_hover");
	elseif sType == "effect" then
		button.setIcons("button_action_effect", "button_action_effect_down", "button_action_effect_hover");
		--button.setStateIcons(3, "button_action_effect", "button_action_effect_down", "button_action_effect_hover");
	end
end

function updateViews()
	local sType = DB.getValue(getDatabaseNode(), "type", "");
	
	if sType == "attempt" then
		onAttemptChanged();
	elseif sType == "effort" then
		onEffortChanged();
	elseif sType == "heal" then
		onHealChanged();
	elseif sType == "effect" then
		onEffectChanged();
	end
end

function onAttemptChanged()
	local sAttack = PowerManager.getPCPowerAttemptActionText(getDatabaseNode());
	local sTooltip = "";
	if sAttack ~= "" then
		sTooltip = "ATTEMPT: " .. sAttack;
	end
	button.setTooltipText(sTooltip);
end

function onEffortChanged()
	local sDamage = PowerManager.getPCPowerEffortActionText(getDatabaseNode());
	button.setTooltipText("DMG: " .. sDamage);
end

function onHealChanged()
	local sHeal = PowerManager.getPCPowerHealActionText(getDatabaseNode());
	button.setTooltipText("HEAL: " .. sHeal);
end

function onEffectChanged()
	local node = getDatabaseNode();
	if not node then
		return;
	end
	
	local sTooltip = DB.getValue(node, "label", "");

	local sApply = DB.getValue(node, "apply", "");
	if sApply == "action" then
		sTooltip = sTooltip .. "; [ACTION]";
	elseif sApply == "roll" then
		sTooltip = sTooltip .. "; [ROLL]";
	elseif sApply == "single" then
		sTooltip = sTooltip .. "; [SINGLES]";
	end
	
	local sTargeting = DB.getValue(node, "targeting", "");
	if sTargeting == "self" then
		sTooltip = sTooltip .. "; [SELF]";
	end

	local sDuplicate = DB.getValue(node, "duplicate", "");
	if sDuplicate ~= "" then
		if sDuplicate == "replace" then
			sTooltip = sTooltip .. "; [REPLACE]";
		elseif sDuplicate == "stack" then
			sTooltip = sTooltip .. "; [STACK]";
		elseif sDuplicate == "remove" then
			sTooltip = sTooltip .. "; [REMOVE]";
		end
	end
	
	sTooltip = "EFFECT: " .. sTooltip;
	
	button.setTooltipText(sTooltip);
end
