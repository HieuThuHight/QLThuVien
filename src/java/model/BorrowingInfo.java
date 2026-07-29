package model;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

public class BorrowingInfo {
    private int loanId;
    private String readerName;
    private LocalDateTime borrowDate;
    private String dueDate;
    private String status;

    public BorrowingInfo() {
    }

    public BorrowingInfo(int loanId, String readerName, LocalDateTime borrowDate, String dueDate, String status) {
        this.loanId = loanId;
        this.readerName = readerName;
        this.borrowDate = borrowDate;
        this.dueDate = dueDate;
        this.status = status;
    }

    public int getLoanId() {
        return loanId;
    }

    public void setLoanId(int loanId) {
        this.loanId = loanId;
    }

    public String getReaderName() {
        return readerName;
    }

    public void setReaderName(String readerName) {
        this.readerName = readerName;
    }

    public LocalDateTime getBorrowDate() {
        return borrowDate;
    }

    public void setBorrowDate(LocalDateTime borrowDate) {
        this.borrowDate = borrowDate;
    }

    public String getDueDate() {
        return dueDate;
    }

    public void setDueDate(String dueDate) {
        this.dueDate = dueDate;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getFormattedBorrowDate() {
        if (borrowDate == null) {
            return "-";
        }
        return borrowDate.format(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm"));
    }
}
