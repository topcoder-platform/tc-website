package com.topcoder.web.reg.model;

import com.topcoder.web.common.model.Base;
import com.topcoder.web.reg.Constants;

import java.util.*;

/**
 * A class containing user information.
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: Mar 29, 2006
 */
public class User extends Base {
    private Long id;
    private String firstName;
    private String middleName;
    private String lastName;
    private String handle;
    private Character status;
    private String password;
    private String activationCode;
    private TimeZone timeZone;
    private Set addresses;
    private Set emailAddresses;
    private Set phoneNumbers;
    private Set notifications;
    /**
     * hoke: used getting information
     */
    private Set demographicResponses;
    private Set securityGroups;
    private Coder coder;
    private Contact contact;
    private Set terms;
    /**
     * hoke: used for making changes
     */
    private List transientResponses;

    public User() {
        status = new Character(Constants.UNACTIVE_STATI[1]);
        addresses = new HashSet();
        emailAddresses = new HashSet();
        phoneNumbers = new HashSet();
        demographicResponses = new HashSet();
        notifications = new TreeSet();
        securityGroups = new HashSet();
        transientResponses = new ArrayList();
        terms = new HashSet();
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
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

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getActivationCode() {
        return activationCode;
    }

    public void setActivationCode(String activationCode) {
        this.activationCode = activationCode;
    }

    public Set getAddresses() {
        return Collections.unmodifiableSet(addresses);
    }

    public void setAddresses(Set addresses) {
        this.addresses = addresses;
    }

    public Set getEmailAddresses() {
        return Collections.unmodifiableSet(emailAddresses);
    }

    public void setEmailAddresses(Set emailAddresses) {
        this.emailAddresses = emailAddresses;
    }

    /**
     * Get the user's primary phone number.
     * @return the user's primary phone number or null if they don't have one.
     */
    public Phone getPrimaryPhoneNumber() {
        Phone p=null;
        boolean found = false;
        for (Iterator it = getPhoneNumbers().iterator(); it.hasNext()&&!found;) {
            p = (Phone)it.next();
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
        if (getAddresses().size()>0) {
            boolean found = false;
            for (Iterator it = getAddresses().iterator(); it.hasNext()&&!found;) {
                a = (Address)it.next();
                found = Address.HOME_TYPE_ID.equals(a.getAddressTypeId());
            }
        }
        return a;
    }

    public Set getPhoneNumbers() {
        return Collections.unmodifiableSet(phoneNumbers);
    }

    /**
     * Get the user's primary email address.
     * @return the user's primary email address or null if they don't have one.
     */
    public Email getPrimaryEmailAddress() {
        Email e=null;
        boolean found = false;
        for (Iterator it = getEmailAddresses().iterator(); it.hasNext()&&!found;) {
            e = (Email)it.next();
            found = e.isPrimary();
        }
        if (found) {
            return e;
        } else {
            return null;
        }
    }


    public void setPhoneNumbers(Set phoneNumbers) {
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

    public Set getDemographicResponses() {
        return Collections.unmodifiableSet(demographicResponses);
    }

    public void setDemographicResponses(Set demographicResponses) {
        this.demographicResponses = demographicResponses;
    }

    public void addDemographicResponse(DemographicResponse response) {
        this.demographicResponses.add(response);
    }


    public void removeDemographicResponse(DemographicResponse response) {
        this.demographicResponses.remove(response);
    }

    public Set getNotifications() {
        return Collections.unmodifiableSet(notifications);
    }

    public void setNotifications(Set notifications) {
        this.notifications = notifications;
    }

    public void addNotification(Notification notification) {
        this.notifications.add(notification);
    }

    public Set getSecurityGroups() {
        return Collections.unmodifiableSet(securityGroups);
    }

    public void setSecurityGroups(Set securityGroups) {
        this.securityGroups = securityGroups;
    }

    public String getHandleLower() {
        return handle.toLowerCase();
    }

    public Set getRegistrationTypes() {
        //i think this could be done better with an HQL query, but dunno how yet
        UserGroup g;
        Set ret = new HashSet();
        for (Iterator it = securityGroups.iterator(); it.hasNext();) {
            g = (UserGroup)it.next();
            for (Iterator it1 = g.getSecurityGroup().getRegistrationTypes().iterator(); it1.hasNext();) {
                RegistrationType o = (RegistrationType)it1.next();
                ret.add(o);
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

    public Set getTerms() {
        return Collections.unmodifiableSet(terms);
    }

    public void setTerms(Set terms) {
        this.terms = terms;
    }

    public void addTerms(TermsOfUse t) {
        terms.add(t);
    }

    public boolean agreedToSiteTerms() {
        Integer id = new Integer(Constants.REG_TERMS_ID);
        boolean found = false;
        for (Iterator it = getTerms().iterator(); it.hasNext()&&!found;) {
            found = id.equals(((TermsOfUse)it.next()).getTypeId());
        }
        return found;
    }


}
