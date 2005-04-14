package com.topcoder.ejb.ContestAdminServices;

import javax.ejb.EJBObject;
import java.rmi.RemoteException;
import java.util.ArrayList;

//import com.topcoder.jmaNet.CoderProblems;

public interface ContestAdminServices extends EJBObject {


/*
    void insertBlobObject(String tableName, String fieldName, Object obj, String whereClause) throws RemoteException;

    Object getBlobObject(String tableName, String fieldName, String whereClause) throws RemoteException;

    ArrayList getContestList() throws RemoteException;

    ArrayList getRoundProblems(int round_id, int contest_id) throws RemoteException;

    ArrayList getLanguages() throws RemoteException;

    ArrayList getRoundList(int contest_id) throws RemoteException;

    ArrayList getSystemTestCaseReportList(int roundId, int problemId, int coderId, int filter) throws RemoteException;

    ArrayList getCoderList(int roundId, int problemId) throws RemoteException;
*/

    ArrayList getCoderList(int roundId) throws RemoteException;

    ArrayList getProblemList(int round_id) throws RemoteException;

/*
    ArrayList getSystemTestCaseReportList(int round_id, int filter) throws RemoteException;
*/

    ArrayList getRoundList() throws RemoteException;

    void nullifyChallenge(int challengeId) throws RemoteException;

/*
    void removeSystemTestResult(int roundId, int coderId, int problemId, int testCaseId) throws RemoteException;
*/

    ArrayList getRoomList(int round_id) throws RemoteException;

    ArrayList getChallengeList(int roundId, int roomId, int filter, int constraintType) throws RemoteException;

    void overturnChallenge(int challenge_id) throws RemoteException;

    ArrayList getCodersByRound(int roundId) throws RemoteException;

    ArrayList getCoderCompilations(int roundId, int coderId) throws RemoteException;

    ArrayList getRounds() throws RemoteException;
}

