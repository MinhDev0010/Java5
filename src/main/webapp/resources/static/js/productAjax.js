import ('https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/11.4.17/sweetalert2.all.min.js')
$(document).ready(function () {
    //listCateGory
    let hr = "http://localhost:8080/pro/findAllCate"
    $.get(hr, function (cate) {
        let data;
        let list = [];
        $(cate).each(function (index, saveId) {
            data = `<option value="${saveId.categoryId}">${saveId.name}</option>`;
            list.push(data);
            console.log(list);
        })
        let dataBody = ` <select class="form-control" name="categoryId" id="categoryId" value = "${cate[0].categoyId}">
                                        ${list}
                                    </select>`

        $('#categoryName').append(dataBody);
    })
//Add data
    let href = "http://localhost:8080/pro/";
    $('#BtnSave').click(function () {
        const dataForm = JSON.stringify($('#AddFormProduct').serializeJSON());
        let d = JSON.parse(dataForm);
        // {"productId":"","name":"dsf","quantity":"45","unitPrice":"46542","categoryId":"4","discount":"4","status":"1","description":"das"}
        const product = {
            name: d.name,
            quantity: d.quantity,
            unitPrice: d.unitPrice,
            description: d.description,
            discount: d.discount,
            enteredDate: new Date(),
            status: d.status,
            category: {
                categoryId: d.categoryId
            }
        }
        $.ajax({
            type: 'Post',
            contentType: 'application/json',
            url: href,
            data: JSON.stringify(product),
            success: function (e) {
                updateImageFile(e.productId);
            }
        })
    });

//ok
    function updateImageFile(id) {
        let formData = new FormData();
        let nameFile = $('#image').prop('files');
        formData.append('multipart', nameFile[0]);
        formData.append('id', id);
        $.ajax({
            type: 'PUT',
            enctype: 'multipart/form-data',
            url: 'http://localhost:8080/pro/saveImage',
            data: formData,
            processData: false,
            contentType: false,
            success: function () {
                Swal.fire(
                    'Good Job',
                    'Product is saved!',
                    'success'
                )
                window.location.reload();
            },
            error: function (e) {
                alert(e);
            }
        })
    }

    let hre = "http://localhost:8080/pro/"
    $.get(hre, function (pro) {
        $(pro).each(function (i, x) {
            let dataBody = ` <tr>
                            <td>${x.name}</td>
                            <td>${x.quantity}</td>
                            <td>${x.unitPrice}</td>
                            <td>${x.discount}</td>
                            <td>${x.status}</td>
                            <td>${x.category.name}</td>
                            <td>
                                   <button id="deleteById" productId="${x.productId}" type="button" class="btn btn-primary"><i class="fas fas-trash-alt"></i>Del</button>
                                </td>
                                <td>
                                   <button  data-bs-toggle="modal" data-bs-target=#editProduct" type="button" class="btn btn-danger"><i class="fas fas-trash-alt"></i>Edit</button>
                                </td>
                        </tr>`
            $('#productList tbody').append((dataBody))
        })
    })
    $(document).on('click', '#deleteById', function () {
        let id = $(this).attr("productId");
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
                    url: `http://localhost:8080/pro/${id}`,
                    success: function () {
                        Swal.fire(
                            'Deleted!',
                            'Your file has been deleted.',
                            'success'
                        )
                    }
                });
                window.location.reload();
            }
        })
    });
})
