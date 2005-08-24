package com.topcoder.ejb.ContestAdminServices;

import javax.ejb.EJBObject;
import java.rmi.RemoteException;
import java.util.ArrayList;

//import com.topcoder.jmaNet.CoderProblems;

public interface ContestAdminServices extends EJBObject {



    ArrayList getRoundList(int contest_id) throws RemoteException;

    ArrayList getCoderList(int roundId) throws RemoteException;

    ArrayList getProblemList(int round_id) throws RemoteException;

    ArrayList getRoundList() throws RemoteException;

    void nullifyChallenge(int challengeId) throws RemoteException;

    ArrayList getRoomList(int round_id) throws RemoteException;

    ArrayList getChallengeList(int roundId, int roomId, int filter, int constraintType) throws RemoteException;

    void overturnChallenge(int challenge_id) throws RemoteException;

    ArrayList getCodersByRound(int roundId) throws RemoteException;

    ArrayList getCoderCompilations(int roundId, int coderId) throws RemoteException;

    ArrayList getRounds() throws RemoteException;
}

