import React, { Component } from 'react';
import { Form, Button } from 'semantic-ui-react';
import axios from 'axios';

class EditAdviser extends Component {
  constructor (props) {
    super(props);
    this.state = {
      student_number : this.props.values.student_number,
      last_name : this.props.values.last_name,
      first_name : this.props.values.first_name,
      middle_name : this.props.values.middle_name,
      course : this.props.values.course,
      employee_number : this.props.values.employee_number,
      interest: this.props.values.interest.replace(' ', '').split(', '),
      advisers : [],
      options: []
    }

    console.log(this.state);
    this.getAdvisers();
    this.getInterest();
  }

  getAdvisers = () => {
    axios.get('http://localhost:3001/advisers/getAdvisers')
    .then((response) => {
      this.setState( { advisers: response.data.map((adviser, index) => ({ 'key': index, 'text': adviser.name, 'value': adviser.employee_number })) });
    })
    .catch((error) => {
      console.log(error);
    });
  }

  getInterest = () => {
    axios.get('http://localhost:3001/students/getStudentInterest')
    .then((response) => {
      this.setState( { options: response.data.map((field, index) => ({ 'key': index, 'text': field.field_of_interest, 'value': field.field_of_interest })) });
    })
    .catch((error) => {
      console.log(error);
    });
  }

  submitForm = (event) => {
    event.preventDefault();

    const user = {
      student_number : this.state.student_number,
      last_name : this.state.last_name,
      first_name : this.state.first_name,
      middle_name : this.state.middle_name,
      course : this.state.course,
      employee_number : this.state.employee_number,
      interest: this.state.interest
    }

    // check for errors
    axios.post(`http://localhost:3001/students/updateStudent`, user)
    .then((response) => {
      console.log(response);
      this.props.clicked();
    }).catch((error) => {
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
    const { student_number, last_name, first_name, middle_name, course, employee_number, interest } = this.state;

    return (
      <div>
        <Form onSubmit={this.submitForm}>
          <Form.Input
            input='text' name='student_number' value={student_number} label='Student Number' placeholder='Student Number' width={5} disabled
            onChange={this.onChange} />
          <Form.Group>
            <Form.Input
              input='text' name='last_name' value={last_name} label='Last Name' placeholder='Last Name' width={6}
              onChange={this.onChange} />
            <Form.Input
              input='text' name='first_name' value={first_name} label='First Name' placeholder='First Name' width={6}
              onChange={this.onChange} />
            <Form.Input
              input='text' name='middle_name' value={middle_name} label='Middle Initial' placeholder='Middle Initial' width={4}
              onChange={this.onChange} />
          </Form.Group>
          <Form.Group>
            <Form.Input
              input='text' name='course' value={course} label='Course' placeholder='Course' width={6}
              onChange={this.onChange} />
            <Form.Dropdown width={5} name='adviser' label='Adviser' placeholder='Choose Adviser here' search selection options={this.state.advisers} value={employee_number} onChange={this.onAdviserChange}/>
          </Form.Group>
            <Form.Dropdown name='field_of_interest' label='Field of Interest' placeholder='Choose here' fluid multiple search selection options={this.state.options} value={interest} onChange={this.onDropdownChange} />
          <Button type='submit' color='green' icon='check' basic floated={'right'}>Edit Student!</Button>
          <br />
          <br />
        </Form>
      </div>
    )
  }
}

export default EditAdviser;
