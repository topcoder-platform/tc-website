/*
* ComponentDTO
*
* Created Oct 8, 2007
*/
package com.topcoder.web.ep.dto;


/**
 * @author Pablo Wolfus (pulky)
 * @version $Id$
 */
public class RegistrationDTO {

    private Long roundId = null;
    private Long coderId = null;
    
    public RegistrationDTO() {
        super();
    }
    
    public RegistrationDTO(Long roundId, Long coderId) {
        super();
        this.roundId = roundId;
        this.coderId = coderId;
    }

    /**
     * @return the coderId
     */
    public Long getCoderId() {
        return coderId;
    }

    /**
     * @param coderId the coderId to set
     */
    public void setCoderId(Long coderId) {
        this.coderId = coderId;
    }

    /**
     * @return the roundId
     */
    public Long getRoundId() {
        return roundId;
    }

    /**
     * @param roundId the roundId to set
     */
    public void setRoundId(Long roundId) {
        this.roundId = roundId;
    }

    /* (non-Javadoc)
     * @see java.lang.Object#hashCode()
     */
    @Override
    public int hashCode() {
        final int PRIME = 31;
        int result = 1;
        result = PRIME * result + ((coderId == null) ? 0 : coderId.hashCode());
        result = PRIME * result + ((roundId == null) ? 0 : roundId.hashCode());
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
        final RegistrationDTO other = (RegistrationDTO) obj;
        if (coderId == null) {
            if (other.coderId != null)
                return false;
        } else if (!coderId.equals(other.coderId))
            return false;
        if (roundId == null) {
            if (other.roundId != null)
                return false;
        } else if (!roundId.equals(other.roundId))
            return false;
        return true;
    }


}
