import React, { Component } from 'react';
import { Header, Button } from 'semantic-ui-react';
import axios from 'axios';

class DeletePaper extends Component {
  constructor(props) {
    super(props);

    this.state = {
      call_number : this.props.values.call_number
    }
  }

  deletePaper = () => {
    axios.post(`http://localhost:3001/papers/deletePaper/${this.state.call_number}`)
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
          Are you sure you want to delete this paper? <font color='red'>Deleting this will delete all instances in the database.</font>
        </Header>

        <Button color='green' floated='right' onClick={() => this.props.clicked()}>Cancel</Button>
        <Button color='red' floated='right' onClick={this.deletePaper}>Delete</Button>
        <br />
        <br />
      </div>
    )
  }
}

export default DeletePaper;
