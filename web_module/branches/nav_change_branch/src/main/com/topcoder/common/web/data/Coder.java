package com.topcoder.common.web.data;

import com.topcoder.common.web.util.Data;
import com.topcoder.shared.docGen.xml.*;

import java.io.Serializable;
import java.util.ArrayList;

public class Coder implements Serializable, TagRenderer {

    private int coderId;
    private String firstName;
    private String lastName;
    private String middleName;
    private String homeAddress1;
    private String homeAddress2;
    private String homeCity;
    private State homeState;
    private Country homeCountry;
    private String homeZip;
    private String workPhone;
    private String homePhone;
    private String notify;
    private String quote;
    private Rating rating;
    private int ranking;
    private java.sql.Date memberSince;
    private String activationCode;
    private Editor editor;
    private Language language;
    private CoderType type;
    private String modified;
    private CoderReferral coderReferral;
    private School currentSchool;
    private ArrayList jobPreferences;
    private ArrayList educations;
    private ArrayList schools;
    private ArrayList skills;
    private ArrayList experiences;
    private ArrayList inquiries;
    private ArrayList demographicResponses;
    private ArrayList notifications;
    private boolean hasImage;
    private ArrayList coderConfirmations;


    public Coder() {
        coderId = 0;
        firstName = "";
        lastName = "";
        middleName = "";
        homeAddress1 = "";
        homeAddress2 = "";
        homeCity = "";
        homeState = new State();
        homeCountry = new Country();
        homeZip = "";
        workPhone = "";
        homePhone = "";
        notify = "";
        quote = "";
        activationCode = "";
        coderReferral = new CoderReferral();
        currentSchool = new School();
        editor = new Editor();
        language = new Language();
        type = new CoderType();
        jobPreferences = new ArrayList();
        modified = "";
        rating = new Rating();
        ranking = 0;
        memberSince = null;
        educations = new ArrayList();
        schools = new ArrayList();
        skills = new ArrayList();
        experiences = new ArrayList();
        inquiries = new ArrayList();
        demographicResponses = new ArrayList();
        notifications = new ArrayList();
        hasImage = false;
        coderConfirmations = new ArrayList();
    }

/*
  public Object clone()
    throws CloneNotSupportedException, OutOfMemoryError {
    Coder result = null;
    try {
      result = new Coder();
      result.setCoderId( getCoderId() );
      result.setFirstName( getFirstName() );
      result.setMiddleName( getMiddleName() );
      result.setLastName( getLastName() );
      result.setHomeAddress1( getHomeAddress1() );
      result.setHomeAddress2( getHomeAddress2() );
      result.setHomeCity( getHomeCity() );
      result.setHomeState( (State) getHomeState().clone() );
      result.setHomeCountry( (Country) getHomeCountry().clone() );
      result.setHomeZip( getHomeZip() );
      result.setHomePhone( getHomePhone() );
      result.setWorkPhone( getWorkPhone() );
      result.setNotify( getNotify() );
      result.setQuote( getQuote() );
      result.setActivationCode( getActivationCode() );
      result.setCoderReferral( getCoderReferral() );
      result.setEditor( getEditor() );
      result.setLanguage( getLanguage() );
      result.setCoderType( getCoderType() );
      result.setJobPrefs( (ArrayList)getJobPrefs().clone() );
      result.setModified( getModified() );
      result.setRating( (Rating) getRating().clone() );
      result.setRanking(getRanking());
      result.setMemberSince( (java.sql.Date) getMemberSince().clone() );
      result.setEducations( (ArrayList) getEducations().clone() );
      result.setCoderSchools( (ArrayList) getCoderSchools().clone() );
      result.setSkills( (ArrayList) getSkills().clone() );
      result.setExperiences( (ArrayList) getExperiences().clone() );
      result.setInquiries( (ArrayList) getInquiries().clone() );
    } catch (Exception e) {
      e.printStackTrace();
    }
    return result;
  }
*/


    /**
     * The constructor for the class. Initializes instance variables.
     * All ArrayLists are initialized to new empty ArrayLists.
     */
    public void setAllModifiedStable() throws Exception {
        try {
            setModified("S");
            getRating().setModified("S");
            getCoderReferral().setModified("S");
            getCurrentSchool().setModified("S");
            Data.stabilizeModifiableList(educations);
            Data.stabilizeModifiableList(schools);
            Data.stabilizeModifiableList(skills);
            Data.stabilizeModifiableList(experiences);
            Data.stabilizeModifiableList(inquiries);
            Data.stabilizeModifiableList(demographicResponses);
            Data.stabilizeModifiableList(coderConfirmations);
        } catch (Exception e) {
            e.printStackTrace();
            throw new Exception("common.web.data.Coder:setAllModifiedStable:ERROR:" + e + "\n");
        }

    }


    //Set
    public void setCoderId(int coderId) {
        this.coderId = coderId;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    public void setMiddleName(String middleName) {
        this.middleName = middleName;
    }

    public void setHomeAddress1(String homeAddress1) {
        this.homeAddress1 = homeAddress1;
    }

    public void setHomeAddress2(String homeAddress2) {
        this.homeAddress2 = homeAddress2;
    }

    public void setHomeCity(String homeCity) {
        this.homeCity = homeCity;
    }

    public void setHomeState(State homeState) {
        this.homeState = homeState;
    }

    public void setHomeCountry(Country homeCountry) {
        this.homeCountry = homeCountry;
    }

    public void setHomeZip(String homeZip) {
        this.homeZip = homeZip;
    }

    public void setWorkPhone(String workPhone) {
        this.workPhone = workPhone;
    }

    public void setHomePhone(String homePhone) {
        this.homePhone = homePhone;
    }

    public void setNotify(String notify) {
        this.notify = notify;
    }

    public void setQuote(String quote) {
        this.quote = quote;
    }

    public void setActivationCode(String activationCode) {
        this.activationCode = activationCode;
    }

    public void setEditor(Editor editor) {
        this.editor = editor;
    }

    public void setLanguage(Language language) {
        this.language = language;
    }

    public void setCoderType(CoderType type) {
        this.type = type;
    }

    public void setJobPreferences(ArrayList jobPreferences) {
        this.jobPreferences = jobPreferences;
    }

    public void setModified(String modified) {
        this.modified = modified;
    }

    public void setSchools(ArrayList schools) {
        this.schools = schools;
    }

    public void setSkills(ArrayList skills) {
        this.skills = skills;
    }

    public void setExperiences(ArrayList experiences) {
        this.experiences = experiences;
    }

    public void setInquiries(ArrayList inquiries) {
        this.inquiries = inquiries;
    }

    public void setEducations(ArrayList education) {
        this.educations = education;
    }

    public void setCoderReferral(CoderReferral coderReferral) {
        this.coderReferral = coderReferral;
    }

    public void setCurrentSchool(School currentSchool) {
        this.currentSchool = currentSchool;
    }

    public void setDemographicResponses(ArrayList demographicResponses) {
        this.demographicResponses = demographicResponses;
    }

    public void setNotifications(ArrayList notifications) {
        this.notifications = notifications;
    }

    public void setRating(Rating rating) {
        this.rating = rating;
    }

    public void setRanking(int ranking) {
        this.ranking = ranking;
    }

    public void setMemberSince(java.sql.Date memberSince) {
        this.memberSince = memberSince;
    }

    public void setHasImage(boolean hasImage) {
        this.hasImage = hasImage;
    }

    public void setCoderConfirmations(ArrayList coderConfirmations) {
        this.coderConfirmations = coderConfirmations;
    }

    // Get
    public int getCoderId() {
        return coderId;
    }

    public String getFirstName() {
        return firstName;
    }

    public String getLastName() {
        return lastName;
    }

    public String getMiddleName() {
        return middleName;
    }

    public String getHomeAddress1() {
        return homeAddress1;
    }

    public String getHomeAddress2() {
        return homeAddress2;
    }

    public String getHomeCity() {
        return homeCity;
    }

    public State getHomeState() {
        return homeState;
    }

    public Country getHomeCountry() {
        return homeCountry;
    }

    public String getHomeZip() {
        return homeZip;
    }

    public String getWorkPhone() {
        return workPhone;
    }

    public String getHomePhone() {
        return homePhone;
    }

    public String getNotify() {
        return notify;
    }

    public String getQuote() {
        return quote;
    }

    public String getActivationCode() {
        return activationCode;
    }

    public CoderReferral getCoderReferral() {
        return coderReferral;
    }

    public School getCurrentSchool() {
        return currentSchool;
    }

    public Editor getEditor() {
        return editor;
    }

    public Language getLanguage() {
        return language;
    }

    public CoderType getCoderType() {
        return type;
    }

    public ArrayList getJobPreferences() {
        return jobPreferences;
    }

    public String getModified() {
        return modified;
    }

    public Rating getRating() {
        return rating;
    }

    public int getRanking() {
        return ranking;
    }

    public java.sql.Date getMemberSince() {
        return memberSince;
    }

    public ArrayList getSchools() {
        return schools;
    }

    public ArrayList getSkills() {
        return skills;
    }

    public ArrayList getExperiences() {
        return experiences;
    }

    public ArrayList getInquiries() {
        return inquiries;
    }

    public ArrayList getEducations() {
        return educations;
    }

    public ArrayList getDemographicResponses() {
        return demographicResponses;
    }

    public ArrayList getNotifications() {
        return notifications;
    }

    public boolean getHasImage() {
        return hasImage;
    }

    public ArrayList getCoderConfirmations() {
        return coderConfirmations;
    }


    public RecordTag getXML() throws Exception {
        RecordTag result = null;
        try {
            result = getCoderXML();
        } catch (Exception e) {
            throw new Exception("common.web.data.Coder:getCoderXML:ERROR:\n" + e);
        }
        return result;
    }

    protected RecordTag getCoderXML() throws Exception {
        RecordTag result = null;
        try {
            result = new RecordTag("Coder");
            result.addTag(new ValueTag("CoderId", coderId));
            result.addTag(new ValueTag("FirstName", firstName));
            result.addTag(new ValueTag("LastName", lastName));
            result.addTag(new ValueTag("MiddleName", middleName));
            result.addTag(new ValueTag("HomeAddress1", homeAddress1));
            result.addTag(new ValueTag("HomeAddress2", homeAddress2));
            result.addTag(new ValueTag("HomeCity", homeCity));
            result.addTag(homeState.getXML());
            result.addTag(homeCountry.getXML());
            result.addTag(new ValueTag("HomeZip", homeZip));
            result.addTag(new ValueTag("WorkPhone", workPhone));
            result.addTag(new ValueTag("HomePhone", homePhone));
            result.addTag(new ValueTag("Notify", notify));
            result.addTag(new ValueTag("Quote", quote));
            result.addTag(new ValueTag("ActivationCode", activationCode));
            result.addTag(new ValueTag("Modified", modified));
            result.addTag(RecordTag.getListXML("Educations", educations));
            result.addTag(RecordTag.getListXML("Schools", schools));
            result.addTag(RecordTag.getListXML("Skills", skills));
            result.addTag(RecordTag.getListXML("Experiences", experiences));
            result.addTag(RecordTag.getListXML("DemographicResponses", demographicResponses));
            result.addTag(RecordTag.getListXML("Notifications", notifications));
            result.addTag(RecordTag.getListXML("Inquiries", inquiries));
            result.addTag(rating.getXML());
            result.addTag(new ValueTag("Ranking", ranking));
            result.addTag(new ValueTag("MemberSince", memberSince));
            result.addTag(coderReferral.getXML());
            result.addTag(currentSchool.getXML());
            result.addTag(editor.getXML());
            result.addTag(language.getXML());
            result.addTag(type.getXML());
            result.addTag(RecordTag.getListXML("JobPrefs", jobPreferences));
            result.addTag(new ValueTag("HasImage", hasImage));
            result.addTag(RecordTag.getListXML("CoderConfirmations", coderConfirmations));
        } catch (Exception e) {
            throw new Exception("common.web.data.Coder getXML ERROR: " + e);
        }
        return result;
    }

}

