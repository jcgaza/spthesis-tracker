import React, { Component } from 'react';

import { Menu, Header, Icon, Button } from 'semantic-ui-react';

class Navbar extends Component {
  render () {
    return (
      <Menu fluid borderless="true" attached>
        <Menu.Item header>
          <Header as='h2'>
            <Icon name='search' color={'white'}/>
            <Header.Content>
              SP-THESIS TRACKER
              <Header.Subheader>
                A simple tracker
              </Header.Subheader>
            </Header.Content>
          </Header>
        </Menu.Item>
        <Menu.Menu position="right">
          <Menu.Item>admin</Menu.Item>
          <Menu.Item>
            <Button basic>Logout</Button>
          </Menu.Item>
        </Menu.Menu>
      </Menu>
    );
  }
}

export default Navbar;
