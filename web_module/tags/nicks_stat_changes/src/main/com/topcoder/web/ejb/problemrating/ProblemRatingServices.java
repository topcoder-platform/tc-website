package com.topcoder.web.ejb.problemrating;


import javax.ejb.EJBObject;
import java.rmi.RemoteException;
import javax.ejb.EJBException;
import java.util.Map;

public interface ProblemRatingServices extends EJBObject {
    public void setProblemRating(int questionID, long coderID, int problemID, int rating) throws RemoteException, EJBException;
    public void createProblemRating(int questionID, long coderID, int problemID) throws RemoteException, EJBException;
}
