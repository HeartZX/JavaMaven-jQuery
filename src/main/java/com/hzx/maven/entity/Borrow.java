package com.hzx.maven.entity;

import java.util.Date;

public class Borrow {
    private Integer id;

    private Integer readerId;

    private Integer bookId;

    private Date borrowtime;

    private Date returntime;

    private Integer isreturn;
    private Reader reader;
    private Book book;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getReaderId() {
        return readerId;
    }

    public void setReaderId(Integer readerId) {
        this.readerId = readerId;
    }

    public Integer getBookId() {
        return bookId;
    }

    public void setBookId(Integer bookId) {
        this.bookId = bookId;
    }

    public Date getBorrowtime() {
        return borrowtime;
    }

    public void setBorrowtime(Date borrowtime) {
        this.borrowtime = borrowtime;
    }

    public Date getReturntime() {
        return returntime;
    }

    public void setReturntime(Date returntime) {
        this.returntime = returntime;
    }

    public Integer getIsreturn() {
        return isreturn;
    }

    public void setIsreturn(Integer isreturn) {
        this.isreturn = isreturn;
    }

    public Reader getReader() {
		return reader;
	}

	public void setReader(Reader reader) {
		this.reader = reader;
	}

	public Book getBook() {
		return book;
	}

	public void setBook(Book book) {
		this.book = book;
	}

	public Borrow(Integer id, Integer readerId, Integer bookId, Date borrowtime, Date returntime, Integer isreturn,
			Reader reader, Book book) {
		super();
		this.id = id;
		this.readerId = readerId;
		this.bookId = bookId;
		this.borrowtime = borrowtime;
		this.returntime = returntime;
		this.isreturn = isreturn;
		this.reader = reader;
		this.book = book;
	}

	public Borrow() {
		super();
		// TODO Auto-generated constructor stub
	}

	@Override
	public String toString() {
		return "Borrow [id=" + id + ", readerId=" + readerId + ", bookId=" + bookId + ", borrowtime=" + borrowtime
				+ ", returntime=" + returntime + ", isreturn=" + isreturn + ", reader=" + reader + ", book=" + book
				+ "]";
	}

	
    
}