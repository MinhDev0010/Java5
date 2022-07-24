<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Document</title>
    <link
            rel="stylesheet"
            href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.1.3/css/bootstrap.min.css"
    />
</head>
<body>
<header class="row text-center">
    <div class="col">
        <nav class="navbar navbar-expand-sm navbar-light bg-light">
            <a class="navbar-brand" href=""
            ><img src="https://afdevinfo.com/wp-content/uploads/2018/01/logo.jpg" width="100px" class="img-fluid"
                  alt=""
            /></a>
            <button
                    class="navbar-toggler d-lg-none"
                    type="button"
                    data-toggle="collapse"
                    data-target="#collapsibleNavId"
                    aria-controls="collapsibleNavId"
                    aria-expanded="false"
                    aria-label="Toggle navigation"
            >
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="collapsibleNavId">
                <ul class="navbar-nav mr-auto mt-2 mt-lg-0">
                    <li class="nav-item active"></li>
                    <li class="nav-item">
                        <a class="nav-link" href="/admin/accounts/register" style="color: black"
                        ><b>Thêm người dùng</b></a
                        >
                    </li>
                    <li class="nav-item">
                        <a
                                class="nav-link"
                                style="color: black"
                                href="/admin/categories/add"
                        ><b>Quản lý loại hàng</b></a
                        >
                    </li>
                    <li class="nav-item">
                        <a
                                class="nav-link"
                                style="color: black"
                                href="/admin/product/add"
                        ><b>Quản lý sản phẩm</b></a
                        >
                    </li>
                </ul>
                <form class="form-inline my-2 my-lg-0">
                    <a class="nav-link" style="color: black" href="/admin/account/login"
                    ><b>Đăng xuất</b></a
                    >
                </form>
            </div>
        </nav>
    </div>
</header>
<section>
    <div class="row">
        <div class="col-md-6 offset-md-3">
            <ul class="nav nav-tabs" id="myTab" role="tablist">
                <li class="nav-item" role="presentation">
                    <button class="nav-link active" id="home-tab" data-bs-toggle="tab" data-bs-target="#home"
                            type="button" role="tab" aria-controls="home" aria-selected="true">Add Account
                    </button>
                </li>
                <li class="nav-item" role="presentation">
                    <button class="nav-link" id="profile-tab" data-bs-toggle="tab" data-bs-target="#profile"
                            type="button" role="tab" aria-controls="profile" aria-selected="false">Profile
                    </button>
                </li>
            </ul>
            <div class="tab-content" id="myTabContent">
                <div class="tab-pane fade show active" id="home" role="tabpanel" aria-labelledby="home-tab">
                    <form id="accountForm" method="post">
                        <div class="card">
                            <div class="card-header">
                                <h2>Add Account</h2>
                            </div>
                            <div class="card-body">
                                <div class="form-group">
                                    <label>User name:</label>
                                    <input type="text" class="form-control" name="username"/>
                                </div>

                                <div class="form-group">
                                    <label>Pass:</label>
                                    <input type="password" class="form-control" name="password"/>
                                </div>
                                <div class="form-check form-check-inline">
                                    <label class="form-check-label">
                                        <input class="form-check-input m-1" type="radio" name="role" value="true"
                                               checked> Admin
                                    </label>
                                    <label class="form-check-label">
                                        <input class="form-check-input m-1" type="radio" name="role" value="false">
                                        Client
                                    </label>
                                </div>
                            </div>
                            <div class="card-footer text-muted">
                                <button type="reset" class="btn btn-secondary">Reset</button>
                                <button type="button" id="btnSubmit" class="btn btn-primary"><i
                                        class="fas fa-save"></i> Save
                                </button>
                            </div>
                        </div>
                    </form>
                </div>
                <div class="tab-pane fade" id="profile" role="tabpanel" aria-labelledby="profile-tab">
                    <div class="col mt-4">
                        <div class="card">
                            <div class="card-header">
                                <h2>List Of Account</h2>
                            </div>
                            <div class="card-body">
                                <table class="table table-striped table-inverse" id="ajaxAcc">
                                    <thead class="thead-inverse">
                                    <tr>
                                        <th>Username</th>
                                        <th>Password</th>
                                        <th>Role</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    </tbody>
                                </table>
                            </div>
                            <div class="card-footer text-muted">
                                <nav aria-label="Page navigation">
                                    <ul class="pagination justify-content-center">
                                        <li class="page-item disabled">
                                            <a class="page-link" href="#" aria-label="Previous">
                                                <span aria-hidden="true">&laquo;</span>
                                                <span class="sr-only">Previous</span>
                                            </a>
                                        </li>
                                        <li class="page-item active"><a class="page-link" href="#">1</a></li>
                                        <li class="page-item"><a class="page-link" href="#">2</a></li>
                                        <li class="page-item">
                                            <a class="page-link" href="#" aria-label="Next">
                                                <span aria-hidden="true">&raquo;</span>
                                                <span class="sr-only">Next</span>
                                            </a>
                                        </li>
                                    </ul>
                                </nav>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<div class="modal fade" id="editAcc" tabindex="-1" aria-labelledby="editAcc" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Edit Account</h5>
                <button type="button" class="btn-close" id="closeForm" data-bs-dismiss="modal"
                        aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <form id="formEdit">
                    <div class="form-group">
                        <label for="username">Username</label>
                        <input type="text" class="form-control" name="username" id="username">
                    </div>
                    <div class="form-group">
                        <label for="password">Password</label>
                        <input type="text" class="form-control" name="password" id="password">
                    </div>
                    <div class="form-check form-check-inline">
                        <label class="form-check-label">
                            <input class="form-check-input m-1" type="radio" id="roleTrue" name="role" value="true">
                            Admin
                        </label>
                        <label class="form-check-label">
                            <input class="form-check-input m-1" id="roleFalse" type="radio" name="role" value="false">
                            Client
                        </label>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                <button type="button" id="editBtn" class="btn btn-primary">Save changes</button>
            </div>
        </div>
    </div>
</div>
<%@include file="./../../commonsLink.jsp" %>
<script src="<c:url value="/js/accountAjax.js"/>">
</script>
</body>
</html>