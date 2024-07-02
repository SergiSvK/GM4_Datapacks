from beet import Context, LootTable
from beet.contrib.vanilla import Vanilla
import itertools
from typing import Any

ITEMS = {
  "diamond_sword": 1562,
  "diamond_pickaxe": 1562,
  "diamond_axe": 1562,
  "diamond_shovel": 1562,
  "diamond_hoe": 1562,
  "diamond_helmet": 364,
  "diamond_chestplate": 529,
  "diamond_leggings": 496,
  "diamond_boots": 430,

  "iron_sword": 251,
  "iron_pickaxe": 251,
  "iron_axe": 251,
  "iron_shovel": 251,
  "iron_hoe": 251,
  "iron_helmet": 166,
  "iron_chestplate": 241,
  "iron_leggings": 226,
  "iron_boots": 196,

  "golden_sword": 33,
  "golden_pickaxe": 33,
  "golden_axe": 33,
  "golden_shovel": 33,
  "golden_hoe": 33,
  "golden_helmet": 78,
  "golden_chestplate": 113,
  "golden_leggings": 106,
  "golden_boots": 92,

  "leather_helmet": 56,
  "leather_chestplate": 81,
  "leather_leggings": 76,
  "leather_boots": 66,

  "turtle_helmet": 276,
  "bow": 385,
  "crossbow": 466,
  "shears": 239,
  "fishing_rod": 65,
  "flint_and_steel": 65,
}


def beet_default(ctx: Context):
  """Creates a loot table for dropping the 9 result items when disassembling an item."""
  vanilla = ctx.inject(Vanilla)
  recipes = vanilla.data.recipe

  for item, durability in ITEMS.items():
    recipe = recipes[f"minecraft:{item}"].data
    ingredients: list[tuple[str, int]] = []
    if recipe["type"] == "minecraft:crafting_shaped":
      pattern = "".join([
        (" " + r if len(r) == 1 else r).ljust(3, " ")
        for r in recipe["pattern"]
      ]).rjust(9, " ")
      ingredient_groups = ["".join(g) for _, g in itertools.groupby(pattern)]
      recipe_keys = {k: n["item"] for k, n in recipe["key"].items()}
      ingredients = [
        ("minecraft:air" if p[0] == " " else recipe_keys[p[0]], len(p))
        for p in ingredient_groups
      ]
    else:
      for ingredient in recipe["ingredients"]:
        ingredients.append((ingredient["item"], 1))
      if len(ingredients) < 9:
        ingredients.append(("minecraft:air", 9-len(ingredients)))

    pools: Any = []
    for ingredient, count in ingredients:
      base: Any = {
        "rolls": count,
        "entries": [{"type": "minecraft:item", "name": ingredient}]
      }
      if ingredient == "minecraft:air":
        pools.append(base)
        continue
      base["entries"][0]["conditions"] = [{
        "condition": "value_check",
        "value": {
          "type": "score",
          "target": {
            "type": "fixed",
            "name": "$damage"
          },
          "score": "gm4_disassembler"
        },
        "range": {
          "min": 0,
          "max": {
            "type": "uniform",
            "min": 0,
            "max": durability
          }
        }
      }]
      pools.append({
        "rolls": count,
        "entries": [{
          "type": "minecraft:alternatives",
          "children": [
            base["entries"][0],
            { "type": "minecraft:item", "name": "minecraft:air" }
          ]
        }]
      })
    
    ctx.data[f"{ctx.project_id}:disassembleables/{item}"] = LootTable({
      "__comment": "Generated by generate_disassembly.py",
      "type": "minecraft:generic",
      "pools": pools
    })

  caller: Any = {
    "__comment": "Generated by generate_disassembly.py",
    "type": "minecraft:fishing",
    "pools": [{
      "rolls": 1,
      "entries": [{"type":"minecraft:alternatives","children":[]}]
    }]
  }  
  for item in ITEMS:
    caller["pools"][0]["entries"][0]["children"].append({
      "type": "minecraft:loot_table",
      "value": f'gm4_disassemblers:disassembleables/{item}',
      "conditions": [{
        "condition": "match_tool",
        "predicate": {
          "items": [f"minecraft:{item}"]
        }
      }]
    })
    if item.startswith("diamond_"):
      caller["pools"][0]["entries"][0]["children"][-1]["conditions"].append({
        "condition": "value_check",
        "range": 1,
        "value": {"type":"score","target":{"type":"fixed","name":"disassemble_diamonds"},"score":"gm4_disassembler"}
      })

  ctx.data[f"{ctx.project_id}:caller"] = LootTable(caller)
