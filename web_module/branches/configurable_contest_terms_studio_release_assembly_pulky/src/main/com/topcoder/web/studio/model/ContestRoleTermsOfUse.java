/*
 * Copyright (C) 2001 - 2009 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.web.studio.model;

import java.io.Serializable;

import com.topcoder.web.common.model.Base;
import com.topcoder.web.common.model.TermsOfUse;

public class ContestRoleTermsOfUse extends Base {
    /**
     * 
     */
    private static final long serialVersionUID = 1L;
    
    private Identifier id = new Identifier();

    public Identifier getId() {
        return id;
    }

    public void setId(Identifier id) {
        this.id = id;
    }

    public boolean equals(Object o) {
        if (o == null) {
            return false;
        } else {
            try {
                ContestRoleTermsOfUse other = (ContestRoleTermsOfUse) o;
                return id.equals(other.getId());
            } catch (ClassCastException e) {
                return false;
            }
        }
    }

    public int hashCode() {
        return getId().hashCode();
    }

    public static class Identifier implements Serializable, Cloneable {
        /**
         * 
         */
        private static final long serialVersionUID = 1L;
        
        private Contest contest;
        private Integer roleId;
        private TermsOfUse terms;

        public Identifier() {
        }

        public Identifier(Contest contest, Integer roleId, TermsOfUse terms) {
            this.contest = contest;
            this.roleId = roleId;
            this.terms = terms;
        }

        public Integer getRoleId() {
            return roleId;
        }

        public void setRoleId(Integer roleId) {
            this.roleId = roleId;
        }

        public Contest getContest() {
            return contest;
        }

        public void setContest(Contest contest) {
            this.contest = contest;
        }

        public TermsOfUse getTerms() {
            return terms;
        }

        public void setTerms(TermsOfUse terms) {
            this.terms = terms;
        }


        public boolean equals(Object o) {
            if (o == null) {
                return false;
            } else {
                try {
                    ContestRoleTermsOfUse.Identifier oa = (ContestRoleTermsOfUse.Identifier) o;
                    return (oa.contest.getId().equals(contest.getId()) &&
                            oa.roleId.equals(roleId) &&
                            oa.terms.getId().equals(terms.getId()));
                } catch (ClassCastException e) {
                    return false;
                }
            }
        }

        public int hashCode() {
            StringBuffer buf = new StringBuffer(100);
            buf.append(contest.getId());
            buf.append(" ");
            buf.append(roleId);
            buf.append(" ");
            buf.append(terms.getId());
            return buf.toString().hashCode();
        }
    }
}
