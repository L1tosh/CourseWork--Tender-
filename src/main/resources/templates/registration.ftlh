<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>MyTender</title>

    <!-- Bootstrap reboot  -->
    <link rel="stylesheet" href="/static/libs/bootstrap-reboot.min.css">

    <!-- Bootstrap -->
    <link rel="stylesheet" href="/static/libs/bootstrap-grid.min.css">

    <!-- Google Fonts -->
    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans:ital,wght@0,400;0,700;1,400&display=swap" rel="stylesheet">

    <!-- My style -->
    <link rel="stylesheet" href="/static/css/registration-style.css">
    <link rel="stylesheet" href="/static/css/footer-style.css">
    <link rel="stylesheet" href="/static/css/header-style.css">

</head>
<body>
<#import "blocks/template.ftlh" as templates>

<!-- Header -->
<@templates.header />

<main class="main">
    <div class="container">
        <div class="registration">
            <form action="/registration" class="registration-form" method="post">
                <h2>Registration</h2><br>

                <div>
                    <label>
                        First Name: <br>
                        <input type="text" name="firstName" placeholder="Enter your name"><br>
                    </label>
                    <label>
                        Last Name: <br>
                        <input type="text" name="lastName" placeholder="Enter your surname"><br>
                    </label>
                </div>

                <div>
                    <label>
                        Email: <br>
                        <input type="email" name="email" placeholder="Enter your email"><br>
                    </label>
                    <label>
                        Phone Number: <br>
                        <input type="number" name="phoneNumber" placeholder="Enter your number"><br>

                    </label>
                </div>

                <div>
                    <label>
                        Password: <br>
                        <input type="password" name="password" placeholder="Enter your password"><br>
                    </label>
                    <label>
                        Confirm Password: <br>
                        <input type="password" name="password2" placeholder="Repeat your password"><br>
                    </label>
                </div>

                <!--        <div class="massage">-->
                <!--          <div class="wrong-massage">-->
                <!--            wrong-->
                <!--          </div>-->
                <!--        </div>-->

                <div>
                    <input type="hidden" name="_csrf" value="${_csrf.token}">
                    <button type="submit">Register</button>
                </div>


            </form>
            <#if errorMassage??>
                <h2 style="color: red">${errorMassage}</h2>
            </#if>
        </div>

    </div>
</main>


</body>
</html>