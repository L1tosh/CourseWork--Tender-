<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>MyTender</title>

    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Registration</title>

    <!-- Bootstrap reboot  -->
    <link rel="stylesheet" href="/static/libs/bootstrap-reboot.min.css">

    <!-- Bootstrap  -->
    <link rel="stylesheet" href="/static/libs/bootstrap-grid.min.css">

    <!-- Google Fonts -->
    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans:ital,wght@0,400;0,700;1,400&display=swap"
          rel="stylesheet">

    <!-- My style -->
    <link rel="stylesheet" href="/static/css/styles.css">
    <link rel="stylesheet" href="/static/css/footer-style.css">
    <link rel="stylesheet" href="/static/css/header-style.css">
    <link rel="stylesheet" href="/static/css/button-style.css">
    <link rel="stylesheet" href="/static/css/product-edit-style.css">

</head>
<body>
<#import "blocks/template.ftlh" as templates>

<!-- Header -->
<@templates.header />

<main class="main">
    <!--    Add new tender-->
    <div class="container">
        <div class="edit-form">
            <form action="/product/edit/${product.id}" method="post" name="product">
                <div>
                    <div>Title:</div>
                    <input type="text" name="title" value="${product.title}"></div>
                <div>
                    <div>Company:</div>
                    <input type="text" name="company" value="${product.company}"></div>
                <div>
                    <div>City:</div>
                    <input type="text" name="city" value="${product.city}"></div>
                <div>
                    <div>Start price:</div>
                    <input type="number" name="price" value="${product.price?string('0')}"></div>
                <div>
                    <div>Time start:</div>
                    <input type="date" name="timeStart" value="${product.timeStart}" style="text-align: center"></div>
                <div>
                    <div>Time and:</div>
                    <input type="date" name="timeEnd" value="${product.timeEnd}" style="text-align: center"></div>
                <div>
                    <div>Little description:</div>
                    <textarea name="littleDescription" rows="3">${product.littleDescription}</textarea></div>
                <div>
                    <div>Description:</div>
                    <textarea name="description" rows="7">${product.description}</textarea></div>
                <div class="save-button">
                    <input type="hidden" name="_csrf" value="${_csrf.token}">
                    <button type="submit" class="button" style="width: 30%">Save</button>
                </div>
            </form>
        </div>
    </div>
</main>

<!-- Footer -->
<@templates.footer />
</body>
</html>