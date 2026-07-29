<%-- 
    Document   : admin
    Created on : Jul 27, 2026, 3:04:17 PM
    Author     : Do Hieu
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="model.BorrowingInfo" %>
<%
    Integer totalBooks = (Integer) request.getAttribute("totalBooks");
    Integer totalReaders = (Integer) request.getAttribute("totalReaders");
    Integer currentBorrowings = (Integer) request.getAttribute("currentBorrowings");
    Integer overdueCount = (Integer) request.getAttribute("overdueCount");
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Trang quản trị - Cổng thông tin Thư viện UNETIaa</title>

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

            .action-grid {
                display: grid;
                grid-template-columns: repeat(auto-fit, minmax(220px, 1fr));
                gap: 16px;
                margin-top: 20px;
            }

            .action-card {
                background-color: white;
                border-radius: 10px;
                box-shadow: 0 2px 8px rgba(0,0,0,0.08);
                overflow: hidden;
                transition: transform 0.18s ease, box-shadow 0.18s ease;
            }

            .action-card:hover {
                transform: translateY(-4px);
                box-shadow: 0 6px 18px rgba(0,0,0,0.12);
            }

            .action-card a {
                display: block;
                padding: 18px 20px;
                color: #0056A0;
                font-weight: bold;
                text-decoration: none;
                font-size: 15px;
            }

            .action-card a span {
                display: block;
                margin-top: 8px;
                color: #666;
                font-size: 13px;
                font-weight: normal;
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
        <%@ page import="java.util.List" %>
        <%@ page import="model.BorrowingInfo" %>
        <div class="main-nav">
            <a href="admin" class="active">Trang quản trị</a>
            <a href="books">Quản lý sách</a>
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
                <div class="stat-box"><div class="num"><%= totalBooks != null ? totalBooks : 0 %></div><div class="lbl">Tổng đầu sách</div></div>
                <div class="stat-box"><div class="num"><%= totalReaders != null ? totalReaders : 0 %></div><div class="lbl">Độc giả</div></div>
                <div class="stat-box"><div class="num"><%= currentBorrowings != null ? currentBorrowings : 0 %></div><div class="lbl">Đang mượn</div></div>
                <div class="stat-box"><div class="num"><%= overdueCount != null ? overdueCount : 0 %></div><div class="lbl">Quá hạn</div></div>
            </div>

            <div class="section-title">Chức năng nhanh</div>
            <div class="action-grid">
                <div class="action-card"><a href="books">Quản lý sách<span>Thêm, sửa, xem danh sách sách</span></a></div>
                <div class="action-card"><a href="phieumuon.jsp">Mượn / Trả sách<span>Quản lý phiếu mượn trả</span></a></div>
                <div class="action-card"><a href="docgia.jsp">Quản lý độc giả<span>Danh sách và thẻ độc giả</span></a></div>
                <div class="action-card"><a href="nhanvien.jsp">Quản lý nhân viên<span>Thông tin nhân viên thư viện</span></a></div>
                <div class="action-card"><a href="nhacungcap.jsp">Nhà cung cấp<span>Thông tin nhà cung cấp</span></a></div>
                <div class="action-card"><a href="phieunhap.jsp">Nhập sách<span>Quản lý phiếu nhập và kho</span></a></div>
                <div class="action-card"><a href="phieuphat.jsp">Phiếu phạt<span>Quản lý phạt quá hạn</span></a></div>
                <div class="action-card"><a href="doanhthu.jsp">Thống kê doanh thu<span>Báo cáo thu chi</span></a></div>
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
                <%
                    List<BorrowingInfo> recentBorrowings = (List<BorrowingInfo>) request.getAttribute("recentBorrowings");
                    if (recentBorrowings != null && !recentBorrowings.isEmpty()) {
                        for (BorrowingInfo borrowing : recentBorrowings) {
                %>
                <tr>
                    <td><%= borrowing.getLoanId() %></td>
                    <td><%= borrowing.getReaderName() %></td>
                    <td><%= borrowing.getFormattedBorrowDate() %></td>
                    <td><%= borrowing.getDueDate() %></td>
                    <td><%= borrowing.getStatus() %></td>
                </tr>
                <%      }
                    } else {
                %>
                <tr>
                    <td colspan="5">Không có dữ liệu.</td>
                </tr>
                <% } %>
            </table>

        </div>

        <div class="uneti-footer">
            &copy; 2026 Thư viện UNETI - Trường Đại học Kinh tế - Kỹ thuật Công nghiệp
        </div>

    </body>
</html>
