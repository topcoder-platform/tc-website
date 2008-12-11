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
 * @version $Id: ProblemSet.java 66662 2007-10-25 12:59:15Z pulky $
 */
public class ProblemSet extends Base {

    private Integer id = null;
    private String name = null;
    private String description = null;

    private Set<Component> components;

    private Boolean admitAssignment = null;

    public ProblemSet() {
        super();
        this.components = new HashSet<Component>();
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

    /**
     * @return the admitAssignment
     */
    public Boolean getAdmitAssignment() {
        return admitAssignment;
    }

    /**
     * @param admitAssignment the admitAssignment to set
     */
    public void setAdmitAssignment(Boolean admitAssignment) {
        this.admitAssignment = admitAssignment;
    }

    /**
     * @return the components
     */
    public Set<Component> getComponents() {
        return Collections.unmodifiableSet(components);
    }

    /**
     * @param components the components to set
     */
    public void setComponents(Set<Component> components) {
        this.components = components;
    }

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

    /* (non-Javadoc)
     * @see java.lang.Object#hashCode()
     */
    @Override
    public int hashCode() {
        final int PRIME = 31;
        int result = 1;
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
        final ProblemSet other = (ProblemSet) obj;
        if (name == null) {
            if (other.name != null)
                return false;
        } else if (!name.equals(other.name))
            return false;
        return true;
    }
}
