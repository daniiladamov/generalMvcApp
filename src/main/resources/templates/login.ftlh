<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Log in</title>
</head>
<body>

<form action="/login" method="post">
  User name:<br> <input type="text" name="username"/><br>
    Password: <br><input type="password" name="password"/><br><br>
    <input type="hidden" name="_csrf" value="${_csrf.token}">
    <input type="submit" value="Sign in"><br>
</form>
<a href="/registration">Registration</a>
</body>
</html>