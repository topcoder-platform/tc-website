package com.topcoder.web.common.model;

public class UserSecurityKey extends Base {
    private Long id;
    private User user;
    private String securityKey;
    private int securityKeyTypeId;


    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

	public String getSecurityKey() {
		return securityKey;
	}

	public void setSecurityKey(String securityKey) {
		this.securityKey = securityKey;
	}

	public int getSecurityKeyTypeId() {
		return securityKeyTypeId;
	}

	public void setSecurityKeyTypeId(int securityKeyTypeId) {
		this.securityKeyTypeId = securityKeyTypeId;
	}

}
