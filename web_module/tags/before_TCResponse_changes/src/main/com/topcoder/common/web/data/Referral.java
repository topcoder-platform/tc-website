package com.topcoder.common.web.data;

import com.topcoder.shared.docGen.xml.*;

import java.io.Serializable;


public class Referral implements Serializable, TagRenderer { //, Cloneable {

    public static int INACTIVE = 0;
    public static int ACTIVE = 1;

    private int referralId;
    private String referralDesc;
    private int sort;
    private int statusId;

    public Referral() {
        referralId = 0;
        referralDesc = "";
        sort = 0;
        statusId = INACTIVE;
    }


/*
  public Object clone()
    throws CloneNotSupportedException, OutOfMemoryError {
    Referral result = null;
    try {
      result = new Referral();
      result.setReferralId(getReferralId());
      result.setReferralDesc(getReferralDesc());
      result.setSort(getSort());
      result.setStatusId(getStatusId());
    } catch (Exception e) {
      e.printStackTrace();
    }
    return result;
  }
*/


    //Set
    public void setReferralId(int referralId) {
        this.referralId = referralId;
    }

    public void setReferralDesc(String referralDesc) {
        this.referralDesc = referralDesc;
    }

    public void setSort(int sort) {
        this.sort = sort;
    }

    public void setStatusId(int statusId) {
        this.statusId = statusId;
    }

    // Get
    public int getReferralId() {
        return referralId;
    }

    public String getReferralDesc() {
        return referralDesc;
    }

    public int getSort() {
        return sort;
    }

    public int getStatusId() {
        return statusId;
    }

    public RecordTag getXML() throws Exception {
        RecordTag result = null;
        try {
            result = getReferralXML();
        } catch (Exception e) {
            throw new Exception("common.web.data.Referral:getXML:ERROR:\n" + e);
        }
        return result;
    }

    protected RecordTag getReferralXML() throws Exception {
        RecordTag result = null;
        try {
            result = new RecordTag("Referral");
            result.addTag(new ValueTag("ReferralId", referralId));
            result.addTag(new ValueTag("ReferralDesc", referralDesc));
            result.addTag(new ValueTag("Sort", sort));
            result.addTag(new ValueTag("StatusId", statusId));
        } catch (Exception e) {
            throw new Exception("common.web.data.Referral:getReferralXML:ERROR:\n" + e);
        }
        return result;
    }
}
