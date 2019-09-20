package com.hzx.maven.entity;

public class Reader {
    private Integer id;

    private String readername;

    private Integer readerTypeid;

    private String sex;

    private String tel;

    private String email;

    private String remark;
    
    
    private ReaderType readertype;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getReadername() {
        return readername;
    }

    public void setReadername(String readername) {
        this.readername = readername == null ? null : readername.trim();
    }

   

  
	

	public Integer getReaderTypeid() {
		return readerTypeid;
	}

	public void setReaderTypeid(Integer readerTypeid) {
		this.readerTypeid = readerTypeid;
	}

	public String getSex() {
        return sex;
    }

    public void setSex(String sex) {
        this.sex = sex == null ? null : sex.trim();
    }

    public String getTel() {
        return tel;
    }

    public void setTel(String tel) {
        this.tel = tel == null ? null : tel.trim();
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email == null ? null : email.trim();
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark == null ? null : remark.trim();
    }

	public ReaderType getReadertype() {
		return readertype;
	}

	public void setReadertype(ReaderType readertype) {
		this.readertype = readertype;
	}

	

	public Reader() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Reader(Integer id, String readername, Integer readerTypeid, String sex, String tel, String email,
			String remark, ReaderType readertype) {
		super();
		this.id = id;
		this.readername = readername;
		this.readerTypeid = readerTypeid;
		this.sex = sex;
		this.tel = tel;
		this.email = email;
		this.remark = remark;
		this.readertype = readertype;
	}

	@Override
	public String toString() {
		return "Reader [id=" + id + ", readername=" + readername + ", readerTypeid=" + readerTypeid + ", sex=" + sex
				+ ", tel=" + tel + ", email=" + email + ", remark=" + remark + ", readertype=" + readertype + "]";
	}

	
	

	


	
    
}