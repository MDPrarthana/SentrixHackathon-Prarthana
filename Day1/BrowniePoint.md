# Sleepwalker's Diary – Day 1 Brownie Point

## Problem

Security alerts are often investigated individually. Historical attacker activity is rarely correlated, allowing attackers to spread actions over time and avoid detection.

## Interpretation

The riddle describes a SOC that records alerts but forgets previous attacker behavior.

A real attacker learns this weakness and performs a low-and-slow attack campaign.

## Solution

A Bash-based attack campaign reconstruction engine was developed.

The engine:

- Reads historical attacker events
- Groups activities by source IP
- Builds an attacker timeline
- Maps activities to attack stages
- Detects complete attack campaigns
- Predicts attacker intent

## Attack Stages

- NMAP_SCAN → Reconnaissance
- SSH_ATTEMPT → Credential Access
- WEB_ENUMERATION → Discovery
- SQL_INJECTION → Exploitation

## Outcome

Instead of viewing alerts independently, the system reconstructs attacker behavior across time and identifies low-and-slow attack campaigns.

This helps analysts detect threats that would otherwise appear as unrelated events.
