package com.topcoder.web.ejb.ProblemRatingServices;


import javax.ejb.EJBObject;
import java.rmi.RemoteException;
import java.util.Map;

public interface ProblemRatingServices extends EJBObject {
    public void setProblemRating(int questionID, long coderID, int problemID, int rating) throws RemoteException;
    public void createProblemRating(int questionID, long coderID, int problemID) throws RemoteException;
}
