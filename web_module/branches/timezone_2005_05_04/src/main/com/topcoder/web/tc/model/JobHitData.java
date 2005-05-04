package com.topcoder.web.tc.model;

import java.io.Serializable;
import java.util.Map;
import java.util.TreeMap;

/**
 * A class to process job hits.
 * @author  Greg Paul
 */
public class JobHitData implements Serializable {

    public static final String CODER_TYPE_STUDENT = "1";

    private long userId;
    private int rating;
    private String firstName;
    private String lastName;
    private String address1;
    private String address2;
    private String city;
    private String state;
    private String zip;
    private String country;
    private String phone;
    private String handle;
    private String email;
    private String coderType;
    private String coderTypeId;
    private String school;
    private String memberSince;
    private String mostRecentEvent;
    private String gpa;
    private String gpaScale;
    private Map demographics;
    private boolean hasResume;
    private boolean newbie;
    private long nextRoundId;
    private long nextContestId;
    private String nextRoundName;
    private String nextContestName;


    /** Creates new JobHitTask */
    public JobHitData() {
        super();
        setUserId(-1);
        setRating(0);
        setFirstName("");
        setLastName("");
        setAddress1("");
        setAddress2("");
        setCity("");
        setState("");
        setZip("");
        setCountry("");
        setPhone("");
        setHandle("");
        setEmail("");
        setCoderType("");
        setCoderTypeId("");
        setSchool("");
        setMemberSince("");
        setMostRecentEvent("");
        setGpa("");
        setGpaScale("");
        setDemographics(new TreeMap());
        setHasResume(false);
        setNewbie(false);
        setNextRoundId(0);
        setNextContestId(0);
        setNextRoundName("");
        setNextContestName("");
    }

    public boolean hasResume() {
        return hasResume;
    }

    public void setHasResume(boolean hasResume) {
        this.hasResume = hasResume;
    }

    public boolean isNewbie() {
        return newbie;
    }

    public void setNewbie(boolean newbie) {
        this.newbie = newbie;
    }

    public long getUserId() {
        return userId;
    }

    public void setUserId(long userId) {
        this.userId = userId;
    }

    public int getRating() {
        return rating;
    }

    public void setRating(int rating) {
        this.rating = rating;
    }


    public String getFirstName() {
        return firstName;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    public String getLastName() {
        return lastName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
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

    public String getState() {
        return state;
    }

    public void setState(String state) {
        this.state = state;
    }

    public String getZip() {
        return zip;
    }

    public void setZip(String zip) {
        this.zip = zip;
    }

    public String getCity() {
        return city;
    }

    public void setCity(String city) {
        this.city = city;
    }

    public String getCountry() {
        return country;
    }

    public void setCountry(String country) {
        this.country = country;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getHandle() {
        return handle;
    }

    public void setHandle(String handle) {
        this.handle = handle;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public Map getDemographics() {
        return demographics;
    }

    public void addDemographic(Object key, Object value) {
        demographics.put(key, value);
    }

    public void setDemographics(Map demographics) {
        this.demographics = demographics;
    }

    public String getSchool() {
        return school;
    }

    public void setSchool(String school) {
        this.school = school;
    }

    public String getCoderType() {
        return coderType;
    }

    public void setCoderType(String coderType) {
        this.coderType = coderType;
    }

    public String getCoderTypeId() {
        return coderTypeId;
    }

    public void setCoderTypeId(String coderTypeId) {
        this.coderTypeId = coderTypeId;
    }

    public String getMemberSince() {
        return memberSince;
    }

    public void setMemberSince(String memberSince) {
        this.memberSince = memberSince;
    }

    public String getMostRecentEvent() {
        return mostRecentEvent;
    }

    public void setMostRecentEvent(String mostRecentEvent) {
        this.mostRecentEvent = mostRecentEvent;
    }

    public String getGpa() {
        return gpa;
    }

    public void setGpa(String gpa) {
        this.gpa = gpa;
    }

    public String getGpaScale() {
        return gpaScale;
    }

    public void setGpaScale(String gpaScale) {
        this.gpaScale = gpaScale;
    }

    public long getNextRoundId() {
        return nextRoundId;
    }

    public void setNextRoundId(long nextRoundId) {
        this.nextRoundId = nextRoundId;
    }

    public long getNextContestId() {
        return nextContestId;
    }

    public void setNextContestId(long nextContestId) {
        this.nextContestId = nextContestId;
    }

    public String getNextRoundName() {
        return nextRoundName;
    }

    public void setNextRoundName(String nextRoundName) {
        this.nextRoundName = nextRoundName;
    }

    public String getNextContestName() {
        return nextContestName;
    }

    public void setNextContestName(String nextContestName) {
        this.nextContestName = nextContestName;
    }


}
