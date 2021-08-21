const fs = require("fs");

var moddedUnits, moddedItems, moddedLiquids, moddedBlocks = [];
var modContent = fs.existsSync("modContent.json") ? require("../../modContent.json") : false;

if (modContent != false) {

};

module.exports = {
  moddedUnits,
  moddedItems,
  moddedLiquids,
  moddedBlocks
};