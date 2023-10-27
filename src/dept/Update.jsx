import React from "react";
import withRouter from "./withRouter";
import {Link} from 'react-router-dom';

class Update extends React.Component{
	
	
	render(){
		return (
		<>
			<h1>부서 수정</h1>
			<hr/>
			<Link to="/rest/dept">목록으로 이동</Link>
		</>
		);
	}
}


export default withRouter(Update);