package com.topcoder.web.common.model.algo;

import java.sql.Timestamp;
import java.util.Collections;
import java.util.HashSet;
import java.util.Set;

import com.topcoder.web.common.model.Base;

/**
 * @author pulky
 */
public class Round extends Base {

    public static final String FUTURE_STATUS = "F";
    private Long id = null;
    private Contest contest = null;
    private String name = null;
    private String shortName = null;
    private String status = null;

    private Long registrationLimit = null;
    private Integer invitational = null;
    private RoundType type = null;
    private Integer rated = null;
    
    private Set<Room> rooms;
    private Set<RoundProperty> roundProperties;
    private Set<RoundSegment> roundSegments;
    private Set<RoundComponent> roundComponents;
    private Set<Language> languages;

    private Set<ComponentState> componentStates;
    private Set<RoundRegistration> roundRegistrations;

    public Round() {
        super();
        this.rooms= new HashSet<Room>();
        this.roundProperties = new HashSet<RoundProperty>();
        this.roundSegments = new HashSet<RoundSegment>();
        this.roundComponents = new HashSet<RoundComponent>();
        this.languages = new HashSet<Language>();
        this.componentStates = new HashSet<ComponentState>();
        this.roundRegistrations = new HashSet<RoundRegistration>();
    }
    
    public Contest getContest() {
        return contest;
    }
    public void setContest(Contest contest) {
        this.contest = contest;
    }
    public Long getId() {
        return id;
    }
    public void setId(Long id) {
        this.id = id;
    }
    public String getName() {
        return name;
    }
    public void setName(String name) {
        this.name = name;
    }
    public String getShortName() {
        return shortName;
    }
    public void setShortName(String shortName) {
        this.shortName = shortName;
    }
    public String getStatus() {
        return status;
    }
    public void setStatus(String status) {
        this.status = status;
    }
    /**
     * @return the invitational
     */
    public Integer getInvitational() {
        return invitational;
    }
    /**
     * @param invitational the invitational to set
     */
    public void setInvitational(Integer invitational) {
        this.invitational = invitational;
    }
    /**
     * @return the rated
     */
    public Integer getRated() {
        return rated;
    }
    /**
     * @param rated the rated to set
     */
    public void setRated(Integer rated) {
        this.rated = rated;
    }
    /**
     * @return the registrationLimit
     */
    public Long getRegistrationLimit() {
        return registrationLimit;
    }

    public Set<RoundProperty> getRoundProperties() {
        return Collections.unmodifiableSet(roundProperties);
    }

    public void setRoundProperties(Set<RoundProperty> roundProperties) {
        this.roundProperties = roundProperties;
    }
    
    public void addProperty(Integer propertyId, Object propertyValue) {
        RoundProperty rp = new RoundProperty();
        
        rp.getId().setRound(this);
        rp.getId().setTypeId(propertyId);
        rp.setValue(propertyValue);
        
        this.roundProperties.add(rp);
    }

    public void editProperty(Integer propertyId, Object propertyValue) {
        for (RoundProperty rp : this.roundProperties) {
            if (rp.getId().getTypeId().equals(propertyId)) {
                rp.setValue(propertyValue);                
            }
        }
    }

    public Object getProperty(Integer propertyId) {
        for (RoundProperty rp : this.roundProperties) {
            if (rp.getId().getTypeId().equals(propertyId)) {
                return rp.getValue();
            }
        }
        return null;
    }

    public Set<RoundSegment> getRoundSegments() {
        return Collections.unmodifiableSet(roundSegments);
    }

    public void setRoundSegments(Set<RoundSegment> roundSegments) {
        this.roundSegments = roundSegments;
    }

    public void addSegment(RoundSegment rs) {
        rs.getId().setRound(this);
        this.roundSegments.add(rs);
    }

    // TODO: move this to the arena helper, maybe make roundSegments collection modifiable.
    public void updateSegmentsDates(Timestamp startDate, Timestamp endDate) {
        for (RoundSegment rs : this.roundSegments) {
            if (!rs.getId().getSegmentId().equals(1l)) {
                rs.setStartTime(rs.getId().getSegmentId().equals(2l) ? startDate : endDate);
                rs.setEndTime(endDate);
            }
        }
    }

    public Set<RoundComponent> getRoundComponents() {
        return Collections.unmodifiableSet(roundComponents);
    }

    public void setRoundComponents(Set<RoundComponent> roundComponents) {
        this.roundComponents = roundComponents;
    }

    public Set<RoundRegistration> getRoundRegistrations() {
        return Collections.unmodifiableSet(roundRegistrations);
    }

    public void setRoundRegistrations(Set<RoundRegistration> roundRegistrations) {
        this.roundRegistrations = roundRegistrations;
    }

    public void addRegistration(RoundRegistration rr) {
        rr.getId().setRound(this);
        this.roundRegistrations.add(rr);
    }

    public void removeRegistration(RoundRegistration rr) {
        rr.getId().setRound(this);
        if (this.roundRegistrations.contains(rr)) {
            this.roundRegistrations.remove(rr);
        }
    }

    public int getRegistered() {
        return this.roundRegistrations.size();
    }

    public void addComponent(RoundComponent rc) {
        rc.getId().setRound(this);
        this.roundComponents.add(rc);
    }

    public void removeRoundComponent(RoundComponent rc) {
        if  (this.roundComponents.contains(rc)) {
            log.debug("contains rc!");
            this.roundComponents.remove(rc);
        }
    }

    public Set<Language> getLanguages() {
        return Collections.unmodifiableSet(languages);
    }

    public void setLanguages(Set<Language> languages) {
        this.languages = languages;
    }

    public void addLanguage(Language language) {
        this.languages.add(language);
    }

    public void clearLanguages() {
        this.languages.clear();
    }

    public Set<Room> getRooms() {
        return Collections.unmodifiableSet(rooms);
    }

    public void setRooms(Set<Room> rooms) {
        this.rooms = rooms;
    }

    public void addRoom(Room r) {
        this.rooms.add(r);
    }

    /**
     * @param registrationLimit the registrationLimit to set
     */
    public void setRegistrationLimit(Long registrationLimit) {
        this.registrationLimit = registrationLimit;
    }

    /**
     * @return the type
     */
    public RoundType getType() {
        return type;
    }
    /**
     * @param type the type to set
     */
    public void setType(RoundType type) {
        this.type = type;
    }

    /**
     * @return the componentStates
     */
    public Set<ComponentState> getComponentStates() {
        return Collections.unmodifiableSet(componentStates);
    }

    /**
     * @param componentStates the componentStates to set
     */
    public void setComponentStates(Set<ComponentState> componentStates) {
        this.componentStates = componentStates;
    }

    /* (non-Javadoc)
     * @see java.lang.Object#hashCode()
     */
    @Override
    public int hashCode() {
        final int PRIME = 31;
        int result = 1;
        result = PRIME * result + ((contest == null) ? 0 : contest.hashCode());
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
        final Round other = (Round) obj;
        if (contest == null) {
            if (other.contest != null)
                return false;
        } else if (!contest.equals(other.contest))
            return false;
        if (name == null) {
            if (other.name != null)
                return false;
        } else if (!name.equals(other.name))
            return false;
        return true;
    }

}
