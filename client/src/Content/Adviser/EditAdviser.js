import React, { Component } from 'react';
import { Form, Button } from 'semantic-ui-react';
import axios from 'axios';

class EditAdviser extends Component {
  constructor (props) {
    super(props);

    this.state = {
      employee_number : this.props.values.employee_number,
      last_name : this.props.values.last_name,
      first_name : this.props.values.first_name,
      middle_name : this.props.values.middle_name,
      college : this.props.values.college,
      department : this.props.values.department,
      mastery : this.props.values.field_mastery.replace(' ', '').split(', '),
      options: []
    }

    this.getMastery();
  }

  getMastery = () => {
    axios.get('http://localhost:3001/advisers/getAdviserMastery')
    .then((response) => {
      this.setState( { options: response.data.map((field, index) => ({ 'key': index, 'text': field.field_of_mastery, 'value': field.field_of_mastery })) });
    })
    .catch((error) => {
      console.log(error);
    });
  }

  submitForm = (event) => {
    event.preventDefault();
    const { employee_number, last_name, first_name, middle_name, college, department, mastery } = this.state;

    const user = {
      employee_number : employee_number,
      last_name: last_name,
      first_name: first_name,
      middle_name: middle_name,
      college: college,
      department: department,
      mastery: mastery
    };

    console.log(user);

    // check for errors
    axios.post(`http://localhost:3001/advisers/updateAdviser`, user)
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

  onDropdownChange = (event, data) => {
    const state = this.state;
    state['mastery'] = data.value;
    this.setState(state);
  }

  render () {
    const { employee_number, last_name, first_name, middle_name, college, department, mastery } = this.state;

    return (
      <div>
        <Form onSubmit={this.submitForm}>
          <Form.Input
            input='text' name='employee_number' value={employee_number} label='Employee Number' placeholder='Employee Number' width={5} disabled
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
              input='text' name='college' value={college} label='College' placeholder='College' width={6}
              onChange={this.onChange} />
            <Form.Input
              input='text' name='department' value={department} label='Department' placeholder='Department' width={6}
              onChange={this.onChange} />
          </Form.Group>
          <Form.Dropdown name='field_of_mastery' label='Field of Mastery' placeholder='Choose here' fluid multiple search selection options={this.state.options} value={mastery} onChange={this.onDropdownChange} />
          <Button type='submit' color='green' icon='check' basic floated={'right'}>Edit Adviser!</Button>
          <br />
          <br />
        </Form>
      </div>
    )
  }
}

export default EditAdviser;
