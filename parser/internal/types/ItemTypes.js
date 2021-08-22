const { moddedItems } = require("../getModdedContent.js");

module.exports = {
  // Vanilla units
  vanilla: {
    SCRAP: "scrap",
    COPPER: "copper",
    LEAD: "lead",
    GRAPHITE: "graphite",
    COAL: "coal",
    TITANIUM: "titanium",
    THORIUM: "thorium",
    SILICON: "silicon",
    PLASTANIUM: "plastanium",
    PHASEFABRIC: "phaseFabric",
    SURGEALLOY: "surgeAlloy",
    SPOREPOD: "sporePod",
    SAND: "sand",
    BLASTCOMPOUND: "blastCompound",
    PYRATITE: "pyratite",
    METAGLASS: "metaglass",
  },

  // Modded items
  mod: moddedItems,
};
