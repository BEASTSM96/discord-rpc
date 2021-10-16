project "discord-rpc"
	kind "StaticLib"
	language "C++"

    targetdir ("bin/" .. outputdir .. "/%{prj.name}")
	objdir ("bin-int/" .. outputdir .. "/%{prj.name}")

    includedirs 
    {
        "include/",
        "../rapidjson/include"
    }

    files
	{
		"src/**.cpp",
        "include/**.h"
	}

    removefiles 
    {
        "src/dllmain.cpp"
    }

    filter "system:macosx"
        staticruntime "On"
		files {
			"src/**.m"
		}

		removefiles {
			"src/connection_win.cpp",
			"src/discord_register_linux.cpp",
			"src/discord_register_win.cpp"
		}

		defines {
			"_DISCORD_MACOSX"
		}

        filter "configurations:Debug"
	        runtime "Debug"
	        symbols "on"
        filter "configurations:Release"
	        runtime "Release"
	        optimize "on"


	filter "system:unix"
        staticruntime "On"
		defines {
			"_DISCORD_UNIX"
		}	

		removefiles {
			"src/**.m",
			"src/connection_win.cpp",
			"src/discord_register_win.cpp"
		}
        
        filter "configurations:Debug"
	        runtime "Debug"
	        symbols "on"
        filter "configurations:Release"
	        runtime "Release"
	        optimize "on"

	filter "system:linux"
        staticruntime "On"
		defines {
			"_DISCORD_LINUX"
		}

		removefiles {
			"src/**.m",
			"src/connection_win.cpp",
			"src/discord_register_win.cpp"
		}

        filter "configurations:Debug"
	        runtime "Debug"
	        symbols "on"
        filter "configurations:Release"
	        runtime "Release"
	        optimize "on"


	filter "system:windows"
        staticruntime "On"
		defines {
			"_DISCORD_WINDOWS"
		}

		removefiles {
			"src/**.m",
			"src/connection_unix.cpp",
			"src/discord_register_linux.cpp"
		}

    filter "configurations:Debug"
		runtime "Debug"
		symbols "on"

	filter "configurations:Release"
		runtime "Release"
		optimize "on"

