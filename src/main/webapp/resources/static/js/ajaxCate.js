import ('https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/11.4.17/sweetalert2.all.min.js')
$(document).ready(function () {
    //Add data
    $('#btnSubmit').click(function () {
        const dataForm = JSON.stringify($('#cateGory').serializeJSON());
        $.ajax({
            type: "POST",
            contentType: "application/json",
            url: "http://localhost:8080/cate/",
            data: dataForm,
            success: function (status) {
                Swal.fire(
                    'Good job!',
                    'Create is successfully',
                    'success'
                ).then(() => {
                    window.location.reload();
                })
            },
            error: function (error) {
                Swal.fire(
                    'ERROR',
                    `Create is failed!! ${error}`,
                    'error'
                ).then();
            }
        });
    });
//Delete
    $(document).on('click', '#deleteById', function () {
        let id = $(this).attr("categoryId");
        Swal.fire({
            title: 'Are you sure?',
            text: "You won't be able to revert this!",
            icon: 'warning',
            showCancelButton: true,
            confirmButtonColor: '#3085d6',
            cancelButtonColor: '#d33',
            confirmButtonText: 'Yes, delete it!'
        }).then((result) => {
            if (result.isConfirmed) {
                $.ajax({
                    type: "Delete",
                    contentType: "application/json",
                    url: `http://localhost:8080/cate/${id}`,
                    success: function () {
                        Swal.fire(
                            'Deleted!',
                            'Your file has been deleted.',
                            'success'
                        )
                        window.location.reload();
                    }
                });
            }
        })
    });
    //Fill Data
    let href = "http://localhost:8080/cate/";
    $.get(href, function (cate) {
        $(cate).each(function (i, x) {
            let dataTbody = `<tr>
                                <td >${x.categoryId}</td>
                                <td>${x.name}</td>                             
                                <td>
                                   <button id="deleteById" categoryId="${x.categoryId}" type="button" class="btn btn-primary"><i class="fas fas-trash-alt"></i>Del</button>
                                </td>
                                <td>
                                   <button id="editById" categoryId="${x.categoryId}" data-bs-toggle="modal" data-bs-target="#editCategory" type="button" class="btn btn-danger"><i class="fas fas-trash-alt"></i>Edit</button>
                                </td>
                            </tr>`
            $('#ajaxCate tbody').append(dataTbody)
        });
    });

//Update data
    $(document).on('click', '#editBtn', function () {
            let form = JSON.stringify($('#formEdit').serializeJSON());
            $.ajax({
                type: "Put",
                contentType: "application/json",
                url: "http://localhost:8080/cate/",
                data: form,
                success: function () {
                    Swal.fire(
                        'Good job!',
                        'Update is successfully',
                        'success'
                    ).then(() => {
                        $('#closeForm').click();
                        window.location.reload();
                    })
                },
                error: function (e) {
                    Swal.fire(
                        'ERROR',
                        `Update is failed!! ${e}`,
                        'error'
                    ).then();
                }
            });
        }
    );
    $(document).on('click', '#editById', function () {
        let id = $(this).attr("categoryId");
        let hr = `http://localhost:8080/cate/${id}`;
        $.get(hr, function (data) {
            $('.modal-body #categoryId').val(data.categoryId);
            $('.modal-body #CategoryName').val(data.name);
        })
    });
})