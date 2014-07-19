#!/usr/bin/env bash
cat /var/log/apache2/ | awk '{print $1}' > ips.txt
uniq ips.txt > uniques.txt
IPS='cat uniques.txt'
echo "" > ./ipinfo.csv
for i in $IPS
do
    echo "$i,'host $i | awk '{print $5}'','geoiplookup $i | cut -d "," -f2 | sed -e 's/^[ \t]*//'','geoiplookup -f /usr/share/GeoIP/GeoLiteCity.dat $i | cut -d "," -f3 | sed -e 's/^[ \t]*//'','geoiplookup -f /usr/share/GeoIP/GeoLiteCity.dat $i | cut -d "," -f4 | sed -e 's/^[ \t]*//''" >> ipinfo.csv
done
done
