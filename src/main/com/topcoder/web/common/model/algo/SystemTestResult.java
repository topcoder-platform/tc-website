package com.topcoder.web.common.model.algo;

import java.io.Serializable;

import com.topcoder.web.common.model.Base;
import com.topcoder.web.common.model.Coder;

/**
 * @author pulky
 */
public class SystemTestResult extends Base {

    protected Identifier id = new Identifier();

    private Integer succeeded= null;
    
    public Identifier getId() {
        return id;
    }

    public void setId(Identifier id) {
        this.id = id;
    }
    
    /**
     * @return the succeeded
     */
    public Integer getSucceeded() {
        return succeeded;
    }

    /**
     * @param succeeded the succeeded to set
     */
    public void setSucceeded(Integer succeeded) {
        this.succeeded = succeeded;
    }
    
    public static class Identifier implements Serializable {

        private Round round = null;
        private Component component = null;
        private Coder coder = null;
        private Long testCaseId = null;
        /**
         * @return the round
         */
        public Round getRound() {
            return round;
        }
        /**
         * @param round the round to set
         */
        public void setRound(Round round) {
            this.round = round;
        }
        /**
         * @return the component
         */
        public Component getComponent() {
            return component;
        }
        /**
         * @param component the component to set
         */
        public void setComponent(Component component) {
            this.component = component;
        }
        /**
         * @return the coder
         */
        public Coder getCoder() {
            return coder;
        }
        /**
         * @param coder the coder to set
         */
        public void setCoder(Coder coder) {
            this.coder = coder;
        }
        /**
         * @return the testCaseId
         */
        public Long getTestCaseId() {
            return testCaseId;
        }
        /**
         * @param testCaseId the testCaseId to set
         */
        public void setTestCaseId(Long testCaseId) {
            this.testCaseId = testCaseId;
        }
        /* (non-Javadoc)
         * @see java.lang.Object#hashCode()
         */
        @Override
        public int hashCode() {
            final int prime = 31;
            int result = 1;
            result = prime * result + ((coder == null) ? 0 : coder.getId().hashCode());
            result = prime * result
                    + ((component == null) ? 0 : component.hashCode());
            result = prime * result + ((round == null) ? 0 : round.hashCode());
            result = prime * result
                    + ((testCaseId == null) ? 0 : testCaseId.hashCode());
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
            if (coder == null) {
                if (other.coder != null)
                    return false;
            } else if (!coder.getId().equals(other.coder.getId()))
                return false;
            if (component == null) {
                if (other.component != null)
                    return false;
            } else if (!component.equals(other.component))
                return false;
            if (round == null) {
                if (other.round != null)
                    return false;
            } else if (!round.equals(other.round))
                return false;
            if (testCaseId == null) {
                if (other.testCaseId != null)
                    return false;
            } else if (!testCaseId.equals(other.testCaseId))
                return false;
            return true;
        }
    }


    /* (non-Javadoc)
     * @see java.lang.Object#hashCode()
     */
    @Override
    public int hashCode() {
        final int PRIME = 31;
        int result = 1;
        result = PRIME * result + ((id == null) ? 0 : id.hashCode());
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
        final SystemTestResult other = (SystemTestResult) obj;
        if (id == null) {
            if (other.id != null)
                return false;
        } else if (!id.equals(other.id))
            return false;
        return true;
    }

}
