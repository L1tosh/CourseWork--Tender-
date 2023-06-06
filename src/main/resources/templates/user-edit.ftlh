<!DOCTYPE html>
<html lang="en" xmlns:th="http://www.thymeleaf.org">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>MyTender</title>

    <!-- Bootstrap reboot -->
    <link rel="stylesheet" href="/static/libs/bootstrap-reboot.min.css">

    <!-- Bootstrap сетка -->
    <link rel="stylesheet" href="/static/libs/bootstrap-grid.min.css">

    <!-- Google Fonts -->
    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans:ital,wght@0,400;0,700;1,400&display=swap" rel="stylesheet">

    <!-- My style -->
    <link rel="stylesheet" href="/static/css/user-edit-style.css">
    <link rel="stylesheet" href="/static/css/header-style.css">
    <link rel="stylesheet" href="/static/css/admin-style.css">
    <link rel="stylesheet" href="/static/css/button-style.css">
</head>
<body>
<#import "blocks/template.ftlh" as templates>

<!-- Header -->
<@templates.header />

<main class="main">
    <div class="container">
        <h2>Edit User</h2>
        <form class="user-edit" action="/admin/user/edit" method="post" >
            <div><input type="text" name="firstName" value="${user.firstName}" style="width: 50%;"></div>
            <div><input type="text" name="lastName" value="${user.lastName}" style="width: 50%;"></div>
            <div><input type="text" name="phoneNumber" value="${user.phoneNumber}" style="width: 50%;"></div>

            <div>
                <#list roles as role>
                        <div>
                            <input type="checkbox" name="${role}"
                                    ${user.roles?seq_contains(role)?string("checked", "")} style="margin-right: 10px">
                            ${role}
                        </div>
                </#list>
            </div>

            <div><input type="hidden" value="${user.id}" name="userId">
                <input type="hidden" value="${_csrf.token}" name="_csrf">
                <button class="button" type="submit">Save</button>
            </div>
        </form>

        <div class="admin-panel">
            <table>
                <tr>
                    <th>Views</th>
                    <th>Tittle</th>
                    <th>Start price</th>
                    <th>Data start</th>
                    <th>Data end</th>
                    <th>Delete</th>
                </tr>
                <#list products as product>
                    <tr>
                        <th>1</th>
                        <th><a href="/product/${product.id}">${product.title}</a></th>
                        <th>${product.price}</th>
                        <th>${product.timeStart}</th>
                        <th>${product.timeEnd}</th>
                        <th>
                            <form action="/product/delete/${product.id}" method="post">
                                <input type="hidden" name="_csrf" value="${_csrf.token}">
                                <button type="submit" class="button">Delete</button>
                            </form>
                        </th>
                    </tr>
                </#list>
            </table>
        </div>

    </div>
</main>


</body>
</html>
