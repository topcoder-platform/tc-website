package com.topcoder.web.oracle.model;

import com.topcoder.web.common.model.Base;

import java.io.Serializable;

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: Mar 14, 2007
 */
public class CandidateInfo extends Base {
    String value;
    Identifier id = new Identifier();

    public String getValue() {
        return value;
    }

    public void setValue(String value) {
        this.value = value;
    }

    public Identifier getId() {
        return id;
    }

    public void setId(Identifier id) {
        this.id = id;
    }

    public CandidateProperty getProperty() {
        return id.getProperty();
    }

    public void setProperty(CandidateProperty property) {
        id.setProperty(property);
    }

    public Candidate getCandidate() {
        return id.getCandidate();
    }

    public void setCandidate(Candidate candidate) {
        id.setCandidate(candidate);
    }


    public boolean equals(Object o) {
        if (o == null) {
            return false;
        } else {
            try {
                CandidateInfo oa = (CandidateInfo) o;
                return getId().equals(oa.getId());
            } catch (ClassCastException e) {
                return false;
            }
        }
    }

    public int hashCode() {
        return getId().hashCode();
    }

    public static class Identifier implements Serializable, Cloneable {

        private CandidateProperty property;
        private Candidate candidate;

        public Identifier() {

        }

        public Identifier(CandidateProperty property, Candidate candidate) {
            this.property = property;
            this.candidate = candidate;
        }


        public CandidateProperty getProperty() {
            return property;
        }

        public void setProperty(CandidateProperty property) {
            this.property = property;
        }

        public Candidate getCandidate() {
            return candidate;
        }

        public void setCandidate(Candidate candidate) {
            this.candidate = candidate;
        }

        public boolean equals(Object o) {
            if (o == null) {
                return false;
            } else {
                try {
                    CandidateInfo.Identifier oa = (CandidateInfo.Identifier) o;
                    return (oa.property.getId().equals(property.getId()) &&
                            oa.candidate.getId().equals(candidate.getId()));
                } catch (ClassCastException e) {
                    return false;
                }
            }
        }

        public int hashCode() {
            try {
                StringBuffer buf = new StringBuffer(100);
                buf.append(property.getId());
                buf.append(" ");
                buf.append(candidate.getId());
                return buf.toString().hashCode();
            } catch (NullPointerException t) {
                t.printStackTrace();
                throw t;
            }
        }


    }
}




