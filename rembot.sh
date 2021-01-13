#!/bin/bash

# skip odd weeks, this script is executed on Sunday
week=$(date +%-V --date="next wednesday")
if [ $((week % 2)) == 0 ]
then
        exit
fi

treffcount=$(cat ~/rembot/treffcount)
treffdate=$(LANG="de_DE.UTF-8" date --date="Wed" "+%-d. %B")

from="From: RemBot <rembot@chaostreff-gun.de>"
to="talk@chaostreff-gun.de"
subject="${treffcount}. Treffen am ${treffdate}"

mail -a "${from}" -s "${subject}" "${to}" <<EOF
Hallo,

diesen Mittwoch ist wieder Chaostreff!

Wir treffen uns im Bastelkeller. Los geht's um 19 Uhr, vermutlich ist aber auch ab 18 Uhr schon jemand da.

Dein Rem(inder)Bot
EOF

echo "$(($treffcount + 1))" > ~/rembot/treffcount
