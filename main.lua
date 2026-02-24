return {
    entry = function()
        local root_output, _ = Command("ghq"):arg({ "root" }):stdout(Command.PIPED):output()
        if not root_output or root_output.stdout == "" then
            ya.notify { title = "ghq.yazi", content = "ghq root failed", level = "error", timeout = 3 }
            return
        end
        local ghq_root = root_output.stdout:gsub("\n$", "")

        local ghq_output, _ = Command("ghq"):arg({ "list" }):stdout(Command.PIPED):output()
        if not ghq_output or ghq_output.stdout == "" then
            ya.notify { title = "ghq.yazi", content = "ghq list failed", level = "error", timeout = 3 }
            return
        end

        local permit = ui.hide()
        local child, spawn_err = Command("fzf")
            :stdin(Command.PIPED)
            :stdout(Command.PIPED)
            :stderr(Command.INHERIT)
            :spawn()

        if not child then
            permit:drop()
            ya.notify { title = "ghq.yazi", content = "fzf failed: " .. tostring(spawn_err), level = "error", timeout = 3 }
            return
        end

        child:write_all(ghq_output.stdout)
        child:flush()
        local output, err = child:wait_with_output()
        permit:drop()

        if not output then
            ya.notify { title = "ghq.yazi", content = tostring(err), level = "error", timeout = 3 }
            return
        end
        if not output.status.success then
            return
        end
        local selected = output.stdout:gsub("\n$", "")
        if selected ~= "" then
            ya.emit("cd", { ghq_root .. "/" .. selected, raw = true })
        end
    end,
}
