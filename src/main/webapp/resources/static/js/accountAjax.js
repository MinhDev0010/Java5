import ('https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/11.4.17/sweetalert2.all.min.js')
$(document).ready(function () {
    //add data
    $('#btnSubmit').click(function () {
        const formData = JSON.stringify($('#accountForm').serializeJSON());
        $.ajax({
            type: "Post",
            contentType: "application/json",
            url: "http://localhost:8080/acc/",
            data: formData,
            success: function (status) {
                Swal.fire(
                    'Good job!',
                    'Create is successfully',
                    'success'
                ).then(() => {
                    window.location.href = "http://localhost:8080/admin/account/";
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
    //Fill Data
    let hr = "http://localhost:8080/acc/";
    $.get(hr, function (acc) {
        $(acc).each(function (i, x) {
            let dataTbody = `<tr>
                                <td >${x.username}</td>
                                <td>${x.password}</td>    
                                <td>${x.role ? "Admin" : "Client"}</td>                         
                                <td>
                                   <button id="deleteById" HungMinhBo="${x.username}" type="button" class="btn btn-primary"><i class="fas fas-trash-alt"></i>Del</button>
                                </td>
                                <td>
                                   <button id="editByUsername" HungMinhBo="${x.username}" data-bs-toggle="modal" data-bs-target="#editAcc" type="button" class="btn btn-danger"><i class="fas fas-trash-alt"></i>Edit</button>
                                </td>
                            </tr>`
            $('#ajaxAcc tbody').append(dataTbody)
        });
    });
    //Find By Username
    $(document).on('click', '#editByUsername', function () {
        let username = $(this).attr("HungMinhBo");
        let hr = `http://localhost:8080/acc/${username}`;
        $.get(hr, function (data) {
            $(`.modal-body #username`).val(data.username);
            $(`.modal-body #password`).val(data.password);
            $(`.modal-body #role`).val(data.role);
            if (data.role) {
                $('.modal-body #roleTrue').prop('checked', true);
            } else {
                $('.modal-body #roleFalse').prop('checked', true);
            }
        })

    })
    //Update Data
    $(document).on('click', '#editBtn', function () {
        let dataForm = JSON.stringify($('#formEdit').serializeJSON());
        console.log(dataForm)
        $.ajax({
            type: "Put",
            contentType: "application/json",
            url: "http://localhost:8080/acc/",
            data: dataForm,
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
    })
    //Login
    $(document).on('click', '#BtnLogin', function () {
            let data = JSON.stringify($('#LoginForm').serializeJSON());
            let href = `http://localhost:8080/acc/login?username=${$('#username').val()}&password=${$('#password').val()}`;
            $.ajax({
                type: 'Post',
                contentType: 'application/json',
                url: href,
                success: function () {
                    Swal.fire(
                        'Good job!',
                        'Login is successfully',
                        'success'
                    ).then(() => {
                        window.location.href = "http://localhost:8080/admin/account/isLogin";
                    })
                },
                error: function (error) {
                    Swal.fire(
                        'ERROR',
                        `Username or password is not valid!! ${error}`,
                        'error'
                    ).then(() => {
                        window.location.reload();
                    });
                }
            })
        }
    )
    //Delete 
    $(document).on('click', '#deleteById', function () {
        let username = $(this).attr("HungMinhBo");
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
                    type: "DELETE",
                    contentType: "application/json",
                    url: `http://localhost:8080/acc/${username}`,
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
})