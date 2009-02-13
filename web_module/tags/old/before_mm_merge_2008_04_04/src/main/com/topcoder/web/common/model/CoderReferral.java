package com.topcoder.web.common.model;

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: May 30, 2006
 */
public class CoderReferral extends Base {

    private Long id;
    private Coder coder;
    private Referral referral;
    private Coder referenceCoder;
    private String other;

    public CoderReferral() {
        super();
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Coder getCoder() {
        return coder;
    }

    public void setCoder(Coder coder) {
        this.coder = coder;
    }

    public Referral getReferral() {
        return referral;
    }

    public void setReferral(Referral referral) {
        this.referral = referral;
    }

    public Coder getReferenceCoder() {
        return referenceCoder;
    }

    public void setReferenceCoder(Coder referenceCoder) {
        this.referenceCoder = referenceCoder;
    }

    public String getOther() {
        return other;
    }

    public void setOther(String other) {
        this.other = other;
    }


}
