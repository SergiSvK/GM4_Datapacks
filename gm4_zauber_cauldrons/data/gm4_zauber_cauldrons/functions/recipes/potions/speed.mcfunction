# @s=boiling zauber cauldron with recipe inside
# at @s
# run from zauber_potions

# remove ingredients
execute align xyz run kill @e[type=item,dx=0,dy=0,dz=0]

# summon item (depending on red/blue fire)
execute unless score has_soul_fire gm4_zc_data matches 1 run summon item ~ ~.2 ~ {Item:{id:"minecraft:potion",Count:1b,tag:{gm4_zauber_cauldrons:{item:"potion",type:"speed",bottle:{multi_use:0}},display:{Lore:['[{"translate":"effect.minecraft.speed","color":"blue","italic":false}," ",{"translate":"potion.potency.3","color":"blue","italic":false},{"text":" (3:20)","color":"blue","italic":false}]','[{"translate":"effect.minecraft.weakness","color":"red","italic":false}," ",{"translate":"potion.potency.3","color":"red","italic":false},{"text":" (6:00)","color":"red","italic":false}]','{"text":""}','{"translate":"potion.whenDrank","color":"dark_purple","italic":false}','{"translate":"attribute.modifier.plus.1","with":["80",{"translate":"attribute.name.generic.movement_speed"}],"color":"blue","italic":false}','{"translate":"attribute.modifier.take.1","with":["16",{"translate":"attribute.name.generic.attack_damage"}],"color":"blue","italic":false}']},HideFlags:32,Potion:"swiftness",CustomPotionEffects:[{Id:1,Amplifier:3,Duration:4000},{Id:18,Amplifier:3,Duration:7200}]}}}
execute if score has_soul_fire gm4_zc_data matches 1 run summon item ~ ~.2 ~ {Item:{id:"minecraft:potion",Count:1b,tag:{gm4_zauber_cauldrons:{item:"potion",type:"speed",bottle:{sips:9b,multi_use:1b}},display:{Lore:['[{"text":"9/9 ","color":"gray","italic":false},{"translate":"%1$s%3427655$s","with":[{"text":"Sips"},{"translate":"item.gm4.zauber_cauldrons.multi_use_bottle.lore.sips"}],"color":"gray","italic":false}]','[{"translate":"effect.minecraft.speed","color":"blue","italic":false}," ",{"translate":"potion.potency.3","color":"blue","italic":false},{"text":" (3:20)","color":"blue","italic":false}]','[{"translate":"effect.minecraft.weakness","color":"red","italic":false}," ",{"translate":"potion.potency.3","color":"red","italic":false},{"text":" (6:00)","color":"red","italic":false}]','{"text":""}','{"translate":"potion.whenDrank","color":"dark_purple","italic":false}','{"translate":"attribute.modifier.plus.1","with":["80",{"translate":"attribute.name.generic.movement_speed"}],"color":"blue","italic":false}','{"translate":"attribute.modifier.take.1","with":["16",{"translate":"attribute.name.generic.attack_damage"}],"color":"blue","italic":false}'],Name:'{"translate":"%1$s","with":["Soulution of Swiftness",[{"translate":"item.gm4.zauber_cauldrons.multi_use_bottle.potion.swiftness"}]],"italic":false}'},HideFlags:32,Potion:"swiftness",CustomPotionEffects:[{Id:1,Amplifier:3,Duration:4000},{Id:18,Amplifier:3,Duration:7200}]}}}

# visuals
scoreboard players set recipe_success gm4_zc_data 1
