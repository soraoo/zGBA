rule("gba-release")
    set_extensions(".cpp")
    on_build_files(function(target, filebatch, opt)
        import("core.project.depend")
        import("utils.progress")

        -- 定义build文件夹
        local targetdir = target:targetdir()
        local objdir = path.join(targetdir, ".objs")
        local bindir = path.join(targetdir, ".bins")
        local gbadir = path.join(targetdir, "release")
        local targetname = target:name()

        -- 确保文件夹存在
        os.mkdir(targetdir)
        os.mkdir(objdir)
        os.mkdir(bindir)
        os.mkdir(gbadir)

        -- 1. 将所有.cpp编译为.o
        progress.show(25, "compile cpps...")
        local objfiles = {}
        for _, sourcefile in ipairs(filebatch.sourcefiles) do
            local objfile = path.join(objdir, path.basename(sourcefile)) .. ".o"
            print("compile: " .. sourcefile)
            os.vrunv("g++", {"-c", sourcefile, "-o", objfile, "-std=c++98"})
            table.append(objfiles, objfile)
        end

        -- 2. 将所有.o链接为.b
        progress.show(50, "generate bin file...")
        local binfile = path.join(bindir, targetname) .. ".b"
        os.vrunv("g++", {"-o", binfile, unpack(objfiles)})

        -- 3. 生成最终的.gba文件
        progress.show(75, "generate gba file...")
        local gbafile = path.join(gbadir, targetname) .. ".gba"
        os.vrunv("objcopy", {"-O", "binary", binfile, gbafile})
    end)
rule_end()