import React, { Component } from 'react';
import { Table, Button, Form, Modal, Grid } from 'semantic-ui-react';
import axios from 'axios';

import EditAdviser from './EditAdviser';
import DeleteAdviser from './DeleteAdviser';

const options = [
  { key: 0, text: 'Employee Number', value: 'employee_number'},
  { key: 1, text: 'First Name', value: 'first_name'},
  { key: 2, text: 'Middle Name', value: 'middle_name'},
  { key: 3, text: 'Last Name', value: 'last_name'},
  { key: 4, text: 'College', value: 'college'},
  { key: 5, text: 'Department', value: 'department'}
];

class ViewAdviser extends Component {
  constructor() {
    super();
    this.getAdvisers();
    this.state = {
      advisers: [],
      current_adviser: "",
      isModalOpen : false,
      isDModalOpen : false,
      search_values: {
        input: "",
        field:""
      }
    }
  }

  getAdvisers = () => {
    axios.get('http://localhost:3001/advisers/viewAdvisers')
    .then((response) => {
      this.setState({ advisers: response.data });
    })
    .catch((error) => {
      console.log(error);
    });
  }

  handleEdit = (event, data) => this.setState({ isModalOpen : true, current_adviser : data.value });
  handleDelete = (event, data) => this.setState({ isDModalOpen : true, current_adviser : data.value });

  handleOpen = () =>  this.setState({ isModalOpen : true });

  handleClose = () => {
    this.setState({ isModalOpen : false });
    this.getAdvisers();
  }

  handleDOpen = () =>  this.setState({ isDModalOpen : true });

  handleDClose = () => {
    this.setState({ isDModalOpen : false });
    this.getAdvisers();
  }

  onInputChange = (event) => {
    const state = this.state;
    state.search_values.input = event.target.value;
    this.setState(state);
  }

  onSelectChange = (event, data) => {
    const state = this.state;
    state.search_values.field = data.value;
    this.setState(state);
  }

  submitSearch = (event) => {
    event.preventDefault();
    const field = this.state.search_values.field;
    const input = this.state.search_values.input;
    console.log(field+input);
    axios.get(`http://localhost:3001/advisers/searchAdviser/${field}/${input}`)
    .then((response) => {
      this.setState({ advisers: response.data });
    })
    .catch((error) => {
      console.log(error.response);
    });
  }

  render () {
    const input = this.state.search_values.text;

    return (
      <div className="Main">
        <Form onSubmit={this.submitSearch}>
          <Grid>
            <Grid.Column width={10}>
              <Form.Input fluid input='text' name='text' value={input} onChange={this.onInputChange} placeholder='Search here' />
            </Grid.Column>
            <Grid.Column width={3}>
              <Form.Dropdown fluid selection placeholder='Field' onChange={this.onSelectChange} options={options} />
            </Grid.Column>
            <Grid.Column width={3}>
              <Button fluid>Search</Button>
            </Grid.Column>
          </Grid>
        </Form>
        <Table celled>
          <Table.Header>
            <Table.Row textAlign='center'>
              <Table.HeaderCell>Employee Number</Table.HeaderCell>
              <Table.HeaderCell>First Name</Table.HeaderCell>
              <Table.HeaderCell>Middle Name</Table.HeaderCell>
              <Table.HeaderCell>Last Name</Table.HeaderCell>
              <Table.HeaderCell>College</Table.HeaderCell>
              <Table.HeaderCell>Department</Table.HeaderCell>
              <Table.HeaderCell>Field Of Mastery</Table.HeaderCell>
              <Table.HeaderCell>Actions</Table.HeaderCell>
            </Table.Row>
          </Table.Header>
          <Table.Body>
            {this.state.advisers.map(adviser =>
              <Table.Row key={adviser.employee_number}>
                <Table.Cell>{adviser.employee_number}</Table.Cell>
                <Table.Cell>{adviser.first_name}</Table.Cell>
                <Table.Cell>{adviser.middle_name}</Table.Cell>
                <Table.Cell>{adviser.last_name}</Table.Cell>
                <Table.Cell>{adviser.college}</Table.Cell>
                <Table.Cell>{adviser.department}</Table.Cell>
                <Table.Cell>{adviser.field_mastery}</Table.Cell>
                <Table.Cell textAlign='center'>
                  <Grid>
                    <Grid.Column>
                      <Form value={adviser} onSubmit={this.handleDelete}>
                        <Button circular type='submit' icon='remove user' negative />
                      </Form>
                    </Grid.Column>
                    <br />
                    <Grid.Column>
                      <Form value={adviser} onSubmit={this.handleEdit}>
                        <Button circular icon='edit' color={'teal'} type='submit' />
                      </Form>
                    </Grid.Column>
                  </Grid>
                </Table.Cell>
              </Table.Row>
            )}
          </Table.Body>
        </Table>
          {
            this.state.isModalOpen ?
              <Modal closeOnDimmerClick={true} open={this.state.isModalOpen} onOpen={this.handleOpen} onClose={this.handleClose} closeIcon>
                <Modal.Header>Edit Adviser</Modal.Header>
                <Modal.Content>
                  <EditAdviser values={this.state.current_adviser} clicked={this.handleClose} />
                </Modal.Content>
              </Modal>
            : null
          }
          {
            this.state.isDModalOpen ?
              <Modal closeOnDimmerClick={true} open={this.state.isDModalOpen} onOpen={this.handleDOpen} onClose={this.handleDClose} closeIcon>
                <Modal.Header>Delete Adviser</Modal.Header>
                <Modal.Content>
                  <DeleteAdviser values={this.state.current_adviser} clicked={this.handleDClose} />
                </Modal.Content>
              </Modal>
            : null
          }
      </div>
    )
  }
};

export default ViewAdviser;
