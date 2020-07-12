import React, { Component } from 'react';
import { Table, Form, Button, Grid, Modal } from 'semantic-ui-react';
import axios from 'axios';

import EditStudent from './EditStudent';
import DeleteStudent from './DeleteStudent';

const options = [
  { key: 0, text: 'Student Number', value: 'Student_number'},
  { key: 1, text: 'First Name', value: 'first_name'},
  { key: 2, text: 'Middle Name', value: 'middle_name'},
  { key: 3, text: 'Last Name', value: 'last_name'},
  { key: 4, text: 'Course', value: 'course'}
];


class ViewStudent extends Component {
  constructor() {
    super();
    this.getStudents();
    this.state = {
      students: [],
      isModalOpen: false,
      isDModalOpen: false,
      current_student: "",
      search_values: {
        input: "",
        field:""
      }
    };
  }

  getStudents = () => {
    axios.get('http://localhost:3001/students/viewStudents')
    .then((response) => {
      this.setState({ students: response.data });
    })
    .catch((error) => {
      console.log(error);
    });
  }

  handleEdit = (event, data) => this.setState({ isModalOpen : true, current_student : data.value });
  handleDelete = (event, data) => this.setState({ isDModalOpen : true, current_student : data.value });
  handleOpen = () =>  this.setState({ isModalOpen : true });

  handleClose = () => {
    this.setState({ isModalOpen : false });
    this.getStudents();
  }

  handleDOpen = () =>  this.setState({ isDModalOpen : true });

  handleDClose = () => {
    this.setState({ isDModalOpen : false });
    this.getStudents();
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
    axios.get(`http://localhost:3001/students/searchStudent/${field}/${input}`)
    .then((response) => {
      this.setState({ students: response.data });
    })
    .catch((error) => {
      console.log(error.response);
    });
  }

  render () {
    const input = this.state.search_values.input;

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

        <Table celled equal>
          <Table.Header>
            <Table.Row textAlign='center'>
              <Table.HeaderCell width={2}>Student Number</Table.HeaderCell>
              <Table.HeaderCell width={2}>Last Name</Table.HeaderCell>
              <Table.HeaderCell width={2}>First Name</Table.HeaderCell>
              <Table.HeaderCell width={1}>Middle Name</Table.HeaderCell>
              <Table.HeaderCell width={2}>Course</Table.HeaderCell>
              <Table.HeaderCell width={2}>Adviser</Table.HeaderCell>
              <Table.HeaderCell width={3}>Field Of Interest</Table.HeaderCell>
              <Table.HeaderCell>Actions</Table.HeaderCell>
            </Table.Row>
          </Table.Header>
          <Table.Body>
            {this.state.students.map(student =>
              <Table.Row key={student.student_number}>
                <Table.Cell>{student.student_number}</Table.Cell>
                <Table.Cell>{student.last_name}</Table.Cell>
                <Table.Cell>{student.first_name}</Table.Cell>
                <Table.Cell>{student.middle_name}</Table.Cell>
                <Table.Cell>{student.course}</Table.Cell>
                <Table.Cell>{student.Adviser}</Table.Cell>
                <Table.Cell>{student.interest}</Table.Cell>
                <Table.Cell textAlign='center'>
                  <Grid>
                    <Grid.Column>
                      <Form value={student} onSubmit={this.handleDelete}>
                        <Button circular type='submit' icon='remove user' negative />
                      </Form>
                    </Grid.Column>
                    <br />
                    <Grid.Column>
                      <Form value={student} onSubmit={this.handleEdit}>
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
              <Modal.Header>Edit Student</Modal.Header>
              <Modal.Content>
                <EditStudent values={this.state.current_student} clicked={this.handleClose} />
              </Modal.Content>
            </Modal>
          : null
        }
        {
          this.state.isDModalOpen ?
            <Modal closeOnDimmerClick={true} open={this.state.isDModalOpen} onOpen={this.handleDOpen} onClose={this.handleDClose} closeIcon>
              <Modal.Header>Delete Student</Modal.Header>
              <Modal.Content>
                <DeleteStudent values={this.state.current_student} clicked={this.handleDClose} />
              </Modal.Content>
            </Modal>
          : null
        }
      </div>
    )
  }
}

export default ViewStudent;
