# T1GER DELIVERY JOB

### Contact
Author: T1GER#9080
Discord: https://discord.gg/FdHkq5q

### Requirements
- ESX 1.2 and below (NOTE: Does NOT support EXM/ExtendedMode or ESX v2.0+)

### Installation
1) Drag & drop the t1ger_deliveryjob into your `resources` server folder.
2) Configure the config file to your liking.
3) Make sure you meet the required requirements.
4) Import the `t1ger_deliverjob.sql` file to your database.
4) Add `start t1ger_deliveryjob` to your server config.
5) Make sure to read through the README!!!!

### Showcase
- https://youtu.be/DEjNVA_PSyU

### Protection
Do not touch or delete **protection_cl.lua** and **protection_sv.lua**. This is security. Upon deleting/corruption these, script will not work.
Contact #T1GER#9080 for IP-Authorization.

### Level System
After each job, players can have added x amount of level in their company. More level means better job opportunities. 
To add trucking company level, call this event:
`TriggerEvent('t1ger_deliveryjob:addCompanyLVL',amount)`
In this script, in config u can decide how much lvl u want to add. The event is triggered serverside, and can be used from other script to improve company level.

## T1GER Shops Support
- Do not touch ID 4 in config for shops and don't change anything inside that.
- Change vehicles, change required level and vehicles and that's it. Don't move it away from ID 4. And don't change the label of it.