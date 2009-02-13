/*
* Component
*
* Created Oct 1, 2007
*/
package com.topcoder.web.common.model.algo;

import com.topcoder.web.common.model.Base;

/**
 * @author Pablo Wolfus (pulky)
 * @version $Id$
 */
public class Problem extends Base {

    private Long id = null;
    private String name = null;
    private String problemText = null;
    private Integer problemTypeId = null;
    private Integer statusId = null;
    private Integer proposedDivisionId = null;
    private Difficulty proposedDifficulty = null;

    
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
     * @return the name
     */
    public String getName() {
        return name;
    }
    /**
     * @param name the name to set
     */
    public void setName(String name) {
        this.name = name;
    }
    /**
     * @return the problemText
     */
    public String getProblemText() {
        return problemText;
    }
    /**
     * @param problemText the problemText to set
     */
    public void setProblemText(String problemText) {
        this.problemText = problemText;
    }
    /**
     * @return the problemTypeId
     */
    public Integer getProblemTypeId() {
        return problemTypeId;
    }
    /**
     * @param problemTypeId the problemTypeId to set
     */
    public void setProblemTypeId(Integer problemTypeId) {
        this.problemTypeId = problemTypeId;
    }
    /**
     * @return the proposedDifficulty
     */
    public Difficulty getProposedDifficulty() {
        return proposedDifficulty;
    }
    /**
     * @param proposedDifficulty the proposedDifficulty to set
     */
    public void setProposedDifficulty(Difficulty proposedDifficulty) {
        this.proposedDifficulty = proposedDifficulty;
    }
    /**
     * @return the proposedDivisionId
     */
    public Integer getProposedDivisionId() {
        return proposedDivisionId;
    }
    /**
     * @param proposedDivisionId the proposedDivisionId to set
     */
    public void setProposedDivisionId(Integer proposedDivisionId) {
        this.proposedDivisionId = proposedDivisionId;
    }
    /**
     * @return the statusId
     */
    public Integer getStatusId() {
        return statusId;
    }
    /**
     * @param statusId the statusId to set
     */
    public void setStatusId(Integer statusId) {
        this.statusId = statusId;
    }
    /* (non-Javadoc)
     * @see java.lang.Object#hashCode()
     */
    @Override
    public int hashCode() {
        final int PRIME = 31;
        int result = 1;
        result = PRIME * result + ((id == null) ? 0 : id.hashCode());
        result = PRIME * result + ((name == null) ? 0 : name.hashCode());
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
        final Problem other = (Problem) obj;
        if (id == null) {
            if (other.id != null)
                return false;
        } else if (!id.equals(other.id))
            return false;
        if (name == null) {
            if (other.name != null)
                return false;
        } else if (!name.equals(other.name))
            return false;
        return true;
    }
}
