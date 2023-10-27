import React from "react";
import withRouter from "./withRouter";
import {Link} from 'react-router-dom';

class Delete extends React.Component{
	
	
		render(){
		return (
		<>
			<h1>부서 삭제</h1>
			<hr/>
			<Link to="/rest/dept">목록으로 이동</Link>
		</>
		);
	}
}


export default withRouter(Delete);