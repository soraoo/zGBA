rule("gba-copy")
    set_extensions(".b")
    on_build_file(function(target, sourcefile, opt)
        import("core.project.depend")
        import("utils.progress")

        local targetdir = target:targetdir()
        local gbafile = path.join(targetdir, target:name()) .. ".gba"

        -- make sure build directory exists
        os.mkdir(targetdir)
        
        -- 编译为.gba
        progress.show(opt.progress, "generate gba file: %s", gbafile)
        os.vrunv("objcopy", {"-O", "binary", sourcefile, gbafile})
    end)
