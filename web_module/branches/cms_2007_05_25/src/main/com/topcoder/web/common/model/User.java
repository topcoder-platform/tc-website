package com.topcoder.web.common.model;

import com.topcoder.web.common.WebConstants;
import com.topcoder.web.common.model.comp.UserContestPrize;
import com.topcoder.web.common.voting.RankBallot;
import org.hibernate.annotations.GenericGenerator;
import org.hibernate.annotations.Parameter;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Column;
import javax.persistence.ManyToMany;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.CascadeType;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Set;
import java.util.TreeSet;

/**
 * A class containing user information.
 *
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: Mar 29, 2006
 */
@Entity
@Table(name="user")
public class User extends Base {
    private Long id;
    private String firstName;
    private String middleName;
    private String lastName;
    private String handle;
    private String lowerHandle;
    private Character status;
    private String password;
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
    private Set<Response> responses;
    private Set<RankBallot> ballots;
    private Set<UserContestPrize> compPrizes;
    
    /**
     * hoke: used for making changes
     */
    private List transientResponses;

    /**
     * doing this weirdness to allow the EL to work with this
     */
/*    private boolean agreedToSiteTerms;*/

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
        compPrizes = new HashSet<UserContestPrize>();
    }


    @Id
    @GenericGenerator(name="user_id",
            strategy="com.topcoder.web.common.model.IdGenerator",
            parameters={@Parameter(name="sequence_name", value="USER_SEQ")})
    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    @Column(name="first_name")
    public String getFirstName() {
        return firstName;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    @Column(name="middle_name")
    public String getMiddleName() {
        return middleName;
    }

    public void setMiddleName(String middleName) {
        this.middleName = middleName;
    }

    @Column(name="last_name")
    public String getLastName() {
        return lastName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    @Column
    public String getHandle() {
        return handle;
    }

    public void setHandle(String handle) {
        this.handle = handle;
    }

    @Column
    public Character getStatus() {
        return status;
    }

    public void setStatus(Character status) {
        this.status = status;
    }

    @Column
    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    @Column(name="activation_code")
    public String getActivationCode() {
        return activationCode;
    }

    public void setActivationCode(String activationCode) {
        this.activationCode = activationCode;
    }

    @ManyToMany(targetEntity=com.topcoder.web.common.model.Address.class, cascade={CascadeType.PERSIST, CascadeType.MERGE})
    @JoinTable(
        name="user_address_xref",
        joinColumns={@JoinColumn(name="user_id")},
        inverseJoinColumns={@JoinColumn(name="user_id")}
    )
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
        for (Iterator<Phone> it = getPhoneNumbers().iterator(); it.hasNext() && !found;) {
            p = it.next();
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
            for (Iterator<Address> it = getAddresses().iterator(); it.hasNext() && !found;) {
                a = it.next();
                found = Address.HOME_TYPE_ID.equals(a.getAddressTypeId());
            }
        }
        return a;
    }

    public Set<Phone> getPhoneNumbers() {
        return phoneNumbers;
    }

    /**
     * Get the user's primary email address.
     *
     * @return the user's primary email address or null if they don't have one.
     */
    public Email getPrimaryEmailAddress() {
        Email e = null;
        boolean found = false;
        for (Iterator<Email> it = getEmailAddresses().iterator(); it.hasNext() && !found;) {
            e = it.next();
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
        e.setUser(this);
        this.emailAddresses.add(e);
    }

    public void addPhoneNumber(Phone p) {
        p.setUser(this);
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
        for (UserGroup securityGroup : securityGroups) {
            g = securityGroup;
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
    }

    public Contact getContact() {
        return contact;
    }

    public void setContact(Contact contact) {
        this.contact = contact;
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
        for (Iterator<TermsOfUse> it = getTerms().iterator(); it.hasNext() && !found;) {
            t = it.next();
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

    public boolean isMemberContactEnabled() {
        UserPreference up = getUserPreference(Preference.MEMBER_CONTACT_PREFERENCE_ID);
        return up == null ? false : String.valueOf(true).equals(up.getValue());
    }

    public SecretQuestion getSecretQuestion() {
        return secretQuestion;
    }

    public void setSecretQuestion(SecretQuestion secretQuestion) {
        this.secretQuestion = secretQuestion;
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
        for (EventRegistration eventRegistration : getEventRegistrations()) {
            if (eventRegistration.getId().getEvent().getId() == e.getId()) {
                return eventRegistration;
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

    public void addEventRegistration(Event event, List<Response> responses, Boolean eligible) {
        EventRegistration er = new EventRegistration();
        er.getId().setUser(this);
        er.getId().setEvent(event);
        er.setEligible(eligible);

        addEventRegistration(er);
        
        if (event.getTerms() != null) {
            addTerms(event.getTerms());        
        }
        
        if (responses != null) {
            addResponse(responses);
        }
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


    @Column(name="handle_lower", updatable=false, insertable=false)
    public String getLowerHandle() {
        return lowerHandle;
    }

    public void setLowerHandle(String lowerHandle) {
        this.lowerHandle = lowerHandle;
    }
}