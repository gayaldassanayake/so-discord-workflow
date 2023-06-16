// import ballerina/http;
// import ballerina/time;
// import ballerina/log;

// // import ballerina/io;
// // configurable string chatId = ?;
// // configurable string chatKey = ?;
// // configurable string chatToken = ?;
// configurable string discordChannelId = ?;
// configurable string discordBotToken = ?;

// configurable string tag = ?;

// // How often will this program be executed
// configurable int intervalSeconds = 60 * 20; // change to 10 minutes

// type Question record {
//     string[] tags;
//     boolean is_answered;
//     int answer_count;
//     string link;
//     string title;
// };

// type QuestionsResponse record {
//     Question[] items;
// };

// public function main() returns error? {
//     time:Utc toDate = time:utcNow();
//     time:Utc fromDate = [toDate[0] - intervalSeconds, toDate[1]];

//     log:printInfo("Fetching new SO questions", interval = intervalSeconds, timeUnit = "seconds", fromdate = fromDate[0]);

//     // Get latest stackoverflow questions for the past hour
//     http:Client stackoverflowClient = check new ("https://api.stackexchange.com/2.3");
//     QuestionsResponse response = check stackoverflowClient->get(string `/questions?order=desc&sort=creation&tagged=${tag}&site=stackoverflow&fromdate=${fromDate[0]}`);
//     log:printInfo("Fetched questions", fromdate = fromDate[0], numOfQuestions = response.items.length());

//     if response.items.length() == 0 {
//         log:printInfo("No new questions during this period");
//         return;
//     }

//     // http:Client googleChatClient = check new ("https://chat.googleapis.com/v1/spaces");

//     // string chatMessage = "*New StackOverflow Question(s):*";
//     // foreach Question question in response.items {
//     //     chatMessage = chatMessage + "\n - " + string `<${question.link}|${question.title}> (Answered: ${question.is_answered ? "Yes" : "No"})`;
//     // }

//     // log:printInfo("Sending chatMessage", chatMessage = chatMessage);


//     // approach 1 - doesn't show the preview
//     // json body = {text: chatMessage};
//     // json|http:ClientError chatResponse = googleChatClient->post(string `/${chatId}/messages?key=${chatKey}&token=${chatToken}`, body);
//     // if chatResponse is http:ClientError {
//     //     log:printError("Failed to send message", 'error = chatResponse);
//     // } else {
//     //     log:printInfo("Sent chat message", response = chatResponse);
//     // }

//     // string title = "**New StackOverflow Question(s):**";
//     // json[] questions = [];
//     // foreach Question question in response.items {
//     //     string value = string `[${question.title}](${question.link}) (Answered: ${question.is_answered ? "Yes" : "No"})`;
//     //     questions.push({value: value, inline: false});
//     // }
//     // json body = {
//     //     content: title,
//     //     embeds: [{fields: questions}]
//     // };

//     // approach 2
//     json[] embeds = [];
//     foreach Question question in response.items {
//         string url = question.link;
//         string title = question.title;
//         string description = string `Answered: ${question.is_answered ? "Yes" : "No"}`;
//         embeds.push({title, url, description, image: {url: "https://stackoverflow.design/assets/img/logos/so/logo-stackoverflow.png"}});
//     }

//     json body = {
//         content: "**New StackOverflow Question(s):**",
//         embeds
//     };

//     http:Client discordClient = check new ("https://discord.com/api/v10/channels");
//     // json payload = {content};
//     map<string> headers = {Authorization: string `Bot ${discordBotToken}`, "Content-Type": "application/json"};
//     json|http:ClientError discordResponse = discordClient->post(string `/${discordChannelId}/messages`, body, headers);
//     if discordResponse is http:ClientError {
//         log:printError("Failed to send discord message", 'error = discordResponse);
//     } else {
//         log:printInfo("Sent discord message", response = discordResponse);
//     }

//     log:printInfo("Finished execution");
// }
