import React from "react"
import PropTypes from "prop-types"
import {
  BrowserRouter as Router,
  Switch,
  Route,
  Link,
  NavLink,
  Redirect 
} from "react-router-dom";

class HelloWorld extends React.Component {
constructor(props) {
    super(props);
	this.state = {
		time : new Date().toString(),
    user : gon.current_user_info
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
    if(gon){
      console.log(gon)
    }else{
      console.log("NUll GOn ");
    }
    
    return (
      <React.Fragment>
      <> </>
      </React.Fragment>
    );

    /*return (
      <React.Fragment>
      <h1>
        <p>Greeting: {this.state.time}</p>
        {(this.state.user) ? <p>User : {this.state.user.email}</p> : <p>User : Not signed in!</p>}
        <br/>
        <a data-method="delete" href="/users/logout" >Sign out</a><br/>
        <a href="/allUsers">All users</a>
      </h1>
      </React.Fragment>
    );*/
  }
}

HelloWorld.propTypes = {
  greeting: PropTypes.string
};
export default HelloWorld
