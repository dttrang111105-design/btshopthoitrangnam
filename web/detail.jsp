<%-- 
    Document   : detail
    Created on : Apr 16, 2026, 10:07:05 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Chi tiết sản phẩm - ${detail.name}</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    
    <style>
    body { background-color: #f0f2f5; font-family: 'Segoe UI', Arial, sans-serif; color: #333; }
    
    /* Container chính */
    .product-card {
        background: #fff;
        margin-top: 20px;
        padding: 30px;
        border-radius: 8px;
        box-shadow: 0 2px 10px rgba(0,0,0,0.08); /* Đổ bóng nhẹ nhàng */
    }

    /* Hiệu ứng ảnh */
    .img-wrapper {
        overflow: hidden;
        border-radius: 4px;
        border: 1px solid #eaeaea;
    }
    .product-img {
        width: 100%;
        transition: 0.5s;
    }
    .img-wrapper:hover .product-img {
        transform: scale(1.05);
    }

    /* Tên sản phẩm */
    .product-name {
        font-size: 28px;
        font-weight: 600;
        margin-bottom: 15px;
        color: #1a1a1a;
    }

    /* Khung giá: ĐỔI SANG MÀU XANH */
    .price-container {
        background: #f8faff;
        padding: 20px;
        border-radius: 4px;
        margin: 20px 0;
        border: 1px solid #e1e8f5;
    }
    .current-price {
        color: #0056b3; /* Màu xanh dương đẳng cấp */
        font-size: 40px;
        font-weight: bold;
    }

    /* Nút bấm: ĐỔI SANG TÔNG XANH */
    .btn-custom {
        height: 50px;
        font-weight: 500;
        border-radius: 4px;
        transition: 0.2s;
        display: inline-flex;
        align-items: center;
        justify-content: center;
        min-width: 200px;
    }
    
    .btn-add-to-cart {
        background: rgba(0, 86, 179, 0.05); /* Xanh nhạt */
        color: #0056b3;
        border: 1px solid #0056b3;
    }
    .btn-add-to-cart:hover {
        background: rgba(0, 86, 179, 0.1);
        transform: translateY(-2px);
    }

    .btn-buy-now {
        background: linear-gradient(180deg, #007bff, #0056b3); /* Xanh gradient */
        color: #fff;
        border: none;
        box-shadow: 0 2px 5px rgba(0, 86, 179, 0.3);
    }
    .btn-buy-now:hover {
        opacity: 0.9;
        transform: translateY(-2px);
        color: #fff;
    }

    /* Các phần bổ sung cho trang dài ra */
    .info-section {
        background: #fff;
        margin-top: 25px;
        padding: 30px;
        border-radius: 8px;
        box-shadow: 0 2px 10px rgba(0,0,0,0.05);
    }
    .section-header {
        background: #fdfdfd;
        padding: 15px;
        font-weight: bold;
        border-left: 5px solid #0056b3; /* Vạch xanh bên trái */
        margin-bottom: 25px;
        font-size: 20px;
        text-transform: uppercase;
        color: #1a1a1a;
    }
    
    /* Phần chi tiết thông số */
    .spec-table { width: 100%; }
    .spec-table td { padding: 12px 15px; border-bottom: 1px solid #eee; }
    .spec-label { color: #757575; width: 30%; }
    .spec-value { color: #333; font-weight: 500; }
</style>
</head>
<body>
    <div class="container pb-5">
    <div class="row product-card shadow-sm">
        <div class="col-md-5">
            <div class="img-wrapper">
                <img src="images/${detail.image}" class="product-img" onerror="this.src='${detail.image}';">
            </div>
        </div>
        
        <div class="col-md-7">
            <nav aria-label="breadcrumb">
                <ol class="breadcrumb" style="background: none; padding: 0;">
                    <li class="breadcrumb-item"><a href="trangchu" style="color: #0056b3;">Trang chủ</a></li>
                    <li class="breadcrumb-item active" aria-current="page">${detail.name}</li>
                </ol>
            </nav>
            
            <h1 class="product-name">${detail.name}</h1>
            <div class="price-container">
                <span class="current-price">₫${detail.price}</span>
            </div>
            
            <div style="color: #666; margin-bottom: 20px;">
                <p><i class="fas fa-truck mr-2"></i> Giao hàng nhanh toàn quốc</p>
                <p><i class="fas fa-check-circle mr-2"></i> Cam kết hàng chính hãng 100%</p>
            </div>
            
            <div class="mt-4">
                <button class="btn btn-custom btn-add-to-cart">
                    <i class="fas fa-cart-plus mr-2"></i> Thêm Vào Giỏ Hàng
                </button>
                <button class="btn btn-custom btn-buy-now ml-3">Mua Ngay</button>
            </div>
        </div>
    </div>

    <div class="info-section">
        <div class="section-header">Chi tiết sản phẩm</div>
        <table class="spec-table">
            <tr>
                <td class="spec-label">Danh mục</td>
                <td class="spec-value text-primary">Thời Trang Nam > Áo > Áo Nỉ</td>
            </tr>
            <tr>
                <td class="spec-label">Thương hiệu</td>
                <td class="spec-value">Hàng VNXK</td>
            </tr>
            <tr>
                <td class="spec-label">Chất liệu</td>
                <td class="spec-value">Nỉ tăm cao cấp, co giãn nhẹ</td>
            </tr>
            <tr>
                <td class="spec-label">Gửi từ</td>
                <td class="spec-value">Hà Nội</td>
            </tr>
        </table>
    </div>

    <div class="info-section">
        <div class="section-header">Mô tả sản phẩm</div>
        <div style="white-space: pre-line; line-height: 1.8; color: #555; padding: 0 10px;">
            ${detail.desc}
        </div>
    </div>
</div>
</body>
</html>
