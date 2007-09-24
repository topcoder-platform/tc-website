/*
* Professor
*
* Created Sep 10, 2007
*/
package com.topcoder.web.common.model.algo;

import java.io.Serializable;

import com.topcoder.web.common.model.Base;

/**
 * @author Pablo Wolfus (pulky)
 * @version $Id$
 */
public class RoundProperty extends Base {

    protected Identifier id = new Identifier();
    protected Integer intValue;
    protected String stringValue;

    public RoundProperty() {
    }

    public Identifier getId() {
        return id;
    }

    public void setId(Identifier id) {
        this.id = id;
    }


    public static class Identifier implements Serializable {

        private Round round = null;
        private Long typeId = null;

        public Identifier() {

        }


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
         * @return the typeId
         */
        public Long getTypeId() {
            return typeId;
        }


        /**
         * @param typeId the typeId to set
         */
        public void setTypeId(Long typeId) {
            this.typeId = typeId;
        }


        /* (non-Javadoc)
         * @see java.lang.Object#hashCode()
         */
        @Override
        public int hashCode() {
            final int PRIME = 31;
            int result = 1;
            result = PRIME * result + ((round == null) ? 0 : round.hashCode());
            result = PRIME * result + ((typeId == null) ? 0 : typeId.hashCode());
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
            if (round == null) {
                if (other.round != null)
                    return false;
            } else if (!round.equals(other.round))
                return false;
            if (typeId == null) {
                if (other.typeId != null)
                    return false;
            } else if (!typeId.equals(other.typeId))
                return false;
            return true;
        }

    }



    /**
     * @return the intValue
     */
    public Integer getIntValue() {
        return intValue;
    }

    /**
     * @param intValue the intValue to set
     */
    public void setIntValue(Integer intValue) {
        this.intValue = intValue;
    }

    /**
     * @return the stringValue
     */
    public String getStringValue() {
        return stringValue;
    }

    /**
     * @param stringValue the stringValue to set
     */
    public void setStringValue(String stringValue) {
        this.stringValue = stringValue;
    }
}

