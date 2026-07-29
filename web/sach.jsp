<%--
    Document   : sach
    Created on : 2026
    Author     : Do Hieu
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Quản lý sách - Thư viện UNETI</title>
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
                max-width: 1200px;
                margin: 30px auto;
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
            .message {
                background-color: #e9f7ef;
                border: 1px solid #c3e6cb;
                color: #155724;
                padding: 12px 16px;
                border-radius: 6px;
                margin-bottom: 16px;
            }
            .book-table {
                width: 100%;
                border-collapse: collapse;
                background-color: white;
                box-shadow: 0 2px 8px rgba(0,0,0,0.08);
            }
            .book-table th, .book-table td {
                padding: 12px 14px;
                border-bottom: 1px solid #eee;
                font-size: 13.5px;
                text-align: left;
            }
            .book-table th {
                background-color: #0056A0;
                color: white;
            }
            .book-form {
                background-color: white;
                border-radius: 8px;
                box-shadow: 0 2px 8px rgba(0,0,0,0.08);
                padding: 18px;
                margin-top: 26px;
            }
            .book-form label {
                display: block;
                color: #333;
                font-size: 14px;
                margin-bottom: 6px;
            }
            .book-form input,
            .book-form textarea {
                width: 100%;
                padding: 10px 12px;
                border: 1px solid #b3d4fc;
                border-radius: 5px;
                margin-bottom: 14px;
                font-size: 14px;
            }
            .book-form button {
                padding: 12px 24px;
                background-color: #0074D9;
                color: white;
                border: none;
                border-radius: 5px;
                font-size: 14px;
                cursor: pointer;
            }
            .book-form button:hover {
                background-color: #0056A0;
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
                <div class="title-bottom">QUẢN LÝ SÁCH</div>
            </div>
        </div>

        <div class="main-nav">
            <a href="admin">Trang quản trị</a>
            <a href="books" class="active">Quản lý sách</a>
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
            <div class="section-title">Danh sách sách</div>
            <%
                String message = (String) request.getAttribute("message");
                if (message != null && !message.isEmpty()) {
            %>
            <div class="message"><%= message %></div>
            <%
                }
            %>
            <table class="book-table">
                <tr>
                    <th>#</th>
                    <th>Tên sách</th>
                    <th>Tác giả</th>
                    <th>Thể loại</th>
                    <th>NXB</th>
                    <th>Năm</th>
                    <th>Số lượng còn</th>
                </tr>
                <%
                    java.util.List<model.Book> books = (java.util.List<model.Book>) request.getAttribute("books");
                    if (books != null && !books.isEmpty()) {
                        for (model.Book book : books) {
                %>
                <tr>
                    <td><%= book.getId() %></td>
                    <td><%= book.getTitle() %></td>
                    <td><%= book.getAuthor() %></td>
                    <td><%= book.getGenre() %></td>
                    <td><%= book.getPublisher() %></td>
                    <td><%= book.getYear() %></td>
                    <td><%= book.getAvailableQuantity() %></td>
                </tr>
                <%      }
                    } else {
                %>
                <tr>
                    <td colspan="7">Không có sách nào.</td>
                </tr>
                <% } %>
            </table>

            <div class="book-form">
                <div class="section-title">Thêm sách mới</div>
                <form action="books" method="POST">
                    <label for="title">Tên sách</label>
                    <input type="text" id="title" name="title" required>

                    <label for="author">Tác giả</label>
                    <input type="text" id="author" name="author">

                    <label for="genre">Thể loại</label>
                    <input type="text" id="genre" name="genre">

                    <label for="publisher">Nhà xuất bản</label>
                    <input type="text" id="publisher" name="publisher">

                    <label for="year">Năm xuất bản</label>
                    <input type="number" id="year" name="year" min="1900" max="2100">

                    <label for="isbn">ISBN</label>
                    <input type="text" id="isbn" name="isbn">

                    <label for="price">Giá</label>
                    <input type="number" id="price" name="price" step="1000">

                    <label for="totalQuantity">Tổng số lượng</label>
                    <input type="number" id="totalQuantity" name="totalQuantity" min="0">

                    <label for="availableQuantity">Số lượng còn lại</label>
                    <input type="number" id="availableQuantity" name="availableQuantity" min="0">

                    <label for="location">Vị trí kệ</label>
                    <input type="text" id="location" name="location">

                    <label for="description">Mô tả</label>
                    <textarea id="description" name="description" rows="3"></textarea>

                    <button type="submit">Lưu sách mới</button>
                </form>
            </div>
        </div>

        <div class="uneti-footer">
            &copy; 2026 Thư viện UNETI - Trường Đại học Kinh tế - Kỹ thuật Công nghiệp
        </div>
    </body>
</html>
