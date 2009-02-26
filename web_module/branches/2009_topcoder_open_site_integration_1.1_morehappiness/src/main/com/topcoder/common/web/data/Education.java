package com.topcoder.common.web.data;

import com.topcoder.shared.docGen.xml.RecordTag;
import com.topcoder.shared.docGen.xml.TagRenderer;
import com.topcoder.shared.docGen.xml.ValueTag;

import java.io.Serializable;


public final class Education
        implements Serializable, Cloneable, TagRenderer, Modifiable {

    private int educationId;
    private int coderId;
    private School school;
    private Degree degree;
    private String major;
    private int graduationYear;
    private int graduationMonth;
    private String modified;

    public Education() {
        coderId = 0;
        educationId = 0;
        school = new School();
        degree = new Degree();
        major = "";
        graduationYear = 0;
        graduationMonth = 0;
        modified = "";
    }

    public boolean equals(Object other) {
        boolean result = false;
        Education otherEd = (Education) other;
        if (
                getEducationId() == otherEd.getEducationId()
                && getSchool().getSchoolId() == otherEd.getSchool().getSchoolId()
                && getDegree().getDegreeId() == otherEd.getDegree().getDegreeId()
                && getMajor().equals(otherEd.getMajor())
                && getGraduationYear() == otherEd.getGraduationYear()
                && getGraduationMonth() == otherEd.getGraduationMonth()
                && getCoderId() == otherEd.getCoderId()
        ) {
            result = true;
        }
        return result;
    }

    public Object clone()
            throws CloneNotSupportedException, OutOfMemoryError {
        Education result = null;
        try {
            result = new Education();
            result.setCoderId(getCoderId());
            result.setEducationId(getEducationId());
            result.setSchool((School) getSchool().clone());
            result.setDegree((Degree) getDegree().clone());
            result.setMajor(getMajor());
            result.setGraduationYear(getGraduationYear());
            result.setGraduationMonth(getGraduationMonth());
            result.setModified(getModified());
        } catch (Exception e) {
            e.printStackTrace();
        }
        return result;
    }


//submit
    public void toggleModified() {
        if (getModified().equals("S")) setModified("U");
        if (getModified().equals("")) setModified("A");
    }


// set
    public void setAllModifiedStable() throws Exception {
        setModified("S");
    }

    public void setEducationId(int educationId) {
        this.educationId = educationId;
    }

    public void setCoderId(int coderId) {
        this.coderId = coderId;
    }

    public void setSchool(School school) {
        this.school = school;
    }

    public void setDegree(Degree degree) {
        this.degree = degree;
    }

    public void setMajor(String major) {
        this.major = major;
    }

    public void setGraduationYear(int graduationYear) {
        this.graduationYear = graduationYear;
    }

    public void setGraduationMonth(int graduationMonth) {
        this.graduationMonth = graduationMonth;
    }

    public void setModified(String modified) {
        this.modified = modified;
    }


// get
    public int getEducationId() {
        return educationId;
    }

    public int getCoderId() {
        return coderId;
    }

    public School getSchool() {
        return school;
    }

    public Degree getDegree() {
        return degree;
    }

    public String getMajor() {
        return major;
    }

    public int getGraduationYear() {
        return graduationYear;
    }

    public int getGraduationMonth() {
        return graduationMonth;
    }

    public String getModified() {
        return modified;
    }

    public RecordTag getXML() throws Exception {
        RecordTag result = null;
        try {
            result = new RecordTag("Education");
            result.addTag(new ValueTag("EducationId", educationId));
            result.addTag(new ValueTag("CoderId", coderId));
            result.addTag(school.getXML());
            result.addTag(degree.getXML());
            result.addTag(new ValueTag("Major", major));
            result.addTag(new ValueTag("GraduationYear", graduationYear));
            result.addTag(new ValueTag("GraduationMonth", graduationMonth));
            result.addTag(new ValueTag("Modified", modified));
        } catch (Exception e) {
            e.printStackTrace();
            throw new Exception("common.web.data.Education getXML ERROR: " + e);
        }
        return result;
    }

}

