local function gerter_per_bus(suffix)
    local thermal = Thermal();
    local gerter = thermal:load("gerter" .. (suffix or ""));
    return gerter:aggregate_agents(BY_SUM(), Collection.BUSES);
end
return gerter_per_bus;