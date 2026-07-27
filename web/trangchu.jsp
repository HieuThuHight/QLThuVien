<%-- 
    Document   : trangchu
    Created on : Jul 27, 2026, 3:03:47 PM
    Author     : Do Hieu
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Trang chủ - Cổng thông tin Thư viện UNETI</title>

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

            .search-container {
                max-width: 900px;
                margin: 30px auto;
                padding: 25px;
                background-color: white;
                border-radius: 8px;
                box-shadow: 0 4px 15px rgba(0,0,0,0.1);
                text-align: center;
            }

            .search-title {
                color: #0056A0;
                font-size: 20px;
                font-weight: bold;
                margin-bottom: 15px;
            }

            .search-input {
                width: 60%;
                padding: 12px 15px;
                border: 1px solid #b3d4fc;
                border-radius: 5px;
                font-size: 14px;
                outline: none;
            }

            .search-btn {
                padding: 12px 25px;
                background-color: #ff5a00;
                color: white;
                border: none;
                border-radius: 5px;
                font-size: 14px;
                font-weight: bold;
                cursor: pointer;
                margin-left: 8px;
            }

            .search-btn:hover {
                background-color: #e65100;
            }

            .content-container {
                max-width: 1100px;
                margin: 0 auto;
                padding: 0 20px 50px;
            }

            .section-title {
                color: #0056A0;
                font-size: 20px;
                font-weight: bold;
                border-left: 5px solid #ff5a00;
                padding-left: 12px;
                margin: 30px 0 15px;
            }

            .book-grid {
                display: grid;
                grid-template-columns: repeat(auto-fill, minmax(180px, 1fr));
                gap: 20px;
            }

            .book-card {
                background-color: white;
                border-radius: 8px;
                box-shadow: 0 2px 8px rgba(0,0,0,0.08);
                overflow: hidden;
            }

            .book-cover {
                height: 220px;
                background-color: #e6f0fa;
            }

            .book-info {
                padding: 12px;
            }

            .book-name {
                color: #0056A0;
                font-weight: bold;
                font-size: 14px;
                margin-bottom: 4px;
            }

            .book-author {
                color: #666;
                font-size: 13px;
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
                <div class="title-bottom">CỔNG THÔNG TIN THƯ VIỆN</div>
            </div>
        </div>

        <!-- MENU DÀNH CHO ĐỘC GIẢ (chỉ chức năng đọc/tra cứu) -->
        <div class="main-nav">
            <a href="trangchu.jsp" class="active">Trang chủ</a>
            <a href="sach.jsp">Sách</a>
            <a href="lichsumuon.jsp">Lịch sử mượn</a>
            <a href="gioithieu.jsp">Giới thiệu thư viện</a>
            <a href="dangnhap.jsp">Đăng nhập</a>
        </div>

        <div class="search-container">
            <div class="search-title">TÌM KIẾM SÁCH</div>
            <form action="" method="GET">
                <input type="text" name="keyword" class="search-input" placeholder="Nhập tên sách hoặc tác giả..." />
                <button type="submit" class="search-btn">TÌM KIẾM</button>
            </form>
        </div>

        <div class="content-container">

            <div class="section-title">Sách mới nhập về</div>
            <div class="book-grid">
                <!-- TODO: lặp danh sách sách mới nhập ra đây -->
            </div>

            <div class="section-title">Sách được mượn nhiều nhất</div>
            <div class="book-grid">
                <!-- TODO: lặp danh sách sách mượn nhiều ra đây -->
            </div>

        </div>

        <div class="uneti-footer">
            &copy; 2026 Thư viện UNETI - Trường Đại học Kinh tế - Kỹ thuật Công nghiệp
        </div>

    </body>
</html>
