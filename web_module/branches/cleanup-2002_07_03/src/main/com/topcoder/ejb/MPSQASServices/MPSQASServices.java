package com.topcoder.ejb.MPSQASServices;

import javax.ejb.*;
import java.rmi.RemoteException;
import java.util.*;
import com.topcoder.mpsqas.common.*;
import com.topcoder.tcclasses.*;

/**
 * Class to declare abstract methods in MPSQASServicesBean
 *
 * @author talub
 */
public interface MPSQASServices extends EJBObject 
{
  /** User Session Methods */
  public ArrayList authenticateUser(String handle,String password) throws RemoteException;

  /** Correspondence Services */
  public boolean sendCorrespondence(Correspondence message, int problemId, int userId) throws RemoteException;
  public ArrayList getUnreadCorrespondence(int userId) throws RemoteException;

  /** Problem Services */
  public ArrayList getProblems(int forType, int id) throws RemoteException;
  public ProblemInformation getProblemInformation(int problemId,int userId) throws RemoteException;
  public ArrayList saveProposal(ProblemInformation info,int coderId) throws RemoteException;
  public ArrayList saveProblem(ProblemInformation info,int problemId, int userId, int connectionId) throws RemoteException;
  public String saveProblemStatement(String statement, int prohlemId, int userId, int connectionId) throws RemoteException;
  public ArrayList processPendingReply(int problemId,boolean approved,String message, int userId) throws RemoteException;
  public boolean saveAdminProblemInformation(ProblemInformation problemInfo,int problemId) throws RemoteException;

  /** Compile and Testing Services */
  public ArrayList compile(ProblemInformation info,int problemId,int userId) throws RemoteException;
  public String test(Object[]args,int problemId, int userId, int type) throws RemoteException;
  public ArrayList compareSolutions(int problemId) throws RemoteException;

  /** Contest Services */
  public ArrayList getContests(int userId) throws RemoteException;
  public ContestInformation getContestInformation(int roundId, boolean adminInfo) throws RemoteException;
  public String saveContestProblems(int roundId, ArrayList problems) throws RemoteException;
  public void wrapUpContest(int roundId) throws RemoteException;
  public String verifyContest(int roundId) throws RemoteException;

  /** Application Services */
  public ArrayList getPendingApplications() throws RemoteException;
  public ApplicationInformation getApplicationInformation(int applicationId) throws RemoteException;
  public ArrayList saveApplication(String message,int applicationType,int userId) throws RemoteException;
  public ArrayList processApplicationReply(int applicationId,boolean accepted,String message,int userId) throws RemoteException;

  /** Chat Services */
  public void logChat(ArrayList chat) throws RemoteException;
  public String getChatHistory(int id, boolean isRound) throws RemoteException;

  /** User Services */
  public ArrayList getUsers(int forType, int id) throws RemoteException;
  public UserInformation getUserInformation(int userId) throws RemoteException;
  public boolean recordPayment(ArrayList userIds) throws RemoteException;
}
