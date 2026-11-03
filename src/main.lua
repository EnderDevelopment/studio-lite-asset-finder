local http = require("coro-http")

local function searchAssets(query)
    local url = "https://api.roblox.com/marketplace/product/search?keyword=" .. query
    local response, body = http.request("GET", url)
    
    if response.code == 200 then
        local data = game:GetService("HttpService"):JSONDecode(body)
        for _, asset in ipairs(data) do
            print("Asset ID: " .. asset.id .. ", Name: " .. asset.name)
        end
    else
        warn("Failed to fetch assets: " .. response.status)
    end
end

-- Example usage
searchAssets("sword")