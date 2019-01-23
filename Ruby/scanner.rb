require "ipaddr"
require "net/ping"

def calculate_network_range(ip, mask)
        address = "#{ip}/#{mask}"
        # transform values with map
        ip_range = IPAddr.new(address).to_range.map { |ip_object| ip_object.to_s }
end

def scan_range(ip_range)
        # filter values with select
        active_ips = ip_range.select { |ip| Net::Ping::External.new(ip).ping? }
end

def write_to_file(active_ips)
        File.open("active_ips.txt", "w") do |file|
                file.puts ip_address
        end
end


range = calculate_network_range("192.168.50.236", "255.255.255.0")
active_ips = scan_range(range)
write_to_file(active_ips)
