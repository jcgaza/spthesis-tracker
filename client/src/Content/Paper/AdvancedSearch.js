import React, { Component } from 'react';
import axios from 'axios';
import { Form, Grid, Button, List } from 'semantic-ui-react';

const searchOptions = [
  { key: 0, text: 'Call Number', value: 'call_number'},
  { key: 1, text: 'Student Number', value: 'student_number'},
  { key: 2, text: 'Employee Number', value: 'employee_number'},
  { key: 3, text: 'Title', value: 'title'},
  { key: 4, text: 'Author', value: 'studname'},
  { key: 5, text: 'Adviser', value: 'advisername'}
];

const sortOptions = [
  { key: 0, text: 'Call Number', value: 'call_number'},
  { key: 1, text: 'Student Number', value: 'studnum'},
  { key: 2, text: 'Employee Number', value: 'empnum'},
  { key: 3, text: 'Title', value: 'title'},
  { key: 4, text: 'Year', value: 'year(date_published)'},
  { key: 5, text: 'Month', value: 'month(date_published)'},
]

const sortBy = [
  { key: 0, text: 'Ascending', value: 'asc'},
  { key: 1, text: 'Descending', value: 'desc'}
]

class AdvancedSearch extends Component {
  constructor(props) {
    super(props);
    this.state = {
      input: "",
      isBest: 0,
      isBestPoster: 0,
      isSP: 0,
      isThesis: 0,
      field: "",
      sortOption: [],
      sortBy: "",
      advisers: [],
      students: [],
      panel: [],
      co_authors: {
        students: [],
        advisers: []
      }
    };

    this.getAdvisers();
    this.getStudents();
  }

  onSortChange = (event, data) => {
    const state = this.state;
    state.sortOption = data.value;
    this.setState(state);
  }

  onSortByChange = (event, data) => {
    const state = this.state;
    state.sortBy = data.value;
    this.setState(state);
  }

  onInputChange = (event) => {
    const state = this.state;
    state.input = event.target.value;
    this.setState(state);
  }

  onSelectChange = (event, data) => {
    const state = this.state;
    state.field = data.value;
    this.setState(state);
  }

  handleSubmit = (event) => {
    event.preventDefault();
    const search = {
      input: (this.state.input !== "" ? this.state.input : "none"),
      field: (this.state.field !== "" ? this.state.field : "none"),
      sortOption : (this.state.sortOption.length !== 0 ? this.state.sortOption.join(',') : "none"),
      sortBy : (this.state.sortBy !== "" ? this.state.sortBy : "none"),
      isSP : this.state.isSP,
      isThesis : this.state.isThesis,
      isBest : this.state.isBest,
      isBestPoster : this.state.isBestPoster,
      panel : (this.state.panel.length !== 0 ? this.state.panel.join(',') : "none"),
      students : (this.state.co_authors.students.length !== 0 ? this.state.co_authors.students.join(',') : "none"),
      advisers : (this.state.co_authors.advisers.length !== 0 ? this.state.co_authors.advisers.join(',') : "none")
    };

    console.log(search);

    axios.get(`http://localhost:3001/papers/advancedSearch/${search.field}/${search.input}/${search.sortOption}/${search.sortBy}/${search.isSP}/${search.isThesis}/${search.isBest}/${search.isBestPoster}/${search.panel}/${search.students}/${search.advisers}`)
    .then((response) => {
      console.log(response.data);
      this.props.clicked(response.data);
    }).catch((error) => {
      console.log(error);
    })
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

  getStudents = () => {
    axios.get('http://localhost:3001/students/getStudents')
    .then((response) => {
      this.setState( { students: response.data.map((student, index) => ({ 'key': index, 'text': `${student.name} (${student.student_number})`, 'value': student.student_number })) });
    })
    .catch((error) => {
      console.log(error);
    });
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

  onSChange = (event, data) => this.setState({ isSP: data.value });
  onTChange = (event, data) => this.setState({ isThesis: data.value });
  onBChange = (event, data) => this.setState({ isBest: data.value });
  onBPChange = (event, data) => this.setState({ isBestPoster: data.value });

  onPanelChange = (event, data) => {
    const state = this.state;
    state.panel = data.value;
    this.setState(state);
  }

  render() {
    const input = this.state.input;
    const isSP = this.state.isSP;
    const isThesis = this.state.isThesis;
    const isBest = this.state.isBest;
    const isBestPoster = this.state.isBestPoster;

    return(
      <Form onSubmit={this.handleSubmit}>
        <Grid>
          <Grid.Row>
            <Grid.Column>
              <Form onSubmit={this.submitSearch}>
                <Grid>
                  <Grid.Column width={10}>
                    <Form.Input fluid label='Specific Search' input='text' name='text' value={input} onChange={this.onInputChange} placeholder='Search here' />
                  </Grid.Column>
                  <Grid.Column width={6}>
                    <Form.Dropdown fluid selection label='Search Options' placeholder='Field' onChange={this.onSelectChange} options={searchOptions} />
                  </Grid.Column>
                </Grid>
              </Form>
            </Grid.Column>
          </Grid.Row>

          <Grid.Row>
            <Grid.Column width={12}>
              <Form.Dropdown fluid name='sort_options' label='Sort Options' placeholder='Choose here' multiple search selection onChange={this.onSortChange} options={sortOptions} />
            </Grid.Column>
            <Grid.Column width={4}>
              <Form.Dropdown fluid name='sort_by' label='Sort By' placeholder='Choose here' selection  onChange={this.onSortByChange} options={sortBy} />
            </Grid.Column>
          </Grid.Row>


          <Grid.Row>
            <Grid.Column width={16}>
              <Form.Dropdown fluid name='coauthor_adviser' label='Members of the Panel' placeholder='Choose here' fluid multiple search selection options={this.state.advisers} onChange={this.onPanelChange} />
            </Grid.Column>
          </Grid.Row>

          <Grid.Row>
            <Grid.Column width={8}>
              <Form.Dropdown fluid name='coauthor_student' label='Co-Authored Students' placeholder='Choose here' fluid multiple search selection options={this.state.students} onChange={this.onCAStudentChange} />
            </Grid.Column>
            <Grid.Column width={8}>
              <Form.Dropdown fluid name='coauthor_adviser' label='Co-Authored Advisers' placeholder='Choose here' fluid multiple search selection options={this.state.advisers} onChange={this.onCAAdviserChange} />
            </Grid.Column>
          </Grid.Row>

          <Grid.Row>
            <Grid.Column width={5}>
              <List>
                <List.Item>
                  <Form.Checkbox label='Show Special Problems Only' name='isSP' value={isSP===1?0:1} onChange={this.onSChange} />
                </List.Item>
                <List.Item>
                  <Form.Checkbox label='Show Theses Only' name='isThesis' value={isThesis===1?0:1} onChange={this.onTChange} />
                </List.Item>
              </List>
            </Grid.Column>

            <Grid.Column width={11}>
              <List>
                <List.Item>
                  <Form.Checkbox label='Show only those with Best Special Problem/Thesis Award' name='isBest' value={isBest===1?0:1} onChange={this.onBChange} />
                </List.Item>
                <List.Item>
                  <Form.Checkbox label='Show only those with Best Special Problem/Thesis Poster Award' name='isBestPoster' value={isBestPoster===1?0:1} onChange={this.onBPChange} />
                </List.Item>
              </List>
            </Grid.Column>
          </Grid.Row>
          <Grid.Row centered>
            <Button type='submit' color='green' basic>Advanced Search</Button>
          </Grid.Row>
        </Grid>
      </Form>
    )
  }
}

export default AdvancedSearch;
