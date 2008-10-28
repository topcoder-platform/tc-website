package com.topcoder.web.oracle.model;

import com.topcoder.web.common.model.Base;

import java.util.*;

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: Mar 14, 2007
 */
public class Candidate extends Base {

    private String name;
    private Integer id;
    private Set<CandidateInfo> info;

    public Candidate() {
        info = new HashSet<CandidateInfo>();
    }


    public Candidate(String name) {
        this();
        this.name = name;
    }

    public Set<CandidateInfo> getInfo() {
        return info;
    }

    public void setInfo(Set<CandidateInfo> info) {
        this.info = info;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public CandidateInfo getInfo(Integer propertyId) {
        for (CandidateInfo anInfo : info) {
            if (anInfo.getId().getProperty().getId().equals(propertyId)) {
                return anInfo;
            }
        }
        return null;
    }

    public Map<Integer, String> getInfoMap() {
        HashMap<Integer, String> m = new HashMap<Integer, String>();
        for (CandidateInfo anInfo : info) {
            m.put(anInfo.getId().getProperty().getId(), anInfo.getValue());
        }
        return m;
    }

    /**
     * Add a info to this candidate
     * and make the association between that object and this candidate
     *
     * @param info the info to add
     */

    public void addInfo(CandidateInfo info) {
        info.setCandidate(this);
        this.info.add(info);
    }

    public boolean equals(Object o) {
        try {
            if (o == null) {
                return false;
            } else {
                Candidate other = (Candidate) o;
                if (getId() == null || other.getId() == null) {
                    return getName().equals(other.getName());
                } else {
                    return getId().equals(other.getId()) && getName().equals(other.getName());
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
        if (id == null && name == null) {
            return 0;
        } else if (id == null) {
            return name.hashCode();
        } else if (name == null) {
            return id.hashCode();
        } else {
            return (name + id).hashCode();
        }
    }

    /**
     * class to sort candidates alphabetically by name, and if two are named the same,
     * then by id.  undefined if both name and id are the same.
     */
    public static class IDComparator implements Comparator<Candidate> {

        public int compare(Candidate c1, Candidate c2) {
            int ret = c1.getName().compareTo(c2.getName());
            return ret == 0 ? c1.getId().compareTo(c2.getId()) : ret;
        }
    }


}
