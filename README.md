# StackOverflow to Google Chat and Discord

Get notified about the latest StackOverflow questions tagged under a specific tag into Google Chat. Written in Ballerina (https://ballerina.io).

## Overview

This program will query the questions created during the last `x` seconds under a provided StackOverflow `tag` and notify the latest questions (if any) to a provided Google Chat.

## Configuration

```toml
chatId = "<google_chat_id>"
chatKey = "<google_chat_key>"
chatToken = "<google_chat_token>"

tag = "Ballerina"

intervalSeconds = 3600
```
