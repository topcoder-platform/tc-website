package com.topcoder.common.web.data;


import com.topcoder.shared.docGen.xml.RecordTag;
import com.topcoder.shared.docGen.xml.TagRenderer;
import com.topcoder.shared.docGen.xml.ValueTag;

import java.io.Serializable;

public final class Organization
        implements
        Serializable
        , Cloneable
        , TagRenderer {

    private int OrganizationId;
    private String OrganizationDesc;
    private String Organization;

    public Organization() {
        OrganizationId = 0;
        OrganizationDesc = "";
        Organization = "";
    }

    public Object clone()
            throws CloneNotSupportedException, OutOfMemoryError {
        Organization result = null;
        try {
            result = new Organization();
            result.setOrganizationId(getOrganizationId());
            result.setOrganizationDesc(getOrganizationDesc());
            result.setOrganization(getOrganization());
        } catch (Exception e) {
            e.printStackTrace();
        }
        return result;
    }


    // set methods
    public void setOrganizationId(int OrganizationId) {
        this.OrganizationId = OrganizationId;
    }

    public void setOrganizationDesc(String OrganizationDesc) {
        this.OrganizationDesc = OrganizationDesc;
    }

    public void setOrganization(String Organization) {
        this.Organization = Organization;
    }

    // get methods
    public int getOrganizationId() {
        return OrganizationId;
    }

    public String getOrganizationDesc() {
        return OrganizationDesc;
    }

    public String getOrganization() {
        return Organization;
    }

    public RecordTag getXML() throws Exception {
        RecordTag result = null;
        try {
            result = getXML("Organization");
        } catch (Exception e) {
            throw new Exception("common.Organization getXML ERROR: " + e);
        }
        return result;
    }

    public RecordTag getXML(String name) throws Exception {
        RecordTag result = null;
        try {
            result = new RecordTag(name);
            result.addTag(new ValueTag("OrganizationId", OrganizationId));
            result.addTag(new ValueTag("OrganizationDesc", OrganizationDesc));
            result.addTag(new ValueTag("Organization", Organization));
        } catch (Exception e) {
            throw new Exception("common.web.data.Organization getXML ERROR: " + e);
        }
        return result;
    }

}

