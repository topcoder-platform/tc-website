package com.topcoder.ejb.ContestAdminServices;

import javax.ejb.EJBObject;
import java.rmi.RemoteException;
import java.util.ArrayList;

//import com.topcoder.jmaNet.CoderProblems;

public interface ContestAdminServices extends EJBObject {


    /** tony's crap **/
    //public ContestCoder getContestCoder(int contestId, int coderId) throws RemoteException ;
    //public ArrayList getProblems(int contestId, int roundId) throws RemoteException;
    //public ArrayList getContestTime(int contestId, int roundId) throws RemoteException;
    //public ArrayList getCurrentContests()  throws RemoteException;
    //public java.sql.Timestamp getCurrentTimestamp() throws RemoteException;
    public void insertBlobObject(String tableName, String fieldName, Object obj, String whereClause) throws RemoteException;

    public Object getBlobObject(String tableName, String fieldName, String whereClause) throws RemoteException;

    //public Object jason (String tableName, String fieldName, String whereClause) throws RemoteException;
    public ArrayList getContestList() throws RemoteException;

    //public int getContestCoderCount(int contestId) throws RemoteException;
    //public void createContest (Contest ca) throws RemoteException;
    // public int saveContest (ContestAdmin ca) throws RemoteException;
    // public int saveRound (Round ra) throws RemoteException;
    // public void saveRoundSegment (RoundSegment rsa) throws RemoteException;
    //public void insertContestCoder(ContestCoder contestCoder) throws RemoteException;
    //public ArrayList getRoundSegments(int round_id, int contest_id) throws RemoteException;
    public ArrayList getRoundProblems(int round_id, int contest_id) throws RemoteException;

    public ArrayList getLanguages() throws RemoteException;

    /** jay's tools **/
    public ArrayList getRoundList(int contest_id) throws RemoteException;

    public ArrayList getSystemTestCaseReportList(int roundId, int problemId, int coderId, int filter) throws RemoteException;

    public ArrayList getCoderList(int roundId, int problemId) throws RemoteException;

    public ArrayList getCoderList(int roundId) throws RemoteException;

    public ArrayList getProblemList(int round_id) throws RemoteException;

    public ArrayList getSystemTestCaseReportList(int round_id, int filter) throws RemoteException;

    public ArrayList getRoundList() throws RemoteException;

    public void nullifyChallenge(int challengeId) throws RemoteException;

    public void removeSystemTestResult(int roundId, int coderId, int problemId, int testCaseId) throws RemoteException;

    public ArrayList getRoomList(int round_id) throws RemoteException;

    public ArrayList getChallengeList(int roundId, int roomId, int filter, int constraintType) throws RemoteException;

    public void overturnChallenge(int challenge_id) throws RemoteException;
/*
  public static void overturnSucceededChallenge(java.sql.Connection conn, int problem_id, int round_id,
                                                int defendant_id, int challenger_id, int challenge_id,
                                                String message, double submission_points) throws RemoteException;
  public static void overturnUnsucceededChallenge(java.sql.Connection conn, int problem_id, int round_id,
                                                  int defendant_id, int challenger_id, int challenge_id,
                                                  String message, double submission_points) throws RemoteException;
  public static void updateChallenge(java.sql.Connection conn, int succeeded, double challenger_points,
                                     double defendant_points, String message, int challenge_id) throws RemoteException;
  public static void updateRoomResult(java.sql.Connection conn, int round_id, int coder_id,
                                      double point_change) throws RemoteException;
  public static void updateProblemState(java.sql.Connection conn, double submission_points, int status_id,
                                        int round_id, int coder_id, int problem_id) throws RemoteException;
  public static String modifyMessage(int succeeded, String message) throws RemoteException;
*/
    /** greg's tool **/
    public ArrayList getCodersByRound(int roundId) throws RemoteException;

    public ArrayList getCoderCompilations(int roundId, int coderId) throws RemoteException;

    public ArrayList getRounds() throws RemoteException;
}

