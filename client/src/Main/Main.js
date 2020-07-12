import React, { Component } from 'react';
import './Main.css';

import { Grid } from 'semantic-ui-react'

import Sidebar from './../Sidebar/Sidebar';
import Navbar from './../Navbar/Navbar';
import Content from './../Content/Content';


class Main extends Component {
  render() {
    return (
      <div className='back'>
        <Grid rows={2}>
          <Grid.Row>
            <Navbar />
          </Grid.Row>
          <Grid.Row>
            <Grid.Column width={4}>
              <Sidebar />
            </Grid.Column>

            <Grid.Column stretched width={12}>
              <div className='main'>
                <Content />
              </div>
            </Grid.Column>
          </Grid.Row>
        </Grid>
      </div>
    );
  }
}

export default Main;
