#@s = liquid tank with item in first slot
#run from liquid_tanks:item_process

#experience tank
execute if entity @s[tag=gm4_lt_experience] if data storage gm4_liquid_tanks:temp/tank {input_slot:{components:{"minecraft:enchantments":{levels:{"minecraft:mending":1}}}}} run function gm4_mending_tanks:check_item
