package controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Book;
import model.BookDAO;

import java.io.IOException;
import java.util.List;

@WebServlet(name = "BookServlet", urlPatterns = {"/books"})
public class BookServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        BookDAO bookDAO = new BookDAO();
        String keyword = request.getParameter("keyword");
        List<Book> books;
        if (keyword != null && !keyword.trim().isEmpty()) {
            books = bookDAO.searchBooks(keyword.trim());
            request.setAttribute("searchKeyword", keyword.trim());
        } else {
            books = bookDAO.getAllBooks();
        }

        String message = (String) request.getSession().getAttribute("message");
        if (message != null) {
            request.setAttribute("message", message);
            request.getSession().removeAttribute("message");
        }

        request.setAttribute("books", books);
        request.getRequestDispatcher("/sach.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        Book book = new Book();
        book.setTitle(request.getParameter("title"));
        book.setAuthor(request.getParameter("author"));
        book.setGenre(request.getParameter("genre"));
        book.setPublisher(request.getParameter("publisher"));
        book.setYear(parseInt(request.getParameter("year")));
        book.setIsbn(request.getParameter("isbn"));
        book.setPrice(parseDouble(request.getParameter("price")));
        book.setTotalQuantity(parseInt(request.getParameter("totalQuantity")));
        book.setAvailableQuantity(parseInt(request.getParameter("availableQuantity")));
        book.setLocation(request.getParameter("location"));
        book.setDescription(request.getParameter("description"));

        BookDAO bookDAO = new BookDAO();
        boolean success = bookDAO.addBook(book);
        if (success) {
            request.getSession().setAttribute("message", "Thêm sách mới thành công.");
        } else {
            request.getSession().setAttribute("message", "Không thể thêm sách. Vui lòng kiểm tra lại thông tin.");
        }
        response.sendRedirect(request.getContextPath() + "/books");
    }

    private int parseInt(String value) {
        try {
            return Integer.parseInt(value);
        } catch (NumberFormatException e) {
            return 0;
        }
    }

    private double parseDouble(String value) {
        try {
            return Double.parseDouble(value);
        } catch (NumberFormatException e) {
            return 0;
        }
    }
}
