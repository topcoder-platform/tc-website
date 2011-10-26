package com.topcoder.web.tc.model;

import com.topcoder.web.common.model.Base;
import com.topcoder.web.common.model.User;

/**
 * @author dok
 * @version $Revision: 53709 $ Date: 2005/01/01 00:00:00
 *          Create Date: Sep 8, 2006
 */
public class AOLAlertInfo extends Base {
    private Long id;
    private User user;
    private String aolEncryptedUserId;

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

    public String getAolEncryptedUserId() {
        return aolEncryptedUserId;
    }

    public void setAolEncryptedUserId(String aolEncryptedUserId) {
        this.aolEncryptedUserId = aolEncryptedUserId;
    }
}
