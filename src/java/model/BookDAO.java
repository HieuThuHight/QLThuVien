package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class BookDAO {

    public List<Book> getAllBooks() {
        List<Book> books = new ArrayList<>();
        String sql = "SELECT * FROM sach ORDER BY MaSach DESC";

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql);
             ResultSet rs = stmt.executeQuery()) {

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
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return books;
    }

    public boolean addBook(Book book) {
        String sql = "INSERT INTO sach (TenSach, TacGia, TheLoai, NhaXuatBan, NamXuatBan, ISBN, DonGia, SoLuongTong, SoLuongConLai, ViTriKe, MoTa) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setString(1, book.getTitle());
            stmt.setString(2, book.getAuthor());
            stmt.setString(3, book.getGenre());
            stmt.setString(4, book.getPublisher());
            stmt.setInt(5, book.getYear());
            stmt.setString(6, book.getIsbn());
            stmt.setDouble(7, book.getPrice());
            stmt.setInt(8, book.getTotalQuantity());
            stmt.setInt(9, book.getAvailableQuantity());
            stmt.setString(10, book.getLocation());
            stmt.setString(11, book.getDescription());

            return stmt.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    public List<Book> searchBooks(String keyword) {
        List<Book> books = new ArrayList<>();
        String sql = "SELECT * FROM sach WHERE TenSach LIKE ? OR TacGia LIKE ? OR TheLoai LIKE ? ORDER BY MaSach DESC";

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            String term = "%" + keyword + "%";
            stmt.setString(1, term);
            stmt.setString(2, term);
            stmt.setString(3, term);

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
