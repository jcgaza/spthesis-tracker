import React, { Component } from 'react';
import { Card, Button, Divider, Grid, Form, Modal, List, Label } from 'semantic-ui-react';
import axios from 'axios';

import AdvancedSearch from './AdvancedSearch';
import DeletePaper from './DeletePaper';
import EditPaper from './EditPaper';

const options = [
  { key: 0, text: 'Call Number', value: 'call_number'},
  { key: 1, text: 'Student Number', value: 'student_number'},
  { key: 2, text: 'Employee Number', value: 'employee_number'},
  { key: 3, text: 'Title', value: 'title'},
  { key: 4, text: 'Author', value: 'studname'},
  { key: 5, text: 'Adviser', value: 'advisername'}
];

class ViewPaper extends Component {
  constructor() {
    super();
    this.state = {
      papers: [],
      current_paper: "",
      isModalOpen : false,
      isDModalOpen : false,
      isEditModalOpen: false,
      co_author_students: [],
      search_values: {
        input: "",
        field:""
      }
    };

    this.getPapers();
  }

  getPapers = () => {
    axios.get('http://localhost:3001/papers/viewPapers')
    .then((response) => {
      this.setState({ papers: response.data });
    })
    .catch((error) => {
      console.log(error);
    });
  }

  submitSearch = (event) => {
    event.preventDefault();

    if (this.state.search_values.input === "" || this.state.search_values.field === "") this.getPapers();

    axios.get(`http://localhost:3001/papers/searchPapers/${this.state.search_values.field}/${this.state.search_values.input}`)
    .then((response) => {
      this.setState({ papers: response.data });
    })
    .catch((error) => {
      console.log(error);
    });
  }

  handleEditModal = (event, data) => {
    this.setState({ current_paper: data.value, isEditModalOpen: true });
  }

  handleEditOpen = () =>  this.setState({ isModalOpen : true });

  handleEditClose = () => {
    this.setState({ isEditModalOpen : false });
    this.getPapers();
  }

  handleDelete = (event, data) => this.setState({ isDModalOpen : true, current_paper : data.value });

  handleOpen = () =>  this.setState({ isModalOpen : true });

  handleClose = () => {
    this.setState({ isModalOpen : false });
  }

  handleDOpen = () =>  this.setState({ isDModalOpen : true });

  handleDClose = () => {
    this.setState({ isDModalOpen : false });
    this.getPapers();
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

  handleResults = (result) => {
    this.setState({ papers: result });
    this.handleClose();
  }


  render () {
    const input = this.state.search_values.input;

    return (
      <div className='Main'>
        <Grid>
          <Grid.Column width={2}>
            <Button fluid color='orange' size='mini' onClick={this.handleOpen}>Advanced Search</Button>
          </Grid.Column>
          <Grid.Column width={14}>
            <Form onSubmit={this.submitSearch}>
              <Grid>
                <Grid.Column width={9}>
                  <Form.Input fluid input='text' name='text' value={input} onChange={this.onInputChange} placeholder='Search here' />
                </Grid.Column>
                <Grid.Column width={4}>
                  <Form.Dropdown fluid selection placeholder='Field' onChange={this.onSelectChange} options={options} />
                </Grid.Column>
                <Grid.Column width={3}>
                  <Button fluid>Search</Button>
                </Grid.Column>
              </Grid>
            </Form>
          </Grid.Column>
        </Grid>

        <Divider />

        <Card.Group itemsPerRow={3}>
          {this.state.papers.map(paper =>
            <Card color={paper.classification==='Thesis' ? 'orange' : 'blue'}>
              <Card.Content>
                {
                  (paper.isBest === 1 && paper.isBestPoster === 1) ?
                    <Label as='a' icon='star' color='yellow' ribbon='right' content='Best SP/Thesis & Poster' />
                  : paper.isBest === 1 ?
                    <Label as='a' icon='star' color='yellow' ribbon='right' content='Best SP/Thesis' />
                  : paper.isBestPoster === 1 ?
                    <Label as='a' icon='star' color='yellow' ribbon='right' content='Best SP/Thesis Poster' />
                  : null
                }

                <Card.Header>{paper.title}</Card.Header>
                <Card.Meta>{paper.call_number}</Card.Meta>
                <Card.Description></Card.Description>

                <List divided>
                  <List.Item>
                    <Label content='Author' horizontal />{paper.studname} ({paper.studnum})
                  </List.Item>
                  <List.Item>
                    <Label content='Adviser' horizontal />{paper.advisername} ({paper.empnum})
                  </List.Item>
                  <List.Item>
                    <Label content='Date Published' horizontal />{paper.date_published.substring(0,10)}
                  </List.Item>
                  <List.Item>
                    <Label content='Student Co-Authors' horizontal />
                    {
                      paper.coauthor_students !== null ?
                        paper.coauthor_students
                        : "None"
                    }
                  </List.Item>
                  <List.Item>
                    <Label content='Adviser Co-Authors' horizontal />
                    {
                      paper.coauthor_advisers !== null ?
                        paper.coauthor_advisers
                        : "None"
                    }
                  </List.Item>

                  <List.Item>
                    <Label content='Panel Members' horizontal />
                    {paper.panelmem}
                  </List.Item>

                  <List.Item>
                    <Label content='Presentation Date' horizontal />
                    {paper.presdate.substring(0,10)}
                  </List.Item>

                  <List.Item>
                    <Label content='Presentation Place' horizontal />
                    {paper.presplace}
                  </List.Item>
                </List>

              </Card.Content>
              <Card.Content extra>
                  <Grid centered>
                    <Button.Group>
                      <Button value={paper} onClick={this.handleEditModal}content='Edit Paper' type='submit' icon='remove user' positive />
                      <Button.Or />
                      <Button type='submit' content='Delete Paper' icon='remove user' value={paper} onClick={this.handleDelete} negative />
                    </Button.Group>
                  </Grid>
              </Card.Content>
              <Divider />
            </Card>
          )}
        </Card.Group>

        {
          this.state.isModalOpen ?
            <Modal closeOnDimmerClick={true} open={this.state.isModalOpen} onOpen={this.handleOpen} onClose={this.handleClose} closeIcon>
              <Modal.Header>Advanced Search</Modal.Header>
              <Modal.Content>
                <AdvancedSearch clicked={this.handleResults} />
              </Modal.Content>
            </Modal>
          : null
        }
        {
            this.state.isDModalOpen ?
              <Modal closeOnDimmerClick={true} open={this.state.isDModalOpen} onOpen={this.handleDOpen} onClose={this.handleDClose} closeIcon>
                <Modal.Header>Delete Paper</Modal.Header>
                <Modal.Content>
                  <DeletePaper values={this.state.current_paper} clicked={this.handleDClose} />
                </Modal.Content>
              </Modal>
            : null
          }
          {
          this.state.isEditModalOpen ?
            <Modal closeOnDimmerClick={true} open={this.state.isEditModalOpen} onOpen={this.handleEditOpen} onClose={this.handleEditClose} closeIcon>
              <Modal.Header>Edit Paper</Modal.Header>
              <Modal.Content>
                <EditPaper values={this.state.current_paper} clicked={this.handleEditClose} />
              </Modal.Content>
            </Modal>
          : null
        }
      </div>
    )
  }
}

export default ViewPaper;
