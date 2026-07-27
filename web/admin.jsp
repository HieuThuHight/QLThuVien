<%-- 
    Document   : admin
    Created on : Jul 27, 2026, 3:04:17 PM
    Author     : Do Hieu
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Trang quản trị - Cổng thông tin Thư viện UNETI</title>

        <style>
            body {
                margin: 0;
                font-family: 'Arial', sans-serif;
                background-color: #f4f7f6;
            }

            .uneti-header {
                background-color: #0056A0;
                color: white;
                display: flex;
                align-items: center;
                justify-content: center;
                padding: 12px 24px;
                box-shadow: 0 4px 6px rgba(0,0,0,0.1);
            }

            .uneti-logo {
                height: 65px;
                margin-right: 20px;
                background-color: white;
                border-radius: 50%;
                padding: 2px;
            }

            .text-container {
                display: flex;
                flex-direction: column;
            }

            .title-top {
                font-size: 14px;
                font-weight: bold;
                letter-spacing: 0.5px;
            }

            .title-bottom {
                font-size: 26px;
                font-weight: bold;
                margin-top: 4px;
                letter-spacing: 1px;
            }

            .main-nav {
                background-color: #0074D9;
                display: flex;
                justify-content: center;
                flex-wrap: wrap;
            }

            .main-nav a {
                color: white;
                text-decoration: none;
                font-weight: bold;
                font-size: 14px;
                padding: 14px 18px;
                display: inline-block;
            }

            .main-nav a:hover,
            .main-nav a.active {
                background-color: #ff5a00;
            }

            .content-container {
                max-width: 1100px;
                margin: 30px auto;
                padding: 0 20px 50px;
            }

            .stats-strip {
                display: grid;
                grid-template-columns: repeat(4, 1fr);
                gap: 16px;
                margin-bottom: 20px;
            }

            .stat-box {
                background-color: white;
                border-radius: 8px;
                box-shadow: 0 2px 8px rgba(0,0,0,0.08);
                padding: 16px;
                text-align: center;
            }

            .stat-box .num {
                font-size: 24px;
                font-weight: bold;
                color: #0056A0;
            }

            .stat-box .lbl {
                font-size: 13px;
                color: #666;
                margin-top: 4px;
            }

            .section-title {
                color: #0056A0;
                font-size: 20px;
                font-weight: bold;
                border-left: 5px solid #ff5a00;
                padding-left: 12px;
                margin: 30px 0 15px;
            }

            .quick-table {
                width: 100%;
                background-color: white;
                border-collapse: collapse;
                box-shadow: 0 2px 8px rgba(0,0,0,0.08);
            }

            .quick-table th, .quick-table td {
                padding: 10px 14px;
                text-align: left;
                border-bottom: 1px solid #eee;
                font-size: 13.5px;
            }

            .quick-table th {
                background-color: #0056A0;
                color: white;
            }

            .uneti-footer {
                background-color: #0056A0;
                color: white;
                text-align: center;
                padding: 18px;
                font-size: 13px;
            }
        </style>
    </head>
    <body>
        <div class="uneti-header">
            <div class="logo-container">
                <img src="png/1.png" alt="UNETI Logo" class="uneti-logo">
            </div>
            <div class="text-container">
                <div class="title-top">TRƯỜNG ĐẠI HỌC KINH TẾ - KỸ THUẬT CÔNG NGHIỆP</div>
                <div class="title-bottom">HỆ THỐNG QUẢN TRỊ THƯ VIỆN</div>
            </div>
        </div>

        <!-- MENU DÀNH CHO NHÂN VIÊN/ADMIN (nghiệp vụ quản lý) -->
        <div class="main-nav">
            <a href="admin.jsp" class="active">Trang quản trị</a>
            <a href="sach.jsp">Quản lý sách</a>
            <a href="phieumuon.jsp">Mượn / Trả sách</a>
            <a href="docgia.jsp">Độc giả</a>
            <a href="nhanvien.jsp">Nhân viên</a>
            <a href="nhacungcap.jsp">Nhà cung cấp</a>
            <a href="phieunhap.jsp">Nhập sách</a>
            <a href="phieuphat.jsp">Phiếu phạt</a>
            <a href="doanhthu.jsp">Thống kê</a>
            <a href="dangxuat.jsp">Đăng xuất</a>
        </div>

        <div class="content-container">

            <div class="stats-strip">
                <div class="stat-box"><div class="num"></div><div class="lbl">Tổng đầu sách</div></div>
                <div class="stat-box"><div class="num"></div><div class="lbl">Độc giả</div></div>
                <div class="stat-box"><div class="num"></div><div class="lbl">Đang mượn</div></div>
                <div class="stat-box"><div class="num"></div><div class="lbl">Quá hạn</div></div>
            </div>

            <div class="section-title">Phiếu mượn gần đây</div>
            <table class="quick-table">
                <tr>
                    <th>Mã phiếu</th>
                    <th>Độc giả</th>
                    <th>Ngày mượn</th>
                    <th>Hạn trả</th>
                    <th>Trạng thái</th>
                </tr>
                <!-- TODO: lặp danh sách phiếu mượn ra đây -->
            </table>

        </div>

        <div class="uneti-footer">
            &copy; 2026 Thư viện UNETI - Trường Đại học Kinh tế - Kỹ thuật Công nghiệp
        </div>

    </body>
</html>
