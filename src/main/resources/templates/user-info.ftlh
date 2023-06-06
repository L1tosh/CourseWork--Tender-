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
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans:ital,wght@0,400;0,700;1,400&display=swap"
          rel="stylesheet">

    <!-- My style -->
    <link rel="stylesheet" href="/static/css/styles.css">
    <link rel="stylesheet" href="/static/css/footer-style.css">
    <link rel="stylesheet" href="/static/css/header-style.css">
    <link rel="stylesheet" href="/static/css/product-info-style.css">

</head>

<body>
<#import "blocks/template.ftlh" as templates>

<!-- Header -->
<@templates.header />

<!-- Main holder -->
<main class="main">

    <div class="title">
        <div class="container">
            <h2>User info</h2>
        </div>
    </div>

    <!-- User info -->
    <div class="container">
        <div class="user">
            <div class="avatar"><img src="/static/images/avatar.png" alt="avatar"></div>
            <div class="user-info">
                <p><b>Name:</b> ${userInfo.firstName} ${userInfo.lastName}</p>
                <p><b>Email:</b> ${userInfo.email}</p>
                <p><b>Phone number:</b> ${userInfo.phoneNumber}</p>
            </div>
        </div>
    </div>
    <#if products?size == 0>
    <#else>
    <!-- title offers -->
    <div class="title">
        <div class="container">
            <h2>Tenders</h2>
        </div>
    </div>

    <!-- Tender info -->
    <div class="container">
        <div class="offers">
            <div class="offer-head">
                <ul>
                    <li>Name</li>
                    <li>Description</li>
                    <li>Status</li>
                    <li>Price</li>
                    <li style="width: 10%">Time</li>
                </ul>
            </div>
            <#list products as product>
                <div class="offer-info">
                    <div><a href="/product/${product.id}">${product.title}</a></div>
                    <div><p>${product.littleDescription}</p></div>
                    <div><#if product.active>Active <#else> Closed</#if></div>
                    <div>${product.price}</div>
                    <div style="width: 10%">${product.timeStart} ${product.timeEnd}</div>
                </div>
                <#else>
                <h2>User don`t have any products.</h2>
            </#list>


        </div>
    </div>
    </#if>
    <#if offers?size == 0>
    <#else>
        <!-- Title -->
        <div class="title">
            <div class="container">
                <h2>Offers</h2>
            </div>
        </div>

        <!-- Offers info -->
        <div class="container">
            <div class="offers">
                <div class="offer-head">
                    <ul>
                        <li>Name</li>
                        <li>Description</li>
                        <li>File</li>
                        <li>Price</li>
                    </ul>
                </div>
                <#list offers as offer>
                    <div class="offer-info" <#if offer.status> style="box-shadow: 0 0 5px 0 rgb(16, 155, 16);"</#if>>
                        <div><a href="/user/${offer.product.user.id}">${offer.user.firstName} ${offer.user.lastName}</a></div>
                        <div><p>${offer.description}</p></div>
                        <div>price.pdf</div>
                        <div>${offer.price}</div>
                    </div>
                </#list>
            </div>
        </div>
    </#if>
</main>


<!-- Footer -->
<@templates.footer />

</body>

</html>