import React, { Component } from 'react';
import { Header, Button } from 'semantic-ui-react';
import axios from 'axios';

class DeleteStudent extends Component {
  constructor(props) {
    super(props);

    this.state = {
      student_number : this.props.values.student_number
    }
  }

  deleteStudent = () => {
    axios.post(`http://localhost:3001/students/deleteStudent/${this.state.student_number}`)
    .then((response) => {
      this.props.clicked();
    })
    .catch((error) => {
      console.log(error);
    });
  }

  render() {
    return (
      <div>
        <Header size='medium'>
          Are you sure you want to delete this student? <font color='red'>Deleting this will delete all instances in the database.</font>
        </Header>

        <Button color='green' floated='right' onClick={() => this.props.clicked()}>Cancel</Button>
        <Button color='red' floated='right' onClick={this.deleteStudent}>Delete</Button>
        <br />
        <br />
      </div>
    )
  }
}

export default DeleteStudent;
