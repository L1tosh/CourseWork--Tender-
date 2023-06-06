<!DOCTYPE html>
<html lang="en" xmlns:th="http://www.thymeleaf.org">
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
    <link rel="stylesheet" href="/static/css/admin-style.css">
    <link rel="stylesheet" href="/static/css/header-style.css">
</head>
<body>
<#import "blocks/template.ftlh" as templates>

<!-- Header -->
<@templates.header />

<main class="main">
    <div class="container">
        <div class="admin-panel">
            <table>
                <tr>
                    <th>First Name</th>
                    <th>Last Name</th>
                    <th>Email</th>
                    <th>Phone</th>
                    <th>Active</th>
                    <th>Role</th>
                    <th>Ban/Unban</th>
                    <th>User page</th>
                    <th>Change user info</th>
                </tr>
                <#list  users as user>
                    <tr>
                        <th>${user.firstName}</th>
                        <th>${user.lastName}</th>
                        <th>${user.email}</th>
                        <th>${user.phoneNumber}</th>
                        <th><#if user.active>true<#else>false</#if></th>
                        <th><#list user.roles as role>${role}</#list></th>
                        <th>
                            <form action="/admin/user/ban/${user.id}" method="post">
                                <input type="hidden" name="_csrf" value="${_csrf.token}">
                                <input type="submit" value="Ban/Unban">
                            </form>
                        <th><a href="user/${user.id}">check</a></th>
                        <th><a href="/admin/user/edit/${user.id}">change</a></th>
                    </tr>
                <#else>
                    <h3>None users</h3>
                </#list>
            </table>
        </div>
    </div>
</main>

</body>
</html>