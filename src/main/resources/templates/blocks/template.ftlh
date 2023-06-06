<#macro header>
    <nav class="navbar">
        <div class="container">
            <div class="navbar-wrap">
                <a href="/" class="navbar-brand">MyTender</a>
                <ul class="navbar-menu">
                    <li><a href="/">Home</a></li>
                    <li><a href="/">Deals</a></li>
                    <li><a href="/users">Users</a></li>
                    <li><a href="#">FAQs</a></li>
                </ul>
            </div>
            <#if user.email??>
            <div class="navbar-login">
                <a href="/profile" class="nav-btn-login">Account</a>
                <#if user.isAdmin()>
                    <a href="/admin" class="nav-btn-login">Admin</a>
                </#if>
                </div>
                <#else>
                    <div class="navbar-login">
                        <a href="/login" class="nav-btn-login">Login</a>
                        <a href="/registration" class="nav-btn-registration">Registration</a>
                    </div>
            </#if>
        </div>
    </nav>
</#macro>

<#macro footer>
    <footer class="footer">
        <div class="container">
            <div class="container-footer">
                <p class="footer-text">© 2023 MyTender All rights reserved.</p>
            </div>
        </div>
    </footer>
</#macro>