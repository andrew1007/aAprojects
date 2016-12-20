class View {
  constructor(game, $el) {
    this.$el = $el;
    this.game = game;
    this.setupBoard();
    this.bindEvents();
  }

  bindEvents() {
    this.$el.on("click", "li", (e) => {
      let $currSq = $(e.currentTarget);
      this.makeMove($currSq);
      if (this.game.currentPlayer === 'x') {
        $currSq.addClass('x').text('X');
      } else {
        $currSq.addClass('o').text('O');
      }
      if (this.game.winner() && this.game.isOver()) {
        const h1 = $("<h1>").text(`${this.game.currentPlayer} has won!`);
        this.$el.find(`.${this.game.currentPlayer}`).addClass("win");
        this.$el.find(`.${this.game.currentPlayer === 'x' ? 'o' : 'x'}`).addClass("lose");

        $(".ttt").append(h1);
      } else if (this.game.isOver()){
        const h1 = $("<h1>").text("No one wins");
        $(".ttt").append(h1);
      }
    });
  }

  makeMove($square) {
    this.game.playMove($square.attr("data-pos").split(","));
    console.log(this.game.board.print());
  }

  setupBoard() {
    for (let i = 0; i <= 2; i++) {
      this.addRow();
    }
  }

  addRow() {
    const rowIdx = this.$el.find(".row").length;
    const $row = $("<ul>").addClass("row").addClass("group");
    for (let colIdx = 0; colIdx <= 2; colIdx++){
      const $square = $("<li>").addClass("square").attr("data-pos", [rowIdx, colIdx]);

      $row.append($square);
    }
    this.$el.append($row);
  }
}

module.exports = View;

//
// Write a View.prototype.setupBoard method; it should make a grid to represent the board. Build the grid using an unordered list (<ul>). The cells can be represented inside the grid using <li> elements. By floating the <li> elements left and giving the <ul> a fixed width, the cells will appear on the same line and nicely wrap around to form a 3x3 grid. Set a border on the cells to make it look like a real grid. Style unclicked cells with a gray background. Change the background to yellow while the user :hovers over an unclicked cell.
