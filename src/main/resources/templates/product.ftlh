<!DOCTYPE html>
<html lang="en" xmlns:th="http://www.thymeleaf.org">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

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
    <link rel="stylesheet" href="/static/css/catalog-style.css">
    <link rel="stylesheet" href="/static/css/footer-style.css">
    <link rel="stylesheet" href="/static/css/header-style.css">

    <title>MyTender</title>
</head>

<body>
<#import "blocks/template.ftlh" as templates>

<!-- Header -->
<@templates.header />

<main class="main">
    <div class="container">
        <#--    Searc form-->
        <div class="search">
            <div class="search-form">
                <form action="/" role="search" method="get">
                    <input name="title" type="search">
                    <input type="submit" value="Search">
                </form>
            </div>
        </div>

        <!--		Table about product info-->
        <div class="container-info">
            <ul class="product-menu">
                <li><a href="#">Views</a></li>
                <li><a href="#">Name product</a></li>
                <li><a href="#">Price</a></li>
                <li><a href="#">Status</a></li>
                <li><a href="#">Time</a></li>
            </ul>
        </div>

        <!--		Product info-->
        <#list products as product>

            <div class="container-product">
                <div class="product-views">${product.views}</div>
                <div class="product-info">
                    <a href="/product/${product.id}">${product.title}</a>
                    <p><span style="font-weight: bold; opacity: .8">Data of create:</span> ${product.timeStart} </p>
                    <p><span style="font-weight: bold; opacity: .8">Enterprise:</span> ${product.company}</p>
                    <p><span style="font-weight: bold; opacity: .8">Little description:</span> ${product.littleDescription}</p>
                </div>
                <div class="product-price" >${product.price}</div>
                <div class="product-status"><#if product.active>Active<#else>Closed</#if></div>
                <div class="product-time">${product.timeStart}<br> to <br>${product.timeEnd}</div>
            </div>
            <#else>
                <div class="container-product">
                    <div class="product-views">0</div>
                    <div class="product-info">
                        <a href="#" style="width: 15px">Title</a>
                        <p>Data of create: today </p>
                        <p>Enterprise: none</p>
                        <p>Little description: none</p>
                    </div>
                    <div class="product-price">none</div>
                    <div class="product-status">none</div>
                    <div class="product-time">none</div>
                </div>
        </#list>

    </div>
</main>

<!-- Footer -->
<@templates.footer />

</body>

</html>


