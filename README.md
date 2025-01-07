![webapp](https://github.com/user-attachments/assets/df9c736c-84c5-46c4-953f-929c87fe20dd)
![tst tables](https://github.com/user-attachments/assets/8bd48599-6139-4cdd-9ce5-4e29632e098d)
![store-results](https://github.com/user-attachments/assets/f6190833-4d35-43c7-82be-bad39d1ec61f)
![main tf](https://github.com/user-attachments/assets/d2e5d14a-263e-4ae7-ad6e-cce3a4ed9065)
![index frontend](https://github.com/user-attachments/assets/d7db92c6-1671-47e5-a105-a49f5f078670)
![dockerfile-f](https://github.com/user-attachments/assets/7ec89c95-b890-45af-bd4d-3f36c02d0d6f)
![dockerfile-b](https://github.com/user-attachments/assets/b3205545-feb6-4def-8c8a-99529b04b4a6)
![cognito](https://github.com/user-attachments/assets/fed6721e-6748-4c73-ae15-4a7098322fae)
![Capture](https://github.com/user-attachments/assets/b142218d-c48d-46d2-b290-c28968744ed7)
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
git clone https://github.com/DrewTheeFourth/Project-Typing-Speed-Test-WebApp
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
