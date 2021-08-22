const { moddedBlocks } = require("../getModdedContent.js");

module.exports = {
  // Vanilla blocks
  vanilla: {
    PLACE: "holder",
  },

  // Modded blocks
  mod: moddedBlocks,
};
