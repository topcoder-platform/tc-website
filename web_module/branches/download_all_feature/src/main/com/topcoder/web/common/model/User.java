package com.topcoder.web.common.model;

import com.topcoder.web.common.WebConstants;
import com.topcoder.web.common.model.comp.UserContestPrize;
import com.topcoder.web.common.model.educ.Professor;
import com.topcoder.web.common.voting.RankBallot;

import java.util.ArrayList;
import java.util.Collections;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Set;
import java.util.TreeSet;

/**
 * <p>
 * A class containing user information.
 * </p>
 * <p>
 * Update(Release Assembly - OpenID Project Update 1 v1.0):
 * Add <code>private String openId</code> field.
 * </p>
 * @author dok, TCASSEMBLER
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: Mar 29, 2006
 */
public class User extends Base {
    private Long id;
    private String firstName;
    private String middleName;
    private String lastName;
    private String nameInAnotherLanguage;
    private String handle;
    private Character status;
    private String activationCode;
    private TimeZone timeZone;
    private Set<Address> addresses;
    private Set<Email> emailAddresses;
    private Set<Phone> phoneNumbers;
    private Set<Notification> notifications;
    private Set<UserPreference> userPreferences;
    /**
     * hoke: used getting information
     */
    private Set<DemographicResponse> demographicResponses;
    private Set<UserGroup> securityGroups;
    private Coder coder;
    private Contact contact;
    private Set<TermsOfUse> terms;
    private Set<EventRegistration> eventRegistrations;
    private SecretQuestion secretQuestion;
    private UserSecurityKey userSecurityKey;
    private Set<Response> responses;
    private Set<RankBallot> ballots;
    private Set<UserContestPrize> compPrizes;
    private Professor professor;
    private Set<UserSchool> schools;
    private Set<School> createdSchools;
    
    /**
     * <p>
     * The open id for the user.
     * </p>
     */
    private String openId;


    /**
     * hoke: used for making changes
     */
    private List transientResponses;

    /**
     * doing this weirdness to allow the EL to work with this
     */
    private boolean agreedToSiteTerms;

    public User() {
        super();
        status = WebConstants.UNACTIVE_STATI[1];
        addresses = new HashSet<Address>();
        emailAddresses = new HashSet<Email>();
        phoneNumbers = new HashSet<Phone>();
        demographicResponses = new HashSet<DemographicResponse>();
        notifications = new TreeSet<Notification>();
        securityGroups = new HashSet<UserGroup>();
        transientResponses = new ArrayList();
        userPreferences = new HashSet<UserPreference>();
        terms = new HashSet<TermsOfUse>();
        responses = new HashSet<Response>();
        ballots = new HashSet<RankBallot>();
        eventRegistrations = new HashSet<EventRegistration>();
        compPrizes = new HashSet<UserContestPrize>();
        schools = new HashSet<UserSchool>();
        createdSchools = new HashSet<School>();
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }
    
    /**
     * <p>
     * Getter of openId field.
     * </p>
     *
     * @return the openId field.
     */
    public String getOpenId() {
        return openId;
    }

    /**
     * <p>
     * Setter of the openId field.
     * </p>
     * @param openId the openId to set
     */
    public void setOpenId(String openId) {
        this.openId = openId;
    }

    public String getFirstName() {
        return firstName;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    public String getMiddleName() {
        return middleName;
    }

    public void setMiddleName(String middleName) {
        this.middleName = middleName;
    }

    public String getLastName() {
        return lastName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    public String getNameInAnotherLanguage() {
        return nameInAnotherLanguage;
    }

    public void setNameInAnotherLanguage(String nameInAnotherLanguage) {
        this.nameInAnotherLanguage = nameInAnotherLanguage;
    }

    public String getHandle() {
        return handle;
    }

    public void setHandle(String handle) {
        this.handle = handle;
    }

    public Character getStatus() {
        return status;
    }

    public void setStatus(Character status) {
        this.status = status;
    }

    public String getActivationCode() {
        return activationCode;
    }

    public void setActivationCode(String activationCode) {
        this.activationCode = activationCode;
    }

    public Set<Address> getAddresses() {
        return Collections.unmodifiableSet(addresses);
    }

    public void setAddresses(Set<Address> addresses) {
        this.addresses = addresses;
    }

    public Set<Email> getEmailAddresses() {
        return Collections.unmodifiableSet(emailAddresses);
    }

    public void setEmailAddresses(Set<Email> emailAddresses) {
        this.emailAddresses = emailAddresses;
    }

    /**
     * Get the user's primary phone number.
     *
     * @return the user's primary phone number or null if they don't have one.
     */
    public Phone getPrimaryPhoneNumber() {
        Phone p = null;
        boolean found = false;
        for (Iterator it = getPhoneNumbers().iterator(); it.hasNext() && !found;) {
            p = (Phone) it.next();
            found = p.isPrimary();
        }
        if (found) {
            return p;
        } else {
            return null;
        }
    }

    public Address getHomeAddress() {
        Address a = null;
        if (getAddresses().size() > 0) {
            boolean found = false;
            for (Iterator it = getAddresses().iterator(); it.hasNext() && !found;) {
                a = (Address) it.next();
                found = Address.HOME_TYPE_ID.equals(a.getAddressTypeId());
            }
        }
        return a;
    }

    public Set<Phone> getPhoneNumbers() {
        return Collections.unmodifiableSet(phoneNumbers);
    }

    /**
     * Get the user's primary email address.
     *
     * @return the user's primary email address or null if they don't have one.
     */
    public Email getPrimaryEmailAddress() {
        Email e = null;
        boolean found = false;
        for (Iterator it = getEmailAddresses().iterator(); it.hasNext() && !found;) {
            e = (Email) it.next();
            found = e.isPrimary();
        }
        if (found) {
            return e;
        } else {
            return null;
        }
    }


    public void setPhoneNumbers(Set<Phone> phoneNumbers) {
        this.phoneNumbers = phoneNumbers;
    }

    public void addAddress(Address a) {
        this.addresses.add(a);
    }

    public void addEmailAddress(Email e) {
        this.emailAddresses.add(e);
    }

    public void addPhoneNumber(Phone p) {
        this.phoneNumbers.add(p);
    }

    public TimeZone getTimeZone() {
        return timeZone;
    }

    public void setTimeZone(TimeZone timeZone) {
        this.timeZone = timeZone;
    }

    public Set<DemographicResponse> getDemographicResponses() {
        return Collections.unmodifiableSet(demographicResponses);
    }

    public void setDemographicResponses(Set<DemographicResponse> demographicResponses) {
        this.demographicResponses = demographicResponses;
    }

    public void addDemographicResponse(DemographicResponse response) {
        this.demographicResponses.add(response);
    }


    public void removeDemographicResponse(DemographicResponse response) {
        this.demographicResponses.remove(response);
    }

    public Set<Notification> getNotifications() {
        return Collections.unmodifiableSet(notifications);
    }

    public void setNotifications(Set<Notification> notifications) {
        this.notifications = notifications;
    }

    public void addNotification(Notification notification) {
        this.notifications.add(notification);
    }

    public void removeNotification(Notification notification) {
        this.notifications.remove(notification);
    }

    public Set<UserGroup> getSecurityGroups() {
        return Collections.unmodifiableSet(securityGroups);
    }

    public void setSecurityGroups(Set<UserGroup> securityGroups) {
        this.securityGroups = securityGroups;
    }

    public String getHandleLower() {
        return handle.toLowerCase();
    }

    public Set<RegistrationType> getRegistrationTypes() {
        //i think this could be done better with an HQL query, but dunno how yet
        UserGroup g;
        Set<RegistrationType> ret = new HashSet<RegistrationType>();
        for (Object securityGroup : securityGroups) {
            g = (UserGroup) securityGroup;
            if (SecurityGroup.ACTIVE.equals(g.getSecurityStatusId())) {
                for (Object o1 : g.getSecurityGroup().getRegistrationTypes()) {
                    RegistrationType o = (RegistrationType) o1;
                    ret.add(o);
                }
            }
        }
        return Collections.unmodifiableSet(ret);
    }

    public Coder getCoder() {
        return coder;
    }

    public void setCoder(Coder coder) {
        this.coder = coder;
        coder.setUser(this);
    }

    public Professor getProfessor() {
        return professor;
    }

    public void setProfessor(Professor professor) {
        this.professor = professor;
        if (professor != null) {
            professor.setUser(this);
        }
    }

    public Contact getContact() {
        return contact;
    }

    public void setContact(Contact contact) {
        this.contact = contact;
        contact.setUser(this);
    }

    public void clearDemographicResponses() {
        demographicResponses.clear();
    }

    public List getTransientResponses() {
        return transientResponses;
    }

    public void removeTransientResponse(DemographicResponse r) {
        transientResponses.remove(r);
    }

    public void setTransientResponses(List transientResponses) {
        this.transientResponses = transientResponses;
    }

    public Set<TermsOfUse> getTerms() {
        return Collections.unmodifiableSet(terms);
    }

    public void setTerms(Set<TermsOfUse> terms) {
        this.terms = terms;
    }

    public void addTerms(TermsOfUse t) {
        terms.add(t);
    }

    public boolean hasTerms(Integer termsId) {
        boolean found = false;
        TermsOfUse t;
        for (Iterator it = getTerms().iterator(); it.hasNext() && !found;) {
            t = (TermsOfUse) it.next();
            if (log.isDebugEnabled()) {
                log.debug("terms: " + t.getId());
            }
            found = termsId.equals(t.getId());
        }
        return found;
    }

    public Set<UserPreference> getUserPreferences() {
        return Collections.unmodifiableSet(userPreferences);
    }

    public void setUserPreferences(Set<UserPreference> userPreferences) {
        this.userPreferences = userPreferences;
    }

    public void addUserPreference(UserPreference userPreference) {
        userPreferences.add(userPreference);
    }

    public UserPreference getUserPreference(Integer preferenceId) {
        for (UserPreference up : userPreferences) {
            if (up.getId().getPreference().getId().equals(preferenceId)) {
                return up;
            }
        }
        return null;
    }

    public boolean isShowEarningsEnabled() {
        UserPreference up = getUserPreference(Preference.SHOW_EARNINGS_PREFERENCE_ID);
        return up != null && "show".equals(up.getValue());
    }

    public boolean isMemberContactEnabled() {
        UserPreference up = getUserPreference(Preference.MEMBER_CONTACT_PREFERENCE_ID);
        return up != null && "yes".equals(up.getValue());
    }

    public SecretQuestion getSecretQuestion() {
        return secretQuestion;
    }

    public void setSecretQuestion(SecretQuestion secretQuestion) {
        this.secretQuestion = secretQuestion;
    }

    public UserSecurityKey getUserSecurityKey() {
		return userSecurityKey;
	}

    public void setUserSecurityKey(UserSecurityKey userSecurityKey) {
		this.userSecurityKey = userSecurityKey;
	}

    public Set<EventRegistration> getEventRegistrations() {
        return Collections.unmodifiableSet(eventRegistrations);
    }

    public void setEventRegistrations(Set<EventRegistration> eventRegistrations) {
        this.eventRegistrations = eventRegistrations;
    }

    public void addEventRegistration(EventRegistration er) {
        eventRegistrations.add(er);
    }

    public Set<UserContestPrize> getCompPrizes() {
        return Collections.unmodifiableSet(compPrizes);
    }

    public void setCompPrizes(Set<UserContestPrize> compContestPrizes) {
        this.compPrizes = compContestPrizes;
    }

    public void addCompPrizes(UserContestPrize prize) {
        this.compPrizes.add(prize);
    }

    public EventRegistration getEventRegistration(Event e) {
        for (EventRegistration curr : getEventRegistrations()) {
            if (curr.getId().getEvent().getId() == e.getId()) {
                return curr;
            }
        }
        return null;
    }

    public Set<Response> getResponses() {
        return Collections.unmodifiableSet(responses);
    }

    public void setResponses(Set<Response> responses) {
        this.responses = responses;
    }

    public void addResponse(Response r) {
        responses.add(r);
    }

    public void addResponse(List<Response> r) {
        responses.addAll(r);
    }

    public void removeResponse(Response r) {
        responses.remove(r);
    }

    public void addEventRegistration(Event event, List<Response> responses, Boolean eligible, String notes) {
        EventRegistration er = new EventRegistration();
        er.getId().setUser(this);
        er.getId().setEvent(event);
        er.setEligible(eligible);
        if (notes != null) {
            er.setNotes(notes);
        }

        addEventRegistration(er);

        if (event.getTerms() != null) {
            addTerms(event.getTerms());
        }

        if (responses != null) {
            addResponse(responses);
        }
    }

    public void addEventRegistration(Event event, List<Response> responses, Boolean eligible) {
        addEventRegistration(event, responses, eligible, null);
    }

    public Set<RankBallot> getBallots() {
        return Collections.unmodifiableSet(ballots);
    }

    public void setBallots(Set<RankBallot> ballots) {
        this.ballots = ballots;
    }

    public void addBallot(RankBallot ballot) {
        ballots.add(ballot);
    }


    public Set<UserSchool> getSchools() {
        //returning a modifiable list because this is the parent side of the relationship.
        //changes to the set will be persisted.
        return schools;
    }

    public void setSchools(Set<UserSchool> schools) {
        this.schools = schools;
    }

    /**
     * If this user is associated with the given school, return that
     * association.
     *
     * @param schoolId                the id of the school to check for
     * @param schoolAssociationTypeId the association that we're looking for
     * @return the association betwen this user and that school
     */
    public UserSchool getSchool(Long schoolId, Integer schoolAssociationTypeId) {
        for (UserSchool school : schools) {
            if (school.getSchool() != null && school.getSchool().getId() != null && school.getSchool().getId().equals(schoolId) &&
                    school.getAssociationType().getId().equals(schoolAssociationTypeId)) {
                return school;
            }
        }
        return null;
    }

    private UserSchool getPrimarySchool(Integer schoolAssociationTypeId) {
        for (UserSchool school : schools) {
            if (school.isPrimary() && school.getAssociationType().getId().equals(schoolAssociationTypeId)) {
                return school;
            }
        }
        return null;
    }

    public UserSchool getPrimaryTeachingSchool() {
        return getPrimarySchool(SchoolAssociationType.TEACHER);
    }

    public UserSchool getPrimaryStudentSchool() {
        return getPrimarySchool(SchoolAssociationType.STUDENT);
    }

    /**
     * Add a school for the user.  If this school is the primary, then
     * mark existing primary school as non-primary.  This method will
     * also associate this user with the passed in school.  If the
     * the user already has a record for this school, then update it.
     *
     * @param school the school that this user is being associated with.
     */
    public void addSchool(UserSchool school) {
        if (school.isPrimary()) {
            for (UserSchool s : schools) {
                if (s.isPrimary() && s.getAssociationType().equals(school.getAssociationType())
                        && !school.getSchool().equals(s.getSchool())) {
                    s.setPrimary(false);
                }

            }
        }
        school.setUser(this);
        schools.add(school);

    }


    public Set<School> getCreatedSchools() {
        //returning a modifiable list because this is the parent side of the relationship.
        //changes to the set will be persisted.
        return createdSchools;
    }

    public void setCreatedSchools(Set<School> createdSchools) {
        this.createdSchools = createdSchools;
    }

    public void addCreatedSchool(School s) {
        this.createdSchools.add(s);
        s.setUser(this);
    }

    @Override
    public int hashCode() {
        final int PRIME = 31;
        int result = 1;
        result = PRIME * result + ((id == null) ? 0 : id.hashCode());
        return result;
    }

    @Override
    public boolean equals(Object obj) {
        if (this == obj)
            return true;
        if (obj == null)
            return false;
        if (getClass() != obj.getClass())
            return false;
        final User other = (User) obj;
        if (id == null) {
            if (other.id != null)
                return false;
        } else if (!id.equals(other.id))
            return false;
        return true;
    }

}
