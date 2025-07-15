#!/pfrm2.0/bin/lua

local function reverse_32bit(hex)
    if #hex ~= 8 then return hex end
    return hex:sub(7,8)..hex:sub(5,6)..hex:sub(3,4)..hex:sub(1,2)
end

local function hex_to_ipv6(hex)
    local segments = {}
    -- Process 32-bit segments with byte reversal
    for i = 1, #hex, 8 do
        local chunk = hex:sub(i, i+7)
        chunk = reverse_32bit(chunk)
        table.insert(segments, chunk:sub(1,4))
        table.insert(segments, chunk:sub(5,8))
    end

    -- Compress IPv6 address
    local compressed = table.concat(segments, ":"):gsub(":0:", "::", 1):gsub("::+", "::")
    return compressed
end

local function hex_to_ipv4(hex)
    local parts = {}
    for i = 1, #hex, 2 do
        table.insert(parts, tonumber(hex:sub(i, i+1), 16))
    end
    return table.concat(parts, ".")
end

local function parse_routing_table(input_data, is_ipv6)
    local result = {}
    for line in input_data:gmatch("[^\r\n]+") do
        local hex_values = line:match("<(.-)>")
        if hex_values then
            local values = {}
            for hex in hex_values:gmatch("[0-9a-fA-F]+") do
                table.insert(values, hex:lower())
            end

            if is_ipv6 then
                if #values >= 16 then
                    -- Destination range (start:4 values, end:4 values)
                    local dst_start = hex_to_ipv6(table.concat({
                        values[1], values[2], values[3], values[4]
                    }, ""))
                    
                    local dst_end = hex_to_ipv6(table.concat({
                        values[5], values[6], values[7], values[8]
                    }, ""))

                    -- Next hop (4 values)
                    local next_hop = hex_to_ipv6(table.concat({
                        values[9], values[10], values[11], values[12]
                    }, ""))

                    -- Metric (position 15) and Interface (position 16)
                    table.insert(result, {
                        dst_range = dst_start .. " - " .. dst_end,
                        next_hop = next_hop,
                        metric = tonumber(values[15], 16) or 0,
                        interface = tonumber(values[16], 16) or 0
                    })
                end
            else  -- IPv4
                if #values >= 7 then
                    table.insert(result, {
                        dst_range = hex_to_ipv4(values[1]).." - "..hex_to_ipv4(values[2]),
                        next_hop = hex_to_ipv4(values[3]),
                        metric = tonumber(values[6], 16) or 0,
                        interface = tonumber(values[7], 16) or 0
                    })
                end
            end
        end
    end
    return result
end

local function get_column_widths(parsed_table)
    local widths = {25, 20, 7, 10}
    for _, entry in ipairs(parsed_table) do
        widths[1] = math.max(widths[1], #entry.dst_range)
        widths[2] = math.max(widths[2], #entry.next_hop)
        widths[3] = math.max(widths[3], #tostring(entry.metric))
        widths[4] = math.max(widths[4], #tostring(entry.interface))
    end
    return widths
end

local function print_routing_table(parsed_table)
    local widths = get_column_widths(parsed_table)
    local fmt = "| %-"..widths[1].."s | %-"..widths[2].."s | %-"..widths[3].."s | %-"..widths[4].."s |"
    local sep = string.rep("-", widths[1] + widths[2] + widths[3] + widths[4] + 13)
    
    print(fmt:format("Destination Range", "Next Hop", "Metric", "Interface"))
    print(sep)
    
    for _, entry in ipairs(parsed_table) do
        print(fmt:format(
            entry.dst_range,
            entry.next_hop,
            tostring(entry.metric),
            tostring(entry.interface)
        ))
    end
end

local function execute_command(cmd)
    local handle = io.popen(cmd)
    if handle then
        local result = handle:read("*a")
        handle:close()
        return result
    end
end

-- Main execution
local arg_mode = arg[1]
local command, is_ipv6

if arg_mode == "-4" then
    command = "fw tab -t vpn_routing -u"
    is_ipv6 = false
elseif arg_mode == "-6" then
    command = "fw6 tab -t vpn_routing -u"
    is_ipv6 = true
else
    print("Usage: "..arg[0].." [-4|-6]")
    os.exit(1)
end

local output = execute_command(command)
if output then
    local parsed = parse_routing_table(output, is_ipv6)
    print_routing_table(parsed)
else
    print("Error executing command")
    os.exit(1)
end

