package com.topcoder.web.ejb.ProblemRatingServices;


import javax.ejb.EJBObject;
import java.rmi.RemoteException;
import java.util.Map;

public interface ProblemRatingServices extends EJBObject {
    public void submitAnswers(int[] questions, int[] ratings, long userID, int problemID) throws RemoteException, Exception;
}
