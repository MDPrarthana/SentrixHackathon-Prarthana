#!/bin/bash

echo ""
echo "========================================"
echo "      SLEEPWALKER ATTACK ANALYZER"
echo "========================================"
echo ""

awk -F, '

NR>1 && NF>=3 {

ip=$2
event=$3

timeline[ip]=timeline[ip] "\n" $1 " -> " event

if(event=="NMAP_SCAN")
recon[ip]=1

if(event=="SSH_ATTEMPT")
access[ip]=1

if(event=="WEB_ENUMERATION")
discovery[ip]=1

if(event=="SQL_INJECTION")
exploit[ip]=1

}

END {

for(ip in timeline){

print "Attacker IP :",ip
print ""
print "Timeline:"
print timeline[ip]
print ""

if(recon[ip]) print "✓ Reconnaissance"
if(access[ip]) print "✓ Credential Access"
if(discovery[ip]) print "✓ Discovery"
if(exploit[ip]) print "✓ Exploitation"

print ""

if(recon[ip] && access[ip] && discovery[ip] && exploit[ip]){

print "ATTACK CAMPAIGN DETECTED"
print "Campaign Type : Low-and-Slow Attack"
print "Defender Blind Spot : Alerts treated independently"
print "Prediction : Future compromise likely"
print "Threat Level : CRITICAL"

}else{

print "No Complete Campaign Detected"
print "Threat Level : LOW"

}

print ""
print "--------------------------------------"
print ""

}
}
' attacker_history.csv
