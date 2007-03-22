package com.topcoder.web.oracle.dao;

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: Mar 19, 2007
 */
public interface OracleDAOFactory {
    CandidateDAO getCandidateDAO();

    CandidatePropertyDAO getCandidatePropertyDAO();

    CandidateRoomResultDAO getCandidateRoomResultDAO();

    ContestDAO getContestDAO();

    ContestStatusDAO getContestStatusDAO();

    ContestTypeDAO getContestTypeDAO();

    PrizeTypeDAO getPrizeTypeDAO();

    RoomDAO getRoomDAO();

    RoundDAO getRoundDAO();

    RoundRegistrationDAO getRoundRegistrationDAO();

    RoundStatusDAO getRoundStatusDAO();

}
