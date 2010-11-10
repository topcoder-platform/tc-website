/*
 * Copyright (C) 2001 - 2009 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.web.studio.model;

import java.io.Serializable;

import com.topcoder.web.common.model.Base;
import com.topcoder.web.common.model.TermsOfUse;
import com.topcoder.web.common.model.comp.ResourceRole;

/**
 * <p>This class represents a Contest Role Terms Of Use relationship.</p>
 *
 * <p>
 *   Version 1.0 (Configurable Contest Terms-Studio Release Assembly v1.0):
 *   <p>
 *       This class was created to handle the new ternary (contest - role - terms of use) relationship.
 *   </p>
 * </p>
 *
 * @author pulky
 * @version 1.0
 * @since Configurable Contest Terms-Studio Release Assembly v1.0
 */
public class ContestRoleTermsOfUse extends Base {

    /**
     * Serial version UID for this class.
     *
     * Please change that number if you affect the fields in a way that will affect the
     * serialization for this object, i.e. when data members are changed.
     * @see http://java.sun.com/j2se/1.3/docs/guide/serialization/spec/version.doc7.html
     */
    private static final long serialVersionUID = 1L;

    /**
     * The ContestRoleTermsOfUse identifier
     */
    private Identifier id = new Identifier();

    /**
     * Gets the identifier
     *
     * @return the identifier
     */
    public Identifier getId() {
        return id;
    }

    /**
     * Sets the identifier
     *
     * @param id the identifier to set
     */
    public void setId(Identifier id) {
        this.id = id;
    }

    /**
     * Equals implementation for this class
     *
     * @param o the object to compare
     * @return true if the two objects are equal (identifiers are equal)
     *
     * @see java.lang.Object#equals(java.lang.Object)
     */
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

    /**
     * Hashcode implementation for this class
     *
     * @return an <code>int</code> with the hashcode (identifier hashcode)
     *
     * @see java.lang.Object#hashCode()
     */
    public int hashCode() {
        return getId().hashCode();
    }

    /**
     * <p>This class represents a Contest Role Terms Of Use relationship identifier.</p>
     *
     * <p>
     *   Version 1.0 (Configurable Contest Terms-Studio Release Assembly v1.0):
     *   <p>
     *       This class was created to represent the new ternary (contest - role - terms of use) relationship
     *       identifier.
     *   </p>
     * </p>
     *
     * @author TCSDEVELOPER
     * @version 1.0
     */
    public static class Identifier implements Serializable, Cloneable {

        /**
         * Serial version UID for this class.
         *
         * Please change that number if you affect the fields in a way that will affect the
         * serialization for this object, i.e. when data members are changed.
         * @see http://java.sun.com/j2se/1.3/docs/guide/serialization/spec/version.doc7.html
         */
        private static final long serialVersionUID = 1L;

        /**
         * The <code>Contest</code> of this relationship identifier
         */
        private Contest contest;

        /**
         * The <code>ResourceRole</code> of this relationship identifier
         */
        private ResourceRole resourceRole;

        /**
         * The <code>TermsOfUse</code> of this relationship identifier
         */
        private TermsOfUse terms;

        /**
         * Empty default constructor
         */
        public Identifier() {
        }

        /**
         * Full constructor using parameters.
         *
         * @param contest the <code>Contest</code> to set
         * @param resourceRole the resource role to set
         * @param terms the <code>TermsOfUse</code> to set
         */
        public Identifier(Contest contest, ResourceRole resourceRole, TermsOfUse terms) {
            this.contest = contest;
            this.resourceRole = resourceRole;
            this.terms = terms;
        }

        /**
         * Gets the resource role of this identifier
         *
         * @return the resource role
         */
        public ResourceRole getResourceRole() {
            return resourceRole;
        }

        /**
         * Sets the resource role of this identifier
         *
         * @param resourceRole the resource role to set
         */
        public void setResourceRole(ResourceRole resourceRole) {
            this.resourceRole = resourceRole;
        }

        /**
         * Gets the contest of this identifier
         *
         * @return the contest
         */
        public Contest getContest() {
            return contest;
        }

        /**
         * Sets the contest of this identifier
         *
         * @param contest the contest to set
         */
        public void setContest(Contest contest) {
            this.contest = contest;
        }

        /**
         * Gets the terms of use of this identifier
         *
         * @return the terms of use
         */
        public TermsOfUse getTerms() {
            return terms;
        }

        /**
         * Sets the terms of use of this identifier
         *
         * @param terms the terms to set
         */
        public void setTerms(TermsOfUse terms) {
            this.terms = terms;
        }


        /**
         * Equals implementation for this class. It will compare the three ids composing this identifier.
         *
         * @param o the object to compare
         * @return true if the two objects are equal (identifiers are equal)
         *
         * @see java.lang.Object#equals(java.lang.Object)
         */
        public boolean equals(Object o) {
            if (o == null) {
                return false;
            } else {
                try {
                    ContestRoleTermsOfUse.Identifier oa = (ContestRoleTermsOfUse.Identifier) o;
                    return (oa.contest.getId().equals(contest.getId()) &&
                            oa.resourceRole.getId().equals(resourceRole.getId()) &&
                            oa.terms.getId().equals(terms.getId()));
                } catch (ClassCastException e) {
                    return false;
                }
            }
        }

        /**
         * Hashcode implementation for this class. It will concatenate the three ids composing this identifier and
         * return the hashcode of this concatenation.
         *
         * @return an <code>int</code> with the hashcode (identifier hashcode)
         *
         * @see java.lang.Object#hashCode()
         */
        public int hashCode() {
            StringBuffer buf = new StringBuffer(100);
            buf.append(contest.getId());
            buf.append(" ");
            buf.append(resourceRole.getId());
            buf.append(" ");
            buf.append(terms.getId());
            return buf.toString().hashCode();
        }
    }
}
