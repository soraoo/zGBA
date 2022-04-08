rule("gba-binary")
    set_extensions(".o")
    on_build_files(function(target, filebatch, opt)
        import("core.project.depend")
        import("utils.progress")

        local targetdir = target:targetdir()
        local binfile = path.join(targetdir, target:name()) .. ".b"

        -- make sure build directory exists
        os.mkdir(targetdir)

        -- 编译为.b
        local files = {}
        for i = #filebatch.sourcefiles, 1, -1 do
            table.append(files, filebatch.sourcefiles[i])
        end
        
        progress.show(opt.progress, "generate bin file: %s", path.filename(binfile))
        os.vrunv("g++", {"-o", binfile, unpack(files)})
    end)
