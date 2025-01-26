function proxy
  echo "proxy"
  set -x https_proxy http://127.0.0.1:7890
  set -x http_proxy http://127.0.0.1:7890
  set -x all_proxy socks5://127.0.0.1:7890
  set -x HTTPS_PROXY http://127.0.0.1:7890
  set -x HTTP_PROXY http://127.0.0.1:7890
  set -x ALL_PROXY socks5://127.0.0.1:7890
end
