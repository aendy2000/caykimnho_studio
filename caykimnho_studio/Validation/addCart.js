$(document).ready(function () {
    $('[id^="checkmaulabel-"]').on('click', function () {
        var id1 = $(this).attr('name');
        $('#valuecolor').val(id1);
        $('#checkmaulabel-' + id1).css({ "background": "#c8ab78", "color": "white" });

        var imagex = $(this).attr('data-images');
        $('#targetImages-' + imagex).click();

        bocheckmau(id1);
    });

    $('[id^="checksizelabel-"]').on('click', function () {
        var id2 = $(this).attr('name');
        $('#valuesize').val(id2);
        $('#checksizelabel-' + id2).css({ "background": "#c8ab78", "color": "white" });
        bochecksize(id2);

    });
    //Thêm vào giỏ hàng
    $('#addgiohang').on('click', function () {
        var id = $(this).attr('name');
        var idColor = $('#valuecolor').val();
        var idSize = $('#valuesize').val();
        var quantity = $('#soluongsanpham').val();
        $('#checkcolor-validation').text('').prop('hidden', true);
        $('#checksize-validation').text('').prop('hidden', true);
        var check = true;
        if (idColor.length == 0) {
            check = false;
            const Toast = Swal.mixin({
                toast: true,
                position: 'top',
                showConfirmButton: false,
                timer: 3000,
                timerProgressBar: true,
                didOpen: (toast) => {
                    toast.addEventListener('mouseenter', Swal.stopTimer)
                    toast.addEventListener('mouseleave', Swal.resumeTimer)
                }
            });

            Toast.fire({
                icon: 'error',
                title: 'Vui lòng chọn màu sắc!'
            });
        }

        if (idSize.length == 0) {
            check = false;
            const Toast = Swal.mixin({
                toast: true,
                position: 'top',
                showConfirmButton: false,
                timer: 3000,
                timerProgressBar: true,
                didOpen: (toast) => {
                    toast.addEventListener('mouseenter', Swal.stopTimer)
                    toast.addEventListener('mouseleave', Swal.resumeTimer)
                }
            });

            Toast.fire({
                icon: 'error',
                title: 'Vui lòng chọn size!'
            });
        }

        if (quantity.length == 0) {
            check = false;
            const Toast = Swal.mixin({
                toast: true,
                position: 'top',
                showConfirmButton: false,
                timer: 3000,
                timerProgressBar: true,
                didOpen: (toast) => {
                    toast.addEventListener('mouseenter', Swal.stopTimer)
                    toast.addEventListener('mouseleave', Swal.resumeTimer)
                }
            });

            Toast.fire({
                icon: 'error',
                title: 'Vui lòng nhập số lượng!'
            });
        }


        if (check == true) {
            var formData = new FormData();
            formData.append('id', id);
            formData.append('idColor', idColor);
            formData.append('idSize', idSize);
            formData.append('quantity', quantity);

            $.ajax({
                url: $('#requestPath').val() + 'home/addcart',
                data: formData,
                type: 'POST',
                dataType: 'html',
                processData: false,
                contentType: false
            }).done(function (ketqua) {
                if (ketqua == "SL") {
                    const Toast = Swal.mixin({
                        toast: true,
                        position: 'top',
                        showConfirmButton: false,
                        timer: 3000,
                        timerProgressBar: true,
                        didOpen: (toast) => {
                            toast.addEventListener('mouseenter', Swal.stopTimer)
                            toast.addEventListener('mouseleave', Swal.resumeTimer)
                        }
                    });

                    Toast.fire({
                        icon: 'warning',
                        title: 'Số lượng sản phẩm trong giỏ hàng tối đa là 100!'
                    });
                }
                else if (ketqua == "null") {
                    const Toast = Swal.mixin({
                        toast: true,
                        position: 'top',
                        showConfirmButton: false,
                        timer: 3000,
                        timerProgressBar: true,
                        didOpen: (toast) => {
                            toast.addEventListener('mouseenter', Swal.stopTimer)
                            toast.addEventListener('mouseleave', Swal.resumeTimer)
                        }
                    });

                    Toast.fire({
                        icon: 'error',
                        title: 'Lỗi, không tìm thấy sản phẩm, hãy thử tải lại trang!'
                    });
                }
                else {
                    $('#minicart').replaceWith(ketqua);
                    $('.mini_cart_close a,.body_overlay').on('click', function () {
                        $('.mini_cart,.body_overlay').removeClass('active')
                    });
                    var soluong = Number($('#giohangsoluong3').attr('name'));
                    $('#giohangsoluong').text(soluong);
                    $('#giohangsoluong2').text(soluong);

                    const Toast = Swal.mixin({
                        toast: true,
                        position: 'top',
                        showConfirmButton: false,
                        timer: 3000,
                        timerProgressBar: true,
                        didOpen: (toast) => {
                            toast.addEventListener('mouseenter', Swal.stopTimer)
                            toast.addEventListener('mouseleave', Swal.resumeTimer)
                        }
                    });

                    Toast.fire({
                        icon: 'success',
                        title: 'Đã thêm vào giỏ hàng'
                    });
                }
            });
        }
    });

    function bocheckmau(id1) {
        $('[id^="checkmaulabel-"]').each(function () {
            var ids = $(this).attr('name');
            if (ids !== id1) {
                $('#checkmaulabel-' + ids).css({ "background": "#f5ebcc", "color": "black" });
            }
        });
    }
    function bochecksize(id2) {
        $('[id^="checksizelabel-"]').each(function () {
            var ids = $(this).attr('name');
            if (ids !== id2) {
                $('#checksizelabel-' + ids).css({ "background": "#f5ebcc", "color": "black" });
            }
        });
    }
});