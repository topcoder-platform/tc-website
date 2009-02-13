package com.topcoder.ejb.Reporting;

import com.topcoder.common.web.data.report.Query;
import com.topcoder.shared.docGen.xml.RecordTag;

import javax.ejb.EJBObject;
import java.rmi.RemoteException;
import java.util.ArrayList;

public interface Reporting extends EJBObject {

    public RecordTag getDayReg(java.sql.Timestamp after)
            throws RemoteException;

    public RecordTag getSchoolCount(java.sql.Timestamp before)
            throws RemoteException;

    public RecordTag getSkillTotal(java.sql.Timestamp before)
            throws RemoteException;

    public RecordTag getDayReg(String tagName, java.sql.Timestamp after)
            throws RemoteException;

    public RecordTag getSchoolCount(String tagName, java.sql.Timestamp before)
            throws RemoteException;

    public RecordTag getSkillTotal(String tagName, java.sql.Timestamp before)
            throws RemoteException;

    public ArrayList getResult(Query query)
            throws RemoteException;

}
