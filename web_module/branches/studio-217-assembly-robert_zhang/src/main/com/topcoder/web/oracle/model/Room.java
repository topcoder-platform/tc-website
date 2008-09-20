package com.topcoder.web.oracle.model;

import com.topcoder.web.common.model.Base;

import java.util.HashSet;
import java.util.Set;

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: Mar 13, 2007
 */
public class Room extends Base {
    private Round round;
    private Integer id;
    private String name;
    private Set<CandidateRoomResult> candidateResults;
    private Set<RoomResult> results;
    private Set<Prediction> predictions;

    public Room() {
        candidateResults = new HashSet<CandidateRoomResult>();
        results = new HashSet<RoomResult>();
        predictions = new HashSet<Prediction>();
    }

    public Round getRound() {
        return round;
    }

    public void setRound(Round round) {
        this.round = round;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }


    public Set<CandidateRoomResult> getCandidateResults() {
        return candidateResults;
    }

    public void setCandidateResults(Set<CandidateRoomResult> candidateResults) {
        this.candidateResults = candidateResults;
    }

    public Set<Prediction> getPredictions() {
        return predictions;
    }

    public void setPredictions(Set<Prediction> predictions) {
        this.predictions = predictions;
    }


    /**
     * Add the given result to this room and make the association between that
     * result and this room.
     *
     * @param result the result to add
     */
    public void addCandidateResult(CandidateRoomResult result) {
        result.setRoom(this);
        candidateResults.add(result);
    }


    public Set<RoomResult> getResults() {
        return results;
    }

    public void setResults(Set<RoomResult> results) {
        this.results = results;
    }

    /**
     * Add the given result to this room and make the association between that
     * result and this room.
     *
     * @param result the result to add
     */
    public void addResult(RoomResult result) {
        result.setRoom(this);
        results.add(result);
    }

    public boolean equals(Object o) {
        try {
            if (o == null) {
                return false;
            } else {
                Room other = (Room) o;
                if (getId() == null || other.getId() == null) {
                    return getName().equals(other.getName());
                } else {
                    return getId().equals(other.getId()) && getName().equals(other.getName());
                }
            }
        } catch (ClassCastException e) {
            return false;
        }
    }

    public int hashCode() {
        if (id == null && name == null) {
            return 0;
        } else if (id == null) {
            return name.hashCode();
        } else if (name == null) {
            return id.hashCode();
        } else {
            return (name + id).hashCode();
        }
    }


}
