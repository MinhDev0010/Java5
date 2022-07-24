<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Login</title>
    <link
            rel="stylesheet"
            href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.1.3/css/bootstrap.min.css"
    />
    <link rel="stylesheet" href="<c:url value="/bootstrap/all.min.css"/>">
    <link rel="stylesheet" href="<c:url value="/bootstrap/bootstrap.min.css"/>">
    <link rel="stylesheet" href="<c:url value="/css/login.css"/>">

</head>
<body>

<div class="container">
    <div class="row">
        <div class="col-sm-9 col-md-7 col-lg-5 mx-auto">
            <div class="card border-0 shadow rounded-3 my-5">
                <div class="card-body p-4 p-sm-5">
                    <h5 class="card-title text-center mb-5 fw-light fs-5">Sign In</h5>
                    <form id="LoginForm" method="post">
                        <div class="form-floating mb-3">
                            <input type="text" class="form-control" id="username" placeholder="Username">
                            <label for="username">Username</label>
                        </div>
                        <div class="form-floating mb-3">
                            <input type="password" class="form-control" id="password" placeholder="password">
                            <label for="password">Password</label>
                        </div>

                        <div class="form-check mb-3">
                            <input class="form-check-input" type="checkbox" value="" id="rememberPasswordCheck">
                            <label class="form-check-label" for="rememberPasswordCheck">
                                Remember me
                            </label>
                        </div>
                        <div class="d-grid">
                            <button class="btn btn-primary btn-login text-uppercase fw-bold" id="BtnLogin"
                                    type="button">Sign
                                in
                            </button>
                        </div>
                        <hr class="my-4">
                        <div class="d-grid mb-2">
                            <button class="btn btn-google btn-login text-uppercase fw-bold" type="submit">
                                <i class="fab fa-google me-2"></i> Sign in with Google
                            </button>
                        </div>
                        <div class="d-grid">
                            <button class="btn btn-facebook btn-login text-uppercase fw-bold" type="submit">
                                <i class="fab fa-facebook-f me-2"></i> Sign in with Facebook
                            </button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
<%@ include file="./../../commonsLink.jsp" %>
<script src="<c:url value="/js/accountAjax.js"/>"></script>
<script src="<c:url value="/bootstrap/bootstrap.bundle.min.js"/>"></script>
</body>
</html>