package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

public class DashboardDAO {

    public int countTotalBooks() {
        return countValue("SELECT COUNT(*) FROM sach");
    }

    public int countTotalReaders() {
        return countValue("SELECT COUNT(*) FROM docgia");
    }

    public int countCurrentBorrowings() {
        return countValue("SELECT COUNT(*) FROM phieumuon WHERE TrangThai IN ('Đang mượn','Quá hạn')");
    }

    public int countOverdue() {
        return countValue("SELECT COUNT(*) FROM phieumuon WHERE TrangThai = 'Quá hạn'");
    }

    private int countValue(String sql) {
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql);
             ResultSet rs = stmt.executeQuery()) {
            if (rs.next()) {
                return rs.getInt(1);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return 0;
    }

    public List<BorrowingInfo> getRecentBorrowings(int limit) {
        List<BorrowingInfo> borrowings = new ArrayList<>();
        String sql = "SELECT pm.MaPhieuMuon, dg.HoTen, pm.NgayMuon, pm.NgayHenTra, pm.TrangThai " +
                     "FROM phieumuon pm " +
                     "JOIN docgia dg ON pm.MaDG = dg.MaDG " +
                     "ORDER BY pm.NgayMuon DESC LIMIT ?";

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setInt(1, limit);
            try (ResultSet rs = stmt.executeQuery()) {
                while (rs.next()) {
                    BorrowingInfo info = new BorrowingInfo();
                    info.setLoanId(rs.getInt("MaPhieuMuon"));
                    info.setReaderName(rs.getString("HoTen"));
                    info.setBorrowDate(rs.getTimestamp("NgayMuon").toLocalDateTime());
                    info.setDueDate(rs.getDate("NgayHenTra").toString());
                    info.setStatus(rs.getString("TrangThai"));
                    borrowings.add(info);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return borrowings;
    }

    public List<Book> getTopBooks(int limit) {
        List<Book> books = new ArrayList<>();
        String sql = "SELECT * FROM sach ORDER BY SoLuongConLai DESC LIMIT ?";

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setInt(1, limit);
            try (ResultSet rs = stmt.executeQuery()) {
                while (rs.next()) {
                    Book book = new Book();
                    book.setId(rs.getInt("MaSach"));
                    book.setTitle(rs.getString("TenSach"));
                    book.setAuthor(rs.getString("TacGia"));
                    book.setGenre(rs.getString("TheLoai"));
                    book.setPublisher(rs.getString("NhaXuatBan"));
                    book.setYear(rs.getInt("NamXuatBan"));
                    book.setIsbn(rs.getString("ISBN"));
                    book.setPrice(rs.getDouble("DonGia"));
                    book.setTotalQuantity(rs.getInt("SoLuongTong"));
                    book.setAvailableQuantity(rs.getInt("SoLuongConLai"));
                    book.setLocation(rs.getString("ViTriKe"));
                    book.setDescription(rs.getString("MoTa"));
                    books.add(book);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return books;
    }
}
