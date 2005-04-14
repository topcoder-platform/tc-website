package com.topcoder.ejb.ContestAdminServices;

import javax.ejb.EJBObject;
import java.rmi.RemoteException;
import java.util.ArrayList;

//import com.topcoder.jmaNet.CoderProblems;

public interface ContestAdminServices extends EJBObject {


    public void insertBlobObject(String tableName, String fieldName, Object obj, String whereClause) throws RemoteException;

    public Object getBlobObject(String tableName, String fieldName, String whereClause) throws RemoteException;

    public ArrayList getContestList() throws RemoteException;

    public ArrayList getRoundProblems(int round_id, int contest_id) throws RemoteException;

    public ArrayList getLanguages() throws RemoteException;

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

    public ArrayList getCodersByRound(int roundId) throws RemoteException;

    public ArrayList getCoderCompilations(int roundId, int coderId) throws RemoteException;

    public ArrayList getRounds() throws RemoteException;
}

