package com.topcoder.web.common.voting;

import com.topcoder.web.common.model.Base;

import java.util.*;

/**
 * @author dok
 * @version $Revision$ $Date$
 *          Create Date: Aug 31, 2005
 */
public class Candidate extends Base {

    private String name;
    private Long id;
    private CondorcetSchulzeElection election;
    private Set info;
    private Set votes;

    public Candidate() {
        info = new HashSet();
        votes = new HashSet();
    }


    public Candidate(String name) {
        this();
        this.name = name;
    }

    public Set getInfo() {
        return info;
    }

    public void setInfo(Set info) {
        this.info = info;
    }

    public CondorcetSchulzeElection getElection() {
        return election;
    }

    public void setElection(CondorcetSchulzeElection election) {
        this.election = election;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public CandidateInfo getInfo(Integer propertyId) {
        for (Iterator it = info.iterator(); it.hasNext();) {
            CandidateInfo ci = (CandidateInfo) it.next();
            if (ci.getId().getProperty().getId().equals(propertyId)) {
                return ci;
            }
        }
        return null;
    }

    public Map getInfoMap() {
        HashMap m = new HashMap();
        for (Iterator it = info.iterator(); it.hasNext();) {
            CandidateInfo ci = (CandidateInfo) it.next();
            m.put(ci.getId().getProperty().getId(), ci.getValue());
        }
        return m;
    }

    public boolean equals(Object o) {
        try {
            if (o == null) {
                return false;
            } else {
                Candidate other = (Candidate) o;
                if (this.getId() == null || other.getId() == null) {
                    return this.getName().equals(other.getName());
                } else {
                    return this.getId().equals(other.getId()) && this.getName().equals(other.getName());
                }
            }
        } catch (ClassCastException e) {
            return false;
        }
    }


    public String toString() {
        return this.name + ":" + this.id;
    }

    public int hashCode() {
        if (id == null) {
            return this.name.hashCode();
        } else if (this.name == null) {
            return this.id.hashCode();
        } else {
            return (this.name + this.id).hashCode();
        }
    }

    /**
     * @return an unmodifiable set of votes for this candidate
     */
    public Set getVotes() {
        return Collections.unmodifiableSet(votes);
    }


    /**
     * class to sort candidates alphabetically by name, and if two are named the same,
     * then by id.  undefined if both name and id are the same.
     */
    public static class IDComparator implements Comparator {

        public int compare(Object o1, Object o2) {
            Candidate c1 = (Candidate) o1;
            Candidate c2 = (Candidate) o2;
            int ret = c1.getName().compareTo(c2.getName());
            return ret == 0 ? c1.getId().compareTo(c2.getId()) : ret;
        }
    }


}
