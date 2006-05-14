package com.topcoder.web.reg.model;

import com.topcoder.web.common.model.Base;

import java.sql.Timestamp;

/**
 * A class to hold coder data.
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: Mar 29, 2006
 */
public class Coder extends Base {

    private Long id;
    private Timestamp memberSince;
    private String quote;
    private CoderType coderType;
    private Country compCountry;
/*
    private HSAlgoRating hsRating;
    private TCAlgoRating tcRating;
*/
    private CurrentSchool currentSchool;
    private User user;


    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }


    public Timestamp getMemberSince() {
        return memberSince;
    }

    public void setMemberSince(Timestamp memberSince) {
        this.memberSince = memberSince;
    }

    public String getQuote() {
        return quote;
    }

    public void setQuote(String quote) {
        this.quote = quote;
    }


    public Country getCompCountry() {
        return compCountry;
    }

    public void setCompCountry(Country compCountry) {
        this.compCountry = compCountry;
    }

/*
    public HSAlgoRating getHSRating() {
        return hsRating;
    }

    public void setHSRating(HSAlgoRating hsRating) {
        this.hsRating = hsRating;
    }

    public TCAlgoRating getTCRating() {
        return tcRating;
    }

    public void setTCRating(TCAlgoRating tcRating) {
        this.tcRating = tcRating;
    }
*/

    public CoderType getCoderType() {
        return coderType;
    }

    public void setCoderType(CoderType coderType) {
        this.coderType = coderType;
    }

    public CurrentSchool getCurrentSchool() {
        return currentSchool;
    }

    public void setCurrentSchool(CurrentSchool currentSchool) {
        this.currentSchool = currentSchool;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public Object clone() throws CloneNotSupportedException {
        Coder ret = (Coder) super.clone();
/*
        ret.setHSRating((HSAlgoRating) hsRating.clone());
        ret.setTCRating((TCAlgoRating) tcRating.clone());
*/
        ret.setCurrentSchool((CurrentSchool) currentSchool.clone());
        ret.setUser((User) user.clone());
        return ret;
    }

}
