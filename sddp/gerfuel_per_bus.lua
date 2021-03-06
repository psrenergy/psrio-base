local function gerfuel_per_bus(suffix)
    local fuelconsumption = FuelConsumption();
    local gerfuel = fuelconsumption:load("gerter" .. (suffix or ""));
    return gerfuel:aggregate_agents(BY_SUM(), Collection.BUSES);
end
return gerfuel_per_bus;