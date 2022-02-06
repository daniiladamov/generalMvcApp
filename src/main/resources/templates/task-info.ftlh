<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Task-info</title>
</head>
<body>
<h2>Information about Task#${task.id}<h2>

<h3>${task.topic}<h3>

       <hr>
        Task from user: ${task.userFrom.fullName}
        <hr>
        Task for user: ${task.userTo.fullName}
        <hr>
        Task description:<br>
        <label>${task.description}</label>
        <hr>
        Creation date: ${task.dateOfCreate}<br><hr>
        Status: <#if task.status>
        Completed
        <#else>In progress
        </#if><br>
        <hr>
        <#if task.status>
            Completed date: ${task.dateOfFinish}<br><hr>
            Comment:<br>
            ${task.comment}<br></#if>
            <#if task.userTo.getId()==user.getId()&&!task.status>
        <form action="/complete-task/${task.id}" method="post">
            Comment:<br>
            <textarea rows="5" name="comment" required></textarea><br>
            <input type="submit" value="Complete the task">
            <input type="hidden" name="_csrf" value="${_csrf.token}">
        </form></#if>
        <hr>
        <form action="/user-panel" method="get">
            <input type="submit" value="Come back to user panel">
            <input type="hidden" name="_csrf" value="${_csrf.token}">
        </form>
</body>
</html>