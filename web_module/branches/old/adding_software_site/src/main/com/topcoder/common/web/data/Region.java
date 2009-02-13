package com.topcoder.common.web.data;

import com.topcoder.shared.docGen.xml.*;

import java.io.Serializable;
import java.util.ArrayList;

public final class Region
        implements Serializable, Cloneable, TagRenderer, QueryCriteria {

    private String RegionCode;
    private Country Country;
    private String RegionName;

    public Region() {
        RegionCode = "";
        Country = new Country();
        RegionName = "";
    }

    public boolean equals(Object obj) {
        boolean result = false;
        Region other = (Region) obj;
        if (
                this.getRegionCode().equals(other.getRegionCode())
                && this.getCountry().equals(other.getCountry())
                && this.getRegionName().equals(other.getRegionName())
        ) {
            result = true;
        }
        return result;
    }

    public ArrayList getCriteria(Object obj) {
        ArrayList result = new ArrayList(4);
        Region other = (Region) obj;
        if (!this.getRegionCode().equals(other.getRegionCode())) {
            String[] criteria = {"String", "regions", "region_code", this.getRegionCode()};
            result.add(criteria);
        }
        if (!this.getRegionName().equals(other.getRegionName())) {
            String[] criteria = {"String", "regions", "region_name", this.getRegionName()};
            result.add(criteria);
        }
        result.addAll(this.getCountry().getCriteria(other.getCountry()));
        result.trimToSize();
        return result;
    }

    public Object clone()
            throws CloneNotSupportedException, OutOfMemoryError {
        Region result = null;
        try {
            result = new Region();
            result.setRegionCode(getRegionCode());
            result.setRegionName(getRegionName());
            result.setCountry((Country) getCountry().clone());
        } catch (Exception e) {
            e.printStackTrace();
        }
        return result;
    }


    public void setRegionCode(String RegionCode) {
        this.RegionCode = RegionCode;
    }

    public void setCountry(Country Country) {
        this.Country = Country;
    }

    public void setRegionName(String RegionName) {
        this.RegionName = RegionName;
    }

    public String getRegionCode() {
        return RegionCode;
    }

    public Country getCountry() {
        return Country;
    }

    public String getRegionName() {
        return RegionName;
    }

    public RecordTag getXML() throws Exception {
        RecordTag result = null;
        try {
            result = new RecordTag("Region");
            result.addTag(new ValueTag("RegionCode", RegionCode));
            result.addTag(Country.getXML());
            result.addTag(new ValueTag("RegionName", RegionName));
        } catch (Exception e) {
            throw new Exception("common.web.data.Region getXML ERROR: " + e);
        }
        return result;
    }

}

