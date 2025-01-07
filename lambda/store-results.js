const AWS = require('aws-sdk');
const dynamoDB = new AWS.DynamoDB.DocumentClient();

exports.handler = async (event) => {
    const { userId, score, accuracy } = JSON.parse(event.body);

    const params = {
        TableName: process.env.DYNAMODB_TABLE_NAME,
        Item: {
            UserID: userId,
            Score: score,
            Accuracy: accuracy,
            Date: new Date().toISOString()
        }
    };

    try {
        await dynamoDB.put(params).promise();
        return { statusCode: 200, body: JSON.stringify({ message: 'Result saved!' }) };
    } catch (error) {
        return { statusCode: 500, body: JSON.stringify({ error }) };
    }
};
