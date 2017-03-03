minetest.register_privilege("chat_c", {description = "Can colour their chat", give_to_singleplayer=true})

local helper = {
  {"r","red",3},
  {"g","green",3},
  {"b","blue",3},
  {"lg","lightgreen",4},
  {"lb","lightblue",4},
  {"p","pink",3},
}

minetest.register_on_chat_message(function(name, message)
  if minetest.get_player_privs(name, {chat_c=true}) then
    for _, row in ipairs(helper) do
      if string.find(message, row[1].." ") == 1 then
              local msg = core.colorize(row[2], string.sub(message,row[3]))
              minetest.chat_send_all("<" .. name .. "> " .. msg)
          return true
      end
      end
    end
end)

minetest.register_chatcommand("public_warning", {
   params = "<text>",
   description = "Send red chat message",
   privs = {basic_privs=true},
   func = function(name, param)
      local msg = core.colorize("red", param);
      minetest.chat_send_all(msg);
   end,
})
