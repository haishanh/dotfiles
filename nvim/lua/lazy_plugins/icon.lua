return {
  { dir = "/Users/haishan/Developer/h/nvim-nonicons", lazy = true },
  -- { dir = "~/h/nvim-nonicons",     lazy = true },
  {
    "nvim-tree/nvim-web-devicons",
    dependencies = { "nvim-nonicons" },
    event = 'VeryLazy',
    -- lazy = true,
    config = function(_, _opts)
      local get = require("nvim-nonicons").get;
      -- checkout https://github.com/nvim-tree/nvim-web-devicons/blob/master/lua/nvim-web-devicons/icons-default.lua 
      require 'nvim-web-devicons'.setup {
        override = {
          -- ["gruntfile"] = {
          --   icon = "",
          --   color = "#e37933",
          --   name = "Gruntfile"
          -- },
          -- ["gulpfile"] = {
          --   icon = "",
          --   color = "#cc3e44",
          --   name = "Gulpfile"
          -- },
          -- ["dropbox"] = {
          --   icon = "",
          --   color = "#0061FE",
          --   name = "Dropbox"
          -- },
          -- ["xls"] = {
          --   icon = "",
          --   color = "#207245",
          --   name = "Xls"
          -- },
          -- ["doc"] = {
          --   icon = "",
          --   color = "#185abd",
          --   name = "Doc"
          -- },
          -- ["ppt"] = {
          --   icon = "",
          --   color = "#cb4a32",
          --   name = "Ppt"
          -- },
          -- ["xml"] = {
          --   icon = "謹",
          --   color = "#e37933",
          --   name = "Xml"
          -- },
          -- ["webpack"] = {
          --   icon = "ﰩ",
          --   color = "#519aba",
          --   name = "Webpack"
          -- },
          -- [".settings.json"] = {
          --   icon = "",
          --   color = "#854CC7",
          --   name = "SettingsJson"
          -- },
          -- ["cs"] = {
          --   icon = "",
          --   color = "#596706",
          --   name = "Cs"
          -- },
          -- ["procfile"] = {
          --   icon = "",
          --   color = "#a074c4",
          --   name = "Procfile"
          -- },
          ["svg"] = {
            icon = get("image"),
            color = "#FFB13B",
            name = "Svg"
          },
          -- [".bashprofile"] = {
          --   icon = "",
          --   color = "#89e051",
          --   name = "BashProfile"
          -- },
          -- [".bashrc"] = {
          --   icon = "",
          --   color = "#89e051",
          --   name = "Bashrc"
          -- },
          -- [".babelrc"] = {
          --   icon = "ﬥ",
          --   color = "#cbcb41",
          --   name = "Babelrc"
          -- },
          -- [".ds_store"] = {
          --   icon = "",
          --   color = "#41535b",
          --   name = "DsStore"
          -- },
          ["git"] = {
            icon = get("git-commit"),
            color = "#F14C28",
            name = "GitLogo"
          },
          [".gitattributes"] = {
            icon = get("git-commit"),
            color = "#41535b",
            name = "GitAttributes"
          },
          [".gitconfig"] = {
            icon = get("git-commit"),
            color = "#41535b",
            name = "GitConfig"
          },
          -- ["COMMIT_EDITMSG"] = {
          --   icon = "",
          --   color = "#41535b",
          --   name = "GitCommit"
          -- },
          -- [".gitlab-ci.yml"] = {
          --   icon = "",
          --   color = "#e24329",
          --   name = "GitlabCI"
          -- },
          [".gvimrc"] = {
            icon = get("vim"),
            color = "#019833",
            name = "Gvimrc"
          },
          [".npmrc"] = {
            icon = get("npm"),
            color = "#E8274B",
            cterm_color = "161",
            name = "NPMrc",
          },
          [".npmignore"] = {
            icon = get("npm"),
            color = "#E8274B",
            name = "NPMIgnore"
          },
          [".vimrc"] = {
            icon = get("vim"),
            color = "#019833",
            name = "Vimrc"
          },
          [".zshrc"] = {
            icon = get("terminal"),
            color = "#89e051",
            name = "Zshrc"
          },
          ["Dockerfile"] = {
            icon = get("docker"),
            color = "#384d54",
            name = "Dockerfile"
          },
          ["Gemfile"] = {
            icon = get("ruby"),
            color = "#701516",
            name = "Gemfile"
          },
          ["LICENSE"] = {
            icon = get("file-badge"),
            color = "#d0bf41",
            name = "License"
          },
          -- ["Vagrantfile$"] = {
          --   icon = "",
          --   color = "#1563FF",
          --   name = "Vagrantfile"
          -- },
          -- ["_gvimrc"] = {
          --   icon = "",
          --   color = "#019833",
          --   name = "Gvimrc"
          -- },
          -- ["_vimrc"] = {
          --   icon = "",
          --   color = "#019833",
          --   name = "Vimrc"
          -- },
          -- ["ai"] = {
          --   icon = "",
          --   color = "#cbcb41",
          --   name = "Ai"
          -- },
          -- ["awk"] = {
          --   icon = "",
          --   color = "#4d5a5e",
          --   name = "Awk"
          -- },
          ["bash"] = {
            icon = get("terminal"),
            color = "#89e051",
            name = "Bash"
          },
          -- ["bat"] = {
          --   icon = "",
          --   color = "#C1F12E",
          --   name = "Bat"
          -- },
          -- ["bmp"] = {
          --   icon = "",
          --   color = "#a074c4",
          --   name = "Bmp"
          -- },
          ["c"] = {
            icon = get("c"),
            color = "#599eff",
            name = "C"
          },
          ["c++"] = {
            icon = get("c-plusplus"),
            color = "#f34b7d",
            name = "CPlusPlus"
          },
          ["cc"] = {
            icon = get("c-plusplus"),
            color = "#f34b7d",
            name = "CPlusPlus"
          },
          -- ["clj"] = {
          --   icon = "",
          --   color = "#8dc149",
          --   name = "Clojure"
          -- },
          -- ["cljc"] = {
          --   icon = "",
          --   color = "#8dc149",
          --   name = "ClojureC"
          -- },
          -- ["cljs"] = {
          --   icon = "",
          --   color = "#519aba",
          --   name = "ClojureJS"
          -- },
          -- ["cmakelists.txt"] = {
          --   icon = "",
          --   color = "#6d8086",
          --   name = "CmakeLists"
          -- },
          -- ["coffee"] = {
          --   icon = "",
          --   color = "#cbcb41",
          --   name = "Coffee"
          -- },
          ["conf"] = {
            icon = get("gear"),
            color = "#6d8086",
            name = "Conf"
          },
          -- ["config.ru"] = {
          --   icon = "",
          --   color = "#701516",
          --   name = "ConfigRu"
          -- },
          ["cp"] = {
            icon = get("c-plusplus"),
            color = "#519aba",
            name = "Cp"
          },
          ["cpp"] = {
            icon = get("c-plusplus"),
            color = "#519aba",
            name = "Cpp"
          },
          -- ["csh"] = {
          --   icon = "",
          --   color = "#4d5a5e",
          --   name = "Csh"
          -- },
          ["css"] = {
            icon = get("css"),
            color = "#563d7c",
            name = "Css"
          },
          -- ["cxx"] = {
          --   icon = "",
          --   color = "#519aba",
          --   name = "Cxx"
          -- },
          -- ["d"] = {
          --   icon = "",
          --   color = "#427819",
          --   name = "D"
          -- },
          ["dart"] = {
            icon = get("dart"),
            color = "#03589C",
            name = "Dart"
          },
          ["db"] = {
            icon = get("database"),
            color = "#dad8d8",
            name = "Db"
          },
          -- ["diff"] = {
          --   icon = "",
          --   color = "#41535b",
          --   name = "Diff"
          -- },
          ["dockerfile"] = {
            icon = get("docker"),
            color = "#384d54",
            name = "Dockerfile"
          },
          [".dockerignore"] = {
            icon = get("docker"),
            color = "#384d54",
            name = "Dockerfile"
          },
          [".env"] = {
            icon = get("cpu"),
            color = "#faf743",
            cterm_color = "226",
            name = "Env",
          },
          -- ["dump"] = {
          --   icon = "",
          --   color = "#dad8d8",
          --   name = "Dump"
          -- },
          -- ["edn"] = {
          --   icon = "",
          --   color = "#519aba",
          --   name = "Edn"
          -- },
          -- ["eex"] = {
          --   icon = "",
          --   color = "#a074c4",
          --   name = "Eex"
          -- },
          -- ["ejs"] = {
          --   icon = "",
          --   color = "#cbcb41",
          --   name = "Ejs"
          -- },
          -- ["elm"] = {
          --   icon = "",
          --   color = "#519aba",
          --   name = "Elm"
          -- },
          -- ["erl"] = {
          --   icon = "",
          --   color = "#B83998",
          --   name = "Erl"
          -- },
          -- ["ex"] = {
          --   icon = "",
          --   color = "#a074c4",
          --   name = "Ex"
          -- },
          -- ["exs"] = {
          --   icon = "",
          --   color = "#a074c4",
          --   name = "Exs"
          -- },
          -- ["f#"] = {
          --   icon = "",
          --   color = "#519aba",
          --   name = "Fsharp"
          -- },
          -- ["favicon.ico"] = {
          --   icon = "",
          --   color = "#cbcb41",
          --   name = "Favicon"
          -- },
          ["fish"] = {
            icon = get("terminal"),
            color = "#4d5a5e",
            name = "Fish"
          },
          -- ["fs"] = {
          --   icon = "",
          --   color = "#519aba",
          --   name = "Fs"
          -- },
          -- ["fsi"] = {
          --   icon = "",
          --   color = "#519aba",
          --   name = "Fsi"
          -- },
          -- ["fsscript"] = {
          --   icon = "",
          --   color = "#519aba",
          --   name = "Fsscript"
          -- },
          -- ["fsx"] = {
          --   icon = "",
          --   color = "#519aba",
          --   name = "Fsx"
          -- },
          -- ["gemspec"] = {
          --   icon = "",
          --   color = "#701516",
          --   name = "Gemspec"
          -- },
          -- ["gif"] = {
          --   icon = "",
          --   color = "#a074c4",
          --   name = "Gif"
          -- },
          ["go"] = {
            icon = get("go"),
            color = "#519aba",
            name = "Go"
          },
          -- ["h"] = {
          --   icon = "",
          --   color = "#a074c4",
          --   name = "H"
          -- },
          -- ["haml"] = {
          --   icon = "",
          --   color = "#eaeae1",
          --   name = "Haml"
          -- },
          -- ["hbs"] = {
          --   icon = "",
          --   color = "#f0772b",
          --   name = "Hbs"
          -- },
          -- ["hh"] = {
          --   icon = "",
          --   color = "#a074c4",
          --   name = "Hh"
          -- },
          -- ["hpp"] = {
          --   icon = "",
          --   color = "#a074c4",
          --   name = "Hpp"
          -- },
          -- ["hrl"] = {
          --   icon = "",
          --   color = "#B83998",
          --   name = "Hrl"
          -- },
          -- ["hs"] = {
          --   icon = "",
          --   color = "#a074c4",
          --   name = "Hs"
          -- },
          ["htm"] = {
            icon = get("html"),
            color = "#e34c26",
            name = "Htm"
          },
          ["html"] = {
            icon = get("html"),
            color = "#e34c26",
            name = "Html"
          },
          -- ["hxx"] = {
          --   icon = "",
          --   color = "#a074c4",
          --   name = "Hxx"
          -- },
          ["ico"] = {
            icon = get("image"),
            color = "#cbcb41",
            name = "Ico"
          },
          -- ["ini"] = {
          --   icon = "",
          --   color = "#6d8086",
          --   name = "Ini"
          -- },
          ["java"] = {
            icon = get("java"),
            color = "#cc3e44",
            name = "Java"
          },
          -- ["jl"] = {
          --   icon = "",
          --   color = "#a270ba",
          --   name = "Jl"
          -- },
          ["jpeg"] = {
            icon = get("image"),
            color = "#a074c4",
            name = "Jpeg"
          },
          ["jpg"] = {
            icon = get("image"),
            color = "#a074c4",
            name = "Jpg"
          },
          ["js"] = {
            icon = get("javascript"),
            color = "#cbcb41",
            name = "Js"
          },
          ["cjs"] = {
            icon = get("javascript"),
            color = "#cbcb41",
            name = "Js"
          },
          ["json"] = {
            icon = get("json"),
            color = "#cbcb41",
            name = "Json"
          },
          ["jsonc"] = {
            icon = get("json"),
            color = "#cbcb41",
            name = "Json"
          },
          ["jsx"] = {
            icon = get("react"),
            color = "#519aba",
            name = "Jsx"
          },
          -- ["ksh"] = {
          --   icon = "",
          --   color = "#4d5a5e",
          --   name = "Ksh"
          -- },
          -- ["leex"] = {
          --   icon = "",
          --   color = "#a074c4",
          --   name = "Leex"
          -- },
          -- ["less"] = {
          --   icon = "",
          --   color = "#563d7c",
          --   name = "Less"
          -- },
          -- ["lhs"] = {
          --   icon = "",
          --   color = "#a074c4",
          --   name = "Lhs"
          -- },
          ["license"] = {
            icon = get("file-badge"),
            color = "#cbcb41",
            name = "License"
          },
          ["lua"] = {
            icon = get("lua"),
            color = "#51a0cf",
            name = "Lua"
          },
          ["makefile"] = {
            icon = get("terminal"),
            color = "#6d8086",
            name = "Makefile"
          },
          ["markdown"] = {
            icon = get("markdown"),
            color = "#519aba",
            name = "Markdown"
          },
          ["md"] = {
            icon = get("markdown"),
            color = "#519aba",
            name = "Md"
          },
          ["mdx"] = {
            icon = get("markdown"),
            color = "#519aba",
            name = "Mdx"
          },
          -- ["mix.lock"] = {
          --   icon = "",
          --   color = "#a074c4",
          --   name = "MixLock"
          -- },
          ["mjs"] = {
            icon = get("javascript"),
            color = "#f1e05a",
            cterm_color = "221",
            name = "Mjs",
          },
          -- ["ml"] = {
          --   icon = "λ",
          --   color = "#e37933",
          --   name = "Ml"
          -- },
          -- ["mli"] = {
          --   icon = "λ",
          --   color = "#e37933",
          --   name = "Mli"
          -- },
          -- ["mustache"] = {
          --   icon = "",
          --   color = "#e37933",
          --   name = "Mustache"
          -- },
          -- ["nix"] = {
          --   icon = "",
          --   color = "#7ebae4",
          --   name = "Nix"
          -- },
          ["node_modules"] = {
            icon = get("npm"),
            color = "#E8274B",
            name = "NodeModules"
          },
          ['package.json'] = {
            icon = get("npm"),
            color = "#e8274b",
            name = "PackageJson"
          },
          ['package-lock.json'] = {
            icon = get("npm"),
            color = "#7a0d21",
            name = "PackageLockJson"
          },
          ["php"] = {
            icon = get("php"),
            color = "#a074c4",
            name = "Php"
          },
          ["pl"] = {
            icon = get("perl"),
            color = "#519aba",
            name = "Pl"
          },
          -- ["pm"] = {
          --   icon = "",
          --   color = "#519aba",
          --   name = "Pm"
          -- },
          ["png"] = {
            icon = get("image"),
            color = "#a074c4",
            name = "Png"
          },
          -- ["pp"] = {
          --   icon = "",
          --   color = "#302B6D",
          --   name = "Pp"
          -- },
          -- ["ps1"] = {
          --   icon = "",
          --   color = "#4d5a5e",
          --   name = "PromptPs1"
          -- },
          -- ["psb"] = {
          --   icon = "",
          --   color = "#519aba",
          --   name = "Psb"
          -- },
          -- ["psd"] = {
          --   icon = "",
          --   color = "#519aba",
          --   name = "Psd"
          -- },
          ["py"] = {
            icon = get("python"),
            color = "#3572A5",
            name = "Py"
          },
          ["pyc"] = {
            icon = get("python"),
            color = "#519aba",
            name = "Pyc"
          },
          ["pyd"] = {
            icon = get("python"),
            color = "#519aba",
            name = "Pyd"
          },
          ["pyo"] = {
            icon = get("python"),
            color = "#519aba",
            name = "Pyo"
          },
          ["r"] = {
            icon = get("r"),
            color = "#358a5b",
            name = "R"
          },
          ["rake"] = {
            icon = get("ruby"),
            color = "#701516",
            name = "Rake"
          },
          ["rakefile"] = {
            icon = get("ruby"),
            color = "#701516",
            name = "Rakefile"
          },
          ["rb"] = {
            icon = get("ruby"),
            color = "#701516",
            name = "Rb"
          },
          -- ["rlib"] = {
          --   icon = "",
          --   color = "#dea584",
          --   name = "Rlib"
          -- },
          -- ["rmd"] = {
          --   icon = "",
          --   color = "#519aba",
          --   name = "Rmd"
          -- },
          -- ["rproj"] = {
          --   icon = "鉶",
          --   color = "#358a5b",
          --   name = "Rproj"
          -- },
          ["rs"] = {
            icon = get("rust"),
            color = "#dea584",
            name = "Rs"
          },
          ["rss"] = {
            icon = get("rss"),
            color = "#FB9D3B",
            name = "Rss"
          },
          -- ["sass"] = {
          --   icon = "",
          --   color = "#f55385",
          --   name = "Sass"
          -- },
          ["scala"] = {
            icon = get("scala"),
            color = "#cc3e44",
            name = "Scala"
          },
          ["scss"] = {
            icon = get("css"),
            color = "#f55385",
            name = "Scss"
          },
          ["sh"] = {
            icon = get("terminal"),
            color = "#4d5a5e",
            name = "Sh"
          },
          -- ["slim"] = {
          --   icon = "",
          --   color = "#e34c26",
          --   name = "Slim"
          -- },
          -- ["sln"] = {
          --   icon = "",
          --   color = "#854CC7",
          --   name = "Sln"
          -- },
          ["sql"] = {
            icon = get("database"),
            color = "#dad8d8",
            name = "Sql"
          },
          -- ["styl"] = {
          --   icon = "",
          --   color = "#8dc149",
          --   name = "Styl"
          -- },
          -- ["suo"] = {
          --   icon = "",
          --   color = "#854CC7",
          --   name = "Suo"
          -- },
          --
          ["svelte"] = {
            icon = get("svelte"),
            color = "#ff3e00",
            cterm_color = "202",
            name = "Svelte",
          },
          ["swift"] = {
            icon = get("swift"),
            color = "#e37933",
            name = "Swift"
          },
          -- ["t"] = {
          --   icon = "",
          --   color = "#519aba",
          --   name = "Tor"
          -- },
          -- ["tex"] = {
          --   icon = "ﭨ",
          --   color = "#3D6117",
          --   name = "Tex"
          -- },
          ["txt"] = {
            icon = get("file"),
            color = "#89e051",
            cterm_color = "113",
            name = "Txt",
          },
          ["toml"] = {
            icon = get("toml"),
            color = "#6d8086",
            name = "Toml"
          },
          ["test.ts"] = {
            icon = get("typescript"),
            color = "#384d54",
            name = "TestTs"
          },
          ["spec.ts"] = {
            icon = get("typescript"),
            color = "#384d54",
            name = "SpecTs"
          },
          ["d.ts"] = {
            icon = get("typescript"),
            color = "#384d54",
            name = "SpecTs"
          },
          ["ts"] = {
            icon = get("typescript"),
            color = "#519aba",
            name = "Ts"
          },
          ["tsx"] = {
            icon = get("react"),
            color = "#519aba",
            name = "Tsx"
          },
          -- ["twig"] = {
          --   icon = "",
          --   color = "#8dc149",
          --   name = "Twig"
          -- },
          ["vim"] = {
            icon = get("vim"),
            color = "#019833",
            name = "Vim"
          },
          ["vue"] = {
            icon = get("vue"),
            color = "#8dc149",
            name = "Vue"
          },
          -- ["webmanifest"] = {
          --   icon = "",
          --   color = "#f1e05a",
          --   name = "Webmanifest"
          -- },
          ["webp"] = {
            icon = get("image"),
            color = "#a074c4",
            name = "Webp"
          },
          -- ["xcplayground"] = {
          --   icon = "",
          --   color = "#e37933",
          --   name = "XcPlayground"
          -- },
          -- ["xul"] = {
          --   icon = "",
          --   color = "#e37933",
          --   name = "Xul"
          -- },
          ["yaml"] = {
            icon = get("yaml"),
            color = "#6d8086",
            name = "Yaml"
          },
          ["yml"] = {
            icon = get("yaml"),
            color = "#6d8086",
            name = "Yml"
          },
          ["zsh"] = {
            icon = get("terminal"),
            color = "#89e051",
            name = "Zsh"
          },
          ["terminal"] = {
            icon = get("terminal"),
            color = "#31B53E",
            name = "Terminal"
          }
          -- ["pdf"] = {
          --   icon = "",
          --   color = "#b30b00",
          --   name = "Pdf"
          -- },
          -- ["kt"] = {
          --   icon = "𝙆",
          --   color = "#F88A02",
          --   name = "Kotlin"
          -- }
        },
        override_by_filename = {
          [".gitignore"] = {
            icon = get("git-commit"),
            -- color = "#f1502f",
            color = "#41535b",
            name = "Gitignore"
          },
          ["favicon.ico"] = {
            icon = get("image"),
            color = "#cbcb41",
            cterm_color = "185",
            name = "Favicon",
          },
        },
        -- same as `override` but specifically for overrides by extension
        -- takes effect when `strict` is true
        override_by_extension = {
          ["log"] = {
            icon = get("file"),
            color = "#384d54",
            name = "Log"
          }
        }
      }
    end,
  },

}
