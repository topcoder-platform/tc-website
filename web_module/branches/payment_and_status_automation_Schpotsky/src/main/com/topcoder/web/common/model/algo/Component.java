/*
* Component
*
* Created Oct 1, 2007
*/
package com.topcoder.web.common.model.algo;

import java.util.Collections;
import java.util.HashSet;
import java.util.Set;

import com.topcoder.web.common.model.Base;

/**
 * @author Pablo Wolfus (pulky)
 * @version $Id$
 */
public class Component extends Base {

    private Long id = null;
    private Problem problem = null;
    private Integer componentTypeId = null;
    private String componentText = null;
    private Integer statusId = null;
    private Set<RoundComponent> roundComponents;

    public Component() {
        super();
        this.roundComponents = new HashSet<RoundComponent>();
    }

    /**
     * @return the componentText
     */
    public String getComponentText() {
        return componentText;
    }
    /**
     * @param componentText the componentText to set
     */
    public void setComponentText(String componentText) {
        this.componentText = componentText;
    }
    /**
     * @return the componentTypeId
     */
    public Integer getComponentTypeId() {
        return componentTypeId;
    }
    /**
     * @param componentTypeId the componentTypeId to set
     */
    public void setComponentTypeId(Integer componentTypeId) {
        this.componentTypeId = componentTypeId;
    }
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
     * @return the problem
     */
    public Problem getProblem() {
        return problem;
    }
    /**
     * @param problem the problem to set
     */
    public void setProblem(Problem problem) {
        this.problem = problem;
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
    
    public Set<RoundComponent> getRoundComponents() {
        return Collections.unmodifiableSet(roundComponents);
    }

    public void setRoundComponents(Set<RoundComponent> roundComponents) {
        this.roundComponents = roundComponents;
    }

    public void removeRoundComponent(RoundComponent rc) {
        if  (this.roundComponents.contains(rc)) {
            this.roundComponents.remove(rc);
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
        result = PRIME * result + ((problem == null) ? 0 : problem.hashCode());
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
        final Component other = (Component) obj;
        if (id == null) {
            if (other.id != null)
                return false;
        } else if (!id.equals(other.id))
            return false;
        if (problem == null) {
            if (other.problem != null)
                return false;
        } else if (!problem.equals(other.problem))
            return false;
        return true;
    }

    
}
