package com.topcoder.common.web.data;

import java.io.Serializable;

public class Location implements Serializable {

    private int contestId;
    private int roundId;
    private int roomId;

    public Location() {
        this.contestId = -1;
        this.roundId = -1;
        this.roomId = -1;
    }

    public Location(int contestId, int roundId, int roomId) {
        this.contestId = contestId;
        this.roundId = roundId;
        this.roomId = roomId;
    }

    public final void setContestId(int in) {
        this.contestId = in;
    }

    public final int getContestId() {
        return this.contestId;
    }

    public final void setRoundId(int in) {
        this.roundId = in;
    }

    public final int getRoundId() {
        return this.roundId;
    }

    public final void setRoomId(int in) {
        this.roomId = in;
    }

    public final int getRoomId() {
        return this.roomId;
    }

    public final void setLocation(int contestId, int roundId, int roomId) {
        this.contestId = contestId;
        this.roundId = roundId;
        this.roomId = roomId;
    }

    public final void reset() {
        this.contestId = -1;
        this.roundId = -1;
        this.roomId = -1;
    }

    public final String print() {
        return new String("CONTEST: " + contestId + " ROUND: " + roundId + " ROOM: " + roomId);
    }

}
