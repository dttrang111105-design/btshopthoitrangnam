<%@page import="model.ThongKe"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>

        <meta charset="UTF-8">

        <title>Thống kê doanh thu</title>

        <link href="css/css/bootstrap.min.css" rel="stylesheet">
        <link href="trangchu.css" rel="stylesheet">
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css" rel="stylesheet"/>
        <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>

        <style>
            body{
                background:#f5f5f5;
            }
            .dashboard-title{
                font-size:35px;
                font-weight:bold;
                color:#8b4513;
                margin-bottom:30px;
            }
            .card-box{
                background:white;
                border-radius:20px;
                padding:25px;
                box-shadow:0 5px 15px rgba(0,0,0,0.1);
                margin-bottom:30px;
                transition:0.3s;
            }
            .card-box:hover{
                transform:translateY(-5px);
            }
            .card-title{
                font-size:20px;
                font-weight:bold;
                margin-bottom:15px;
                color:#8b4513;
            }
            .revenue-number{
                font-size:32px;
                font-weight:bold;
                color:red;
            }
            .table thead{
                background:#212529;
                color:white;
            }
            .chart-box{
                background:white;
                border-radius:20px;
                padding:25px;
                box-shadow:0 5px 15px rgba(0,0,0,0.1);
                margin-bottom:30px;
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
                            <a class="nav-link active" href="Admin">
                                <i class="fa fa-home"></i>
                                Trang chủ
                            </a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="quanlysanpham">
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
                        <!-- THỐNG KÊ -->
                        <li class="nav-item">
                            <a class="nav-link" href="ThongKe">
                                <i class="fa fa-chart-line"></i>
                                Thống kê
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
        <div class="container mt-5">
            <div class="dashboard-title">
                <i class="fa fa-chart-line"></i>
                Thống kê doanh thu
            </div>
            <%
                Double totalRevenue = (Double) request.getAttribute("totalRevenue");
                Integer totalOrders = (Integer) request.getAttribute("totalOrders");
                Integer totalProducts = (Integer) request.getAttribute("totalProducts");
                if (totalRevenue == null) {
                    totalRevenue = 0.0;
                }
                if (totalOrders == null) {
                    totalOrders = 0;
                }
                if (totalProducts == null) {
                    totalProducts = 0;
                }
            %>

            <!-- CARD -->
            <div class="row">
                <div class="col-md-4">
                    <div class="card-box">
                        <div class="card-title">
                            <i class="fa fa-money-bill-wave"></i>
                            Tổng doanh thu
                        </div>
                        <div class="revenue-number">
                            <%= String.format("%,.0f", totalRevenue)%> VNĐ
                        </div>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="card-box">
                        <div class="card-title">
                            <i class="fa fa-cart-shopping"></i>
                            Tổng đơn hàng
                        </div>
                        <div class="revenue-number">
                            <%= totalOrders%>
                        </div>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="card-box">
                        <div class="card-title">
                            <i class="fa fa-shirt"></i>
                            Sản phẩm đã bán
                        </div>
                        <div class="revenue-number">
                            <%= totalProducts%>
                        </div>
                    </div>
                </div>
            </div>
            <!-- BIỂU ĐỒ -->
            <div class="chart-box">
                <div class="d-flex justify-content-between align-items-center mb-4">
                    <h4>
                        <i class="fa fa-chart-column"></i>
                        Biểu đồ doanh thu
                    </h4>
                    <select id="chartType" class="form-select w-auto">
                        <option value="day">
                            Theo ngày
                        </option>
                        <option value="week">
                            Theo tuần
                        </option>
                        <option value="month">
                            Theo tháng
                        </option>
                    </select>
                </div>
                <div style=" width:100%; max-width:900px; height:400px; margin:auto; ">
                    <canvas id="dailyChart"></canvas>
                </div>
            </div>
            <!-- DOANH THU THEO NGÀY -->
            <div class="card-box">
                <div class="card-title">
                    <i class="fa fa-calendar-day"></i>
                    Doanh thu theo ngày
                </div>
                <table class="table table-bordered table-hover">
                    <thead>
                        <tr>
                            <th>Ngày</th>
                            <th>Doanh thu</th>
                        </tr>
                    </thead>
                    <tbody>
                        <%
                            List<ThongKe> dailyRevenue = (List<ThongKe>) request.getAttribute("dailyRevenue");
                            if (dailyRevenue != null) {
                                for (ThongKe r : dailyRevenue) {
                        %>
                        <tr>
                            <td> <%= r.getLabel()%> </td>
                            <td style=" color:red; font-weight:bold; ">
                                <%= String.format("%,.0f", r.getTotal())%> VNĐ
                            </td>
                        </tr>
                        <%
                                }
                            }
                        %>
                    </tbody>
                </table>
            </div>
            <!-- DOANH THU THEO TUẦN -->
            <div class="card-box">
                <div class="card-title">
                    <i class="fa fa-calendar-week"></i>
                    Doanh thu theo tuần
                </div>
                <table class="table table-bordered table-hover">
                    <thead>
                        <tr>
                            <th>Tuần</th>
                            <th>Doanh thu</th>
                        </tr>
                    </thead>
                    <tbody>
                        <%
                            List<ThongKe> weeklyRevenue = (List<ThongKe>) request.getAttribute("weeklyRevenue");
                            if (weeklyRevenue != null) {
                                for (ThongKe r : weeklyRevenue) {
                        %>
                        <tr>
                            <td> <%= r.getLabel()%> </td>
                            <td style=" color:red; font-weight:bold; ">
                                <%= String.format("%,.0f", r.getTotal())%> VNĐ
                            </td>
                        </tr>
                        <%
                                }
                            }
                        %>
                    </tbody>
                </table>
            </div>
            <!-- DOANH THU THEO THÁNG -->
            <div class="card-box">
                <div class="card-title">
                    <i class="fa fa-calendar"></i>
                    Doanh thu theo tháng
                </div>
                <table class="table table-bordered table-hover">
                    <thead>
                        <tr>
                            <th>Tháng</th>
                            <th>Doanh thu</th>
                        </tr>
                    </thead>
                    <tbody>
                        <%
                            List<ThongKe> monthlyRevenue = (List<ThongKe>) request.getAttribute("monthlyRevenue");
                            if (monthlyRevenue != null) {
                                for (ThongKe r : monthlyRevenue) {
                        %>
                        <tr>
                            <td>
                                <%= r.getLabel()%>
                            </td>
                            <td style=" color:red; font-weight:bold; ">
                                <%= String.format("%,.0f", r.getTotal())%> VNĐ
                            </td>
                        </tr>
                        <%
                                }
                            }
                        %>
                    </tbody>
                </table>
            </div>
        </div>

        <!-- CHART -->
        <script>
            const dayLabels = [
                <%
                    if (dailyRevenue != null) {
                        for (int i = 0; i < dailyRevenue.size(); i++) {
                            ThongKe r = dailyRevenue.get(i);
                %>
                "<%= r.getLabel()%>"
                <%= (i < dailyRevenue.size() - 1) ? "," : ""%>
                <%
                        }
                    }
                %>
            ];
            const dayData = [
                <%
                    if (dailyRevenue != null) {
                        for (int i = 0; i < dailyRevenue.size(); i++) {
                            ThongKe r = dailyRevenue.get(i);
                %>
                <%= r.getTotal()%>
                <%= (i < dailyRevenue.size() - 1) ? "," : ""%>
                <%
                        }
                    }
                %>
            ];
            // ================= THEO TUẦN =================
            const weekLabels = [
                <%
                    if (weeklyRevenue != null) {
                        for (int i = 0; i < weeklyRevenue.size(); i++) {
                            ThongKe r = weeklyRevenue.get(i);
                %>
                "<%= r.getLabel()%>"
                <%= (i < weeklyRevenue.size() - 1) ? "," : ""%>
                <%
                        }
                    }
                %>
            ];
            const weekData = [
                <%
                    if (weeklyRevenue != null) {
                        for (int i = 0; i < weeklyRevenue.size(); i++) {
                            ThongKe r = weeklyRevenue.get(i);
                %>
                <%= r.getTotal()%>
                <%= (i < weeklyRevenue.size() - 1) ? "," : ""%>
                <%
                        }
                    }
                %>
            ];
            // ================= THEO THÁNG =================
            const monthLabels = [
                <%
                    if (monthlyRevenue != null) {
                        for (int i = 0; i < monthlyRevenue.size(); i++) {
                            ThongKe r = monthlyRevenue.get(i);
                %>
                "<%= r.getLabel()%>"
                <%= (i < monthlyRevenue.size() - 1) ? "," : ""%>
                <%
                        }
                    }
                %>
            ];
            const monthData = [
                <%
                    if (monthlyRevenue != null) {
                        for (int i = 0; i < monthlyRevenue.size(); i++) {
                            ThongKe r = monthlyRevenue.get(i);

                %>
                <%= r.getTotal()%>
                <%= (i < monthlyRevenue.size() - 1) ? "," : ""%>
                <%
                        }
                    }
                %>
            ];
            // ================= CHART =================
            const ctx = document.getElementById("dailyChart");
            let revenueChart = new Chart(ctx, {
                type: 'bar',
                data: {
                    labels: dayLabels,
                    datasets: [{ label: 'Doanh thu', data: dayData, borderWidth: 2 }]
                },
                options: {
                    responsive: true,
                    maintainAspectRatio: false
                }
            });
            // ================= CHANGE =================
            document.getElementById("chartType").addEventListener("change",
                    function () {
                        let value = this.value;
                        if (value === "day") {
                            revenueChart.data.labels = dayLabels;
                            revenueChart.data.datasets[0].data = dayData;
                        } else if (value === "week") {
                            revenueChart.data.labels = weekLabels;
                            revenueChart.data.datasets[0].data = weekData;
                        } else if (value === "month") {
                            revenueChart.data.labels = monthLabels;
                            revenueChart.data.datasets[0].data = monthData;
                        }
                        revenueChart.update();
                    });
        </script>
        <!-- FOOTER -->
        <div class="bg-dark text-white text-center p-3 mt-4">
            <p>Đàm Thu Trang - 11/11/2005</p>
            <p>Nguyễn Tiến Nam - 21/12/2005</p>
            <p>Phạm Doãn Nguyên - 25/04/2005</p>
        </div>
        <script src="css/css/js/bootstrap.bundle.min.js"></script>

    </body>
</html>