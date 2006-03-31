package com.topcoder.web.reg.model;

import java.sql.Timestamp;
import java.util.Set;
import java.util.Collections;
import java.util.Iterator;
import java.util.TreeSet;

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: Mar 29, 2006
 */
public class Coder extends User {

    private Timestamp memberSince;
    private String quote;
    private Integer coderTypeId;
    private String compCountryCoder;
    private Set algoRatings;

    public Coder() {
        super();
        algoRatings = new TreeSet();
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

    public Integer getCoderTypeId() {
        return coderTypeId;
    }

    public void setCoderTypeId(Integer coderTypeId) {
        this.coderTypeId = coderTypeId;
    }

    public String getCompCountryCoder() {
        return compCountryCoder;
    }

    public void setCompCountryCoder(String compCountryCoder) {
        this.compCountryCoder = compCountryCoder;
    }
    public Set getAlgoRatings() {
        return Collections.unmodifiableSet(algoRatings);
    }

    public void setAlgoRatings(Set ratings) {
        this.algoRatings = ratings;
    }
    public void addRating(AlgoRating r) {
        this.algoRatings.add(r);
    }

    public Object clone() throws CloneNotSupportedException {
        Coder ret = (Coder)super.clone();
        for(Iterator it = algoRatings.iterator(); it.hasNext();) {
            ret.addRating((AlgoRating)((AlgoRating)it.next()).clone());
        }
        return ret;
    }
}
