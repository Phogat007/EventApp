# EventApp

EventApp is an event management system tailored for educational institutions. It simplifies event planning and organization, providing a streamlined platform for administrators, faculty, and students.

## Features

- **Intuitive Event Creation**: Easily set up events with details such as title, description, date, time, location, and more.
- **Event Approval Workflow**: Implement a pending event system for administrators to review and approve events.
- **User Management**: Basic user registration and login, with role-based permissions for faculty, and administrators.
- **Event History**: Track past events for reporting and analysis.

## Installation

### Prerequisites
- Ruby version 3.3.0
- Rails
- PostgreSQL database

### Setup
1. Clone the repository:

```bash
git clone https://github.com/Phogat007/EventApp.git
```
2. Install dependencies:

```bash
cd EventApp
bundle install
```
3. Database setup:
- Create a PostgreSQL database named EventApp (adjust names in `config/database.yml` if needed).
- Set up database and run migrations:
```bash
rails db:setup
rails db:migrate
```
### Usage

1. Start the Rails server:
```bash
rails server
```
2. Access the application in your web browser at `http://localhost:3000`.

### Development Testing

The app uses RSpec for testing. Run tests with `rspec`.

### Docker Support

A Dockerfile is included for streamlined setup in a production environment.

## Deployment

For production environments, consider a hosting provider like DigitalOcean, Fly, which offers easy integration with Rails applications. Optimize asset compilation for production before deployment.

## Credits

- bhavyansh001
- phogat007