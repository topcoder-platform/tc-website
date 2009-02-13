package com.topcoder.common.web.data;

import com.topcoder.shared.docGen.xml.RecordTag;
import com.topcoder.shared.docGen.xml.TagRenderer;
import com.topcoder.shared.docGen.xml.ValueTag;

import java.io.Serializable;


public final class Experience
        implements Serializable, Cloneable, TagRenderer, Modifiable {

    private int CoderId;
    private int ExperienceId;
    private String Company;
    private String City;
    private State State;
    private Country Country;
    private int StartYear;
    private int StartMonth;
    private int EndYear;
    private int EndMonth;
    private String TitleDesc;
    private String Description;
    private String Modified;
    private Title Title;
    private Organization organization;
    private ExperienceType experienceType;


    public Experience() {
        CoderId = 0;
        ExperienceId = 0;
        Company = "";
        City = "";
        State = new State();
        Country = new Country();
        StartYear = 0;
        StartMonth = 0;
        EndYear = 0;
        EndMonth = 0;
        TitleDesc = "";
        Description = "";
        Title = new Title();
        organization = new Organization();
        experienceType = new ExperienceType();
        Modified = "";
    }

    public boolean equals(Object other) {
        boolean result = false;
        Experience otherExp = (Experience) other;
        if (
                getExperienceId() == otherExp.getExperienceId()
                && getCompany().equals(otherExp.getCompany())
                && getCity().equals(otherExp.getCity())
                && getState().getStateCode().equals(otherExp.getState().getStateCode())
                && getCountry().getCountryCode().equals(otherExp.getCountry().getCountryCode())
                && getStartYear() == otherExp.getStartYear()
                && getStartMonth() == otherExp.getStartMonth()
                && getEndYear() == otherExp.getEndYear()
                && getEndMonth() == otherExp.getEndMonth()
                && getTitleDesc().equals(otherExp.getTitleDesc())
                && getDescription().equals(otherExp.getDescription())
                && getTitle().getTitleId() == otherExp.getTitle().getTitleId()
                && getOrganization().getOrganizationId() == otherExp.getOrganization().getOrganizationId()
                && getExperienceType().getExperienceTypeId() == otherExp.getExperienceType().getExperienceTypeId()
                && getCoderId() == otherExp.getCoderId()
        ) {
            result = true;
        }
        return result;
    }

    public Object clone()
            throws CloneNotSupportedException, OutOfMemoryError {
        Experience result = null;
        try {
            result = new Experience();
            result.setCoderId(getCoderId());
            result.setExperienceId(getExperienceId());
            result.setCompany(getCompany());
            result.setCity(getCity());
            result.setState((State) getState().clone());
            result.setCountry((Country) getCountry().clone());
            result.setStartYear(getStartYear());
            result.setStartMonth(getStartMonth());
            result.setEndYear(getEndYear());
            result.setEndMonth(getEndMonth());
            result.setTitleDesc(getTitleDesc());
            result.setDescription(getDescription());
            result.setTitle((Title) getTitle().clone());
            result.setOrganization((Organization) getOrganization().clone());
            result.setExperienceType((ExperienceType) getExperienceType().clone());
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

    public void setCoderId(int CoderId) {
        this.CoderId = CoderId;
    }

    public void setExperienceId(int ExperienceId) {
        this.ExperienceId = ExperienceId;
    }

    public void setCompany(String Company) {
        this.Company = Company;
    }

    public void setCity(String City) {
        this.City = City;
    }

    public void setState(State State) {
        this.State = State;
    }

    public void setCountry(Country Country) {
        this.Country = Country;
    }

    public void setStartYear(int StartYear) {
        this.StartYear = StartYear;
    }

    public void setStartMonth(int StartMonth) {
        this.StartMonth = StartMonth;
    }

    public void setEndYear(int EndYear) {
        this.EndYear = EndYear;
    }

    public void setEndMonth(int EndMonth) {
        this.EndMonth = EndMonth;
    }

    public void setTitleDesc(String TitleDesc) {
        this.TitleDesc = TitleDesc;
    }

    public void setDescription(String Description) {
        this.Description = Description;
    }

    public void setTitle(Title Title) {
        this.Title = Title;
    }

    public void setOrganization(Organization organization) {
        this.organization = organization;
    }

    public void setExperienceType(ExperienceType experienceType) {
        this.experienceType = experienceType;
    }

    public void setModified(String modified) {
        this.Modified = modified;
    }


// get
    public int getCoderId() {
        return CoderId;
    }

    public int getExperienceId() {
        return ExperienceId;
    }

    public String getCompany() {
        return Company;
    }

    public String getCity() {
        return City;
    }

    public State getState() {
        return State;
    }

    public Country getCountry() {
        return Country;
    }

    public int getStartYear() {
        return StartYear;
    }

    public int getStartMonth() {
        return StartMonth;
    }

    public int getEndYear() {
        return EndYear;
    }

    public int getEndMonth() {
        return EndMonth;
    }

    public String getTitleDesc() {
        return TitleDesc;
    }

    public String getDescription() {
        return Description;
    }

    public Title getTitle() {
        return Title;
    }

    public Organization getOrganization() {
        return organization;
    }

    public ExperienceType getExperienceType() {
        return experienceType;
    }

    public String getModified() {
        return Modified;
    }

    public RecordTag getXML() throws Exception {
        RecordTag result = null;
        try {
            result = new RecordTag("Experience");
            result.addTag(new ValueTag("CoderId", CoderId));
            result.addTag(new ValueTag("ExperienceId", ExperienceId));
            result.addTag(new ValueTag("Company", Company));
            result.addTag(new ValueTag("City", City));
            result.addTag(State.getXML());
            result.addTag(Country.getXML());
            result.addTag(new ValueTag("StartYear", StartYear));
            result.addTag(new ValueTag("StartMonth", StartMonth));
            result.addTag(new ValueTag("EndYear", EndYear));
            result.addTag(new ValueTag("EndMonth", EndMonth));
            result.addTag(new ValueTag("TitleDesc", TitleDesc));
            result.addTag(new ValueTag("Description", Description));
            result.addTag(Title.getXML());
            result.addTag(organization.getXML());
            result.addTag(experienceType.getXML());
            result.addTag(new ValueTag("Modified", Modified));
        } catch (Exception e) {
            throw new Exception("common.web.data.Experience:getXML:ERROR:\n" + e);
        }
        return result;
    }

}

