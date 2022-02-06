<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Registration</title>
</head>
<body>
<form action="/registration" method="post">
    Login:<br><input type="text" name="username"/><br>
    Password:<br><input type="password" name="password"/><br>
    First name:<br><input type="text" name="firstName"/><br>
    Second name:<br><input type="text" name="secondName"/><br>

    <input type="hidden" name="_csrf" value="${_csrf.token}">
    <input type="submit" value="register">
</form>


</body>
</html>