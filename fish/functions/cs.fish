function cs --argument-names cmd
    switch "$cmd"
        case gcloud
            echo "# show current config"
            echo "gcloud config list"
            echo "# list and activate configurations"
            echo "gcloud config configurations list"
            echo "gcloud config configurations activate xxx"
        case "" -h --help
            echo "Usage: fisher install <plugins...>  Install plugins"
            echo "       fisher remove  <plugins...>  Remove installed plugins"
            echo "       fisher update  <plugins...>  Update installed plugins"

        case \*
            echo "cs: Unknown command: \"$cmd\"" >&2 && return 1
    end
end
