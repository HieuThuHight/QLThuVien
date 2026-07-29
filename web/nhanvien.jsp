<%--
    Document   : nhanvien
    Created on : 2026
    Author     : Do Hieu
--%>
<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<%@ page import="model.DBConnection, java.sql.Connection, java.sql.PreparedStatement, java.sql.ResultSet, java.sql.SQLException, java.util.ArrayList, java.util.HashMap, java.util.List, java.util.Map" %>
<%
    request.setCharacterEncoding("UTF-8");
    String message = "";
    if ("POST".equalsIgnoreCase(request.getMethod())) {
        String hoTen = request.getParameter("hoten");
        String chucVu = request.getParameter("chucvu");
        String sdt = request.getParameter("sdt");
        String email = request.getParameter("email");
        String diaChi = request.getParameter("diachi");

        String sql = "INSERT INTO nhanvien (HoTen, ChucVu, SDT, Email, DiaChi) VALUES (?, ?, ?, ?, ?)";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setString(1, hoTen);
            stmt.setString(2, chucVu);
            stmt.setString(3, sdt);
            stmt.setString(4, email);
            stmt.setString(5, diaChi);
            int inserted = stmt.executeUpdate();
            message = inserted > 0 ? "Thêm nhân viên thành công." : "Không thể thêm nhân viên.";
        } catch (SQLException e) {
            message = "Lỗi: " + e.getMessage();
        }
    }

    List<Map<String, Object>> employees = new ArrayList<>();
    try (Connection conn = DBConnection.getConnection();
         PreparedStatement stmt = conn.prepareStatement("SELECT * FROM nhanvien ORDER BY MaNV DESC");
         ResultSet rs = stmt.executeQuery()) {
        while (rs.next()) {
            Map<String, Object> item = new HashMap<>();
            item.put("id", rs.getInt("MaNV"));
            item.put("name", rs.getString("HoTen"));
            item.put("role", rs.getString("ChucVu"));
            item.put("phone", rs.getString("SDT"));
            item.put("email", rs.getString("Email"));
            item.put("address", rs.getString("DiaChi"));
            item.put("status", rs.getString("TrangThai"));
            employees.add(item);
        }
    } catch (SQLException e) {
        message = "Lỗi: " + e.getMessage();
    }
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Quản lý nhân viên - Thư viện UNETI</title>
        <style>
            body {margin:0; font-family:Arial, sans-serif; background:#f4f7f6;}
            .header {background:#0056A0; color:white; padding:14px 24px; display:flex; align-items:center;}
            .logo {width:62px; height:62px; background:white; border-radius:50%; margin-right:16px;}
            .nav {background:#0074D9; display:flex; flex-wrap:wrap; justify-content:center;}
            .nav a {color:white; padding:14px 16px; text-decoration:none; font-weight:bold;}
            .nav a.active, .nav a:hover {background:#ff5a00;}
            .container {max-width:1140px; margin:24px auto; padding:0 20px 40px;}
            .title {font-size:22px; color:#0056A0; margin-bottom:16px;}
            .message {background:#e7f3ff; border:1px solid #cce5ff; color:#0f3c75; padding:12px 14px; border-radius:8px; margin-bottom:18px;}
            .grid {display:grid; grid-template-columns:1fr 320px; gap:20px;}
            .card {background:white; border-radius:10px; box-shadow:0 2px 8px rgba(0,0,0,0.08); padding:18px;}
            .card h2 {margin-top:0; color:#0056A0;}
            .table {width:100%; border-collapse:collapse;}
            .table th, .table td {padding:12px 10px; border-bottom:1px solid #eee; text-align:left; font-size:13px;}
            .table th {background:#0056A0; color:white;}
            .form-field {margin-bottom:12px;}
            .form-field label {display:block; margin-bottom:6px; color:#333;}
            .form-field input {width:100%; padding:10px; border:1px solid #b3d4fc; border-radius:6px;}
            .btn {background:#0074D9; color:white; padding:12px 20px; border:none; border-radius:6px; cursor:pointer; font-weight:bold;}
            .btn:hover {background:#0056A0;}
            .footer {background:#0056A0; color:white; text-align:center; padding:18px; margin-top:30px;}
        </style>
    </head>
    <body>
        <div class="header">
            <div class="logo"></div>
            <div>
                <div style="font-size:14px;">TRƯỜNG ĐẠI HỌC KINH TẾ - KỸ THUẬT CÔNG NGHIỆP</div>
                <div style="font-size:24px; font-weight:bold;">QUẢN LÝ NHÂN VIÊN</div>
            </div>
        </div>
        <div class="nav">
            <a href="trangchu.jsp">Trang chủ</a>
            <a href="admin">Dashboard</a>
            <a href="books">Quản lý sách</a>
            <a href="phieumuon.jsp">Mượn / Trả sách</a>
            <a href="docgia.jsp">Độc giả</a>
            <a href="nhanvien.jsp" class="active">Nhân viên</a>
            <a href="nhacungcap.jsp">Nhà cung cấp</a>
            <a href="phieunhap.jsp">Nhập sách</a>
            <a href="phieuphat.jsp">Phiếu phạt</a>
            <a href="doanhthu.jsp">Thống kê</a>
            <a href="dangxuat.jsp">Đăng xuất</a>
        </div>
        <div class="container">
            <div class="title">Danh sách nhân viên</div>
            <% if (message != null && !message.isEmpty()) { %>
            <div class="message"><%= message %></div>
            <% } %>
            <div class="grid">
                <div class="card">
                    <h2>Thông tin nhân viên</h2>
                    <table class="table">
                        <tr><th>#</th><th>Họ tên</th><th>Chức vụ</th><th>SDT</th><th>Email</th><th>Trạng thái</th></tr>
                        <% if (employees.isEmpty()) { %>
                        <tr><td colspan="6">Không có nhân viên.</td></tr>
                        <% } else {
                            for (Map<String, Object> emp : employees) {
                        %>
                        <tr>
                            <td><%= emp.get("id") %></td>
                            <td><%= emp.get("name") %></td>
                            <td><%= emp.get("role") %></td>
                            <td><%= emp.get("phone") %></td>
                            <td><%= emp.get("email") %></td>
                            <td><%= emp.get("status") %></td>
                        </tr>
                        <% }
                        } %>
                    </table>
                </div>
                <div class="card">
                    <h2>Thêm nhân viên mới</h2>
                    <form action="nhanvien.jsp" method="POST">
                        <div class="form-field"><label>Họ tên</label><input type="text" name="hoten" required></div>
                        <div class="form-field"><label>Chức vụ</label><input type="text" name="chucvu"></div>
                        <div class="form-field"><label>SDT</label><input type="text" name="sdt"></div>
                        <div class="form-field"><label>Email</label><input type="email" name="email"></div>
                        <div class="form-field"><label>Địa chỉ</label><input type="text" name="diachi"></div>
                        <button class="btn" type="submit">Lưu nhân viên</button>
                    </form>
                </div>
            </div>
        </div>
        <div class="footer">&copy; 2026 Thư viện UNETI</div>
    </body>
</html>
