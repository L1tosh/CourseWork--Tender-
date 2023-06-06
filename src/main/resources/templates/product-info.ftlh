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
    <link rel="stylesheet" href="/static/css/button-style.css">

</head>

<body>
<#import "blocks/template.ftlh" as templates>

<!-- Header -->
<@templates.header />

<!-- Main holder -->
<main class="main">

    <!-- Tender info -->
    <div class="container">
        <div class="user">
            <div class="avatar">
                <img src="/static/images/avatar.png" alt="avatar">
            </div>
            <div class="user-info">
                <p><b>User name:</b> <a class="name"
                                        href="/user/${product.user.id}">${product.user.firstName} ${product.user.lastName}</a>
                </p>
                <p><b>Email:</b> ${product.user.email}</p>
                <p><b>Phone number:</b> ${product.user.phoneNumber}</p>
                <p><b>Company:</b> ${product.company}</p>
                <p><b>City:</b> ${product.city}</p>
                <p><b>Time:</b> ${product.timeStart} to ${product.timeEnd}</p>
            </div>
        </div>
        <div class="product-info">
            <p>${product.title}</p>
            <p>Price: ${product.price} $</p>
            <p>${product.description}</p>
        </div>
        <#if product.active>
            <div class="add-offer">
                <button class="button" onclick="toggleCodeAdd()" style="width: 20%">Add offer</button>
            </div>
        </#if>
    </div>
    <div id="code-add-offer" style="display:none;">
        <!--    Title offers -->
        <div class="title">
            <div class="container">
                <h2>Add offer</h2>
            </div>
        </div>

        <!--    Add Offer-->
        <div class="container" >
            <div class="offer-space">
                <div class="offer-form">
                    <form action="/${product.id}/offer/add" method="post" name="offer">
                        <div>
                            <div>Title:</div>
                            <input type="text" name="title"></div>
                        <div>
                            <div>Price:</div>
                            <input type="number" min="0" max="${product.price}" name="price"></div>
                        <div>
                            <div>Description:</div>
                            <textarea name="description" rows="7"></textarea></div>
                        <div class="save-button" style="justify-content: right">
                            <input type="hidden" name="_csrf" value="${_csrf.token}">
                            <button class="button" type="submit" style="width: 20%">Save</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
    <#if product.offers?size == 0>
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
            <#list product.offers as offer>
                <div class="offer-info" <#if offer.status> style="box-shadow: 0 0 5px 0 rgb(16, 155, 16);"</#if>>
                    <div><a href="/user/${product.user.id}">${offer.user.firstName} ${offer.user.lastName}</a></div>
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

<script type="text/javascript">
    let codeAddOffer = document.getElementById("code-add-offer");

    function toggleCodeAdd() {
        if (codeAddOffer.style.display === "none") {
            codeAddOffer.style.display = "block";
        } else {
            codeAddOffer.style.display = "none"
        }
    }
</script>

</html>