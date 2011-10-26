/*
* Difficulty
*
* Created Oct 1, 2007
*/
package com.topcoder.web.common.model.algo;

import com.topcoder.web.common.model.Base;

/**
 * @author Pablo Wolfus (pulky)
 * @version $Id: Difficulty.java 66662 2007-10-25 12:59:15Z pulky $
 */
public class Difficulty extends Base {

    private Long id = null;
    private String difficultyLevel = null;
    private String difficultyDesc = null;
    private Double pointValue = null;

    
    /**
     * @return the id
     */
    public Long getId() {
        return id;
    }
    /**
     * @param id the id to set
     */
    public void setId(Long id) {
        this.id = id;
    }
    /**
     * @return the difficultyDesc
     */
    public String getDifficultyDesc() {
        return difficultyDesc;
    }
    /**
     * @param difficultyDesc the difficultyDesc to set
     */
    public void setDifficultyDesc(String difficultyDesc) {
        this.difficultyDesc = difficultyDesc;
    }
    /**
     * @return the difficultyLevel
     */
    public String getDifficultyLevel() {
        return difficultyLevel;
    }
    /**
     * @param difficultyLevel the difficultyLevel to set
     */
    public void setDifficultyLevel(String difficultyLevel) {
        this.difficultyLevel = difficultyLevel;
    }
    /**
     * @return the pointValue
     */
    public Double getPointValue() {
        return pointValue;
    }
    /**
     * @param pointValue the pointValue to set
     */
    public void setPointValue(Double pointValue) {
        this.pointValue = pointValue;
    }
    /* (non-Javadoc)
     * @see java.lang.Object#hashCode()
     */
    @Override
    public int hashCode() {
        final int PRIME = 31;
        int result = 1;
        result = PRIME * result + ((difficultyDesc == null) ? 0 : difficultyDesc.hashCode());
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
        final Difficulty other = (Difficulty) obj;
        if (difficultyDesc == null) {
            if (other.difficultyDesc != null)
                return false;
        } else if (!difficultyDesc.equals(other.difficultyDesc))
            return false;
        return true;
    }
}
