const { moddedLiquids } = require("../getModdedContent.js");

module.exports = {
  // Vanilla liquids
  WATER: "water",
  SLAG: "slag",
  OIL: "oil",
  CRYOFLUID: "cryoFluid",

  // Modded liquids
  mod: moddedLiquids,
};
