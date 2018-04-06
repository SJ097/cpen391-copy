-- This information is used by the Wi-Fi dongle to make a wireless connection to the router in the Lab
-- or if you are using another router e.g. at home, change ID and Password appropriately
 --SSID = "M112-PD"
 --SSID_PASSWORD = "aiv4aith2Zie4Aeg"

-- I understand from students who have tried, that this also works, using UBC Visitor wireless connection
-- although I haven't tried it

SSID= "SM-G950W3470"
SSID_PASSWORD = "loooltesting1567"

-- configure ESP as a station
wifi.setmode(wifi.STATION)
wifi.sta.config(SSID,SSID_PASSWORD)
wifi.sta.autoconnect(1)

-- alternatively you could do it this way
-- wifi.sta.config("M112-PD","aiv4aith2Zie4Aeg", 1)
-- wifi.sta.connect()

-- pause for connection to take place - adjust time delay if necessary or repeat until connection made
tmr.delay(1000000) -- wait 1,000,000 us = 1 second

-- This should print 5 if connection was successful
-- print(wifi.sta.status())

-- Prints the IP given to ESP8266
-- print(wifi.sta.getip())

-- List all available wireless network ---
-- See documentation: https://nodemcu.readthedocs.io/en/master/en/modules/wifi/#wifistagetap

-- The following 2 pieces of information are related to your Twilio account the one you made in Exercise 1.9
-- change appropriately
TWILIO_ACCOUNT_SID = "AC2fadb2c4a5f84190cf7b3471da8c1cd6"
TWILIO_TOKEN =       "839c6f5ba3a127b5972c328901ac5d2c"

-- Unfortunately, the Wi-FI dongle can only make unsecured HTTP requests, but Twilio requires 
-- secured HTTPS requests, so we will use a relay website to convert HTTP requests into HTTPS requests
-- visit http://iot-https-relay.appspot.com/ to learn more about this service
-- Please be sure to understand the security issues of using this relay app and use at your own risk.

-- this is the web address of the relay web site that our dongle sends the initial HTTP request to
HOST = "iot-https-relay.appspot.com" 
CPEN391HOST = "34.218.93.237"

-- The following variable defines the TWILIO web site that we will connect to
-- use the first one if you want to send a text to a cell phone
-- use the second (commented out) one if you want to make a call to a cell phone - that's the only change
URI = "/twilio/Messages.json"
--URI = "/twilio/Calls.json"
URI_FETCH_RESERVATIONS = "/NIOS_Fetch_Reservations.php"
URI_CHECK_IN = "/NIOSII_check_in.php"

function build_post_request(host, uri, data_table)

     data = ""

     for param,value in pairs(data_table) do
          data = data .. param.."="..value.."&"
     end

     request = "POST "..uri.." HTTP/1.1\r\n"..
     "Host: "..host.."\r\n"..
     "Connection: close\r\n"..
     "Content-Type: application/x-www-form-urlencoded\r\n"..
     "Content-Length: "..string.len(data).."\r\n"..
     "\r\n"..
     data
     --print(request)
     return request
end

-- This function registers a function to echo back any response from the server, to our DE1/NIOS system 
-- or hyper-terminal (depending on what the dongle is connected to)
function display(sck,response)
     print(string.sub(response, 200))
end

-- When using send_sms: the "from" number HAS to be your twilio number.
-- If you have a free twilio account the "to" number HAS to be your twilio verified number.
function send_sms(from,to,body)

     data = {
      sid = TWILIO_ACCOUNT_SID,
      token = TWILIO_TOKEN,
      Body = string.gsub(body," ","+"),
      From = from,
      To = to
     }

     socket = net.createConnection(net.TCP,0)
     socket:on("receive",display)
     socket:connect(80,HOST)

     socket:on("connection",function(sck)
          post_request = build_post_request(HOST,URI,data)
          response = sck:send(post_request)
          print(response)
     end)
end

function two_factor_authentication()
	ip = wifi.sta.getip()

	if(ip==nil) then
		print("Connecting...")
	else
		-- generate random number
		code1 = math.random(0, 9)
		code2 = math.random(0, 9)
		code3 = math.random(0, 9)
		code4 = math.random(0, 9)
		
		print("$" .. code1 .. code2 .. code3 .. code4 .. "$")
		
		tmr.stop(0)
		
		-- send a text message
		send_sms("(469) 291-0713 ","(518) 366-7951","Your security code is: " .. code1 .. code2 .. code3 .. code4)
	
	end
end

function fetchBooking()
  print("Testing an extremely big string 1. Testing an extremely big string 2. Testing an extremely big string 3. Testing an extremely big string 4. Testing an extremely big string 5. Testing an extremely big string 6. Testing an extremely big string 7.")
end

function fetchReservations(passport_id_input, dep_airport_input)
	ip = wifi.sta.getip()

	if(ip==nil) then
		print("Connecting...")
	else
		tmr.stop(0)
		--print("Connected to AP!")
		--print(ip)
		
		data = {
			passport_id = passport_id_input,
			dep_airport = dep_airport_input
		}
		
		socket = net.createConnection(net.TCP,0)
		socket:on("receive",display)
		socket:connect(80,CPEN391HOST)
		
		socket:on("connection",function(sck)
			post_request = build_post_request(CPEN391HOST,URI_FETCH_RESERVATIONS,data)
			response = sck:send(post_request)
			--print(response)
		end)
	end
end

function confirmCheckIn(reservation_id_input)
	ip = wifi.sta.getip()

	if(ip==nil) then
		print("Connecting...")
	else
		tmr.stop(0)
		--print("Connected to AP!")
		--print(ip)
		
		data = {
			reservation_id = reservation_id_input
		}
		
		socket = net.createConnection(net.TCP,0)
		socket:on("receive",display)
		socket:connect(80,CPEN391HOST)
		
		socket:on("connection",function(sck)
			post_request = build_post_request(CPEN391HOST,URI_CHECK_IN,data)
			response = sck:send(post_request)
			--print(response)
		end)
	end
end

function white_space_testing()
	print("Hello. This is just testing")
end