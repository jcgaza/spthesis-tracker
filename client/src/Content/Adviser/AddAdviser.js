import React, { Component } from 'react';
import { Form, Button, Message } from 'semantic-ui-react';
import axios from 'axios';

class AddAdviser extends Component {
  constructor() {
    super();
    this.state = {
      employee_number: "",
      last_name: "",
      first_name: "",
      middle_name: "",
      college: "",
      department: "",
      mastery: [],
      options: [],
      messageDiv: "",
      message: ""
    };
    
    this.getMastery();
  }

  getMastery = () => {
    axios.get('http://localhost:3001/advisers/getAdviserMastery')
    .then((response) => {
      this.setState( { options: response.data.map(field => ({ 'key': field.field_of_mastery.toLowerCase().replace(/\s/g, ''), 'text': field.field_of_mastery, 'value': field.field_of_mastery })) });
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

    // check for errors
    axios.post(`http://localhost:3001/advisers/addAdviser`, user)
    .then((response) => {
      this.setState({ messageDiv : "SUCCESS", message: response.data.message  })
      // console.log(this.messageDiv + ": " + response.data.message);
    }).catch((error) => {
      this.setState({ messageDiv : "ERROR", message: "Error"  })
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
    const { employee_number, last_name, first_name, middle_name, college, department } = this.state;

    return (
      <div>
        <Form onSubmit={this.submitForm}>
          <Form.Input
            input='text' name='employee_number' value={employee_number} label='Employee Number' placeholder='Employee Number' width={5}
            onChange={this.onChange} pattern='\d{5}-\d{4}' title="99999-9999" required/>
          <Form.Group>
            <Form.Input
              input='text' name='last_name' value={last_name} label='Last Name' placeholder='Last Name' width={6}
              onChange={this.onChange} pattern='[A-Z a-z]{0,20}' required/>
            <Form.Input
              input='text' name='first_name' value={first_name} label='First Name' placeholder='First Name' width={6}
              onChange={this.onChange} pattern='[A-Z a-z]{0,20}' required/>
            <Form.Input
              input='text' name='middle_name' value={middle_name} label='Middle Initial' placeholder='Middle Initial' width={4}
              onChange={this.onChange} pattern='[A-Z a-z]{0,20}' required/>
          </Form.Group>
          <Form.Group>
            <Form.Input
              input='text' name='college' value={college} label='College' placeholder='College' width={6}
              onChange={this.onChange} pattern='[A-Z]{0,5}' required/>
            <Form.Input
              input='text' name='department' value={department} label='Department' placeholder='Department' width={6}
              onChange={this.onChange} pattern='[A-Z]{0,7}' required/>
          </Form.Group>
          <Form.Dropdown name='field_of_mastery' label='Field of Mastery' placeholder='Choose here' fluid multiple search selection options={this.state.options} onChange={this.onDropdownChange}/>
          <br />
          <Button type="submit">Add Adviser!</Button>
        </Form>
        { (this.state.messageDiv === "SUCCESS") ?
          <Message attached success
            header={`Added Adviser ${this.state.employee_number}`}
            content={this.state.message}
          />
        : (this.state.messageDiv === "ERROR") ?
         <Message attached error
           header={`Error adding Adviser`}
           content={this.state.message}
         />
        : null
       }
    </div>
    )
  }
}

export default AddAdviser;
