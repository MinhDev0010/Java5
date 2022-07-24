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
    <title>List Of Product</title>
    <link
            rel="stylesheet"
            href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.1.3/css/bootstrap.min.css"
    />
</head>
<body>
<main>
    <header class="row text-center">
    </header>
    <section class="row">
        <div class="col mt-4">
            <div class="card">
                <div class="card-header">
                    <h2>List Of Product</h2>
                </div>
                <div class="card-body">
                    <table class="table table-striped table-inverse" id="productList">
                        <thead class="thead-inverse">
                        <tr>
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
        <footer class="row"></footer>
    </section>
</main>
<%@ include file="./../../commonsLink.jsp" %>
<script src="<c:url value="/js/productAjax.js"/>"></script>
</body>
</html>