package com.topcoder.web.common.model;

import java.util.Collections;
import java.util.Set;

/**
 * A class to hold address information
 *
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: Mar 29, 2006
 */
public class Address extends Base {
    public static final Integer OFFICE_TYPE_ID = 1;
    public static final Integer HOME_TYPE_ID = 2;
    public static final Integer BILLING_TYPE_ID = 3;
    public static final Integer PASSPORT_TYPE_ID = 4;
    public static final Integer VISA_LETTER_TYPE_ID = 5;

    private Long id;
    private Integer addressTypeId;
    private String address1;
    private String address2;
    private String address3;
    private String city;
    private String postalCode;
    private String province;
/*
    private String stateCode;
*/
    private State state;
/*
    private String countryCode;
*/
    private Country country;
    private Set users;

    public Address() {

    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Integer getAddressTypeId() {
        return addressTypeId;
    }

    public void setAddressTypeId(Integer addressTypeId) {
        this.addressTypeId = addressTypeId;
    }

    public String getAddress1() {
        return address1;
    }

    public void setAddress1(String address1) {
        this.address1 = address1;
    }

    public String getAddress2() {
        return address2;
    }

    public void setAddress2(String address2) {
        this.address2 = address2;
    }

    public String getAddress3() {
        return address3;
    }

    public void setAddress3(String address3) {
        this.address3 = address3;
    }

    public String getCity() {
        return city;
    }

    public void setCity(String city) {
        this.city = city;
    }

    public String getPostalCode() {
        return postalCode;
    }

    public void setPostalCode(String postalCode) {
        this.postalCode = postalCode;
    }

    public String getProvince() {
        return province;
    }

    public void setProvince(String province) {
        this.province = province;
    }

/*    public String getStateCode() {
        return stateCode;
    }

    public void setStateCode(String stateCode) {
        this.stateCode = stateCode;
    }*/

/*
    public String getCountryCode() {
        return countryCode;
    }

    public void setCountryCode(String countryCode) {
        this.countryCode = countryCode;
    }
*/


    /**
     * Return a copy of the state.  Returning a clone
     * because we don't want anything about the actual
     * State objec to be changed as we don't
     * want to persist changes to the state table.
     *
     * @return the state
     */
    public State getState() {
        return state;
    }

    public void setState(State state) {
        this.state = state;
    }


    public Country getCountry() {
        return country;
    }

    public void setCountry(Country country) {
        this.country = country;
    }

    public Set getUsers() {
        return Collections.unmodifiableSet(users);
    }

    public void setUsers(Set users) {
        this.users = users;
    }


}
