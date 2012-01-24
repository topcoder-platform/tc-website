/*
* ComponentDTO
*
* Created Oct 8, 2007
*/
package com.topcoder.web.ep.dto;

import java.io.Serializable;


/**
 * @author Pablo Wolfus (pulky)
 * @version $Id$
 */
public class ComponentDTO implements Serializable {
    private static final long serialVersionUID = 1L;

    private Long componentId = null;
    private Double points = null;
    private String problemName = null;
    
    public ComponentDTO(Long componentId) {
        super();
        this.componentId = componentId;
    }
    
    public ComponentDTO(Long componentId, Double points, String problemName) {
        super();
        this.componentId = componentId;
        this.points = points;
        this.problemName = problemName;
    }

    /**
     * @return the componentId
     */
    public Long getComponentId() {
        return componentId;
    }
    /**
     * @param componentId the componentId to set
     */
    public void setComponentId(Long componentId) {
        this.componentId = componentId;
    }
    /**
     * @return the points
     */
    public Double getPoints() {
        return points;
    }
    /**
     * @param points the points to set
     */
    public void setPoints(Double points) {
        this.points = points;
    }
    /**
     * @return the problemName
     */
    public String getProblemName() {
        return problemName;
    }
    /**
     * @param problemName the problemName to set
     */
    public void setProblemName(String problemName) {
        this.problemName = problemName;
    }

    /* (non-Javadoc)
     * @see java.lang.Object#hashCode()
     */
    @Override
    public int hashCode() {
        final int PRIME = 31;
        int result = 1;
        result = PRIME * result + ((componentId == null) ? 0 : componentId.hashCode());
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
        final ComponentDTO other = (ComponentDTO) obj;
        if (componentId == null) {
            if (other.componentId != null)
                return false;
        } else if (!componentId.equals(other.componentId))
            return false;
        return true;
    }
    
    

}
