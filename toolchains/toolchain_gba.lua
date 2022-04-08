-- define toolchain
toolchain("gba")
    -- mark as standalone toolchain
    set_kind("standalone")
    -- set skd dir
    set_sdkdir("F:/devkitadv-r5-beta-3")
    -- set bin dir
    set_bindir("F:/devkitadv-r5-beta-3/bin")
    -- set toolset
    set_toolset("cxx", "g++")
    set_toolset("ld", "g++")
toolchain_end()