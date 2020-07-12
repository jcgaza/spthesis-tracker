import React, { Component } from 'react';
import './Sidebar.css'
import { Menu, Icon, Header } from 'semantic-ui-react';
import { Link } from 'react-router-dom';

class Sidebar extends Component {
  state = { activeItem : 'search-sp-thesis' };

  handleItemClick = (e, { name }) => {
    this.setState({ activeItem :  name });
  }

  render () {
    const { activeItem } = this.state;

    return (
      <div className='back'>
      <Menu className='sidebar_menu' fluid pointing secondary vertical color={'orange'} size={'massive'} borderless>
          <Menu.Menu vertical tabular>
            <Header as='h3'>
              <Icon name='file text outline' />
              <Header.Content>
                SP-Thesis Registry
                <Header.Subheader>
                  Check Papers on database
                </Header.Subheader>
              </Header.Content>
            </Header>

            <Link to='view-paper'>
              <Menu.Item name='search-sp-thesis' active={ activeItem === 'search-sp-thesis' } onClick={ this.handleItemClick }>
                Search for Papers
              </Menu.Item>
            </Link>

            <Link to='add-paper'>
              <Menu.Item name='add-sp-thesis' active={ activeItem === 'add-sp-thesis' } onClick={ this.handleItemClick }>
                Add Special Problem/Thesis
              </Menu.Item>
            </Link>
          </Menu.Menu>
          <br />
          <Menu.Menu vertical tabular>
            <Header as='h3'>
              <Icon name='student' />
              <Header.Content>
                Student Registry
                <Header.Subheader>
                  Check the authors on database
                </Header.Subheader>
              </Header.Content>
            </Header>

            <Link to='view-student'>
              <Menu.Item name='view-students' active={ activeItem === 'view-students' } onClick={ this.handleItemClick }>
                View Students
              </Menu.Item>
            </Link>

            <Link to='add-student'>
              <Menu.Item name='add-students' active={ activeItem === 'add-students' } onClick={ this.handleItemClick }>
                Add Students
              </Menu.Item>
            </Link>
          </Menu.Menu>
          <br />
          <Menu.Menu vertical tabular>
            <Header as='h3'>
              <Icon name='university' />
              <Header.Content>
                Adviser Registry
                <Header.Subheader>
                  Check the advisers on database
                </Header.Subheader>
              </Header.Content>
            </Header>

            <Link to='view-adviser'>
              <Menu.Item name='view-advisers' active={ activeItem === 'view-advisers' } onClick={ this.handleItemClick }>
                View Advisers
              </Menu.Item>
            </Link>

            <Link to='add-adviser'>
              <Menu.Item name='add-advisers' active={ activeItem === 'add-advisers' } onClick={ this.handleItemClick }>
                Add Advisers
              </Menu.Item>
            </Link>
          </Menu.Menu>
      </Menu>
    </div>
    );
  }
}

export default Sidebar;
