<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>MyTender</title>

    <!-- Bootstrap reboot -->
    <link rel="stylesheet" href="/static/libs/bootstrap-reboot.min.css">

    <!-- Bootstrap -->
    <link rel="stylesheet" href="/static/libs/bootstrap-grid.min.css">

    <!-- Google Fonts -->
    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans:ital,wght@0,400;0,700;1,400&display=swap" rel="stylesheet">

    <!-- My style -->
    <link rel="stylesheet" href="/static/css/login-style.css">
    <link rel="stylesheet" href="/static/css/footer-style.css">
    <link rel="stylesheet" href="/static/css/header-style.css">
</head>
<body>
<#import "blocks/template.ftlh" as templates>

<!-- Header -->
<@templates.header />

<main class="main">
    <div class="container">
        <div class="login">
            <form action="/login" method="post" class="login-form">
                <h2>Log in</h2><br>
                <div>
                    <label>
                        User Name: <br>
                        <input type="email" name="username" placeholder="Enter your user name"><br>
                    </label>
                    <label>
                        Password: <br>
                        <input type="password" name="password" placeholder="Enter your password"><br>
                    </label>
                </div>
                <div>
                    <input type="hidden" name="_csrf" value="${_csrf.token}">
                    <button type="submit">Log in</button>
                </div>
            </form>
        </div>
    </div>
</main>


</body>
</html>