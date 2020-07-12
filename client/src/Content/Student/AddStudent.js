import React, { Component } from 'react';
import { Form, Button, Message } from 'semantic-ui-react';
import axios from 'axios';

class AddStudent extends Component {
  constructor() {
    super();
    this.state = {
      student_number: "",
      last_name: "",
      first_name: "",
      middle_name: "",
      course: "",
      employee_number: "",
      messageDiv: "",
      message: "",
      interest: [],
      options: [],
      advisers: []
    };

    this.getInterest();
    this.getAdvisers();
  }

  getInterest = () => {
    axios.get('http://localhost:3001/students/getStudentInterest')
    .then((response) => {
      this.setState( { options: response.data.map(field => ({ 'key': field.field_of_interest.toLowerCase().replace(/\s/g, ''), 'text': field.field_of_interest, 'value': field.field_of_interest })) });
    })
    .catch((error) => {
      console.log(error);
    });
  }

  getAdvisers = () => {
    axios.get('http://localhost:3001/advisers/getAdvisers')
    .then((response) => {
      this.setState( { advisers: response.data.map((adviser, index) => ({ 'key': index, 'text': `${adviser.name} (${adviser.employee_number})`, 'value': adviser.employee_number })) });
    })
    .catch((error) => {
      console.log(error);
    });
  }

  submitForm = (event) => {
    event.preventDefault();

    const user = {
      student_number: this.state.student_number,
      last_name: this.state.last_name,
      first_name: this.state.first_name,
      middle_name: this.state.middle_name,
      course: this.state.course,
      employee_number: this.state.employee_number,
      interest: this.state.interest
    }

    axios.post(`http://localhost:3001/students/addStudent`, user)
    .then((response) => {
      this.setState({ messageDiv: "SUCCESS", message: "Successfully added Student" });
    }).catch((error) => {
      this.setState({ messageDiv: "ERROR", message: "Error adding Student" });
      console.log(error);
    });
  }

  onChange = (event) => {
    const state = this.state;
    state[event.target.name] = event.target.value;
    this.setState(state);
  }

  onAdviserChange = (event, data) => {
    const state = this.state;
    state['employee_number'] = data.value;
    this.setState(state);
  }

  onDropdownChange = (event, data) => {
    const state = this.state;
    state['interest'] = data.value;
    this.setState(state);
  }

  render () {
    const { student_number, last_name, first_name, middle_name, course } = this.state;

    return (
      <div>
        <Form onSubmit={this.submitForm}>
          <Form.Input
            input='text' name='student_number' value={student_number} label='Student Number' placeholder='Student Number' width={5} pattern='\d{4}-\d{5}' required
            onChange={this.onChange} />
          <Form.Group>
            <Form.Input
              input='text' name='last_name' value={last_name} label='Last Name' placeholder='Last Name' width={6} pattern='[A-Z a-z]{0,20}' required
              onChange={this.onChange} />
            <Form.Input
              input='text' name='first_name' value={first_name} label='First Name' placeholder='First Name' width={6} pattern='[A-Z a-z]{0,20}' required
              onChange={this.onChange} />
            <Form.Input
              input='text' name='middle_name' value={middle_name} label='Middle Initial' placeholder='Middle Initial' width={4} pattern='[A-Z a-z]{0,20}' required
              onChange={this.onChange} />
          </Form.Group>
          <Form.Group>
            <Form.Input
              input='text' name='course' value={course} label='Course' placeholder='Course' width={6} pattern='[A-Z]{0,6}' required
              onChange={this.onChange} />
            <Form.Dropdown width={5} name='adviser' label='Adviser' placeholder='Choose Adviser here' search selection options={this.state.advisers} onChange={this.onAdviserChange} required />
          </Form.Group>
          <Form.Dropdown name='field_of_interest' label='Field of Interest' placeholder='Choose here' fluid multiple search selection options={this.state.options} onChange={this.onDropdownChange} required />
          <Button type="submit">Add Student!</Button>
        </Form>
        { (this.state.messageDiv === "SUCCESS") ?
          <Message attached success
            header={`Added Student ${this.state.student_number}`}
            content={this.state.message}
          />
        : (this.state.messageDiv === "ERROR") ?
         <Message attached error
           header={`Error adding Student`}
           content={this.state.message}
         />
        : null
       }
      </div>
    )
  }
}

export default AddStudent;
