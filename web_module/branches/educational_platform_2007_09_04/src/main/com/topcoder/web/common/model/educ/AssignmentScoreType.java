/*
* Professor
*
* Created Sep 10, 2007
*/
package com.topcoder.web.common.model.educ;

import java.util.ArrayList;
import java.util.List;

import com.topcoder.web.common.model.Base;

/**
 * @author Pablo Wolfus (pulky)
 * @version $Id$
 */
public class AssignmentScoreType extends Base {

    public static final Integer TC_SCORE_TYPE = 1;
    public static final Integer PASSED_SCORE_TYPE = 2;
    public static final Integer SUCCESS_FAIL_SCORE_TYPE = 3;
    public static final Integer ACTIVE_STATUS = 1;

    // TODO: create a lookup
    public static List<AssignmentScoreType> getAll() {
        List<AssignmentScoreType> last = new ArrayList<AssignmentScoreType>(3);
        
        last.add(new AssignmentScoreType(TC_SCORE_TYPE, "TC Score (based on time)"));
        last.add(new AssignmentScoreType(PASSED_SCORE_TYPE, "# of passed Test Cases"));
        last.add(new AssignmentScoreType(SUCCESS_FAIL_SCORE_TYPE, "Success / Fail"));
        
        return last;
    }

    
    private Integer id;

    private String description;

    /**
     * @return the description
     */
    public String getDescription() {
        return description;
    }

    /**
     * @param description the description to set
     */
    public void setDescription(String description) {
        this.description = description;
    }

    /**
     * @return the id
     */
    public Integer getId() {
        return id;
    }

    /**
     * @param id the id to set
     */
    public void setId(Integer id) {
        this.id = id;
    }

    /* (non-Javadoc)
     * @see java.lang.Object#hashCode()
     */
    @Override
    public int hashCode() {
        final int PRIME = 31;
        int result = 1;
        result = PRIME * result + ((description == null) ? 0 : description.hashCode());
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
        final AssignmentScoreType other = (AssignmentScoreType) obj;
        if (description == null) {
            if (other.description != null)
                return false;
        } else if (!description.equals(other.description))
            return false;
        if (id == null) {
            if (other.id != null)
                return false;
        } else if (!id.equals(other.id))
            return false;
        return true;
    }

    public AssignmentScoreType(Integer id, String description) {
        super();
        this.id = id;
        this.description = description;
    }
    
    
}
