<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>List Categories</title>
    <link
            rel="stylesheet"
            href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.1.3/css/bootstrap.min.css"
    />
</head>
<body>
<main>
    <div class="row">
        <div class="col-md-6-offset-3">
            <header class="row text-center">
            </header>
            <section class="row">
                <div class="col mt-4">
                    <div class="card">
                        <div class="card-header">
                            <h2>List Of Category</h2>
                        </div>
                        <div class="card-body">
                            <table class="table table-striped table-inverse" id="ajaxCate">
                                <thead class="thead-inverse">
                                <tr>
                                    <th>Category ID</th>
                                    <th>Name</th>
                                    <th></th>
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
                <footer class="row"></footer>
            </section>
        </div>
    </div>
    <div class="modal fade" id="editCategory" tabindex="-1" aria-labelledby="editCategory" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">Edit Category</h5>
                    <button type="button" class="btn-close" id="closeForm" data-bs-dismiss="modal"
                            aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <form id="formEdit">
                        <div class="form-group">
                            <label for="categoryId">Id</label>
                            <input type="text" class="form-control" name="categoryId" id="categoryId">
                        </div>
                        <div class="form-group">
                            <label for="CategoryName">Name</label>
                            <input type="text" class="form-control" name="name" id="CategoryName">
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
</main>
<%@ include file="./../../commonsLink.jsp" %>
<script src="<c:url value="/js/ajaxCate.js" />"></script>

</body>
</html>