const Util = {
  inherits (child, parent) {
    let Surrogate = function(){};
    Surrogate.prototype = parent.prototype;
    child.prototype = new Surrogate();
    child.prototype.constructor = child;
  },
  randomVec (length) {
    const deg = 2 * Math.PI * Math.random();
    return this.scale([Math.sin(deg), Math.cos(deg)], length);
  },
  // Scale the length of a vector by the given amount.
  scale (vec, m) {
    return [vec[0] * m, vec[1] * m];
  }
};



module.exports = Util;
