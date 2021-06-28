local function eneemb(suffix)
    local hydro = require("collection/hydro");
    local volfin = hydro:load("volfin" .. (suffix or ""));
    local fprodtac = hydro:load("fprodtac" .. (suffix or ""));
    
    return ifelse(hydro.existing:gt(0.5), 0, (volfin - hydro.vmin) * fprodtac):convert("GWh");
end
return eneemb;