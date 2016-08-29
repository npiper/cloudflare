docker run -d -p 8888:8888 -e "http_proxy=http://$SUSER:$SPASS@proxy.auiag.corp:8080" -e "https_proxy=http://$SUSER:$SPASS@proxy.auiag.corp:8080" -e "no_proxy=localhost,chuck,*.auiag.corp" -e "AD_PASSWORD=$SPASS" -t cloudflare

