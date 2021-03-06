local function gerbat_per_bus(suffix)
    local battery = Battery();
    local gerbat = battery:load("gerbat" .. (suffix or ""));
    return gerbat:aggregate_agents(BY_SUM(), Collection.BUSES);
end
return gerbat_per_bus;