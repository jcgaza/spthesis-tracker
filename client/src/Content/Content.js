import React, { Component } from 'react';
import { Switch, Route } from 'react-router'

import AddPaper from './Paper/AddPaper';
import ViewPaper from './Paper/ViewPaper';
import AddStudent from './Student/AddStudent';
import ViewStudent from './Student/ViewStudent';
import AddAdviser from './Adviser/AddAdviser';
import ViewAdviser from './Adviser/ViewAdviser';

class Content extends Component {
  render() {
    return (
      <main>
        <Switch>
          <Route exact path='/' component={ViewPaper}/>

          <Route path='/view-paper' component={ViewPaper} />
          <Route path='/add-paper' component={AddPaper} />

          <Route path='/view-student' component={ViewStudent} />
          <Route path='/add-student' component={AddStudent} />

          <Route path='/view-adviser' component={ViewAdviser} />
          <Route path='/add-adviser' component={AddAdviser} />
        </Switch>
      </main>
    )
  }
}

export default Content;
