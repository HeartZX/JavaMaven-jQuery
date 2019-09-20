package com.hzx.maven.entity;

public class Book {
    private Integer bookid;

    private String bookname;

    private Integer typeid;

    private Integer caseid;

    private String author;

    private String price;

    private Integer borrowsum;

    private String concern;
    
    private BookType booktype;
    
    private BookCase bookcase;

    public Integer getBookid() {
        return bookid;
    }

    public void setBookid(Integer bookid) {
        this.bookid = bookid;
    }

    public String getBookname() {
        return bookname;
    }

    public void setBookname(String bookname) {
        this.bookname = bookname == null ? null : bookname.trim();
    }

    public Integer getTypeid() {
        return typeid;
    }

    public void setTypeid(Integer typeid) {
        this.typeid = typeid;
    }

    public Integer getCaseid() {
        return caseid;
    }

    public void setCaseid(Integer caseid) {
        this.caseid = caseid;
    }

    public String getAuthor() {
        return author;
    }

    public void setAuthor(String author) {
        this.author = author == null ? null : author.trim();
    }

    public String getPrice() {
        return price;
    }

    public void setPrice(String price) {
        this.price = price == null ? null : price.trim();
    }

    public Integer getBorrowsum() {
        return borrowsum;
    }

    public void setBorrowsum(Integer borrowsum) {
        this.borrowsum = borrowsum;
    }

    public String getConcern() {
        return concern;
    }

    public void setConcern(String concern) {
        this.concern = concern == null ? null : concern.trim();
    }

	public BookType getBooktype() {
		return booktype;
	}

	public void setBooktype(BookType booktype) {
		this.booktype = booktype;
	}

	public BookCase getBookcase() {
		return bookcase;
	}

	public void setBookcase(BookCase bookcase) {
		this.bookcase = bookcase;
	}

	public Book(Integer bookid, String bookname, Integer typeid, Integer caseid, String author, String price,
			Integer borrowsum, String concern, BookType booktype, BookCase bookcase) {
		super();
		this.bookid = bookid;
		this.bookname = bookname;
		this.typeid = typeid;
		this.caseid = caseid;
		this.author = author;
		this.price = price;
		this.borrowsum = borrowsum;
		this.concern = concern;
		this.booktype = booktype;
		this.bookcase = bookcase;
	}

	public Book() {
		super();
		// TODO Auto-generated constructor stub
	}

	@Override
	public String toString() {
		return "Book [bookid=" + bookid + ", bookname=" + bookname + ", typeid=" + typeid + ", caseid=" + caseid
				+ ", author=" + author + ", price=" + price + ", borrowsum=" + borrowsum + ", concern=" + concern
				+ ", booktype=" + booktype + ", bookcase=" + bookcase + "]";
	}
	
}