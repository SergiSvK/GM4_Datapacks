# places the auto_crafter down based on rotation
# @s = player who placed the auto_crafter
# located at the center of the placed block
# run from gm4_auto_crafting:machine/create

# place dropper
setblock ~ ~ ~ dropper[facing=south]{CustomName:'{"translate":"%1$s%3427655$s","with":[{"translate":"%1$s%3427656$s","with":[{"text":"Set Recipe Shape","font":"minecraft:default","color":"#373737"},[{"text":"Set\\u00a0Recipe\\u00a0Shape","font":"gm4:half_scale"},{"text":"Set\\u00a0Recipe\\u00a0Shape","font":"gm4:inverted"},{"text":"Set\\u00a0Recipe\\u00a0Shape","font":"gm4:inverted_spacing"},{"text":"Set\\u00a0Recipe\\u00a0Shape","font":"gm4:offscreen"},{"translate":"gui.gm4.auto_crafter","font":"gm4:container_gui","color":"white"},{"text":"Set\\u00a0Recipe\\u00a0Shape","font":"gm4:half_scale"},{"text":"Set\\u00a0Recipe\\u00a0Shape","font":"gm4:inverted"},{"text":"Set\\u00a0Recipe\\u00a0Shape","font":"gm4:inverted_spacing"},{"text":"Set Recipe Shape","font":"minecraft:default","color":"#373737"}]]},{"translate":"%1$s%3427656$s","with":[{"translate":"container.gm4.auto_crafter","font":"minecraft:default","color":"#373737"},[{"translate":"container.gm4.auto_crafter","font":"gm4:half_scale"},{"translate":"container.gm4.auto_crafter","font":"gm4:inverted"},{"translate":"container.gm4.auto_crafter","font":"gm4:inverted_spacing"},{"translate":"container.gm4.auto_crafter","font":"gm4:offscreen"},{"translate":"gui.gm4.auto_crafter","font":"gm4:container_gui","color":"white"},{"translate":"container.gm4.auto_crafter","font":"gm4:half_scale"},{"translate":"container.gm4.auto_crafter","font":"gm4:inverted"},{"translate":"container.gm4.auto_crafter","font":"gm4:inverted_spacing"},{"translate":"container.gm4.auto_crafter","font":"minecraft:default","color":"#373737"}]]}]}'}

# summon display armor stand and marker entity
summon armor_stand ~ ~-1.44 ~ {NoGravity:1,Marker:1,Invulnerable:1,Invisible:1,Silent:1,DisabledSlots:4144959,Tags:["gm4_no_edit","gm4_auto_crafter_stand","gm4_machine_stand","smithed.entity","smithed.strict","gm4_new_machine"],HasVisualFire:1,CustomName:'"gm4_auto_crafter_stand"',ArmorItems:[{},{},{},{id:"minecraft:crafting_table",Count:1b,tag:{CustomModelData:3420008}}],Rotation:[0.0f,0.0f],Pose:{Head:[90.0f,0.0f,0.0f]}}
summon marker ~ ~ ~ {Tags:["gm4_auto_crafter","gm4_machine_marker","smithed.block","smithed.entity","smithed.strict","gm4_new_machine"],CustomName:'"gm4_auto_crafter"',Rotation:[0.0f,0.0f]}