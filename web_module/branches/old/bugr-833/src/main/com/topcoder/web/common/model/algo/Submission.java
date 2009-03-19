/*
* Submission
*
* Created Oct 1, 2007
*/
package com.topcoder.web.common.model.algo;

import java.io.Serializable;

import com.topcoder.web.common.model.Base;

/**
 * @author Pablo Wolfus (pulky)
 * @version $Id$
 */
public class Submission extends Base {

    protected Identifier id = new Identifier();

    private String submissionText = null;
    private Long openTime = null;
    private Long submitTime = null;
    
    public Submission() {
        super();
    }

    public Identifier getId() {
        return id;
    }

    public void setId(Identifier id) {
        this.id = id;
    }

    /**
     * @return the submissionText
     */
    public String getSubmissionText() {
        return submissionText;
    }

    /**
     * @param submissionText the submissionText to set
     */
    public void setSubmissionText(String submissionText) {
        this.submissionText = submissionText;
    }

    /**
     * @return the openTime
     */
    public Long getOpenTime() {
        return openTime;
    }

    /**
     * @param openTime the openTime to set
     */
    public void setOpenTime(Long openTime) {
        this.openTime = openTime;
    }

    /**
     * @return the submitTime
     */
    public Long getSubmitTime() {
        return submitTime;
    }

    /**
     * @param submitTime the submitTime to set
     */
    public void setSubmitTime(Long submitTime) {
        this.submitTime = submitTime;
    }

    public static class Identifier implements Serializable {
        private ComponentState componentState = null;
        private Integer submissionNumber = null;

        public Identifier() {
            super();
        }
        
        public Identifier(ComponentState componentState, Integer submissionNumber) {
            super();
            this.componentState = componentState;
            this.submissionNumber = submissionNumber;
        }
        /**
         * @return the componentState
         */
        public ComponentState getComponentState() {
            return componentState;
        }
        /**
         * @param componentState the componentState to set
         */
        public void setComponentState(ComponentState componentState) {
            this.componentState = componentState;
        }
        /**
         * @return the submissionNumber
         */
        public Integer getSubmissionNumber() {
            return submissionNumber;
        }
        /**
         * @param submissionNumber the submissionNumber to set
         */
        public void setSubmissionNumber(Integer submissionNumber) {
            this.submissionNumber = submissionNumber;
        }
        /* (non-Javadoc)
         * @see java.lang.Object#hashCode()
         */
        @Override
        public int hashCode() {
            final int prime = 31;
            int result = 1;
            result = prime * result
                    + ((componentState == null) ? 0 : componentState.hashCode());
            result = prime
                    * result
                    + ((submissionNumber == null) ? 0 : submissionNumber
                            .hashCode());
            return result;
        }
        /* (non-Javadoc)
         * @see java.lang.Object#equals(java.lang.Object)
         */
        @Override
        public boolean equals(Object obj) {
            if (this == obj)
                return true;
            if (obj == null)
                return false;
            if (getClass() != obj.getClass())
                return false;
            final Identifier other = (Identifier) obj;
            if (componentState == null) {
                if (other.componentState != null)
                    return false;
            } else if (!componentState.equals(other.componentState))
                return false;
            if (submissionNumber == null) {
                if (other.submissionNumber != null)
                    return false;
            } else if (!submissionNumber.equals(other.submissionNumber))
                return false;
            return true;
        }

        
    }

    /* (non-Javadoc)
     * @see java.lang.Object#hashCode()
     */
    @Override
    public int hashCode() {
        final int prime = 31;
        int result = 1;
        result = prime * result + ((id == null) ? 0 : id.hashCode());
        return result;
    }

    /* (non-Javadoc)
     * @see java.lang.Object#equals(java.lang.Object)
     */
    @Override
    public boolean equals(Object obj) {
        if (this == obj)
            return true;
        if (obj == null)
            return false;
        if (getClass() != obj.getClass())
            return false;
        final Submission other = (Submission) obj;
        if (id == null) {
            if (other.id != null)
                return false;
        } else if (!id.equals(other.id))
            return false;
        return true;
    }

}
