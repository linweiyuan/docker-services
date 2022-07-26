ngx.say('{"id": 1, "name": "hello"}')

-- local function read_http(path)
--   local resp = ngx.location.capture(path, {
--     method = ngx.HTTP_GET
--   })
--   if not resp then
--     ngx.log(ngx.ERR, "http error, path: ", path)
--     ngx.exit(404)
--   end
--   return resp.body
-- end

-- local a = read_http("/test")

-- ngx.say(a)
