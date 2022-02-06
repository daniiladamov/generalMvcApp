<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Create-Task</title>
</head>
<body>

<form action="/create-task" method="post">
    Task topic:<br><input type="text" name="topic"><br>
    Task description:<br><textarea name="description" rows="5"></textarea><br>
    UserName for task<br>
    <select size="1" name="to">
        <option disabled>Choose the user</option>
    <#list list as usr>
        <option value="${usr.fullName}">${usr.fullName}</option>
    </#list>
    </select><br>
    <input type="submit" value="Send">
    <input type="hidden" name="_csrf" value="${_csrf.token}">
   </form><hr>


</body>
</html>