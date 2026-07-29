<%--
    Document   : phieumuon
    Created on : 2026
    Author     : Do Hieu
--%>
<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<%@ page import="model.DBConnection, java.sql.Connection, java.sql.PreparedStatement, java.sql.ResultSet, java.sql.SQLException, java.sql.Statement, java.util.ArrayList, java.util.HashMap, java.util.List, java.util.Map" %>
<%
    request.setCharacterEncoding("UTF-8");
    String message = "";
    if ("POST".equalsIgnoreCase(request.getMethod())) {
        String madg = request.getParameter("madg");
        String manv = request.getParameter("manv");
        String ngaymuon = request.getParameter("ngaymuon");
        String ngayhentra = request.getParameter("ngayhentra");
        String trangthai = request.getParameter("trangthai");

        String insertSql = "INSERT INTO phieumuon (MaDG, MaNV, NgayMuon, NgayHenTra, TrangThai) VALUES (?, ?, ?, ?, ?)";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(insertSql, Statement.RETURN_GENERATED_KEYS)) {
            stmt.setInt(1, Integer.parseInt(madg));
            stmt.setInt(2, Integer.parseInt(manv));
            stmt.setString(3, ngaymuon);
            stmt.setString(4, ngayhentra);
            stmt.setString(5, trangthai);
            int inserted = stmt.executeUpdate();
            message = inserted > 0 ? "Thêm phiếu mượn thành công." : "Không thể thêm phiếu mượn.";
        } catch (SQLException e) {
            message = "Lỗi: " + e.getMessage();
        }
    }

    List<Map<String, Object>> loans = new ArrayList<>();
    try (Connection conn = DBConnection.getConnection();
         PreparedStatement stmt = conn.prepareStatement("SELECT pm.MaPhieuMuon, dg.HoTen AS DocGia, nv.HoTen AS NhanVien, pm.NgayMuon, pm.NgayHenTra, pm.TrangThai FROM phieumuon pm JOIN docgia dg ON pm.MaDG = dg.MaDG JOIN nhanvien nv ON pm.MaNV = nv.MaNV ORDER BY pm.MaPhieuMuon DESC");
         ResultSet rs = stmt.executeQuery()) {
        while (rs.next()) {
            Map<String, Object> item = new HashMap<>();
            item.put("id", rs.getInt("MaPhieuMuon"));
            item.put("reader", rs.getString("DocGia"));
            item.put("staff", rs.getString("NhanVien"));
            item.put("borrowDate", rs.getString("NgayMuon"));
            item.put("dueDate", rs.getString("NgayHenTra"));
            item.put("status", rs.getString("TrangThai"));
            loans.add(item);
        }
    } catch (SQLException e) {
        message = "Lỗi: " + e.getMessage();
    }
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Phiếu mượn - Thư viện UNETI</title>
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
                <div style="font-size:24px; font-weight:bold;">PHIẾU MƯỢN</div>
            </div>
        </div>
        <div class="nav">
            <a href="trangchu.jsp">Trang chủ</a>
            <a href="admin">Dashboard</a>
            <a href="books">Quản lý sách</a>
            <a href="phieumuon.jsp" class="active">Mượn / Trả sách</a>
            <a href="docgia.jsp">Độc giả</a>
            <a href="nhanvien.jsp">Nhân viên</a>
            <a href="nhacungcap.jsp">Nhà cung cấp</a>
            <a href="phieunhap.jsp">Nhập sách</a>
            <a href="phieuphat.jsp">Phiếu phạt</a>
            <a href="doanhthu.jsp">Thống kê</a>
            <a href="dangxuat.jsp">Đăng xuất</a>
        </div>
        <div class="container">
            <div class="title">Phiếu mượn</div>
            <% if (message != null && !message.isEmpty()) { %>
            <div class="message"><%= message %></div>
            <% } %>
            <div class="grid">
                <div class="card">
                    <h2>Danh sách phiếu mượn</h2>
                    <table class="table">
                        <tr><th>#</th><th>Độc giả</th><th>Nhân viên</th><th>Ngày mượn</th><th>Hạn trả</th><th>Trạng thái</th></tr>
                        <% if (loans.isEmpty()) { %>
                        <tr><td colspan="6">Không có phiếu mượn.</td></tr>
                        <% } else {
                            for (Map<String, Object> loan : loans) {
                        %>
                        <tr>
                            <td><%= loan.get("id") %></td>
                            <td><%= loan.get("reader") %></td>
                            <td><%= loan.get("staff") %></td>
                            <td><%= loan.get("borrowDate") %></td>
                            <td><%= loan.get("dueDate") %></td>
                            <td><%= loan.get("status") %></td>
                        </tr>
                        <% }
                        } %>
                    </table>
                </div>
                <div class="card">
                    <h2>Thêm phiếu mượn</h2>
                    <form action="phieumuon.jsp" method="POST">
                        <div class="form-field"><label>Mã độc giả</label><input type="number" name="madg" required></div>
                        <div class="form-field"><label>Mã nhân viên</label><input type="number" name="manv" required></div>
                        <div class="form-field"><label>Ngày mượn</label><input type="datetime-local" name="ngaymuon" required></div>
                        <div class="form-field"><label>Hạn trả</label><input type="date" name="ngayhentra" required></div>
                        <div class="form-field"><label>Trạng thái</label><select name="trangthai"><option value="Đang mượn">Đang mượn</option><option value="Đã trả">Đã trả</option><option value="Quá hạn">Quá hạn</option></select></div>
                        <button class="btn" type="submit">Lưu phiếu mượn</button>
                    </form>
                </div>
            </div>
        </div>
        <div class="footer">&copy; 2026 Thư viện UNETI</div>
    </body>
</html>
