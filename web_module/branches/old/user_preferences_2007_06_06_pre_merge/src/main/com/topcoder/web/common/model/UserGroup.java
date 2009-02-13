package com.topcoder.web.common.model;


/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: Apr 13, 2006
 */
public class UserGroup extends Base {
    private Long id;
    private User user;
    private SecurityGroup securityGroup;
    private Long createUserId;
    private Integer securityStatusId;

    public UserGroup() {
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public SecurityGroup getSecurityGroup() {
        return securityGroup;
    }

    public void setSecurityGroup(SecurityGroup securityGroup) {
        this.securityGroup = securityGroup;
    }

    public Long getCreateUserId() {
        return createUserId;
    }

    public void setCreateUserId(Long createUserId) {
        this.createUserId = createUserId;
    }

    public Integer getSecurityStatusId() {
        return securityStatusId;
    }

    public void setSecurityStatusId(Integer securityStatusId) {
        this.securityStatusId = securityStatusId;
    }


}
