import React, { Component } from 'react';
import { Form, Button, Message, List } from 'semantic-ui-react';
import axios from 'axios';

const classification = [
  { key: 0, text: 'Special Problem', value: 'SP' },
  { key: 1, text: 'Thesis', value: 'Thesis' }
]

class AddPaper extends Component {
  constructor() {
    super();
    this.state = {
  		call_number: "",
  		title: "",
  		classification: "",
  		date_published: "",
  		grade: "",
      isBest: 0,
      isBestPoster: 0,
  		student_number: "",
      co_authors: {
        students: [],
        advisers: []
      },
      panel: [],
      presentation_date: "",
      presentation_place: "",
      students: [],
      advisers: [],
      messageDiv: "",
      message: "",
    };

    this.getAdvisers();
    this.getStudents();
  }

  submitForm = (event) => {
    event.preventDefault();

    const user = {
      call_number: this.state.call_number,
  		title: this.state.title,
  		classification: this.state.classification,
  		date_published: this.state.date_published,
  		grade: this.state.grade,
      isBest: this.state.isBest,
      isBestPoster: this.state.isBestPoster,
  		student_number: this.state.student_number,
      co_authors: {
        students: this.state.co_authors.students,
        advisers: this.state.co_authors.advisers
      },
      panel: this.state.panel,
      presentation_date: this.state.presentation_date,
      presentation_place: this.state.presentation_place
    }

    console.log(user);

    axios.post(`http://localhost:3001/papers/addPaper`, user)
    .then((response) => {
      this.setState({ messageDiv: "SUCCESS", message: "Successfully added Paper" });
    }).catch((error) => {
      this.setState({ messageDiv: "ERROR", message: "Error adding Paper" });
      console.log(error);
    });
  }

  getStudents = () => {
    axios.get('http://localhost:3001/students/getStudents')
    .then((response) => {
      this.setState( { students: response.data.map((student, index) => ({ 'key': index, 'text': `${student.name} (${student.student_number})`, 'value': student.student_number })) });
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

  onChange = (event) => {
    const state = this.state;
    state[event.target.name] = event.target.value;
    this.setState(state);
  }

  onStudentChange = (event, data) => {
    const state = this.state;
    state.student_number = data.value;
    this.setState(state);
  }

  onCAStudentChange = (event, data) => {
    const state = this.state;
    state.co_authors.students = data.value;
    this.setState(state);
  }

  onCAAdviserChange = (event, data) => {
    const state = this.state;
    state.co_authors.advisers = data.value;
    this.setState(state);
  }

  onPanelChange = (event, data) => {
    const state = this.state;
    state.panel = data.value;
    this.setState(state);
  }

  onCChange = (event, data) => this.setState({ classification: data.value });
  onCheckChange = (event, data) => this.setState({ isBest: data.value });
  onCheckPosterChange = (event, data) => this.setState({ isBestPoster: data.value });

  render () {
    const { call_number, title, date_published, grade, isBest, isBestPoster, presentation_date, presentation_place } = this.state;

    return (
      <div>
        <Form onSubmit={this.submitForm}>
        	<Form.Group>
  	        <Form.Input
  	          input='text' name='call_number' value={call_number} label='Call Number' placeholder='Call Number' width={5} pattern='[A-Z]{5}-\d{5}' required
  	          onChange={this.onChange} />
  	        <Form.Dropdown width={5} name='student' label='Student' placeholder='Choose Author here' search selection options={this.state.students} onChange={this.onStudentChange} required />
          </Form.Group>

          <Form.Input
            input='text' name='title' value={title} label='Title' placeholder='Title' width={16}
            onChange={this.onChange} pattern='.{0,100}' required />

          <Form.Group>
            <Form.Input
              input='text' name='date_published' value={date_published} label='Date Published' placeholder='YYYY-MM-DD' width={4} onChange={this.onChange} pattern='\d{4}-\d{2}-\d{2}' required />
            <Form.Input
              input='text' name='grade' value={grade} label='Grade' placeholder='Grade' width={4}
              onChange={this.onChange} pattern='(1|2|3|4|5)(.(00|25|50|75))?' required />
            <Form.Dropdown label='Classification' width={4} selection placeholder='Classification' options={classification} onChange={this.onCChange} required />

            <List>
              <List.Item>
                <Form.Checkbox label='Best SP/Thesis' value={isBest===1?0:1} onChange={this.onCheckChange} />
              </List.Item>
              <List.Item>
                <Form.Checkbox label='Best SP/Thesis Poster' value={isBestPoster===1?0:1} onChange={this.onCheckPosterChange} />
              </List.Item>
            </List>
          </Form.Group>

          <Form.Group>
            <Form.Dropdown width={8} name='coauthor_student' label='Co-Authored Students' placeholder='Choose here' fluid multiple search selection options={this.state.students} onChange={this.onCAStudentChange} />
            <Form.Dropdown width={8} name='coauthor_adviser' label='Co-Authored Advisers' placeholder='Choose here' fluid multiple search selection options={this.state.advisers} onChange={this.onCAAdviserChange} />
          </Form.Group>

          <Form.Group>
            <Form.Dropdown width={8} name='coauthor_adviser' label='Members of the Panel' placeholder='Choose here' fluid multiple search selection options={this.state.advisers} onChange={this.onPanelChange} required />
            <Form.Input
              input='text' name='presentation_date' value={presentation_date} label='Presentation Date' placeholder='Presentation Date' width={4} onChange={this.onChange} pattern='\d{4}-\d{2}-\d{2}' required />
            <Form.Input
              input='text' name='presentation_place' value={presentation_place} label='Presentation Place' placeholder='Presentation Place' width={4} onChange={this.onChange} pattern='.{0,255}' required />
          </Form.Group>

          <Button type="submit">Add Paper!</Button>
        </Form>

        { (this.state.messageDiv === "SUCCESS") ?
          <Message attached success
            header={`Added Paper ${this.state.call_number}`}
            content={this.state.message}
          />
        : (this.state.messageDiv === "ERROR") ?
         <Message attached error
           header={`Error adding Paper`}
           content={this.state.message}
         />
        : null
       }
      </div>
    )
  }
}

export default AddPaper;
