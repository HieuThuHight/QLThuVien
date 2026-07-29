<%--
    Document   : phieunhap
    Created on : 2026
    Author     : Do Hieu
--%>
<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<%@ page import="model.DBConnection, java.sql.Connection, java.sql.PreparedStatement, java.sql.ResultSet, java.sql.SQLException, java.sql.Statement, java.util.ArrayList, java.util.HashMap, java.util.List, java.util.Map" %>
<%
    request.setCharacterEncoding("UTF-8");
    String message = "";
    if ("POST".equalsIgnoreCase(request.getMethod())) {
        String manv = request.getParameter("manv");
        String manncc = request.getParameter("manncc");
        String ngaynhap = request.getParameter("ngaynhap");
        String tongtien = request.getParameter("tongtien");

        String insertPhieu = "INSERT INTO phieunhap (MaNV, MaNCC, NgayNhap, TongTien) VALUES (?, ?, ?, ?)";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(insertPhieu, Statement.RETURN_GENERATED_KEYS)) {
            stmt.setInt(1, Integer.parseInt(manv));
            stmt.setInt(2, Integer.parseInt(manncc));
            stmt.setString(3, ngaynhap);
            stmt.setDouble(4, Double.parseDouble(tongtien));
            int inserted = stmt.executeUpdate();
            message = inserted > 0 ? "Thêm phiếu nhập thành công." : "Không thể thêm phiếu nhập.";
        } catch (SQLException e) {
            message = "Lỗi: " + e.getMessage();
        }
    }

    List<Map<String, Object>> receipts = new ArrayList<>();
    try (Connection conn = DBConnection.getConnection();
         PreparedStatement stmt = conn.prepareStatement("SELECT pn.MaPhieuNhap, nv.HoTen AS NhanVien, ncc.TenNCC AS NhaCungCap, pn.NgayNhap, pn.TongTien FROM phieunhap pn JOIN nhanvien nv ON pn.MaNV = nv.MaNV JOIN nhacungcap ncc ON pn.MaNCC = ncc.MaNCC ORDER BY pn.MaPhieuNhap DESC");
         ResultSet rs = stmt.executeQuery()) {
        while (rs.next()) {
            Map<String, Object> item = new HashMap<>();
            item.put("id", rs.getInt("MaPhieuNhap"));
            item.put("nv", rs.getString("NhanVien"));
            item.put("ncc", rs.getString("NhaCungCap"));
            item.put("date", rs.getString("NgayNhap"));
            item.put("total", rs.getDouble("TongTien"));
            receipts.add(item);
        }
    } catch (SQLException e) {
        message = "Lỗi: " + e.getMessage();
    }
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Phiếu nhập - Thư viện UNETI</title>
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
                <div style="font-size:24px; font-weight:bold;">PHIẾU NHẬP</div>
            </div>
        </div>
        <div class="nav">
            <a href="trangchu.jsp">Trang chủ</a>
            <a href="admin">Dashboard</a>
            <a href="books">Quản lý sách</a>
            <a href="phieumuon.jsp">Mượn / Trả sách</a>
            <a href="docgia.jsp">Độc giả</a>
            <a href="nhanvien.jsp">Nhân viên</a>
            <a href="nhacungcap.jsp">Nhà cung cấp</a>
            <a href="phieunhap.jsp" class="active">Nhập sách</a>
            <a href="phieuphat.jsp">Phiếu phạt</a>
            <a href="doanhthu.jsp">Thống kê</a>
            <a href="dangxuat.jsp">Đăng xuất</a>
        </div>
        <div class="container">
            <div class="title">Phiếu nhập sách</div>
            <% if (message != null && !message.isEmpty()) { %>
            <div class="message"><%= message %></div>
            <% } %>
            <div class="grid">
                <div class="card">
                    <h2>Danh sách phiếu nhập</h2>
                    <table class="table">
                        <tr><th>#</th><th>Nhân viên</th><th>Nhà cung cấp</th><th>Ngày nhập</th><th>Tổng tiền</th></tr>
                        <% if (receipts.isEmpty()) { %>
                        <tr><td colspan="5">Không có phiếu nhập.</td></tr>
                        <% } else {
                            for (Map<String, Object> receipt : receipts) {
                        %>
                        <tr>
                            <td><%= receipt.get("id") %></td>
                            <td><%= receipt.get("nv") %></td>
                            <td><%= receipt.get("ncc") %></td>
                            <td><%= receipt.get("date") %></td>
                            <td><%= receipt.get("total") %></td>
                        </tr>
                        <% }
                        } %>
                    </table>
                </div>
                <div class="card">
                    <h2>Thêm phiếu nhập</h2>
                    <form action="phieunhap.jsp" method="POST">
                        <div class="form-field"><label>Mã nhân viên</label><input type="number" name="manv" required></div>
                        <div class="form-field"><label>Mã nhà cung cấp</label><input type="number" name="manncc" required></div>
                        <div class="form-field"><label>Ngày nhập</label><input type="datetime-local" name="ngaynhap" required></div>
                        <div class="form-field"><label>Tổng tiền</label><input type="number" name="tongtien" step="1000" required></div>
                        <button class="btn" type="submit">Lưu phiếu nhập</button>
                    </form>
                </div>
            </div>
        </div>
        <div class="footer">&copy; 2026 Thư viện UNETI</div>
    </body>
</html>
