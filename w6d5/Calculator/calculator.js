import React from 'react';

class Calculator extends React.Component {
  constructor(props) {
    super(props);
    this.state = {firstNum: "", secondNum: "", result: 0};
    this.setNum1 = this.setNum1.bind(this);
    this.setNum2 = this.setNum2.bind(this);
    this.add = this.add.bind(this);
  }

  setNum1(e){
    const firstNum = e.target.value ? parseInt(e.target.value) : "";
    this.setState({firstNum})
  }

  setNum2(e){
    const secondNum = e.target.value ? parseInt(e.target.value) : "";
    this.setState({secondNum})
  }

  add(e){
    e.preventDefault();
    let result = this.state.firstNum + this.state.secondNum;
    this.setState({result});
  }

  clear(e){
    e.preventDefault();
    this.setState(firstNum: "", secondNum: "", result: 0);
  }

  render() {
    const {firstNum, secondNum, result} = this.state
    return (
      <div>
        <h1>{result}</h1> // replace this with your code
        <input onChange={this.setNum1} value={firstNum}/>
        <input onChange={this.setNum2} value={secondNum}/>
        <button onClick={this.clear}>reset</button>
        <button onClick={this.add}>add</button>
      </div>
    );
  }
}

export default Calculator;
