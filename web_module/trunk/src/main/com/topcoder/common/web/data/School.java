package com.topcoder.common.web.data;

import com.topcoder.shared.docGen.xml.*;

import java.io.Serializable;


public class School
        implements Serializable, TagRenderer, Comparable, Cloneable, Modifiable {

    private int userId;
    private int schoolId;
    private String name;
    private String sortLetter;
    private String city;
    private State state;
    private Country country;
    private String modified;
    private float gpa;
    private float gpaScale;

    public School() {
        init("");
    }

    public School(String stateName) {
        if (stateName == null) {
            stateName = "";
        }
        init(stateName);
    }

    private void init(String stateName) {
        schoolId = 0;
        name = stateName;
        sortLetter = "";
        city = "";
        state = new State();
        country = new Country();
        modified = "";
        userId = 0;
        gpa = 0;
        gpaScale = 0;
    }

    public boolean equals(Object other) {
        boolean result = false;
        School otherSchool = (School) other;
        if (
                getName().equals(otherSchool.getName())
                && getCity().equals(otherSchool.getCity())
                && getState().getStateCode().equals(otherSchool.getState().getStateCode())
                && getCountry().getCountryCode().equals(otherSchool.getCountry().getCountryCode())
                && getUserId() == otherSchool.getUserId()
                && getSchoolId() == otherSchool.getSchoolId()
                && getSortLetter().equals(otherSchool.getSortLetter())
                && getGpa() == otherSchool.getGpa()
                && getGpaScale() == otherSchool.getGpaScale()
        ) {
            result = true;
        }
        return result;
    }

    public Object clone()
            throws CloneNotSupportedException, OutOfMemoryError {
        School result = null;
        try {
            result = new School();
            result.setUserId(getUserId());
            result.setSchoolId(getSchoolId());
            result.setName(getName());
            result.setSortLetter(getSortLetter());
            result.setCity(getCity());
            result.setState((State) getState().clone());
            result.setCountry((Country) getCountry().clone());
            result.setGpa(getGpa());
            result.setGpaScale(getGpaScale());
            result.setModified(getModified());
        } catch (Exception e) {
            e.printStackTrace();
        }
        return result;
    }

    public int compareTo(Object other) {
        School otherSchool = (School) other;
        StringBuffer temp = new StringBuffer(132);
        char[] beginName = new char[4];
        temp.append(this.getSortLetter());
        temp.append(this.getName());
        if (temp.length() > 5) {
            temp.getChars(1, 5, beginName, 0);
            if (beginName[0] == 'T' && beginName[1] == 'h' && beginName[2] == 'e' && beginName[3] == ' ') {
                temp.delete(1, 5);
            }
        }
        String thisComparator = temp.toString();
        temp.delete(0, temp.length());
        temp.append(otherSchool.getSortLetter());
        temp.append(otherSchool.getName());
        if (temp.length() > 5) {
            temp.getChars(1, 5, beginName, 0);
            if (beginName[0] == 'T' && beginName[1] == 'h' && beginName[2] == 'e' && beginName[3] == ' ') {
                temp.delete(1, 5);
            }
        }
        String otherComparator = temp.toString();
        return thisComparator.compareToIgnoreCase(otherComparator);
    }

// set
    public void setAllModifiedStable() throws Exception {
        setModified("S");
    }

    public void setSchoolId(int schoolId) {
        this.schoolId = schoolId;
    }

    public void setName(String name) {
        this.name = name;
    }

    public void setSortLetter(String sortLetter) {
        this.sortLetter = sortLetter;
    }

    public void setCity(String city) {
        this.city = city;
    }

    public void setState(State state) {
        this.state = state;
    }

    public void setCountry(Country country) {
        this.country = country;
    }

    public void setModified(String modified) {
        this.modified = modified;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public void setGpa(float gpa) {
        this.gpa = gpa;
    }

    public void setGpaScale(float gpaScale) {
        this.gpaScale = gpaScale;
    }

// get

    public int getSchoolId() {
        return schoolId;
    }

    public String getName() {
        return name;
    }

    public String getSortLetter() {
        return sortLetter;
    }

    public String getCity() {
        return city;
    }

    public State getState() {
        return state;
    }

    public Country getCountry() {
        return country;
    }

    public String getModified() {
        return modified;
    }

    public int getUserId() {
        return userId;
    }
  
    public float getGpa() {
        return gpa;
    }

    public float getGpaScale() {
        return gpaScale;
    }

    public RecordTag getXML() throws Exception {
        RecordTag result = null;
        try {
            result = new RecordTag("School");
            result.addTag(new ValueTag("SchoolId", schoolId));
            result.addTag(new ValueTag("Name", name));
            result.addTag(new ValueTag("Letter", sortLetter));
            result.addTag(new ValueTag("City", city));
            result.addTag(state.getXML());
            result.addTag(country.getXML());
            result.addTag(new ValueTag("Modified", modified));
            result.addTag(new ValueTag("UserId", userId));
            result.addTag(new ValueTag("Gpa", getGpa()));
            result.addTag(new ValueTag("GpaScale", getGpaScale()));
        } catch (Exception e) {
            throw new Exception("common.web.data.School getXML ERROR: " + e);
        }
        return result;
    }

}
