package com.hzx.maven.entity;

public class ReaderType {
    private Integer readerTypeid;

    private String typename;

    private String num;

    public Integer getReaderTypeid() {
        return readerTypeid;
    }

    public void setReaderTypeid(Integer readerTypeid) {
        this.readerTypeid = readerTypeid;
    }

    public String getTypename() {
        return typename;
    }

    public void setTypename(String typename) {
        this.typename = typename == null ? null : typename.trim();
    }

    public String getNum() {
        return num;
    }

    public void setNum(String num) {
        this.num = num == null ? null : num.trim();
    }

	public ReaderType(Integer readerTypeid, String typename, String num) {
		super();
		this.readerTypeid = readerTypeid;
		this.typename = typename;
		this.num = num;
	}

	public ReaderType() {
		super();
		// TODO Auto-generated constructor stub
	}

	@Override
	public String toString() {
		return "ReaderType [readerTypeid=" + readerTypeid + ", typename=" + typename + ", num=" + num + "]";
	}
    
    
}