-- ~/.config/yazi/init.lua
-- relative-motions {{{
require("relative-motions"):setup({
    show_numbers = "relative_absolute",
    show_motion = false
})
-- }}}

-- Folder-specific rules {{{
require("folder-rules"):setup()
-- }}}

-- Git support {{{
require("git"):setup()
-- }}}

-- Add file owner and group to Status bar {{{
Status:children_add(function()
    local h = cx.active.current.hovered
    if h == nil or ya.target_family() ~= "unix" then return "" end

    return ui.Line {
        ui.Span(ya.user_name(h.cha.uid) or tostring(h.cha.uid)):fg("yellow"),
        ":",
        ui.Span(ya.group_name(h.cha.gid) or tostring(h.cha.gid)):fg("yellow"),
        " "
    }
end, 500, Status.RIGHT)
-- }}}

-- Symlink {{{
Status:children_add(function(self)
    local h = self._current.hovered
    if h and h.link_to then
        return "  " .. tostring(h.link_to)
    else
        return ""
    end
end, 3300, Status.LEFT)
-- }}}
