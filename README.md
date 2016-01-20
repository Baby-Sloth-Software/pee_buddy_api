# Pee Buddy API
<hr>
[![Build Status](https://travis-ci.org/Baby-Sloth-Software/pee_buddy_api.svg?branch=master)](https://travis-ci.org/Baby-Sloth-Software/pee_buddy_api)

Welcome to the Pee Buddy API documentation.  This application will allow you to store and rate bathrooms found using Google Places API V3.

**Methods**

* [User Methods](#user-methods)
	* [Registration](#user-registration)
	* [Login] (#user-login)
* [TYPE Methods](#TYPE-methods)
	* [METHOD NAME](#TYPE-METHOD_NAME)
	* [METHOD NAME](#TYPE-METHOD_NAME)
	* [METHOD NAME](#TYPE-METHOD_NAME)
	
##<a name="user-methods"></a>User Methods

###<a name="user-registration"></a>Registration

This request will create a new user in the system and return back an auth\_token back.  The auth\_token must be used for all subsequent requests (except for User Login).

####POST `/api/v1/users/register`

**Request**
    
| Form Params | Type           | Description  |
| ------------- |:-------------:|:----- |
| email | String | ​*(Required)*​ Users email address, must follow the format terric@babyslothsoftware.com |
| username | String | ​*(Required)*​ Username must be unique |
| password    | String      |  ​*(Required)*​  password for the user |

**Response**

If successful, you will receive:

    Status Code: 201 - Created
    
```json
{
  "success": "true",
  "username": "USERNAME",
  "auth_token": "AUTH_TOKEN"
}       
```

If unsuccessful, you will receive:

    Status Code: 422 - Unprocessable Entity
    
```json
{
  "errors": [
    "Email has already been taken",
    "Username has already been taken"
  ]
}
```

###<a name="user-login"></a>Login

This request will allow an existing user in the system to send their email and password and return back an auth\_token back.  The auth\_token must be used for all subsequent requests (except for User Registration).

####POST `/users`

**Request**
    
| Form Params       | Type           | Description  |
| ------------- |:-------------:|:----- |
| username | String | ​*(Required)*​ existing username in system |
| password    | String      |  ​*(Required)*​  password for the user |


**Response**

If successful, you will receive:

    Status Code: 202 - Accepted
    
```json
{
  "success": "true",
  "username": "USERNAME",
  "auth_token": "AUTH_TOKEN"
}     
```

If unsuccessful, you will receive:

    Status Code: 401 - Not Authorized
    
```json
{
  "errors": {
    "detail": "Username or Password incorrect."
  }
}
```

<!--##<a name="TYPE-methods"></a>TYPE Methods

###<a name="TYPE-METHOD_NAME"></a>METHOD NAME

<METHOD DESCRIPTION>

####GET POST PUT PATCH DELETE `/ROUTE`

**Request**

**** Note - use any of the following tables as you need them for each request.
    
| Header Params        | Type           | Description  |
| ------------- |:-------------:|:----- |
| <NAME> | <TYPE> | ​*(Required -or- Optional)*​ <DESCRIPTION>  |

| Form Params        | Type           | Description  |
| ------------- |:-------------:|:----- |
| <NAME> | <TYPE> | ​*(Required -or- Optional)*​ <DESCRIPTION>  |

| URL Params        | Type           | Description  |
| ------------- |:-------------:|:----- |
| <NAME> | <TYPE> | ​*(Required -or- Optional)*​ <DESCRIPTION>  |

**Request**
```json
  JSON - pull from params variable on request using Postman and binding.pry
```

**Response**

If successful, you will receive:

    Status Code: <CODE NUMBER> - <CODE DESCRIPTION>
    
```json
  JSON - pull from Postman using Pretty feature
```

If unsuccessful, you will receive:

    Status Code: <CODE NUMBER> - <CODE DESCRIPTION>
    
```json
  JSON - pull from Postman using Pretty feature
```-->