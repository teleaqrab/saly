local function history(extra, suc, result)
for i=1, #result do
delete_msg(result[i].id, ok_cb, false)
end
if tonumber(extra.con) == #result then
send_msg(extra.chatid, 'ℹ "'..#result..'" پیام اخیر سوپر گروه حذف شد', ok_cb, false)
else
send_msg(extra.chatid, 'ℹ️ تمام پیام های سوپر گروه حذف شد', ok_cb, false)
end
end
local function run(msg, matches)
if matches[1] == 'remmsg' then
    if permissions(msg.from.id, msg.to.id, "settings") then
        if msg.to.type == 'channel' then
            if tonumber(matches[2]) > 99 or tonumber(matches[2]) < 1 then
            return '🚫 '..lang_text(msg.to.id, 'require_down100')
            end
            get_history(msg.to.peer_id, matches[2] + 1 , history , {chatid = msg.to.peer_id, con = matches[2]})
        else
                         return '🚫 '..lang_text(msg.to.id, 'onlychannel')
        end
else
return '🚫 '..lang_text(msg.to.id, 'require_mod')
end
end
end
return {
    patterns = {
        '^[!/#](remmsg) (%d*)$'
    },
    run = run
}