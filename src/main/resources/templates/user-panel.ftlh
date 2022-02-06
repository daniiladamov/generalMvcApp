<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <title>UserPanel</title>
        <style>
            .hidden{
                display: none;
            }
        </style>
    </head>
    <body>
    Hello, ${user.fullName}
    <form action="/logout" method="post">
        <input type="submit" value="sign out">
        <input type="hidden" name="_csrf" value="${_csrf.token}"/>
    </form>
    <br>
    <form action="/create-task" method="get">
        <button>Create a new task!</button>
        <input type="hidden" name="_csrf" value="${_csrf.token}"/>
    </form>
    <br>
    <hr>

    <h3>You have ${user.countOfTasks} task(s)</h3>
    <table border="1">
        <tr>
            <th>Task id</th>
            <th>Task from</th>
            <th>Task topic</th>
            <th>More detailed</th>
        </tr>

        <#list user.taskTo as task>
        <#if task.status==false>
        <tr>
            <th>${task.id}</th>
            <th>${task.userFrom.fullName}</th>
            <th>${task.topic}</th>
            <th>
                <form action="/task-info/${task.id}" method="get">
                    <button>Click</button>
                    <input type="hidden" name="_csrf" value="${_csrf.token}"/>
                </form>
            </th>
        </tr>
    </#if>
    </#list>
    </table>

    <br>
    <hr>
    <h3 id="first">Task from you(click)</h3>
    <div id="firstDiv">
        <table border="1">
            <tr>
                <th>Task id</th>
                <th>Task to</th>
                <th>Task topic</th>
                <th>More detailed</th>
            </tr>
            <#list user.taskFrom as task>
            <#if task.status==false>
            <tr>
                <th>${task.id}</th>
                <th>${task.userTo.fullName}</th>
                <th>${task.topic}</th>
                <th>
                    <form action="/task-info/${task.id}" method="get">
                        <button>Click</button>
                        <input type="hidden" name="_csrf" value="${_csrf.token}"/>
                    </form>
                </th>
            </tr>
        </#if>
    </#list>
    </table></div>
<br>
<hr>
<h3 id="second">Completed task for you(click)</h3>
<div id="secondDiv">
    <table border="1">
        <tr>
            <th>Task id</th>
            <th>Task from</th>
            <th>Task topic</th>
            <th>More detailed</th>
        </tr>

        <#list user.taskTo as task>
        <#if task.status==true>
        <tr>
            <th>${task.id}</th>
            <th>${task.userFrom.fullName}</th>
            <th>${task.topic}</th>
            <th>
                <form action="/task-info/${task.id}" method="get">
                    <button>Click</button>
                    <input type="hidden" name="_csrf" value="${_csrf.token}"/>
                </form>
            </th>
        </tr>
    </#if>
    </#list>
    </table></div>
<br>
<hr>
<h3 id="third">Completed task from you(click)</h3>
<div id="thirdDiv">
    <table border="1">
        <tr>
            <th>Task id</th>
            <th>Task to</th>
            <th>Task topic</th>
            <th>More detailed</th>
        </tr>
        <#list user.taskFrom as task>
        <#if task.status==true>
        <tr>
            <th>${task.id}</th>
            <th>${task.userTo.fullName}</th>
            <th>${task.topic}</th>
            <th>
                <form action="/task-info/${task.id}" method="get">
                    <button>Click</button>
                    <input type="hidden" name="_csrf" value="${_csrf.token}"/>
                </form>
            </th>
        </tr>
    </#if>
    </#list>
    </table></div>
    <script>
        const first = document.getElementById('first')
        const second = document.getElementById('second')
        const third = document.getElementById('third')
        const firstDiv = document.getElementById('firstDiv')
        const secondDiv = document.getElementById('secondDiv')
        const thirdDiv = document.getElementById('thirdDiv')
        firstDiv.classList.add('hidden')
        let stateForFirstDiv = false
        first.addEventListener('click', () => {
            stateForFirstDiv? firstDiv.classList.add('hidden'):firstDiv.classList.remove('hidden')
            stateForFirstDiv=!stateForFirstDiv
        })
        secondDiv.classList.add('hidden')
        let stateForSecondDiv = false
        second.addEventListener('click', () => {
            stateForSecondDiv?secondDiv.classList.add('hidden'):secondDiv.classList.remove('hidden')
            stateForSecondDiv=!stateForSecondDiv
        })
        thirdDiv.classList.add('hidden')
        let stateForThirdDiv = false
        third.addEventListener('click', () => {
            stateForThirdDiv?thirdDiv.classList.add('hidden'):thirdDiv.classList.remove('hidden')
            stateForThirdDiv=!stateForThirdDiv
        })
    </script>
</body>
</html>