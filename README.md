# GitGames Messaging

## About
GitGames Messaging is an application created for the GitGames project for Turing School of Software and Design. One goal for the project was to use Service Oriented Architecture in our app, and so this application lives outside of our main application, [GitGames](https://github.com/patrickshobe/GitGames-BackEnd). 

GitGames Messaging creates an endpoint that takes in a username and array of email addresses, and will automatically send emails to those email addresses with a link to check out their GitHub metrics at our frontend application, [GitGames](https://thegitgames.herokuapp.com/).

## Endpoints

All routes prepended by the app url: `https://gitgamesmessaging.herokuapp.com/`

### Users

`/api/v1/users`

##### Request Structure

```
# Request
post `/api/v1/users`
      body = {user: {"emails": ['test_email@test.com', 'test_email_2@test.com'] 
            "username": coder123}}
```
