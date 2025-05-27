# BuildFlowFullStackApplication

This application serves as the foundational codebase for Sprint 1 of the Lloyds Bank Group Modern Engineering Bootcamp Project Specification. It provides a robust starting point for developing Python-based RESTful web services, ideal for learning backend development or bootstrapping new projects requiring CRUD (Create, Read, Update, Delete) functionalities.

## Project Overview

**BuildFlowFullStackApplication** is designed to offer a simple yet functional API that allows users to manage a collection of "products". It demonstrates basic API interactions through both `curl` commands and a simple web interface. This starter kit is excellent for understanding the fundamentals of building and testing a web API.

## Technology Stack (Likely)

While not exhaustively detailed, this project primarily utilizes:

- **Python:** For the backend logic and server-side operations (as seen in `lbg.py`).
- **Standard Python Libraries:** For web server capabilities (potentially a lightweight framework like Flask or FastAPI, or built-in modules like `http.server` for simplicity, though not explicitly stated).
- **HTML/CSS/JavaScript:** For the basic browser-based interface (`index.html`).
- **Behave:** For acceptance testing.
- **Pip:** For Python package management.

## Prerequisites

Before you begin, ensure you have the following installed on your system:

- **Python:** Version 3.7 or higher is recommended. You can download it from the [official Python website](https://www.python.org/downloads/).
- **Pip:** The Python package installer (usually included with Python installations).
- **Git:** For cloning the repository.
- **A Terminal or Command-Line Interface:** Such as Git Bash (recommended on Windows), PowerShell, or your system's default terminal (for macOS/Linux).
- **cURL:** A command-line tool for transferring data with URLs, used here for API testing. (Often pre-installed or available with Git Bash).
- **(Optional) Web Browser:** For interacting with the HTML interface (e.g., Chrome, Firefox, Edge).
- **(Optional) API Testing Tool:** Tools like Postman or Insomnia can be helpful for more complex API interactions.

## Setup

To prepare the project and get it running on your local machine, follow these steps:

1.  **Clone the Repository:**
    Open your terminal, navigate to the directory where you want to store the project, and run:

    ```bash
    # git clone <repository_url> # Replace <repository_url> with the actual URL
    # cd BuildFlowFullStackApplication # Or the name of the cloned directory
    ```

    _(Assuming you have cloned the repository and navigated into its directory)_

2.  **Create and Activate a Virtual Environment (Recommended):**
    It's a best practice to use a virtual environment to manage project-specific dependencies and avoid conflicts with your global Python installation.

    ```bash
    # Create a virtual environment named 'venv'
    python -m venv venv

    # Activate the virtual environment
    # On Windows (Git Bash or PowerShell):
    # venv\Scripts\activate
    # On macOS/Linux:
    # source venv/bin/activate
    ```

3.  **Install Dependencies:**
    The project's required Python packages are listed in `requirements.txt`. Install them by running:
    ```bash
    pip install -r requirements.txt
    ```
    This file typically includes libraries needed for the web server, API functionality, and any other specific tasks the application performs.

## Application Structure (Inferred)

A high-level overview of the project's key files and directories:

- `lbg.py`: The main application script that likely contains the web server logic, API route definitions, and core functionality.
- `requirements.txt`: Lists all Python package dependencies required for the project.
- `index.html`: A basic HTML page providing a user interface for interacting with the API through a web browser.
- `lbg.test.py`: Contains unit and/or integration tests designed to verify the correctness of individual components or their interactions within the application.
- `features/`: This directory holds acceptance tests, written using the Behave framework.
  - `restapp.feature`: Defines user stories and test scenarios in the Gherkin language (Given-When-Then format).
  - `environment.py`: Contains Python code for setting up and tearing down the testing environment for Behave tests, including WebDriver configuration.

## Executing the Application

To run the application, ensure your virtual environment is activated (if you created one) and all dependencies are installed. From your terminal, execute:

```bash
python lbg.py
API Listening on http://localhost:8080
```

This command starts the backend server, which will then listen for incoming requests on port 8080 of your local machine.

## Halting the Application

To stop the application, navigate to the Git Bash terminal window where the server is currently running and press the key combination `CTRL` + `C`. This will terminate the server process.

## Operations & Functionality

The application provides full CRUD (Create, Read, Update, Delete) functionality for managing "products". Each product typically has a name, description, and price.

### Via a Web Browser

You can interact with this application using a web browser by navigating to:
`http://localhost:8080/index.html`

The webpage provides buttons that correspond to the various CRUD operations, allowing for a visual way to manage products.

### Via `curl` Commands (API Endpoints)

The following `curl` commands can be used to interact with the API directly from your terminal.

#### CREATE a New Product

This command sends a `POST` request with a JSON payload containing the new product's details. The server then creates a new product entry.

```bash
curl -s -X POST http://localhost:8080/create -H 'Content-type:application/json' -d '{"name":"example product", "description":"this is an example", "price":9.99}'
```

#### READ (All Products)

This command sends a `GET` request to retrieve a list of all existing products.

```bash
curl -s -X GET http://localhost:8080/read
```

#### READ (Specific Product by ID)

This command sends a `GET` request to retrieve details for a single product, identified by its unique `<id>`.

```bash
curl -s -X GET http://localhost:8080/read/<id>
```

**Note:** For these commands, any text enclosed in angle braces `<>` (like `<id>`) must be substituted by you with the actual value. For example, replace `<id>` with `1` if you want to read the product with ID 1.

#### UPDATE an Existing Product

This command sends a `PUT` request to modify the details of an existing product, identified by its `<id>`. The request body should contain the updated information in JSON format.

```bash
curl -s -X PUT http://localhost:8080/update/<id> -H 'Content-type:application/json'  -d '{"name":"updated product", "description":"its brand new", "price":99.99}'
```

**Note:** Replace `<id>` with the actual product ID you wish to update.

#### DELETE a Product

This command sends a `DELETE` request to remove a specific product, identified by its `<id>`.

```bash
curl -s -X DELETE http://localhost:8080/delete/<id>
```

**Note:** Replace `<id>` with the actual product ID you wish to delete.

## Verification & Testing

This project includes different types of tests to ensure its functionality and reliability.

### Unit/Integration Tests

These tests are designed to verify individual parts of the application (unit tests) or the interaction between different components (integration tests), such as request handling and data processing logic.
To execute these tests, ensure the server is operational in one terminal. In a new terminal window (with the virtual environment activated if used), run:

```bash
python lbg.test.py
```

### Acceptance Tests

Acceptance tests validate the application from an end-user perspective, ensuring it meets the specified requirements. This project uses Behave for acceptance testing.
To perform acceptance tests:

1.  Download a WebDriver compatible with your web browser of choice (e.g., ChromeDriver for Chrome, GeckoDriver for Firefox).
2.  Update the path to this WebDriver in the `.\features\environment.py` file.
3.  Ensure the server is running.
4.  In a new terminal window (with the virtual environment activated if used), execute the command:

```bash
behave .\features\restapp.feature
```

## Troubleshooting Common Issues

- **Port Conflict:** If the server fails to start on `http://localhost:8080`, another application might already be using that port. Try stopping the other application or configuring this project to use a different port (if possible through `lbg.py` or its configurations).
- **Command Not Found (`python`, `pip`, `curl`):** Ensure that Python, Pip, and Git (which often includes curl) are correctly installed and their installation directories are added to your system's PATH environment variable.
- **Dependency Installation Failures:** If `pip install -r requirements.txt` fails, check your internet connection. Look for specific error messages, as they might indicate missing system libraries or incompatibilities that need to be resolved.
- **Virtual Environment Not Activated:** If you're using a virtual environment, make sure it's activated in your terminal session before running `pip install` or `python lbg.py`.

## Next Steps & Potential Enhancements

This starter project can be a foundation for more complex applications. Potential future enhancements include:

- **Database Integration:** Replace in-memory data storage (if used) with a persistent database like SQLite, PostgreSQL, or MongoDB.
- **User Authentication & Authorization:** Implement secure ways to manage user access.
- **Input Validation & Error Handling:** Add more robust validation for incoming data and provide clearer error messages.
- **Dockerization:** Containerize the application for easier deployment and scalability.
- **Expanded API Functionality:** Add more complex endpoints and data models.

## Contributing

While this project is part of a specific bootcamp, contributions in the form of suggestions, bug reports, or feature ideas are generally welcome if it were an open-source project. (Please follow standard GitHub practices like forking and creating pull requests if applicable).
