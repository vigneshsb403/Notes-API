# Notes-API

<p align="center">
<a href="https://twitter.com/sbvignesh"><img src="https://img.shields.io/twitter/follow/sbvignesh.svg?logo=twitter"></a>
<a href="https://github.com/vigneshsb403/Notes-API/issues"><img src="https://img.shields.io/badge/contributions-welcome-brightgreen.svg?style=flat"></a>
<a href="https://restfulapi.net"><img src="https://img.shields.io/badge/REST%20API-8A2BE2"></a>
<a href="https://api.vigneshsb.fun"><img src="https://img.shields.io/badge/Website-00CF71"></a>

</p>

<p align="center">
  <a href="#installing">Install</a> •
  <a href="#usage">Usage</a> •
  <a href="#auth">Auth</a> •
  <a href="#folder">Folder</a> •
  <a href="#note">Note</a>
</p>

<br>
<br>

# Installing
First clone the repo
```
git clone https://github.com/vigneshsb403/Notes-API/
```
then run the below commands:
```
cd Notes-API
docker compose build
docker compose up -d
```
> [!NOTE]\
> Assuming you have installed docker.

# Usage
To test if every thing is working
Request:
```bash
curl --location --request POST 'http://localhost/api/test'
```
Response:
```json
{
    "Host": "localhost",
    "User-Agent": "curl\/8.1.2",
    "Accept": "*\/*"
}
```
<br>

---

<br>

# Auth

## Signup
Request:
```bash
curl --location 'http://localhost/api/auth/signup' \
--form 'username="root"' \
--form 'email="rioot57@icloud.com"' \
--form 'password="dontlookhere"'
```

Response:
```json
{
    "message": "Signup success",
    "userid": 116
}
```

## Login
Request:
```bash
curl --location 'http://localhost/api/auth/login' \
--form 'username="root"' \
--form 'password="dontlookhere"'
```

Responce:
```json
{
    "message": "Login success",
    "tokens": {
        "access_token": "a.9f0e77f9b08bbe258f4df61cc4e3e1c180f6f3c6e881a8c74f87XXXXXXXXXXXX",
        "valid_for": 7200,
        "refresh_token": "r.ee4fbd66283e64f2ee8fe75ef233a03b576f4e2e302e80ff5feXXXXXXXXXXXX",
        "reference_token": "auth_grant",
        "type": "api"
    }
}
```

## Refresh Token
Request:
```bash
curl --location 'http://localhost/api/auth/refresh' \
--form 'refresh_token="r.5e2653b4b1995fdb7490fa01cc8fce46955892efb95d0df3b225XXXXXXXXXXXX"'
```

Responce:
```json
{
    "message": "Refresh Success",
    "tokens": {
        "access_token": "a.62761edb7a664521104187ad3308b983f92711c973ff3d77cXXXXXXXXXXXX",
        "valid_for": 7200,
        "refresh_token": "d.17ab0606e7e0ff47b96XXXXXXXXXXXX",
        "reference_token": "r.5e2653b4b1995fdb7490fa01cc8fce46955892efb95d0df3b2XXXXXXXXXXXX",
        "type": "api"
    }
}
```

## Current user

Request:
```bash
curl --location --request POST 'http://localhost/api/auth/current' \
--header 'Authorization: Bearer a.8e640f40e87cd18cf2052f7f69bc2cff8c5a1393d3866beaXXXXXXXXXXXX' \
--header 'Cookie: PHPSESSID=81pru9ip5gq4nXXXXXXXXXXXX'
```

Responce:
```json
{
    "username": "root"
}
```
> [!NOTE]\
> you also get a cookie with the responce

<br>

---

<br>

# Folder
 ## New Folder
 Request:
 ```bash
curl --location 'http://localhost/api/folder/new' \
--header 'Authorization: Bearer a.8e640f40e87cd18cf2052f7f69bc2cff8c5a1393d3866bea54c0e081f6b2f5e2' \
--header 'Cookie: PHPSESSID=81pru9ip5gq4n4kpa7jt17kj3h' \
--form 'name="ANSI Hacking"'
```
Responce:
```json
{
    "folder_id": 14
}
```

## List Folder
Request:
```bash
curl --location 'http://localhost/api/folder/list' \
--header 'Authorization: Bearer a.8e640f40e87cd18cf2052f7f69bc2cff8c5a1393d3866bea54c0e081f6b2f5e2' \
--header 'Cookie: PHPSESSID=81pru9ip5gq4n4kpa7jt17kj3h'
```

Responce:
```json
[
    {
        "id": "13",
        "name": "Default Folder",
        "owner": "root",
        "created_at": "2024-01-10 15:38:35",
        "created": "16 hours ago",
        "count": "0"
    },
    {
        "id": "14",
        "name": "ANSI Hacking",
        "owner": "root",
        "created_at": "2024-01-11 08:04:07",
        "created": "1 minute ago",
        "count": "0"
    }
]
```

## Delete Folder:
Request:
```bash
curl --location 'http://localhost/api/folder/delete' \
--header 'Authorization: Bearer a.8e640f40e87cd18cf2052f7f69bc2cff8c5a1393d3866bea54c0e081f6b2f5e2' \
--header 'Cookie: PHPSESSID=81pru9ip5gq4n4kpa7jt17kj3h' \
--form 'id="14"'
```

Responce:
```json
{
    "message": "success"
}
```

## Get all notes
Request:
```bash
curl --location 'http://localhost/api/folder/get_all_notes' \
--header 'Authorization: Bearer a.8e640f40e87cd18cf2052f7f69bc2cff8c5a1393d3866bea54c0e081f6b2f5e2' \
--header 'Cookie: PHPSESSID=81pru9ip5gq4n4kpa7jt17kj3h' \
--form 'id="13"'
```

Response:
```
{
    "count": "2",
    "notes": [
        {
            "id": "51",
            "title": "New note",
            "body": "new body",
            "created_at": "2024-01-11 08:38:09",
            "updated_at": "2024-01-11 08:38:09",
            "owner": "root",
            "folder_id": "13",
            "created": "2 minutes ago",
            "updated": "2 minutes ago"
        },
        {
            "id": "52",
            "title": "Free note",
            "body": "Never trust user data",
            "created_at": "2024-01-11 08:39:27",
            "updated_at": "2024-01-11 08:39:27",
            "owner": "root",
            "folder_id": "13",
            "created": "55 seconds ago",
            "updated": "55 seconds ago"
        }
    ]
}
```
<br>

---

<br>

# Note
## New Note
Request:
```bash
curl --location 'http://localhost/api/notes/new' \
--header 'Authorization: Bearer a.8e640f40e87cd18cf2052f7f69bc2cff8c5a1393d3866bea54c0e081f6b2f5e2' \
--header 'Cookie: PHPSESSID=81pru9ip5gq4n4kpa7jt17kj3h' \
--form 'title="New note"' \
--form 'body="new body"' \
--form 'folder="13"'
```

Response:
```json
{
    "note_id": "51"
}
```
## Get Note
Request:
```bash
curl --location 'http://localhost/api/notes/get' \
--header 'Authorization: Bearer a.8e640f40e87cd18cf2052f7f69bc2cff8c5a1393d3866bea54c0e081f6b2f5e2' \
--header 'Cookie: PHPSESSID=81pru9ip5gq4n4kpa7jt17kj3h' \
--form 'id="52"'
```
Response:
```json
{
    "id": "52",
    "title": "Free note",
    "body": "Never trust user data",
    "created": "4 hours ago",
    "updated": "4 hours ago"
}
```

## Edit Note
Request:
```bash
curl --location 'http://localhost/api/notes/edit' \
--header 'Authorization: Bearer a.c43164c466a67ce17fbd5d93d7a71595381746e17499b696d0647c316e980543' \
--header 'Cookie: PHPSESSID=81pru9ip5gq4n4kpa7jt17kj3h' \
--form 'id="51"' \
--form 'title="Edited "' \
--form 'body="DNS runs on port 53"'
```
Response:
```json
{
    "id": "51",
    "title": "Edited",
    "body": "DNS runs on port 53",
    "created": "4 hours ago",
    "updated": "1 second ago"
}
```

## Delete Note
Request:
```bash
curl --location 'http://localhost/api/notes/delete' \
--header 'Authorization: Bearer a.c43164c466a67ce17fbd5d93d7a71595381746e17499b696d0647c316e980543' \
--header 'Cookie: PHPSESSID=81pru9ip5gq4n4kpa7jt17kj3h' \
--form 'id="51"'
```
Response:
```json
{
    "message": "success"
}
```

---
Made with 💙 by vignesh sb.
