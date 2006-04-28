package com.topcoder.web.reg.model;

import com.topcoder.web.common.model.Base;

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
    private Set demographicResponses;
    private Set securityGroups;

    public User() {
        addresses = new HashSet();
        emailAddresses = new HashSet();
        phoneNumbers = new HashSet();
        demographicResponses = new HashSet();
        notifications = new TreeSet();
        securityGroups = new HashSet();
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

    public Set getPhoneNumbers() {
        return Collections.unmodifiableSet(phoneNumbers);
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
        try {
            return (TimeZone)timeZone.clone();
        } catch (CloneNotSupportedException e) {
            throw new RuntimeException("What the heck, how did Timezone stop being clonable?");
        }
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

    public Set getRegistrationTypes() {
        //i think this could be done better with an HQL query, but dunno how yet
        SecurityGroup g;
        Set ret = new HashSet();
        for (Iterator it = securityGroups.iterator(); it.hasNext();) {
            g = (SecurityGroup)it.next();
            for (Iterator it1 = g.getRegistrationTypes().iterator(); it1.hasNext();) {
                RegistrationType o = (RegistrationType)it1.next();
                log.debug(o.getDescription());
                ret.add(o);
            }
        }
        return Collections.unmodifiableSet(ret);
    }

    public Object clone() throws CloneNotSupportedException {
        User ret = (User)super.clone();
        ret.setTimeZone((TimeZone)timeZone.clone());
        for(Iterator it = addresses.iterator(); it.hasNext();) {
            ret.addAddress((Address)((Address)it.next()).clone());
        }
        for(Iterator it =phoneNumbers.iterator(); it.hasNext();) {
            ret.addPhoneNumber((Phone)((Phone)it.next()).clone());
        }
        for(Iterator it =emailAddresses.iterator(); it.hasNext();) {
            ret.addEmailAddress((Email)((Email)it.next()).clone());
        }
        for(Iterator it =demographicResponses.iterator(); it.hasNext();) {
            ret.addDemographicResponse((DemographicResponse)((DemographicResponse)it.next()).clone());
        }
        for(Iterator it =notifications.iterator(); it.hasNext();) {
            ret.addNotification((Notification)((Notification)it.next()).clone());
        }
        for(Iterator it =securityGroups.iterator(); it.hasNext();) {
            ret.securityGroups.add(((SecurityGroup)it.next()).clone());
        }

        return ret;
    }

}
