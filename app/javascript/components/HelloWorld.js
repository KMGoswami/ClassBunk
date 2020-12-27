import React from "react"
import PropTypes from "prop-types"
class HelloWorld extends React.Component {
constructor(props) {
    super(props);
	this.state = {
		time : new Date().toString()
	};
}

updateClock = () => {
	this.setState({time : new Date().toString()})
}

componentDidMount(){
	console.log("Calling component did mount");
	window.setInterval(
		() => this.updateClock()
		 , 1000);
}
  render () {
    return (
      <React.Fragment>
        Greeting: {this.state.time}
      </React.Fragment>
    );
  }
}

HelloWorld.propTypes = {
  greeting: PropTypes.string
};
export default HelloWorld
