package com.topcoder.web.common.model;


/**
 * A class to hold user preference data.
 *
 * @author cucu
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: July 6, 2006
 */
public class PreferenceValue extends Base implements Comparable {

    private Integer id;
    private String value;
    private Preference preference;
    private String description;
    private Integer sort;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getValue() {
        return value;
    }

    public Preference getPreference() {
        return preference;
    }

    public void setPreference(Preference preference) {
        this.preference = preference;
    }

    public Integer getSort() {
        return sort;
    }

    public void setSort(Integer sort) {
        this.sort = sort;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public void setValue(String value) {
        this.value = value;
    }

    public int compareTo(Object o) {
        PreferenceValue other = (PreferenceValue) o;
        return getSort().compareTo(other.getSort());
    }
}
