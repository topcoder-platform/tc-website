/*
 * Copyright (C) 2007-2011 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.web.common.model;

import com.topcoder.web.common.model.comp.Contest;

import java.sql.Timestamp;
import java.util.Collections;
import java.util.HashSet;
import java.util.Set;

/**
 * <p>A class representing the single event hosted by <code>TopCoder</code>.</p>
 *
 * <p>
 *   Version 1.1 (2010 TCO WebSite Release assembly v1.0) Change notes:
 *   <ol>
 *     <li>Added constant for ID for event of <code>2010 TCO</code>.</li>
 *   </ol>
 * </p>
 *
 * @author dok, TCSDEVELOPER
 * @version 1.1
 */
public class Event extends Base {
    public static final Long TCO07_COMPONENT_ID = new Long(7);
    public static final Long TCCC07_COMPONENT_ID = new Long(3002);
    public static final Long TCO08_COMPONENT_ID = new Long(3006);
    public static final Long TCO09_EVENT_ID = new Long(3009);

    /**
     * <p>A <code>long</code> providing the ID for event of <code>2010 TCO</code>.</p>
     */
    public static final Long TCO10_EVENT_ID = new Long(3432);

    /**
     * <p>A <code>long</code> providing the ID for event of <code>2011 TCO</code>.</p>
     */
    public static final Long TCO11_EVENT_ID = new Long(3433);

    private Long id;
    private EventType type;
    private String description;
    private String shortDescription;
    private Timestamp registrationStart;
    private Timestamp registrationEnd;
    private TermsOfUse terms;
    private Survey survey;
    private Set users = new HashSet();
    private Event parent;
    private Set<Contest> contests = new HashSet<Contest>();
    private Set<Event> children = new HashSet<Event>();

    public Event(Long id, EventType type) {
        super();
        this.id = id;
        this.type = type;
    }

    public Event getParent() {
        return parent;
    }

    public void setParent(Event parent) {
        this.parent = parent;
    }

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

    public Set getContests() {
        return Collections.unmodifiableSet(contests);
    }

    public void setContests(Set<Contest> contests) {
        this.contests = contests;
    }

    public void addContest(Contest c) {
        contests.add(c);
    }

    public Set<Event> getChildren() {
        return Collections.unmodifiableSet(children);
    }

    public void setChildren(Set<Event> children) {
        this.children = children;
    }

}
