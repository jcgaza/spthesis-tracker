import React from 'react';
import ReactDOM from 'react-dom';
import './index.css';
import App from './App/App';
import registerServiceWorker from './registerServiceWorker';

import jquery from 'jquery';

window.$ = window.jQuery = jquery;
require('semantic-ui-css/semantic.min.css');

ReactDOM.render(<App />, document.getElementById('root'));
registerServiceWorker();
