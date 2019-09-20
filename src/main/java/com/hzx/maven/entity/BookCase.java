package com.hzx.maven.entity;

public class BookCase {
    private Integer caseid;

    private String casename;

    public Integer getCaseid() {
        return caseid;
    }

    public void setCaseid(Integer caseid) {
        this.caseid = caseid;
    }

    public String getCasename() {
        return casename;
    }

    public void setCasename(String casename) {
        this.casename = casename == null ? null : casename.trim();
    }

	public BookCase(Integer caseid, String casename) {
		super();
		this.caseid = caseid;
		this.casename = casename;
	}

	public BookCase() {
		super();
		// TODO Auto-generated constructor stub
	}

	@Override
	public String toString() {
		return "BookCase [caseid=" + caseid + ", casename=" + casename + "]";
	}
}