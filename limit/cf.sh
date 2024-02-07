#!/bin/bash
MYIP=$(wget -qO-icanhazip.com);
tepat instal jq curl -y
read -p "Masukan Domain (contoh : memek7)" domen
DOMAIN=mypremium.biz.id
sub=${domen}
#(</dev/urandom tr -dc a-z0-9 | kepala -c5)
dns=${sub}.mypremium.biz.id
CF_ID=andyyuda41@gmail.com
CF_KEY=0d626234700bad388d6d07b49c42901445d1c
setel -euo pipefail
IP=$(wget -qO-icanhazip.com);
echo "Memperbarui DNS untuk ${dns}..."
ZONA=$(curl -sLX DAPATKAN "https://api.cloudflare.com/client/v4/zones?name=${DOMAIN}&status=active" \
     -H "X-Auth-Email: ${CF_ID}" \
     -H "Kunci-X-Auth: ${CF_KEY}" \
     -H "Jenis Konten: aplikasi/json" | jq -r .hasil[0].id)

RECORD=$(curl -sLX DAPATKAN "https://api.cloudflare.com/client/v4/zones/${ZONE}/dns_records?name=${dns}" \
     -H "X-Auth-Email: ${CF_ID}" \
     -H "Kunci-X-Auth: ${CF_KEY}" \
     -H "Jenis Konten: aplikasi/json" | jq -r .hasil[0].id)

jika [[ "${#RECORD}" -le 10 ]]; Kemudian
     REKAM=$(curl -sLX POST "https://api.cloudflare.com/client/v4/zones/${ZONE}/dns_records" \
     -H "X-Auth-Email: ${CF_ID}" \
     -H "Kunci-X-Auth: ${CF_KEY}" \
     -H "Jenis Konten: aplikasi/json" \
     --data '{"type":"A","name":"'${dns}'","content":"'${IP}'","ttl":120,"proxied":false }' | jq -r .hasil.id)
fi

HASIL=$(curl -sLX PUT "https://api.cloudflare.com/client/v4/zones/${ZONE}/dns_records/${RECORD}" \
     -H "X-Auth-Email: ${CF_ID}" \
     -H "Kunci-X-Auth: ${CF_KEY}" \
     -H "Jenis Konten: aplikasi/json" \
     --data '{"type":"A","name":"'${dns}'","content":"'${IP}'","ttl":120,"proxied":false }')
gema "$dns" > /root/domain
gema "$dns" > /root/scdomain
gema "$dns" > /etc/xray/domain
gema "$dns" > /etc/v2ray/domain
gema "$dns" > /etc/xray/scdomain
gema "IP=$dns" > /var/lib/kyt/ipvps.conf
CD
