package com.topcoder.common.web.data;

import com.topcoder.shared.docGen.xml.*;

import java.io.Serializable;
import java.util.ArrayList;

public final class Country
        implements Serializable, Cloneable, TagRenderer, QueryCriteria {

    public static int NO = 0;
    public static int YES = 1;

    private String countryCode;
    private String countryName;
    private int participating;

    public Country() {
        countryCode = "";
        countryName = "";
        participating = NO;
    }

    public boolean equals(Object obj) {
        boolean result = false;
        Country other = (Country) obj;
        if (
                this.getCountryCode().equals(other.getCountryCode())
                && this.getCountryName().equals(other.getCountryName())
        ) {
            result = true;
        }
        return result;
    }

    public ArrayList getCriteria(Object obj) {
        ArrayList result = new ArrayList(2);
        Country other = (Country) obj;
        if (!this.getCountryCode().equals(other.getCountryCode())) {
            String[] criteria = {"String", "country", "country_code", this.getCountryCode()};
            result.add(criteria);
        }
        if (!this.getCountryName().equals(other.getCountryName())) {
            String[] criteria = {"String", "country", "country_name", this.getCountryName()};
            result.add(criteria);
        }
        if (this.getParticipating() == other.getParticipating()) {
            String[] criteria = {"int", "country", "participating", Integer.toString(this.getParticipating())};
            result.add(criteria);
        }
        result.trimToSize();
        return result;
    }

    public Object clone()
            throws CloneNotSupportedException, OutOfMemoryError {
        Country result = null;
        try {
            result = new Country();
            result.setCountryCode(getCountryCode());
            result.setCountryName(getCountryName());
            result.setParticipating(getParticipating());
        } catch (Exception e) {
            e.printStackTrace();
        }
        return result;
    }


    // set methods
    public void setCountryCode(String countryCode) {
        this.countryCode = countryCode;
    }

    public void setCountryName(String countryName) {
        this.countryName = countryName;
    }

    public void setParticipating(int participating) {
        this.participating = participating;
    }

    // get methods
    public String getCountryCode() {
        return countryCode;
    }

    public String getCountryName() {
        return countryName;
    }

    public int getParticipating() {
        return participating;
    }

    public RecordTag getXML() throws Exception {
        RecordTag result = null;
        try {
            result = getXML("Country");
        } catch (Exception e) {
            throw new Exception("common.web.data.Country getXML ERROR: " + e);
        }
        return result;
    }

    public RecordTag getXML(String name) throws Exception {
        RecordTag result = null;
        try {
            result = new RecordTag(name);
            result.addTag(new ValueTag("CountryCode", countryCode));
            result.addTag(new ValueTag("CountryName", countryName));
            result.addTag(new ValueTag("Participating", participating));
        } catch (Exception e) {
            throw new Exception("common.web.data.Country getXML ERROR: " + e);
        }
        return result;
    }

}

