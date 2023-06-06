<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>MyTender</title>

    <!-- Bootstrap reboot -->
    <link rel="stylesheet" href="/static/libs/bootstrap-reboot.min.css">

    <!-- Bootstrap  -->
    <link rel="stylesheet" href="/static/libs/bootstrap-grid.min.css">

    <!-- Google Fonts -->
    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans:ital,wght@0,400;0,700;1,400&display=swap" rel="stylesheet">

    <!-- My style -->
    <link rel="stylesheet" href="/static/css/styles.css">
    <link rel="stylesheet" href="/static/css/footer-style.css">
    <link rel="stylesheet" href="/static/css/header-style.css">
    <link rel="stylesheet" href="/static/css/button-style.css">
    <link rel="stylesheet" href="/static/css/users-style.css">
</head>
<body>
<#import "blocks/template.ftlh" as templates>

<!-- Header -->
<@templates.header />

<main class="main">
    <div class="container">
        <div class="container-users">
            <#list users as user>
                <#if !user.isAdmin()>
                    <div class="user-block">
                        <div class="image"><img src="/static/images/avatar.png"></div>
                        <div class="info">
                            <ul>
                                <li><a href="user/${user.id}">${user.firstName} ${user.lastName}</a></li>
                                <li>${user.email}</li>
                                <li>${user.phoneNumber}</li>
                            </ul>
                        </div>
                    </div>
                </#if>
            </#list>
        </div>
    </div>
</main>

<!-- Footer -->
<@templates.footer />
</body>
</html>