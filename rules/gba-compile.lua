rule("gba-compile")
    set_extensions(".cpp")
    on_build_file(function(target, sourcefile, opt)
        import("core.project.depend")
        import("utils.progress")

        local targetdir = target:targetdir()

        local filename = path.basename(sourcefile)
        local objfile = path.join(targetdir, filename) .. ".o"

        -- make sure build directory exists
        os.mkdir(targetdir)

        -- 编译为.o
        progress.show(opt.progress, "compile cpp: %s", sourcefile)
        os.vrunv("g++", {"-c", sourcefile, "-o", objfile, "-std=c++98"})
    end)

