package com.hzx.maven.entity;

public class BookType {
    private Integer typeid;

    private String typename;

    private Integer borrowday;

    public Integer getTypeid() {
        return typeid;
    }

    public void setTypeid(Integer typeid) {
        this.typeid = typeid;
    }

    public String getTypename() {
        return typename;
    }

    public void setTypename(String typename) {
        this.typename = typename == null ? null : typename.trim();
    }

    public Integer getBorrowday() {
        return borrowday;
    }

    public void setBorrowday(Integer borrowday) {
        this.borrowday = borrowday;
    }

	public BookType(Integer typeid, String typename, Integer borrowday) {
		super();
		this.typeid = typeid;
		this.typename = typename;
		this.borrowday = borrowday;
	}

	public BookType() {
		super();
		// TODO Auto-generated constructor stub
	}

	@Override
	public String toString() {
		return "BookType [typeid=" + typeid + ", typename=" + typename + ", borrowday=" + borrowday + "]";
	}
}