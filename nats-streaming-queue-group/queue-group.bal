import ballerina/encoding;
import ballerina/io;
import ballerina/log;
import ballerina/nats;

// Creates a NATS connection.
nats:Connection conn = new("localhost:4222");

// Initializes the NATS Streaming listeners.
listener nats:StreamingListener lis = new(conn);


// Binds the consumer to listen to the messages published to the 'demo' subject.
// Belongs to the queue group named "sample-queue-group"
@nats:StreamingSubscriptionConfig {
    subject: "demo",
    queueName: "sample-queue-group"
}
service firstQueueGroupMember on lis {
    resource function onMessage(nats:StreamingMessage message) {
       // Prints the incoming message in the console.
       io:println("Message Received to first queue group member: " + encoding:byteArrayToString(message.getData()));
    }

    resource function onError(nats:StreamingMessage message, nats:Error errorVal) {
        error e = errorVal;
        log:printError("Error occurred: ", err = e);
    }
}


// Binds the consumer to listen to the messages published to the 'demo' subject.
// Belongs to the queue group named "sample-queue-group"
@nats:StreamingSubscriptionConfig {
    subject: "demo",
    queueName: "sample-queue-group"
}
service secondQueueGroupMember on lis {
    resource function onMessage(nats:StreamingMessage message) {
       // Prints the incoming message in the console.
       io:println("Message Received to second queue group member: " + encoding:byteArrayToString(message.getData()));
    }

    resource function onError(nats:StreamingMessage message, nats:Error errorVal) {
        error e = errorVal;
        log:printError("Error occurred: ", err = e);
    }
}


// Binds the consumer to listen to the messages published to the 'demo' subject.
// Belongs to the queue group named "sample-queue-group"
@nats:StreamingSubscriptionConfig {
    subject: "demo",
    queueName: "sample-queue-group"
}
service thridQueueGroupMember on lis {
    resource function onMessage(nats:StreamingMessage message) {
       // Prints the incoming message in the console.
       io:println("Message Received to third queue group member: " + encoding:byteArrayToString(message.getData()));
    }

    resource function onError(nats:StreamingMessage message, nats:Error errorVal) {
        error e = errorVal;
        log:printError("Error occurred: ", err = e);
    }
}
