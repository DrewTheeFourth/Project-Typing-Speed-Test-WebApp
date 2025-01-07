Typing Speed Test
Overview
The Typing Speed Test is a web application designed to help users improve their typing skills. It provides a fun and interactive way to practice typing while tracking performance metrics such as typing speed (in words per minute) and accuracy. The application is built using modern web technologies and leverages serverless architecture for efficient data handling.
Features
Typing Practice: Users can practice typing with randomly generated passages.
Performance Tracking: Real-time feedback on typing speed (WPM) and accuracy.
Responsive Design: Works seamlessly across devices (desktops, tablets, and smartphones).
Data Storage: User results are stored in a DynamoDB database for future reference.
Technologies Used
Frontend:
HTML
CSS
JavaScript
Backend:
AWS Lambda (Node.js)
Amazon DynamoDB
Containerization:
Docker for easy deployment and scalability
Getting Started
Prerequisites
Before you begin, ensure you have the following installed:
Node.js (for backend development)
Docker (for containerization)
AWS Account (for deploying the backend)
Installation
Clone the repository:
bash
git clone https://github.com/yourusername/typing-speed-test.git
cd typing-speed-test
Navigate to the frontend directory and install dependencies:
bash
cd frontend
Build the frontend Docker image:
bash
docker build -t typing-speed-test-frontend .
Navigate to the lambda directory and install any necessary dependencies:
bash
cd ../lambda
Build the backend Docker image:
bash
docker build -t typing-speed-test-backend .
Running the Application
Start both frontend and backend services using Docker Compose:
bash
docker-compose up --build
Access the application by navigating to http://localhost:8080 in your web browser.
Usage
Click on the "Start Test" button to begin.
Type the passage displayed on the screen.
Your typing speed (WPM) and accuracy will be displayed in real-time.
Contributing
Contributions are welcome! If you have suggestions for improvements or new features, feel free to fork the repository and submit a pull request.
License
This project is licensed under the MIT License - see the LICENSE file for details.
Acknowledgments
Thank you to all contributors and resources that helped in building this project!
Feel free to replace placeholders like yourusername with your actual GitHub username or any other relevant information specific to your project. If you have additional sections or details you'd like to include, let me know!
