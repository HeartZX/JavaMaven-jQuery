package com.hzx.maven.entity;

public class Info {
    private Integer id;

    private String libraryName;

    private String masterName;

    private String bulidTime;

    private String contactEmail;

    private String contactAddress;

    private String contactPhone;

    private String contactWeb;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getLibraryName() {
        return libraryName;
    }

    public void setLibraryName(String libraryName) {
        this.libraryName = libraryName == null ? null : libraryName.trim();
    }

    public String getMasterName() {
        return masterName;
    }

    public void setMasterName(String masterName) {
        this.masterName = masterName == null ? null : masterName.trim();
    }

    public String getBulidTime() {
        return bulidTime;
    }

    public void setBulidTime(String bulidTime) {
        this.bulidTime = bulidTime == null ? null : bulidTime.trim();
    }

    public String getContactEmail() {
        return contactEmail;
    }

    public void setContactEmail(String contactEmail) {
        this.contactEmail = contactEmail == null ? null : contactEmail.trim();
    }

    public String getContactAddress() {
        return contactAddress;
    }

    public void setContactAddress(String contactAddress) {
        this.contactAddress = contactAddress == null ? null : contactAddress.trim();
    }

    public String getContactPhone() {
        return contactPhone;
    }

    public void setContactPhone(String contactPhone) {
        this.contactPhone = contactPhone == null ? null : contactPhone.trim();
    }

    public String getContactWeb() {
        return contactWeb;
    }

    public void setContactWeb(String contactWeb) {
        this.contactWeb = contactWeb == null ? null : contactWeb.trim();
    }

	public Info(Integer id, String libraryName, String masterName, String bulidTime, String contactEmail,
			String contactAddress, String contactPhone, String contactWeb) {
		super();
		this.id = id;
		this.libraryName = libraryName;
		this.masterName = masterName;
		this.bulidTime = bulidTime;
		this.contactEmail = contactEmail;
		this.contactAddress = contactAddress;
		this.contactPhone = contactPhone;
		this.contactWeb = contactWeb;
	}

	public Info() {
		super();
		// TODO Auto-generated constructor stub
	}

	@Override
	public String toString() {
		return "Info [id=" + id + ", libraryName=" + libraryName + ", masterName=" + masterName + ", bulidTime="
				+ bulidTime + ", contactEmail=" + contactEmail + ", contactAddress=" + contactAddress
				+ ", contactPhone=" + contactPhone + ", contactWeb=" + contactWeb + "]";
	}
    
}