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
    <link
            rel="stylesheet"
            href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.1.3/css/bootstrap.min.css"
    />
    <title>Product</title>
</head>
<body>
<main class="container">
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
                            <a class="nav-link" href="/admin/account/register" style="color: black"
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
    <section class="row">

        <ul class="nav nav-tabs" id="myTab" role="tablist">
            <li class="nav-item" role="presentation">
                <button class="nav-link active" id="home-tab" data-bs-toggle="tab" data-bs-target="#home" type="button"
                        role="tab" aria-controls="home" aria-selected="true">Add Product
                </button>
            </li>
            <li class="nav-item" role="presentation">
                <button class="nav-link" id="profile-tab" data-bs-toggle="tab" data-bs-target="#profile" type="button"
                        role="tab" aria-controls="profile" aria-selected="false">List Of Product
                </button>
            </li>
        </ul>
        <div class="tab-content" id="myTabContent">
            <div class="tab-pane fade show active" id="home" role="tabpanel" aria-labelledby="home-tab">
                <div class="col mt-4">
                    <form id="AddFormProduct" method="post" enctype="multipart/form-data">
                        <div class="card">
                            <div class="card-header" style="text-align: center; background-color: white;">
                                <img src="https://cdn2.iconfinder.com/data/icons/ecommerce-solid-version/32/add_product_new_product_item_ecommerceproduct--512.png"
                                     width="40px" alt="Polyshop">
                                <h3><b>ADD PRODUCT</b></h3>
                            </div>
                            <div class="card-body">
                                <div class="row">
                                    <div class="col-7">
                                        <div class="form-group">
                                            <label for="productId">Product ID:</label>
                                            <input type="text" class="form-control" name="productId" id="productId">
                                        </div>

                                        <div class="form-group">
                                            <label for="name">Name</label>
                                            <input type="text" class="form-control" name="name" id="name">
                                        </div>

                                        <div class="form-group">
                                            <label for="quantity">Quantity</label>
                                            <input type="text" class="form-control" name="quantity" id="quantity">
                                        </div>

                                        <div class="input-group form-group">
                                            <span class="input-group-text">Unit Price</span>
                                            <input type="number" class="form-control" name="unitPrice" id="unitPrice">
                                            <span class="input-group-text">$</span>
                                        </div>


                                        <div class="form-group" id="categoryName">
                                            <label for="categoryId">Category</label>

                                        </div>
                                    </div>
                                    <div class="col-3">
                                        <img src="https://th.bing.com/th/id/OIP.gs8AqQ1CcdJchWDMkdLMmgHaEQ?w=301&h=180&c=7&r=0&o=5&dpr=1.25&pid=1.7"
                                             width="90%"
                                             class="img-fluid"
                                             alt="">
                                        <div class="form-group">
                                            <label for="image">Image File</label>
                                            <input type="file" class="form-control-file" name="image"
                                                   accept="image/png,image/jpeg"
                                                   id="image" placeholder="" aria-describedby="image">
                                        </div>
                                        <div class="input-group form-group">
                                            <span class="input-group-text">Discount</span>
                                            <input type="number" class="form-control" name="discount" id="discount"
                                                   placeholder="">
                                            <span class="input-group-text">%</span>
                                        </div>
                                        <div class="form-group">
                                            <label for="status">Status</label>
                                            <select class="form-control" name="status" id="status">
                                                <option>0</option>
                                                <option>1</option>
                                            </select>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col">
                                    <div class="form-group">
                                        <label for="description">Description</label>
                                        <textarea class="form-control" name="description" id="description"
                                                  rows="7"></textarea>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="card-footer text-muted">
                            <button type="reset" class="btn btn-success">New</button>
                            <button type="button" id="BtnSave" class="btn btn-primary">Save</button>

                        </div>
                    </form>
                </div>
            </div>
            <div class="tab-pane fade" id="profile" role="tabpanel" aria-labelledby="profile-tab">
                <div class="col mt-4">
                    <div class="card">
                        <div class="card-header">
                            <h2>List Of Product</h2>
                        </div>
                        <div class="card-body">
                            <table class="table table-striped table-inverse" id="productList">
                                <thead class="thead-inverse">
                                <tr>
                                    <th>image</th>
                                    <th>Name</th>
                                    <th>Quantity</th>
                                    <th>Unit Price</th>
                                    <th>Discount</th>
                                    <th>Status</th>
                                    <th>Category</th>
                                    <th></th>
                                </tr>
                                </thead>
                                <tbody>

                                </tbody>
                            </table>
                        </div>
                        <div class="card-footer text-muted">
                            <form action="" method="get">
                                <div class="form-inline form-group">
                                    <label for="">Page Size</label>
                                    <select class="form-control" name="" id="">
                                        <option>5</option>
                                        <option>10</option>
                                        <option>20</option>
                                        <option>30</option>
                                    </select>
                                </div>
                            </form>
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
    </section>
</main>
<%@ include file="./../../commonsLink.jsp" %>
<script src=" <c:url value="/js/productAjax.js"/>"
></script>
</body>
</html>
