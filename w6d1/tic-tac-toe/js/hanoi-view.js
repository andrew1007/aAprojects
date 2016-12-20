Array.prototype.last = function(){
  return this[this.length - 1];
};

class View {
  constructor(game, $el) {
    this.$el = $el;
    this.game = game;
    this.setUpTowers();
    this.clickTower();
    this.firstSelect = undefined;
    this.secondSelect = undefined;
  }

  render() {

  }

  clickTower(){
    $(".pile").on("click", (e)=>{
      let $currPile = $(e.currentTarget);
      let currPile = $currPile;
      if (this.firstSelect === undefined){
        currPile.addClass("selected");
        this.firstSelect = parseInt(currPile.attr("pileIdx"));
      } else {
        this.secondSelect = parseInt(currPile.attr("pileIdx"));
        if (this.game.move(this.firstSelect, this.secondSelect)){
          let pile = this.$el.find(`[pileIdx=${this.secondSelect}]`);
          let discNum = this.game.towers[this.secondSelect].last();
          pile.append($("<li>").addClass(`disc-${discNum}`).attr("disc", discNum));
          let removePile = this.$el.find(`[pileIdx=${this.firstSelect}]`);
          removePile.find(`[disc=${discNum}]`).remove();
        } else {
          alert("invalid move");
        }

        this.resetSelections();
      }
    });

  }

  resetSelections(){
    this.$el.find(".selected").removeClass("selected");
    this.firstSelect = undefined;
    this.secondSelect = undefined;
  }

  setUpTowers() {
    const $pile0 = $("<ul>").addClass("pile").addClass("group").attr("pileIdx", 0);
    for (let discSize = 1; discSize <= 3; discSize++){
      const $discs = $("<li>").addClass(`disc-${discSize}`).attr("disc", discSize);
      $pile0.append($discs);
    }
    this.$el.append($pile0);
    const $pile1 = $("<ul>").addClass("pile").addClass("group").attr("pileIdx", 1);
    const $pile2 = $("<ul>").addClass("pile").addClass("group").attr("pileIdx", 2);
    this.$el.append($pile1);
    this.$el.append($pile2);
  }

}

module.exports = View;
