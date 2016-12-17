const Util = require('./utils.js');
const MovingObject = require('./moving_object.js');
function Asteroid(pos){
  const vals = {pos: pos,
    vel: Util.randomVec(5),
    radius: 4,
    color: "#00FF00"
  };
  MovingObject.call(this, vals);
  
}
Util.inherits(Asteroid, MovingObject);

module.exports = Asteroid;
