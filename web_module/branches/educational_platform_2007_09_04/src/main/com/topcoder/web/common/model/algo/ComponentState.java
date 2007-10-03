/*
* ComponentState
*
* Created Oct 1, 2007
*/
package com.topcoder.web.common.model.algo;

import com.topcoder.web.common.model.Base;
import com.topcoder.web.common.model.Coder;

/**
 * @author Pablo Wolfus (pulky)
 * @version $Id$
 */
public class ComponentState extends Base {

    protected Long id = null;
    protected Double points = null;
    protected Integer statusId = null;

    protected Round round = null;
    protected Coder coder = null;
    protected Component component = null;
    
    public ComponentState() {
        super();
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
        final ComponentState other = (ComponentState) obj;
        if (id == null) {
            if (other.id != null)
                return false;
        } else if (!id.equals(other.id))
            return false;
        return true;
    }
    
    
}
