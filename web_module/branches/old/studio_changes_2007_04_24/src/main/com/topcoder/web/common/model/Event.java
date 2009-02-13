package com.topcoder.web.common.model;

import java.sql.Timestamp;
import java.util.Collections;
import java.util.HashSet;
import java.util.Set;

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: Jan 18, 2007
 */
public class Event extends Base {
    public static final Long TCO07_COMPONENT_ID = new Long(7);

    private Long id;
    private EventType type;
    private String description;
    private String shortDescription;
    private Timestamp registrationStart;
    private Timestamp registrationEnd;
    private TermsOfUse terms;
    private Survey survey;
    private Set users;

    public Event() {
        users = new HashSet();
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }


    public Set getUsers() {
        return Collections.unmodifiableSet(users);
    }

    public void setUsers(Set users) {
        this.users = users;
    }

    public EventType getType() {
        return type;
    }

    public void setType(EventType type) {
        this.type = type;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public Timestamp getRegistrationStart() {
        return registrationStart;
    }

    public void setRegistrationStart(Timestamp registrationStart) {
        this.registrationStart = registrationStart;
    }

    public Timestamp getRegistrationEnd() {
        return registrationEnd;
    }

    public void setRegistrationEnd(Timestamp registrationEnd) {
        this.registrationEnd = registrationEnd;
    }

    public TermsOfUse getTerms() {
        return terms;
    }

    public void setTerms(TermsOfUse terms) {
        this.terms = terms;
    }

    public Survey getSurvey() {
        return survey;
    }

    public void setSurvey(Survey survey) {
        this.survey = survey;
    }

    public String getShortDescription() {
        return shortDescription;
    }

    public void setShortDescription(String shortDescription) {
        this.shortDescription = shortDescription;
    }
}
