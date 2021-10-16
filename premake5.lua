project "discord-rpc"
	kind "StaticLib"
	language "C++"

    targetdir ("bin/" .. outputdir .. "/%{prj.name}")
	objdir ("bin-int/" .. outputdir .. "/%{prj.name}")

    include 
    {
        "include/"
    }

    files
	{
		"src/**.cpp"
	}

    removefiles 
    {
        "src/dllmain.cpp"
    }

    filter "system:macosx"
		files {
			"src/**.m",
		}

		removefiles {
			"src/connection_win.cpp",
			"src/discord_register_linux.cpp",
			"src/discord_register_win.cpp",
		}

		defines {
			"_DISCORD_MACOSX",
		}

	filter "system:unix"
		defines {
			"_DISCORD_UNIX",
		}	

		removefiles {
			"src/**.m",
			"src/connection_win.cpp",
			"src/discord_register_win.cpp",
		}


	filter "system:linux"
		defines {
			"_DISCORD_LINUX",
		}

		removefiles {
			"src/**.m",
			"src/connection_win.cpp",
			"src/discord_register_win.cpp",
		}


	filter "system:windows"
		defines {
			"_DISCORD_WINDOWS",
		}	

		removefiles {
			"src/**.m",
			"src/connection_unix.cpp",
			"src/discord_register_linux.cpp",
		}

