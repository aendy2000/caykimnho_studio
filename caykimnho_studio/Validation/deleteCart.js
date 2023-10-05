$(document).ready(function () {

    //delete product chinh
    $('[id^="xoasanphamchinh-"]').on('click', function () {
        var id = $(this).attr('name');
        var formData = new FormData();
        formData.append('id', id);
        $.ajax({
            url: $('#requestPath').val() + 'Home/removeCartMainProduct',
            data: formData,
            type: 'POST',
            dataType: 'html',
            processData: false,
            contentType: false
        }).done(function (ketqua) {
            if (ketqua == "null") {
                const Toast = Swal.mixin({
                    toast: true,
                    position: 'top',
                    showConfirmButton: false,
                    timer: 1000,
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
                $('.mini_cart,.body_overlay').removeClass('active');
                $('.mini_cart_close a,.body_overlay').on('click', function () {
                    $('.mini_cart,.body_overlay').removeClass('active');
                });
                var soluong = Number($('#giohangsoluong3').attr('name'));
                $('#giohangsoluong').text(soluong);
                $('#giohangsoluong2').text(soluong);
                $('.mini_cart,.body_overlay').addClass('active');
            }
        });

    });
    // Xóa sản phẩm con
    $('[id^="xoasanphamcon-"]').on('click', function () {
        var contents = $(this).attr('name');
        alert(contents);
        var formData = new FormData();
        formData.append('contents', contents);

        $.ajax({
            url: $('#requestPath').val() + 'Home/removeCartChildProduct',
            data: formData,
            type: 'POST',
            dataType: 'html',
            processData: false,
            contentType: false
        }).done(function (ketqua) {
            if (ketqua == "null") {
                const Toast = Swal.mixin({
                    toast: true,
                    position: 'top',
                    showConfirmButton: false,
                    timer: 1000,
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
                $('.mini_cart,.body_overlay').removeClass('active');
                $('.mini_cart_close a,.body_overlay').on('click', function () {
                    $('.mini_cart,.body_overlay').removeClass('active');
                });
                var soluong = Number($('#giohangsoluong3').attr('name'));
                $('#giohangsoluong').text(soluong);
                $('#giohangsoluong2').text(soluong);
                $('.mini_cart,.body_overlay').addClass('active');
            }
        });

    });

});