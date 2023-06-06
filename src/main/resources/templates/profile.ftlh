<!DOCTYPE html>
<html lang="en" xmlns:th="http://www.thymeleaf.org">
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
    <link rel="stylesheet" href="/static/css/user-style.css">
    <link rel="stylesheet" href="/static/css/button-style.css">

</head>

<body>
<#import "blocks/template.ftlh" as templates>

<!-- Header -->
<@templates.header />

<!-- Main scope -->
<main class="main">
    <div class="container">
        <!--User`s nav menu-->
        <div class="user-nav">
            <div class="main-button">
                <ul>
                    <li><a href="#" onclick="toggleCodeProfile()">Account</a></li>
                    <li><a href="#" onclick="toggleCodeViewTender();">View my tender</a></li>
                    <li><a href="#" onclick="toggleCodeViewOffer()">View my offers</a></li>
                    <li><a href="#" onclick="toggleCodeAddTender();">Add new tender</a></li>
                    <li>
                        <form action="/logout" method="post">
                            <input type="hidden" name="_csrf" value="${_csrf.token}">
                            <input type="submit" value="Log out">
                        </form>
                    </li>
                </ul>
            </div>
        </div>

<#--        Right panel -->
        <div class="user-space">
<#--            User Info-->
            <div class="user-form" id="code-user-info" style="display:block;">
                <form action="/profile/edit" method="post" name="user">
                    <div>
                        <div>Name:</div>
                        <input type="text" name="firstName" value="${user.firstName}"></div>
                    <div>
                        <div>Last Name:</div>
                        <input type="text" name="lastName" value="${user.lastName}"></div>
                    <div>
                        <div>Email:</div>
                        <input type="text" name="email" value="${user.email}" readonly></div>
                    <div>
                        <div>Phone Number:</div>
                        <input type="text" name="phoneNumber" value="${user.phoneNumber}"></div>
                    <div>
                        <div>New password:</div>
                        <input type="password" name="password" placeholder="password"></div>
<#--                    <div>-->
<#--                        <div>Repeat:</div>-->
<#--                        <input type="password" name="password" placeholder="password"></div>-->
                    <div class="save-button">
                        <input type="hidden" name="_csrf" value="${_csrf.token}">
                        <button class="button" type="submit" style="width: 20%">Save</button>
                    </div>
                </form>
            </div>

<!--            Add new tender-->
            <div class="user-form" id="code-add-tender" style="display:none;">
                <form action="/product/create" method="post">
                    <div>
                        <div>Title:</div>
                        <input type="text" name="title"></div>
                    <div>
                        <div>Company:</div>
                        <input type="text" name="company"></div>
                    <div>
                        <div>City:</div>
                        <input type="text" name="city"></div>
                    <div>
                        <div>Start price:</div>
                        <input type="number" min="0" name="price"></div>
                    <div>
                        <div>Time start:</div>
                        <input type="date" name="timeStart" style="text-align: center"></div>
                    <div>
                        <div>Time and:</div>
                        <input type="date" name="timeEnd" style="text-align: center"></div>
                    <div>
                        <div>Little description:</div>
                        <textarea name="littleDescription" rows="3"></textarea></div>
                    <div>
                        <div>Description:</div>
                        <textarea name="description" rows="7"></textarea></div>
                    <div class="save-button">
                        <input type="hidden" name="_csrf" value="${_csrf.token}">
                        <button class="button" type="submit" style="width: 20%">Save</button>
                    </div>
                </form>
            </div>

<#--            View my tender-->
            <div class="user-form" id="code-view-tender" style="display:none;">
                <div class="user-tender">
                    <div class="tender-info">
                        <div style="width: 50%">Title</div>
                        <div style="width: 20%">Status</div>
                        <div style="width: 10%">Edit</div>
                        <div style="width: 10%">Delete</div>
                        <div style="width: 10%">Close</div>
                    </div>
                    <#list user.products as product>
                        <div class="tender">
                            <div style="width: 50%"><a href="/product/${product.id}">${product.title}</a></div>
                            <div style="width: 20%"><#if product.active>Active<#else>Closed</#if></div>
                            <div style="width: 10%">
                                <form action="/product/edit/${product.id}" method="get">
                                    <input type="hidden" name="_csrf" value="${_csrf.token}">
                                    <button class="button" type="submit">Edit</button>
                                </form>
                            </div>
                            <div style="width: 10%">
                                <form action="/product/delete/${product.id}" method="post">
                                    <input type="hidden" name="_csrf" value="${_csrf.token}">
                                    <button class="button" type="submit">Delete</button>
                                </form>
                            </div>
                            <div style="width: 10%">
                                <form action="/product/close/${product.id}" method="post">
                                    <input type="hidden" name="_csrf" value="${_csrf.token}">
                                    <button class="button" type="submit">Close</button>
                                </form>
                            </div>
                        </div>
                    </#list>
                </div>
            </div>

<#--            View my offer-->
            <div class="user-form" id="code-view-offer" style="display:none;">
                <div class="user-tender">
                    <div class="tender-info">
                        <div style="width: 30%">Title</div>
                        <div style="width: 30%">Tender</div>
                        <div style="width: 10%">File</div>
                        <div style="width: 20%">Price</div>
                        <div style="width: 10%">Delete</div>
                    </div>
                    <#list user.offers as offer>
                        <div class="tender" <#if offer.status> style="box-shadow: 0 0 5px 0 rgb(16, 155, 16);"</#if>>
                            <div style="width: 30%">${offer.title}</div>
                            <div style="width: 30%"><a href="/product/${offer.product.id}">${offer.product.title}</a></div>
                            <div style="width: 10%">price.pdf</div>
                            <div style="width: 20%">${offer.price}</div>
                            <div style="width: 10%">
                                <form action="offer/delete/${offer.id}" method="post">
                                    <input type="hidden" name="_csrf" value="${_csrf.token}">
                                    <button class="button" type="submit">Delete</button>
                                </form>
                            </div>
                        </div>
                    </#list>
                </div>
            </div>


        </div>


    </div>
</main>

<!-- Footer -->
<@templates.footer />
</body>

<script type="text/javascript">
    let codeUserInfo = document.getElementById("code-user-info");
    let codeAddTender = document.getElementById("code-add-tender");
    let codeViewTender = document.getElementById("code-view-tender");
    let codeViewOffer = document.getElementById("code-view-offer");
    function toggleCodeAddTender() {
        if (codeAddTender.style.display === "none") {
            if (codeUserInfo.style.display === "block") { codeUserInfo.style.display = "none"; }
            if (codeViewTender.style.display === "block") { codeViewTender.style.display = "none"; }
            if (codeViewOffer.style.display === "block") { codeViewOffer.style.display = "none"; }
            codeAddTender.style.display = "block";
        }
    }
    function toggleCodeProfile() {
        if (codeUserInfo.style.display === "none") {
            if (codeAddTender.style.display === "block") { codeAddTender.style.display = "none"; }
            if (codeViewTender.style.display === "block") { codeViewTender.style.display = "none"; }
            if (codeViewOffer.style.display === "block") { codeViewOffer.style.display = "none"; }
            codeUserInfo.style.display = "block";
        }
    }
    function toggleCodeViewTender() {
        if (codeViewTender.style.display === "none") {
            if (codeUserInfo.style.display === "block") { codeUserInfo.style.display = "none"; }
            if (codeAddTender.style.display === "block") { codeAddTender.style.display = "none"; }
            if (codeViewOffer.style.display === "block") { codeViewOffer.style.display = "none"; }
            codeViewTender.style.display = "block";
        }
    }
    function toggleCodeViewOffer() {
        if (codeViewOffer.style.display === "none") {
            if (codeUserInfo.style.display === "block") { codeUserInfo.style.display = "none"; }
            if (codeAddTender.style.display === "block") { codeAddTender.style.display = "none"; }
            if (codeViewTender.style.display === "block") { codeViewTender.style.display = "none"; }
            codeViewOffer.style.display = "block";
        }
    }
</script>

</html>