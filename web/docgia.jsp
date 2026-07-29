<%--
    Document   : docgia
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
        String ngaySinh = request.getParameter("ngaysinh");
        String gioiTinh = request.getParameter("gioitinh");
        String loaiDocGia = request.getParameter("loaidocgia");
        String maThe = request.getParameter("mathe");
        String email = request.getParameter("email");
        String sdt = request.getParameter("sdt");
        String diaChi = request.getParameter("diachi");

        String sql = "INSERT INTO docgia (HoTen, NgaySinh, GioiTinh, LoaiDocGia, MaThe, Email, SDT, DiaChi) VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setString(1, hoTen);
            stmt.setString(2, ngaySinh);
            stmt.setString(3, gioiTinh);
            stmt.setString(4, loaiDocGia);
            stmt.setString(5, maThe);
            stmt.setString(6, email);
            stmt.setString(7, sdt);
            stmt.setString(8, diaChi);
            int inserted = stmt.executeUpdate();
            message = inserted > 0 ? "Thêm độc giả thành công." : "Không thể thêm độc giả.";
        } catch (SQLException e) {
            message = "Lỗi: " + e.getMessage();
        }
    }

    List<Map<String, Object>> readers = new ArrayList<>();
    try (Connection conn = DBConnection.getConnection();
         PreparedStatement stmt = conn.prepareStatement("SELECT * FROM docgia ORDER BY MaDG DESC");
         ResultSet rs = stmt.executeQuery()) {
        while (rs.next()) {
            Map<String, Object> item = new HashMap<>();
            item.put("id", rs.getInt("MaDG"));
            item.put("name", rs.getString("HoTen"));
            item.put("card", rs.getString("MaThe"));
            item.put("type", rs.getString("LoaiDocGia"));
            item.put("email", rs.getString("Email"));
            item.put("phone", rs.getString("SDT"));
            item.put("status", rs.getString("TrangThai"));
            readers.add(item);
        }
    } catch (SQLException e) {
        message = "Lỗi: " + e.getMessage();
    }
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Quản lý độc giả - Thư viện UNETI</title>
        <style>
            body {margin:0; font-family:Arial, sans-serif; background:#f4f7f6;}
            .header {background:#0056A0; color:white; padding:14px 24px; display:flex; align-items:center;}
            .header .logo {width:62px; height:62px; background:white; border-radius:50%; margin-right:16px;}
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
            .form-field input, .form-field select {width:100%; padding:10px; border:1px solid #b3d4fc; border-radius:6px;}
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
                <div style="font-size:24px; font-weight:bold;">QUẢN LÝ ĐỘC GIẢ</div>
            </div>
        </div>
        <div class="nav">
            <a href="trangchu.jsp">Trang chủ</a>
            <a href="admin">Dashboard</a>
            <a href="books">Quản lý sách</a>
            <a href="phieumuon.jsp">Mượn / Trả sách</a>
            <a href="docgia.jsp" class="active">Độc giả</a>
            <a href="nhanvien.jsp">Nhân viên</a>
            <a href="nhacungcap.jsp">Nhà cung cấp</a>
            <a href="phieunhap.jsp">Nhập sách</a>
            <a href="phieuphat.jsp">Phiếu phạt</a>
            <a href="doanhthu.jsp">Thống kê</a>
            <a href="dangxuat.jsp">Đăng xuất</a>
        </div>
        <div class="container">
            <div class="title">Danh sách độc giả</div>
            <% if (message != null && !message.isEmpty()) { %>
            <div class="message"><%= message %></div>
            <% } %>
            <div class="grid">
                <div class="card">
                    <h2>Độc giả hiện có</h2>
                    <table class="table">
                        <tr><th>#</th><th>Họ tên</th><th>Loại</th><th>Thẻ</th><th>Email</th><th>SDT</th><th>Trạng thái</th></tr>
                        <% if (readers.isEmpty()) { %>
                        <tr><td colspan="7">Không có độc giả.</td></tr>
                        <% } else {
                            for (Map<String, Object> reader : readers) {
                        %>
                        <tr>
                            <td><%= reader.get("id") %></td>
                            <td><%= reader.get("name") %></td>
                            <td><%= reader.get("type") %></td>
                            <td><%= reader.get("card") %></td>
                            <td><%= reader.get("email") %></td>
                            <td><%= reader.get("phone") %></td>
                            <td><%= reader.get("status") %></td>
                        </tr>
                        <% }
                        } %>
                    </table>
                </div>
                <div class="card">
                    <h2>Thêm độc giả mới</h2>
                    <form action="docgia.jsp" method="POST">
                        <div class="form-field"><label>Họ tên</label><input type="text" name="hoten" required></div>
                        <div class="form-field"><label>Ngày sinh</label><input type="date" name="ngaysinh"></div>
                        <div class="form-field"><label>Giới tính</label><select name="gioitinh"><option value="">Chọn</option><option value="Nam">Nam</option><option value="Nữ">Nữ</option><option value="Khác">Khác</option></select></div>
                        <div class="form-field"><label>Loại độc giả</label><input type="text" name="loaidocgia"></div>
                        <div class="form-field"><label>Mã thẻ</label><input type="text" name="mathe"></div>
                        <div class="form-field"><label>Email</label><input type="email" name="email"></div>
                        <div class="form-field"><label>SDT</label><input type="text" name="sdt"></div>
                        <div class="form-field"><label>Địa chỉ</label><input type="text" name="diachi"></div>
                        <button class="btn" type="submit">Lưu độc giả</button>
                    </form>
                </div>
            </div>
        </div>
        <div class="footer">&copy; 2026 Thư viện UNETI</div>
    </body>
</html>
