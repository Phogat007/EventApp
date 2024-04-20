EventApp: Event Management for Educational Institutions
A streamlined Rails application designed to simplify event planning and organization throughout educational institutions.

Features
Intuitive Event Creation: Easily set up events with details like title, description, date, time, location, and optional registration forms.
Event Approval Workflow: Implement a pending event system for administrators to review and approve events.
User Management: Basic user registration and login, potentially with role-based permissions for students, faculty, or administrators.
Email Notifications: Automated emails for event updates, approvals, and reminders.
Event Calendar: A visual calendar to showcase upcoming events.
Event History: Track past events for reporting and analysis.
Installation
Prerequisites:
Ruby version 3.3.0
Rails (installation instructions)
PostgreSQL database
Clone the repository:
```bash
git clone https://github.com/your-username/EventApp.git
```
Install dependencies:
```bash
cd EventApp
bundle install
```
Database setup:
Create a PostgreSQL database named EventApp (adjust names in config/database.yml if needed).
Run migrations:
```bash
rails db:migrate
```
Start the Rails server:
```bash
rails server
```
Development
Testing: The app uses RSpec for testing. Run tests with rspec.
Docker Support: A Dockerfile is included for streamlined setup in a production environment.
Deployment
For production environments, consider a hosting provider like Heroku, which offers easy integration with Rails applications. Optimize asset compilation for production before deployment.

Credits
bhavyansh001
phogat007
Contributing
We welcome contributions to EventApp! Please refer to our contributing guidelines for details on how to submit pull requests and bug reports.