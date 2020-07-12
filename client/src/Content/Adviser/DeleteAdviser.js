import React, { Component } from 'react';
import { Header, Button } from 'semantic-ui-react';
import axios from 'axios';

class DeleteAdviser extends Component {
  constructor(props) {
    super(props);

    this.state = {
      employee_number : this.props.values.employee_number
    }
  }

  deleteAdviser = () => {
    axios.post(`http://localhost:3001/advisers/deleteAdviser/${this.state.employee_number}`)
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
          Are you sure you want to delete this adviser? <font color='red'>Deleting this will delete all instances in the database.</font>
        </Header>

        <Button color='green' floated='right' onClick={() => this.props.clicked()}>Cancel</Button>
        <Button color='red' floated='right' onClick={this.deleteAdviser}>Delete</Button>
        <br />
        <br />
      </div>
    )
  }
}

export default DeleteAdviser;
