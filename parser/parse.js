const methods = require("./methods/index.js");

/**
 * 
 * @param {String} mlog 
 * @param {Boolean} [removeComments=false] 
 */
function parse(mlog, removeComments = false) {
  if (mlog == null || mlog.length == 0) throw new Error("String can't be empty");
  if (typeof mlog != "string") throw new Error("Invalid string");
}

module.exports = parse;