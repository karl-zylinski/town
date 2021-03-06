HumanSleepState = class(HumanSleepState)

function HumanSleepState:init()
end

function HumanSleepState:enter()
    self.data.entity.act:set_arms_raised(true)
end

function HumanSleepState:exit()
    self.data.entity.act:set_arms_raised(false)
end

function HumanSleepState:tick()
    if self.data.tiredness < 0.1 then
        return HumanIdleState()
    end

    self.data.tiredness = math.max(0, self.data.tiredness - self.data.tiring_speed * 0.5)
    return self
end
