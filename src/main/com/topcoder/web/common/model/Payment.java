package com.topcoder.web.common.model;


/**
 * A class to hold Payment data.
 *
 * @author VolodymyrK
 */
public class Payment extends Base {

    private Long id;
    private Long userId;

    public Payment() {
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Long getUserId() {
        return userId;
    }

    public void setUserId(Long userId) {
        this.userId = userId;
    }

}
