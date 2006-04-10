package com.topcoder.web.reg.model;

import java.util.Set;
import java.util.Collections;
import java.util.Iterator;
import java.util.TreeSet;
import java.io.Serializable;

/**
 * A class containing user information.
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: Mar 29, 2006
 */
public class User implements Serializable {
    private Long id;
    private String firstName;
    private String middleName;
    private String lastName;
    private String handle;
    private Character status;
    private String password;
    private String activationCode;
    private Set addresses;
    private Set emailAddresses;
    private Set phoneNumbers;
    private Integer timezoneId;
    private Set demographicResponses;

    public User() {
        addresses = new TreeSet();
        emailAddresses = new TreeSet();
        phoneNumbers = new TreeSet();
        demographicResponses = new TreeSet();
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

    public Integer getTimezoneId() {
        return timezoneId;
    }

    public void setTimezoneId(Integer timezoneId) {
        this.timezoneId = timezoneId;
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


    public Object clone() throws CloneNotSupportedException {
        User ret = (User)super.clone();
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

        return ret;
    }

}
