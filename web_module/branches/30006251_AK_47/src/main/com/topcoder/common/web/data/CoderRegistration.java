package com.topcoder.common.web.data;

import com.topcoder.shared.docGen.xml.RecordTag;
import com.topcoder.shared.docGen.xml.TagRenderer;
import com.topcoder.shared.util.logging.Logger;

import java.io.Serializable;
import java.util.ArrayList;


/**
 * This class stores registration information for coders.  It extends the Coder class
 * with implementation allowing servlets to easily store all coder registration information.
 * The entire CoderRegistration object can be stored the the session to maintain state.
 * There is also implementation to call the Coder entity bean for persistent storage.
 * @see common.web.data.Coder
 * @author Steve Burrows
 */

public final class CoderRegistration extends Coder
        implements Serializable, TagRenderer {

    private String LastSchoolLetterCriteria;
    private String LastSkillTypeCriteria;
    private String LastEducationMode;
    private Education TempEducation;
    private ArrayList SessionEducations;
    private ArrayList SessionDemographicResponses;
    private ArrayList SessionSchools;
    private ArrayList SessionCoderSchools;
    private ArrayList SessionExperiences;
    private ArrayList SessionCoderSkills;
    private boolean SessionEducationsLoaded;
    private boolean SessionDemographicResponsesLoaded;
    private boolean SessionSchoolsLoaded;
    private boolean SessionCoderSchoolsLoaded;
    private boolean SessionExperiencesLoaded;
    private boolean SessionCoderSkillsLoaded;
    private static Logger log = Logger.getLogger(CoderRegistration.class);


    public CoderRegistration() {
        super();
        LastSchoolLetterCriteria = "";
        LastSkillTypeCriteria = "";
        LastEducationMode = "";
        TempEducation = new Education();
        SessionEducations = new ArrayList();
        SessionDemographicResponses = new ArrayList();
        SessionExperiences = new ArrayList();
        SessionCoderSkills = new ArrayList();
        SessionSchools = new ArrayList();
        SessionCoderSchools = new ArrayList();
        SessionEducationsLoaded = false;
        SessionDemographicResponsesLoaded = false;
        SessionSchoolsLoaded = false;
        SessionCoderSchoolsLoaded = false;
        SessionExperiencesLoaded = false;
        SessionCoderSkillsLoaded = false;
    }


    public void setAllModifiedStable() throws Exception {
        log.debug("common.web.data.CoderRegistration:setAllModifiedStable:called");
        try {
            super.setAllModifiedStable();
            LastSchoolLetterCriteria = "";
            LastSkillTypeCriteria = "";
            LastEducationMode = "";
            TempEducation = new Education();
            SessionEducations.clear();
            SessionDemographicResponses.clear();
            SessionSchools.clear();
            SessionCoderSchools.clear();
            SessionExperiences.clear();
            SessionCoderSkills.clear();
            SessionEducationsLoaded = false;
            SessionDemographicResponsesLoaded = false;
            SessionSchoolsLoaded = false;
            SessionCoderSchoolsLoaded = false;
            SessionExperiencesLoaded = false;
            SessionCoderSkillsLoaded = false;
        } catch (Exception e) {
            e.printStackTrace();
            throw new Exception("common.web.data.CoderRegistration:setAllModifiedStable:ERROR:" + e + "\n");
        }
    }


/*
  public Object clone()
    throws CloneNotSupportedException, OutOfMemoryError {
    CoderRegistration result = null;
    try {
      result = new CoderRegistration ( (Coder)super.clone() );
      result.setLastSchoolLetterCriteria( getLastSchoolLetterCriteria() );
      result.setLastSkillTypeCriteria( getLastSkillTypeCriteria() );
      result.setLastEducationMode( getLastEducationMode() );
      result.setTempEducation( getTempEducation() );
      result.setSessionEducations( (ArrayList) SessionEducations.clone() );
      result.setSessionSchools( (ArrayList) SessionSchools.clone() );
      result.setSessionCoderSchools( (ArrayList) SessionCoderSchools.clone() );
      result.setSessionExperiences( (ArrayList) SessionExperiences.clone() );
      result.setSessionCoderSkills( (ArrayList) SessionCoderSkills.clone() );
      result.setSessionEducationsLoaded( SessionEducationsLoaded );
      result.setSessionSchoolsLoaded( SessionSchoolsLoaded );
      result.setSessionCoderSchoolsLoaded( SessionCoderSchoolsLoaded );
      result.setSessionExperiencesLoaded( SessionExperiencesLoaded );
      result.setSessionCoderSkillsLoaded( SessionCoderSkillsLoaded );
    } catch (Exception e) {
      log.error("common.web.data.CoderRegistration:clone:ERROR:\n"+e);
    }
    return result;
  }
*/


    public void setSessionEducations(ArrayList SessionEducations) {
        this.SessionEducations = SessionEducations;
    }

    public void setSessionDemographicResponses(ArrayList SessionDemographicResponses) {
        this.SessionDemographicResponses = SessionDemographicResponses;
    }


    public void setSessionSchools(ArrayList SessionSchools) {
        this.SessionSchools = SessionSchools;
    }


    public void setSessionCoderSchools(ArrayList SessionCoderSchools) {
        this.SessionCoderSchools = SessionCoderSchools;
    }


    public void setSessionExperiences(ArrayList SessionExperiences) {
        this.SessionExperiences = SessionExperiences;
    }


    public void setSessionCoderSkills(ArrayList SessionCoderSkills) {
        this.SessionCoderSkills = SessionCoderSkills;
    }


    public void setSessionCoderSkillsLoaded(boolean SessionCoderSkillsLoaded) {
        this.SessionCoderSkillsLoaded = SessionCoderSkillsLoaded;
    }


    public void setSessionSchoolsLoaded(boolean SessionSchoolsLoaded) {
        this.SessionSchoolsLoaded = SessionSchoolsLoaded;
    }


    public void setSessionCoderSchoolsLoaded(boolean SessionCoderSchoolsLoaded) {
        this.SessionCoderSchoolsLoaded = SessionCoderSchoolsLoaded;
    }


    public void setSessionEducationsLoaded(boolean SessionEducationsLoaded) {
        this.SessionEducationsLoaded = SessionEducationsLoaded;
    }

    public void setSessionDemographicResponsesLoaded(boolean SessionDemographicResponsesLoaded) {
        this.SessionDemographicResponsesLoaded = SessionDemographicResponsesLoaded;
    }


    public void setSessionExperiencesLoaded(boolean SessionExperiencesLoaded) {
        this.SessionExperiencesLoaded = SessionExperiencesLoaded;
    }


    public CoderRegistration(Coder coder) {
        super.setCoderId(coder.getCoderId());
        super.setFirstName(coder.getFirstName());
        super.setLastName(coder.getLastName());
        super.setMiddleName(coder.getMiddleName());
        super.setHomeAddress1(coder.getHomeAddress1());
        super.setHomeAddress2(coder.getHomeAddress2());
        super.setHomeCity(coder.getHomeCity());
        super.setHomeState(coder.getHomeState());
        super.setHomeCountry(coder.getHomeCountry());
        super.setHomeZip(coder.getHomeZip());
        super.setWorkPhone(coder.getWorkPhone());
        super.setHomePhone(coder.getHomePhone());
        super.setNotify(coder.getNotify());
        super.setQuote(coder.getQuote());
        super.setActivationCode(coder.getActivationCode());
        super.setModified(coder.getModified());
        super.setEducations(coder.getEducations());
        super.setSkills(coder.getSkills());
        super.setRating(coder.getRating());
        super.setMemberSince(coder.getMemberSince());
        SessionEducations = new ArrayList();
        SessionDemographicResponses = new ArrayList();
        SessionSchools = new ArrayList();
        SessionCoderSchools = new ArrayList();
        SessionExperiences = new ArrayList();
        SessionCoderSkills = new ArrayList();
        SessionEducationsLoaded = false;
        SessionDemographicResponsesLoaded = false;
        SessionSchoolsLoaded = false;
        SessionCoderSchoolsLoaded = false;
        SessionExperiencesLoaded = false;
        SessionCoderSkillsLoaded = false;
        LastSkillTypeCriteria = "";
        LastEducationMode = "";
        TempEducation = new Education();
    }


    public void setLastSkillTypeCriteria(String LastSkillTypeCriteria) {
        this.LastSkillTypeCriteria = LastSkillTypeCriteria;
    }

    public void setLastSchoolLetterCriteria(String LastSchoolLetterCriteria) {
        this.LastSchoolLetterCriteria = LastSchoolLetterCriteria;
    }

    public void setLastEducationMode(String LastEducationMode) {
        this.LastEducationMode = LastEducationMode;
    }

    public void setTempEducation(Education TempEducation) {
        this.TempEducation = TempEducation;
    }

    public String getLastSkillTypeCriteria() {
        return this.LastSkillTypeCriteria;
    }

    public String getLastSchoolLetterCriteria() {
        return this.LastSchoolLetterCriteria;
    }

    public String getLastEducationMode() {
        return this.LastEducationMode;
    }

    public Education getTempEducation() {
        return this.TempEducation;
    }

    public boolean getSessionEducationsLoaded() {
        return this.SessionEducationsLoaded;
    }

    public boolean getSessionDemographicResponsesLoaded() {
        return this.SessionDemographicResponsesLoaded;
    }

    public boolean getSessionSchoolsLoaded() {
        return this.SessionSchoolsLoaded;
    }

    public boolean getSessionCoderSchoolsLoaded() {
        return this.SessionCoderSchoolsLoaded;
    }

    public boolean getSessionExperiencesLoaded() {
        return this.SessionExperiencesLoaded;
    }

    public boolean getSessionCoderSkillsLoaded() {
        return this.SessionCoderSkillsLoaded;
    }

    public ArrayList getSessionEducations() {
        return this.SessionEducations;
    }

    public ArrayList getSessionDemographicResponses() {
        return this.SessionDemographicResponses;
    }

    public ArrayList getSessionSchools() {
        return this.SessionSchools;
    }

    public ArrayList getSessionCoderSchools() {
        return this.SessionCoderSchools;
    }

    public ArrayList getSessionExperiences() {
        return this.SessionExperiences;
    }

    public ArrayList getSessionCoderSkills() {
        return this.SessionCoderSkills;
    }

    public RecordTag getXML() throws Exception {
        RecordTag result = null;
        try {
            result = getCoderXML();
            RecordTag subPreview = new RecordTag("Preview");
            subPreview.addTag(RecordTag.getListXML("SessionEducations", SessionEducations));
            subPreview.addTag(RecordTag.getListXML("SessionDemographicResponses", SessionDemographicResponses));
            subPreview.addTag(RecordTag.getListXML("SessionExperiences", SessionExperiences));
            subPreview.addTag(RecordTag.getListXML("SessionCoderSkills", SessionCoderSkills));
            result.addTag(subPreview);
        } catch (Exception e) {
            throw new Exception("common.web.data.CoderRegistration:getXML:ERROR:\n" + e);
        }
        return result;
    }


}


