package com.topcoder.web.common.model;


/**
 * A class to hold Payment Method data.
 *
 * @author VolodymyrK
 */
public class PaymentMethod extends Base {

    private Long id;
    private String name;

    public PaymentMethod() {
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

}
