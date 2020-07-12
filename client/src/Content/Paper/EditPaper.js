import React, { Component } from 'react';
import { Form, Button, List } from 'semantic-ui-react';
import axios from 'axios';

const classifications = [
  { key: 0, text: 'Special Problem', value: 'SP' },
  { key: 1, text: 'Thesis', value: 'Thesis' }
]

class EditPaper extends Component {
  constructor(props) {
    super(props);
    console.log(this.props);
    this.state = {
  		call_number: this.props.values.call_number,
      student_number: this.props.values.studnum,
  		title: this.props.values.title,
  		classification: this.props.values.classification,
  		date_published: this.props.values.date_published.substring(0, 10),
  		grade: this.props.values.grade,
      isBest: this.props.values.isBest,
      isBestPoster: this.props.values.isBestPoster,
      co_authors: {
        students: this.props.values.coauthor_students.replace(' ', '').split(', '),
        advisers: this.props.values.coauthor_advisers.replace(' ', '').split(', ')
      },
      panel: this.props.values.panelmem.replace(' ', '').split(', '),
      presentation_date: this.props.values.presdate.substring(0, 10),
      presentation_place: this.props.values.presplace,
      students: [],
      advisers: []
    };

    this.getAdvisers();
    this.getStudents();
  }

  submitForm = (event) => {
    event.preventDefault();

    const user = {
      call_number: this.state.call_number,
      student_number: this.state.student_number,
  		title: this.state.title,
  		classification: this.state.classification,
  		date_published: this.state.date_published,
  		grade: this.state.grade,
      isBest: 0,
      isBestPoster: 0,
      co_authors: {
        students: this.state.co_authors.students,
        advisers: this.state.co_authors.advisers
      },
      panel: this.state.panel,
      presentation_date: this.state.presentation_date,
      presentation_place: this.state.presentation_place
    }

    console.log(user);

    axios.post('http://localhost:3001/papers/updatePaper', user)
    .then((response) => {
      console.log(response);
      this.props.clicked();
    }).catch((error) => {
      console.log(error);
    });
  }

  getStudents = () => {
    axios.get('http://localhost:3001/students/getStudents')
    .then((response) => {
      this.setState( { students: response.data.map((student, index) => ({ 'key': index, 'text': student.name, 'value': student.student_number })) });
    })
    .catch((error) => {
      console.log(error);
    });
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

  onChange = (event) => {
    const state = this.state;
    state[event.target.name] = event.target.value;
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
    const { call_number, title, date_published, classification, grade, isBest, isBestPoster, panel, presentation_date, presentation_place } = this.state;

    const CAstudents = this.state.co_authors.students;
    const CAadvisers = this.state.co_authors.advisers;
    const studnum = this.state.student_number;

    return (
      <div>
        <Form onSubmit={this.submitForm}>
        	<Form.Group>
  	        <Form.Input
  	          input='text' name='call_number' value={call_number} label='Call Number' placeholder='Call Number' width={5} disabled
  	          onChange={this.onChange} />
  	        <Form.Input
  	          input='text' name='student_number' value={studnum} label='Student Number' placeholder='Student Number' width={5} pattern='\d{4}-\d{5}' required
  	          onChange={this.onChange} />
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
            <Form.Dropdown value={classification} label='Classification' width={4} selection placeholder='Classification' options={classifications} onChange={this.onCChange} required />

            <List>
              <List.Item>
                <Form.Checkbox label='Best SP/Thesis' value={isBest} onChange={this.onCheckChange} />
              </List.Item>
              <List.Item>
                <Form.Checkbox label='Best SP/Thesis Poster' value={isBestPoster} onChange={this.onCheckPosterChange} />
              </List.Item>
            </List>
          </Form.Group>

          <Form.Group>
            <Form.Dropdown width={8} value={CAstudents} name='coauthor_student' label='Co-Authored Students' placeholder='Choose here' fluid multiple search selection options={this.state.students} onChange={this.onCAStudentChange} />
            <Form.Dropdown width={8} value={CAadvisers} name='coauthor_adviser' label='Co-Authored Advisers' placeholder='Choose here' fluid multiple search selection options={this.state.advisers} onChange={this.onCAAdviserChange} />
          </Form.Group>

          <Form.Group>
            <Form.Dropdown value={panel} width={8} name='panel' label='Members of the Panel' placeholder='Choose here' fluid multiple search selection options={this.state.advisers} onChange={this.onPanelChange} required />
            <Form.Input
              input='text' name='presentation_date' value={presentation_date} label='Presentation Date' placeholder='Presentation Date' width={4} onChange={this.onChange} pattern='\d{4}-\d{2}-\d{2}' required />
            <Form.Input
              input='text' name='presentation_place' value={presentation_place} label='Presentation Place' placeholder='Presentation Place' width={4} onChange={this.onChange} pattern='.{0,255}' required />
          </Form.Group>

          <Button type="submit">Add Paper!</Button>
        </Form>
      </div>
    )
  }
}

export default EditPaper;
