local function sddpgrxxd(suffix)
    local hydro = Hydro();
    local gerhid = hydro:load("gerhid" .. (suffix or ""));

    local thermal = Thermal();
    local gerter = thermal:load("gerter" .. (suffix or ""));
    
    local renewable = Renewable();
    local gergnd = renewable:load("gergnd" .. (suffix or ""));
    
    local battery = Battery()
    local gerbat = battery:load("gerbat" .. (suffix or ""));

    local system = System()
    local defcit = system:load("defcit" .. (suffix or ""));

    return concatenate(
        gerhid:aggregate_agents(BY_SUM(), "Total Hydro"):aggregate_blocks(BY_SUM()):aggregate_scenarios(BY_AVERAGE()),
        gerter:aggregate_agents(BY_SUM(), "Total Thermal"):aggregate_blocks(BY_SUM()):aggregate_scenarios(BY_AVERAGE()),
        gergnd:aggregate_agents(BY_SUM(), "Total Renewable"):aggregate_blocks(BY_SUM()):aggregate_scenarios(BY_AVERAGE()),
        gerbat:aggregate_agents(BY_SUM(), "Total Battery"):aggregate_blocks(BY_SUM()):aggregate_scenarios(BY_AVERAGE()):convert("GWh"),
        defcit:aggregate_agents(BY_SUM(), "Deficit"):aggregate_blocks(BY_SUM()):aggregate_scenarios(BY_AVERAGE())
    );
end
return sddpgrxxd;