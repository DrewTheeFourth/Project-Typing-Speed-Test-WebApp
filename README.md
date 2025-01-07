Typing Speed Test Overview
The Typing Speed Test is a web application designed to enhance users' typing skills. It provides an engaging and interactive platform to practice typing while tracking performance metrics such as typing speed (in words per minute) and accuracy. The application utilizes modern web technologies and a serverless architecture for efficient data management.

Features
Typing Practice: Randomly generated passages for practice.
Performance Tracking: Real-time feedback on typing speed (WPM) and accuracy.
Responsive Design: Optimized for desktops, tablets, and smartphones.
Data Storage: User results stored in an Amazon DynamoDB database for future reference.
Technologies Used
Frontend: HTML, CSS, JavaScript
Backend: AWS Lambda (Node.js), Amazon DynamoDB
Containerization: Docker for deployment and scalability
Getting Started
Prerequisites
Ensure you have the following installed:

Node.js (for backend development)
Docker (for containerization)
AWS Account (for deploying the backend)
Installation
Clone the repository:

bash
Copy code
git clone https://github.com/DrewTheeFourth/Project-Typing-Speed-Test-WebApp.git
cd typing-speed-test
Navigate to the frontend directory and install dependencies:

bash
Copy code
cd frontend
Build the frontend Docker image:

bash
Copy code
docker build -t typing-speed-test-frontend .
Navigate to the lambda directory and install backend dependencies:

bash
Copy code
cd ../lambda
Build the backend Docker image:

bash
Copy code
docker build -t typing-speed-test-backend .
Running the Application
Start both frontend and backend services using Docker Compose:

bash
Copy code
docker-compose up --build
Access the application in your browser at:
http://localhost:8080

Usage
Click the Start Test button to begin.
Type the passage displayed on the screen.
View real-time feedback on your WPM and accuracy.
Contributing
Contributions are welcome! If you have suggestions for improvements or new features:

Fork the repository.
Submit a pull request with your changes.
License
This project is licensed under the MIT License. See the LICENSE file for details.

Acknowledgments
Special thanks to contributors and resources that made this project possible!

