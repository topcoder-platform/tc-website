package com.topcoder.server.ejb.EmailServices;

import javax.ejb.EJBObject;
import java.rmi.RemoteException;
import java.util.*;

/**
 * This class provides access to the database for the EmailJobScheduler.
 *
 * @author   Eric Ellingson
 * @version  $Revision$
 * @internal Log of Changes:
 *           $Log$
 *           Revision 1.1.2.7  2002/05/06 05:36:00  sord
 *           Implemented archive_sched_job_detail related functions.
 *
 *           Revision 1.1.2.6  2002/05/03 09:04:17  sord
 *           Added functions to update jobType and check a job's type. The job type
 *           will be used to determine if a job is pre-detail-build or post-detail-build.
 *
 *           Revision 1.1.2.5  2002/05/02 20:17:37  sord
 *           Added getDate function so we can tell what time it is on the ejb server.
 *
 *           Revision 1.1.2.4  2002/04/27 01:40:56  sord
 *           Fixed bug in getJobs that was returning the wrong jobId
 *
 *           Revision 1.1.2.3  2002/04/25 08:40:31  sord
 *           Added additional functions required for working with job detail records.
 *
 *           Revision 1.1.2.2  2002/04/25 05:52:59  sord
 *           Added EmailServer bean.
 *
 *           Revision 1.1.2.1  2002/04/25 04:52:35  sord
 *           Initial version.
 *
 */
public interface EmailServer extends EJBObject {

    public static final int CREATING = 0;
    public static final int READY = 1;
    public static final int ACTIVE = 2;
    public static final int COMPLETE = 3;
    public static final int INCOMPLETE = 4;
    public static final int CANCELED = 5;

    public static final int ANYRANGE = 0;
    public static final int BEFORERANGE = 1;
    public static final int INRANGE = 2;
    public static final int AFTERRANGE = 3;
    
    public static final int MSG_NONE = 0;
    public static final int MSG_SENT = 1;
    public static final int MSG_FAILED = 2;

    public static final int EMAIL_JOB_TYPE_PRE = 1;
    public static final int EMAIL_JOB_TYPE_POST = 2;
    
 /**
  * Returns the Date according to the remote system that the bean is running on.
  *
  * @return     the current date
  */
    public Date getDate() throws RemoteException;

 /**
  * Returns the Set of jobs that are currently marked with the requested status.
  *
  * @return     a Set of job ids (type Integer)
  */
    public Set getJobs(int status, int dateRange) throws RemoteException;

 /**
  * Changes the status of a job to the requested status.
  */
    public void setJobStatus(int jobId, int status) throws RemoteException;

 /**
  * Removes any detail records for the job that may have been added in 
  * an aborted run. 
  *
  * Under normal circumstances this function will not have anything to 
  * do when it is called.
  */
    public void clearDetailRecords(int jobId) throws RemoteException;

 /**
  * Adds a detail record to the job.  The detail record will be assigned a
  * new id and have a status of NONE.
  *
  * @return     the id of the new detail record
  */
    public int addDetailRecord(int jobId, String data) throws RemoteException;

 /**
  * Changes the status of a job detail record to the requested status.
  */
    public void setDetailStatus(int jobId, int detailId, int status, String reason) throws RemoteException;

 /**
  * Marks the job as having been built so we don't try to build it again.
  */
    public void setJobBuilt(int jobId) throws RemoteException;

 /**
  * Moves the job's detail records from the detail table to the archive table.
  */
    public void archiveDetail(int jobId) throws RemoteException;
}

