package com.topcoder.web.common.model;

import org.hibernate.annotations.GenericGenerator;
import org.hibernate.annotations.Parameter;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.ManyToOne;

/**
 * A class to hold address information
 *
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: Mar 29, 2006
 */
@Entity
@Table(name="address")
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
    private State state;
    private Country country;

    public Address() {

    }

    @Id
    @GenericGenerator(name="address_id",
            strategy="com.topcoder.web.common.model.IdGenerator",
            parameters={@Parameter(name="sequence_name", value="ADDRESS_SEQ")})
    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    @Column(name="address_type_id")
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

    @Column(name="zip")
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

    @ManyToOne
    public State getState() {
        return state;
    }

    public void setState(State state) {
        this.state = state;
    }

    @ManyToOne
    public Country getCountry() {
        return country;
    }

    public void setCountry(Country country) {
        this.country = country;
    }

}
