# Project Updates Backend API

This is the backend API for the Project Updates application, built with FastAPI and Python.

## Features

- Project management (CRUD operations)
- Version management (CRUD operations)
- MySQL database integration
- RESTful API endpoints

## API Endpoints

### Projects
- `GET /projects` - Get all projects
- `GET /projects/{project_id}` - Get a specific project
- `POST /projects` - Create a new project
- `DELETE /projects/{project_id}` - Delete a project

### Versions
- `POST /versions` - Create a new version
- `PUT /versions/{version_id}` - Update a version
- `DELETE /versions/{version_id}` - Delete a version

## Setup

1. Install dependencies:
   ```bash
   pip install -r requirements.txt
   ```

2. Set environment variables:
   ```bash
   DB_HOST=your-database-host
   DB_PORT=3306
   DB_USER=your-database-username
   DB_PASSWORD=your-database-password
   DB_NAME=project_updates
   ```

3. Start the server:
   ```bash
   python start.py
   ```

## Deployment

This backend can be deployed to platforms that support Python applications:
- Railway
- Render
- Heroku
- DigitalOcean App Platform
- AWS Elastic Beanstalk
- Google Cloud Run