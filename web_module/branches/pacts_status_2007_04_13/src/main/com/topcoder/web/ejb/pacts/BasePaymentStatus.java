/*
* BasePaymentStatus
*
* Created Apr 17, 2007
*/
package com.topcoder.web.ejb.pacts;

/**
 * @author Pablo Wolfus (Pulky)
 * @version $Id$
 */
public class BasePaymentStatus {

    private Long id;
    private String desc;
    
    public BasePaymentStatus() {
        super();
    }
    
    public BasePaymentStatus(Long id, String desc) {
        super();
        this.id = id;
        this.desc = desc;
    }
    
    public String getDesc() {
        return desc;
    }
    public void setDesc(String desc) {
        this.desc = desc;
    }
    public Long getId() {
        return id;
    }
    public void setId(Long id) {
        this.id = id;
    }
    
    
}
