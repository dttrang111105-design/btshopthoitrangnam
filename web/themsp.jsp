
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>

<head>

    <meta charset="UTF-8">

    <title>Thêm sản phẩm</title>

    <link rel="stylesheet" href="css/css/bootstrap.min.css"/>
    <link rel="stylesheet" href="trangchu.css"/>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css" rel="stylesheet"/>

    <style>

        body{
            background:#f5f6fa;
        }
        .box-admin{
            background:white;
            padding:35px;
            border-radius:22px;
            box-shadow:0 10px 30px rgba(0,0,0,.08);
            border:1px solid #eee;
            margin-bottom:50px;
        }
        .title-page{
            font-weight:700;
            color:#333;
            position:relative;
            display:inline-block;
            margin-bottom:35px;
        }
        .title-page::after{
            content:'';
            position:absolute;
            bottom:-10px;
            left:0;
            width:50px;
            height:3px;
            background:#8b4513;
        }
        .preview-box{
            width:100%;
            height:320px;
            border-radius:18px;
            overflow:hidden;
            background:#f8f9fa;
            border:2px dashed #ddd;
            display:flex;
            align-items:center;
            justify-content:center;
            margin-bottom:25px;
        }
        .preview-box img{
            width:100%;
            height:100%;
            object-fit:cover;
        }
        .preview-placeholder{
            color:#999;
            text-align:center;
        }
        .preview-placeholder i{
            font-size:48px;
            margin-bottom:10px;
        }
        .form-label{
            font-weight:600;
            color:#444;
        }
        .form-control{
            border-radius:14px;
            padding:12px 14px;
            border:1px solid #ddd;
            transition:.3s;
        }
        .form-control:focus{
            border-color:#8b4513;
            box-shadow:0 0 0 .15rem rgba(139,69,19,.15);
        }
        textarea.form-control{
            min-height:120px;
            resize:none;
        }
        .btn-save{
            background:#111827;
            color:white;
            border:none;
            border-radius:14px;
            padding:12px 28px;
            font-weight:600;
            transition:.3s;
        }
        .btn-save:hover{
            background:#8b4513;
            color:white;
        }
        .btn-back{
            border-radius:14px;
            padding:12px 24px;
            font-weight:600;
        }
    </style>
</head>

<body>
    <!-- NAVBAR -->
    <nav class="navbar navbar-expand-lg navbar-dark sticky-top">
        <div class="container-fluid">
            <a class="navbar-brand fw-bold" href="Admin">
                NTN ADMIN
            </a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#adminNav">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="adminNav">
                <!-- LEFT -->
                <ul class="navbar-nav me-auto">
                    <li class="nav-item">
                        <a class="nav-link" href="Admin">
                            <i class="fa fa-home"></i>
                            Trang chủ
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link active" href="quanlysanpham">
                            <i class="fa fa-box"></i>
                            Sản phẩm
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="quanlyuser">
                            <i class="fa fa-users"></i>
                            Người dùng
                        </a>
                    </li>
                </ul>
                <!-- RIGHT -->
                <div class="d-flex align-items-center">
                    <span class="text-white me-3">
                        <i class="fa fa-user-shield"></i>
                        ADMIN
                    </span>
                    <a href="dangxuat" class="btn btn-danger rounded-pill px-4">
                        <i class="fa fa-right-from-bracket"></i>
                        Đăng xuất
                    </a>
                </div>
            </div>
        </div>
    </nav>
    <!-- CONTENT -->
    <div class="container mt-5">
        <div class="box-admin">
            <h3 class="title-page">
                THÊM SẢN PHẨM
            </h3>
            <form action="themsp" method="post">
                <div class="row">
                    <!-- LEFT -->
                    <div class="col-lg-4">
                        <div class="preview-box">
                            <img id="previewImg" style="display:none;">
                            <div class="preview-placeholder" id="previewPlaceholder">
                                <i class="fa fa-image"></i>
                                <div>
                                    Preview ảnh sản phẩm
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- RIGHT -->
                    <div class="col-lg-8">
                        <div class="mb-3">
                            <label class="form-label">
                                Tên sản phẩm
                            </label>
                            <input type="text" name="name" class="form-control" required>
                        </div>
                        <div class="row">
                            <div class="col-md-6 mb-3">
                                <label class="form-label">
                                    Giá
                                </label>
                                <input type="number" name="price" class="form-control" required>
                            </div>
                            <div class="col-md-6 mb-3">
                                <label class="form-label">
                                    Tồn kho
                                </label>
                                <input type="number" name="stock" class="form-control" required>
                            </div>
                        </div>
                        <div class="mb-3">
                            <label class="form-label">
                                Link ảnh
                            </label>
                            <input type="text" name="image"control" id="imgInput" required>

                        </div>
                        <div class="row">
                            <div class="col-md-6 mb-3">
                                <label class="form-label">
                                    Danh mục
                                </label>
                                <input type="text" name="category" class="form-control">
                            </div>
                            <div class="col-md-6 mb-3">
                                <label class="form-label">
                                    Type
                                </label>
                                <input type="text" name="type" class="form-control">
                            </div>
                        </div>
                        <div class="mb-4">
                            <label class="form-label">
                                Mô tả
                            </label>
                            <textarea name="desc" class="form-control"></textarea>
                        </div>
                        <div class="d-flex gap-3">
                            <a href="quanlysanpham" class="btn btn-outline-dark btn-back">
                                <i class="fa fa-arrow-left"></i>
                                Quay lại
                            </a>
                            <button type="submit" class="btn-save">
                                <i class="fa fa-plus"></i>
                                Thêm sản phẩm
                            </button>
                        </div>
                    </div>
                </div>
            </form>
        </div>
    </div>
    <!-- FOOTER -->
    <div class="bg-dark text-white text-center p-3 mt-4">
        <p>Đàm Thu Trang - 11/11/2005</p>
        <p>Nguyễn Tiến Nam - 21/12/2005</p>
        <p>Phạm Doãn Nguyên - 25/04/2005</p>
    </div>
    <script>
        const imgInput = document.getElementById("imgInput");
        const previewImg = document.getElementById("previewImg");
        const previewPlaceholder = document.getElementById("previewPlaceholder");
        imgInput.addEventListener("input", () => {
            const value = imgInput.value.trim();
            if(value !== ""){
                previewImg.src = value;
                previewImg.style.display = "block";
                previewPlaceholder.style.display = "none";
            }else{
                previewImg.style.display = "none";
                previewPlaceholder.style.display = "block";
            }
        });
    </script>
</body>
</html>