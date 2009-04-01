package com.topcoder.web.oracle.dao.hibernate;

import com.topcoder.web.oracle.dao.*;

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: Mar 19, 2007
 */
public class OracleDAOFactoryHibernate implements OracleDAOFactory {

    public CandidateDAO getCandidateDAO() {
        return new CandidateDAOHibernate();
    }

    public CandidatePropertyDAO getCandidatePropertyDAO() {
        return new CandidatePropertyDAOHibernate();
    }

    public CandidateRoomResultDAO getCandidateRoomResultDAO() {
        return new CandidateRoomResultDAOHibernate();
    }

    public ContestDAO getContestDAO() {
        return new ContestDAOHibernate();
    }

    public RoundPropertyDAO getRoundPropertyDAO() {
        return new RoundPropertyDAOHibernate();
    }

    public ContestStatusDAO getContestStatusDAO() {
        return new ContestStatusDAOHibernate();
    }

    public ContestTypeDAO getContestTypeDAO() {
        return new ContestTypeDAOHibernate();
    }

    public PhaseDAO getPhaseDAO() {
        return new PhaseDAOHibernate();
    }

    public PredictionDAO getPredictionDAO() {
        return new PredictionDAOHibernate();
    }

    public PrizeTypeDAO getPrizeTypeDAO() {
        return new PrizeTypeDAOHibernate();
    }

    public RoomDAO getRoomDAO() {
        return new RoomDAOHibernate();
    }

    public RoomResultDAO getRoomResultDAO() {
        return new RoomResultDAOHibernate();
    }

    public RoundStatusDAO getRoundStatusDAO() {
        return new RoundStatusDAOHibernate();
    }

    public RoundDAO getRoundDAO() {
        return new RoundDAOHibernate();
    }

    public RoundRegistrationDAO getRoundRegistrationDAO() {
        return new RoundRegistrationDAOHibernate();
    }

}
