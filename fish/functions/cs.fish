function cs --argument-names cmd
    switch "$cmd"
        case gcloud
            echo "# show current config"
            echo "gcloud config list"
            echo "# list and activate configurations"
            echo "gcloud config configurations list"
            echo "gcloud config configurations activate xxx"
        case http
            echo "http PUT pie.dev/put"
            echo "  x-date:today  # he "
            echo "  token==secret # Query"
            echo "  name=John     # Data field"
            echo "  "'"'ids[]=10'"'   "   # ids[0]=10"
            echo "  ids[]=10 # ids[1]=20"
            echo "  age:=29 # Raw JSON"
            echo ""
            echo "# application/x-www-form-urlencoded"
            echo "# --data-urlencode"
            echo "http --form POST httpbin.org/anything name=foo"
        case "" -h --help
            echo "Usage: cs command  Show help for command"
            echo "       cs gcloud"
            echo "       cs http"

        case \*
            echo "cs: Unknown command: \"$cmd\"" >&2 && return 1
    end
end
