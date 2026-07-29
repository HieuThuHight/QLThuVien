package controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.DashboardDAO;

import java.io.IOException;

@WebServlet(name = "AdminDashboardServlet", urlPatterns = {"/admin"})
public class AdminDashboardServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        DashboardDAO dashboardDAO = new DashboardDAO();

        request.setAttribute("totalBooks", dashboardDAO.countTotalBooks());
        request.setAttribute("totalReaders", dashboardDAO.countTotalReaders());
        request.setAttribute("currentBorrowings", dashboardDAO.countCurrentBorrowings());
        request.setAttribute("overdueCount", dashboardDAO.countOverdue());
        request.setAttribute("recentBorrowings", dashboardDAO.getRecentBorrowings(6));

        request.getRequestDispatcher("/admin.jsp").forward(request, response);
    }
}
