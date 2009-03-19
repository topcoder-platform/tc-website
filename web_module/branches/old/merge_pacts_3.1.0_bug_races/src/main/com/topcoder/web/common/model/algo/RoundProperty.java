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

    private static final int CLASSROOM_ID = 1;
    private static final int CODING_PHASE_LENGTH = 2;
    private static final int SHOW_ALL_SCORES = 3;
    private static final int SCORE_TYPE = 4;

    public static final Integer CLASSROOM_ID_PROPERTY_ID = 1;
    public static final Integer CODING_PHASE_LENGTH_PROPERTY_ID = 2;
    public static final Integer SHOW_ALL_SCORES_PROPERTY_ID = 3;
    public static final Integer SCORE_TYPE_PROPERTY_ID = 4;

    private Identifier id = new Identifier();
    private Long intValue;
    private String stringValue;

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
        private Integer typeId = null;

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
        public Integer getTypeId() {
            return typeId;
        }


        /**
         * @param typeId the typeId to set
         */
        public void setTypeId(Integer typeId) {
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
    public Long getIntValue() {
        return intValue;
    }

    /**
     * @param intValue the intValue to set
     */
    public void setIntValue(Long intValue) {
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

    public void setValue(Object propertyValue) {
        switch (id.typeId){
            case CLASSROOM_ID:
                setIntValue((Long) propertyValue);
                break;
            case CODING_PHASE_LENGTH:
                setIntValue((Long) propertyValue * 60);
                break;
            case SHOW_ALL_SCORES:
                setIntValue((Long) propertyValue);
                break;
            case SCORE_TYPE:
                setIntValue((Long) propertyValue);
                break;
        }
    }

    public Object getValue() {
        switch (id.typeId){
            case CLASSROOM_ID:
                return getIntValue();
            case CODING_PHASE_LENGTH:
                return (Long) (getIntValue() / 60) ;
            case SHOW_ALL_SCORES:
                return getIntValue();
            case SCORE_TYPE:
                return getIntValue();
        }
        return null;
    }
}

