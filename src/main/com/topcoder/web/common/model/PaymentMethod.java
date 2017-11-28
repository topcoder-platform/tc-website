package com.topcoder.web.common.model;


/**
 * A class to hold Payment Method data.
 *
 * <p>
 * Version 1.1 (Topcoder - Add New Payment Provider) Change notes:
 *   <ol>
 *     <li>Added eligible attribute to determinate whether the payment method is allowed or not.</li>
 *   </ol>
 * </p>
 *
 * @author VolodymyrK, TCSCODER
 * @version 1.1
 */
public class PaymentMethod extends Base {

    private Long id;
    private String name;
    private boolean eligible = true;

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

    public boolean isEligible() {
        return eligible;
    }

    public void setEligible(boolean eligible) {
        this.eligible = eligible;
    }

}
