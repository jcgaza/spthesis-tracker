import React, { Component } from 'react';
import { Router }from 'react-router';
import { createBrowserHistory } from 'history';

import Main from './../Main/Main';

const browserHistory = createBrowserHistory();

class App extends Component {
  render() {
    return(
      <Router history={ browserHistory }>
        <Main />
      </Router>
    );
  }
}

export default App;
