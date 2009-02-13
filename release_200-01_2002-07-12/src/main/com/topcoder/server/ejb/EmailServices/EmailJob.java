
package com.topcoder.server.ejb.EmailServices;

import javax.ejb.EJBObject;
import java.rmi.RemoteException;
import java.util.*;

/**
 * This class allows the creation of an email job.
 * The job requires that a email template and email list have already been created.
 *
 * @author   Eric Ellingson
 * @version  $Revision$
 * @internal Log of Changes:
 *           $Log$
 *           Revision 1.2.2.14  2002/05/08 02:50:37  sord
 *           Added getJobDetailResults(job, first, last) function.
 *
 *           Revision 1.2.2.13  2002/05/06 05:46:05  sord
 *           Added isJobDetailArchived function.
 *
 *           Revision 1.2.2.12  2002/05/03 09:04:17  sord
 *           Added functions to update jobType and check a job's type. The job type
 *           will be used to determine if a job is pre-detail-build or post-detail-build.
 *
 *           Revision 1.2.2.11  2002/04/28 22:56:24  sord
 *           Fixed return value type to String for the Map returned by
 *           the getCommandParams function.
 *
 *           Revision 1.2.2.10  2002/04/28 22:31:40  sord
 *           Added getCommandParamName function
 *
 *           Revision 1.2.2.9  2002/04/28 03:23:14  sord
 *           Added getCommandParams function.
 *
 *           Revision 1.2.2.8  2002/04/25 08:40:31  sord
 *           Added additional functions required for working with job detail records.
 *
 *           Revision 1.2.2.7  2002/04/25 04:52:35  sord
 *           Initial version.
 *
 *           Revision 1.2.2.6  2002/04/22 02:07:04  apps
 *           Added functions for inserting/updating command parameters.
 *
 *           Revision 1.2.2.5  2002/04/21 23:22:05  apps
 *           Added functions to return jobDetail information
 *
 *           Revision 1.2.2.4  2002/04/21 22:21:58  apps
 *           Added functions to set job properties.
 *
 *           Revision 1.2.2.3  2002/04/15 06:01:10  apps
 *           Added accessor functions to access more data info.
 *           Fixed problem in EmailJob where it wouldn't increment the seq_id if the
 *           job failed to create.
 *
 *           Revision 1.2.2.2  2002/04/11 23:58:27  apps
 *           SB test update
 *
 *           Revision 1.2.2.1  2002/04/11 18:20:28  apps
 *           SB -- readded EmailServices
 *
 *           Revision 1.2  2002/04/05 04:18:38  apps
 *           Fixed formatting by replacing tabs with spaces.
 *
 *           Revision 1.1.1.1  2002/04/02 10:42:29  apps
 *           no message
 *
 *           Revision 1.1.2.1  2002/04/02 10:34:32  apps
 *           Initial version.
 *           Interface declared.
 *
 */
public interface EmailJob extends EJBObject {
 /**
  * Creates a new email job with the requested template, list, command, timeframe, and sender information.
  *
  * @return     the job id for the newly created email job.
  */
    public int createEmailJob(    int templateId, 
                                int listId, 
                                int commandId, 
                                Date startAfter, 
                                Date stopBefore, 
                                String fromAddress,
                                String fromPersonal,
                                String subject ) throws RemoteException;

 /**
  * Cancels an email job.
  * For a job that hasn't yet started, this will prevent it from ever running.
  * For a job that is in progress, this will cause it to stop at the next acceptable point.
  * If the job is already complete, this has no effect.
  */
    public void cancelEmailJob(    int jobId ) throws RemoteException;

 /**
  * Restarts an email job that was previously canceled.
  * For a job that had never started, this will allow the job to run.
  * For a job that was in progress, this will cause it to resume from the point the job was stopped.
  * If the job was already complete, this has no effect.
  */
    public void resumeEmailJob(    int jobId ) throws RemoteException;
    
 /**
  * Returns the requested information about the job.
  *
  * @return     the type of the job
  */
    public int getJobTypeId(int jobId) throws RemoteException;

 /**
  * Returns the requested information about the job.
  *
  * @return     the type name of the job
  */
    public String getJobTypeText(int jobId) throws RemoteException;

 /**
  * Converts a typeId into a name.
  *
  * @return     the name for the job typeId
  */
    public String getJobTypeIdText(int typeId) throws RemoteException;

 /**
  * Returns the requested information about the job.
  *
  * @return     the current statusId for the job
  */
    public int getStatusId(int jobId) throws RemoteException;

 /**
  * Returns the requested information about the job.
  *
  * @return     the status string for the job
  */
    public String getStatusText(int jobId) throws RemoteException;

 /**
  * Converts a status id into a status string.
  *
  * @return     the status string for the statusId
  */
    public String getStatusIdText(int statusId) throws RemoteException;

 /**
  * Returns the requested information about the job.
  *
  * @return     the templateId for the job
  */
    public int getTemplateId(int jobId) throws RemoteException;

 /**
  * Returns the requested information about the job.
  *
  * @return     the listId for the job
  */
    public int getListId(int jobId) throws RemoteException;
    
 /**
  * Returns the requested information about the job.
  *
  * @return     the commandId for the job
  */
    public int getCommandId(int jobId) throws RemoteException;
    
 /**
  * Returns the requested information about the job.
  *
  * @return     the commandName for the job
  */
    public String getCommandName(int jobId) throws RemoteException;
    
 /**
  * Returns the requested information about the job.
  *
  * @return     the startAfter date for the job
  */
    public Date getStartAfterDate(int jobId) throws RemoteException;
    
 /**
  * Returns the requested information about the job.
  *
  * @return     the stopBefore date for the job
  */
    public Date getStopBeforeDate(int jobId) throws RemoteException;
    
 /**
  * Returns the requested information about the job.
  *
  * @return     the fromAddress for the job
  */
    public String getFromAddress(int jobId) throws RemoteException;
    
 /**
  * Returns the requested information about the job.
  *
  * @return     the fromPersonal for the job
  */
    public String getFromPersonal(int jobId) throws RemoteException;
    
 /**
  * Returns the requested information about the job.
  *
  * @return     the subject for the job
  */
    public String getSubject(int jobId) throws RemoteException;

 /**
  * Returns a map of the results for the job.
  * For a job that has not yet started, this will be an empty list.
  *
  * The map has jobDetailIds as the keys (type Integer) and 
  * jobDetailStatusIds as the data (type Integer).
  *
  * @return     a map of jobDetailIds and jobDetailStatusIds for a job
  */
    public Map getJobDetailResults(int jobId) throws RemoteException;

 /**
  * Returns a three part array containing the results for a subset of
  * a job's results. The offsets are 0 based and include the last
  * record requested.
  * (for example, to get the first 10 results, request records 0 to 9).
  *
  * At index 0 is a Map of the results for for the requested subset.
  * The map has jobDetailIds as the keys (type Integer) and 
  * jobDetailStatusIds as the data (type Integer).
  *
  * At index 1 is an Integer with a value of 0 or 1 that indicates if 
  * there are additional results before the requested range. 
  * A value of 0 indicates there not previous results. 
  * A value of 1 indicates that there are previous results.
  *
  * At index 2 is an Integer with a value of 0 or 1 that indicates if
  * there are additional results after the requested range.
  * A value of 0 indicates there not additional results. 
  * A value of 1 indicates that there are additional results.
  * 
  * @return     an array containing the results, a flag for previous results, 
  * and a flag for additional results (type {Map, Integer, Integer}).
  *
  * @see #getJobDetailResults(int jobId)
  */
    public Object [] getJobDetailResults(int jobId, int firstRecordOffset, int lastRecordOffset) throws RemoteException;

 /**
  * Returns the jobDetailReason for a jobDetailId.
  *
  * @return     the reason for the current status
  */
    public String getJobDetailReason(int jobId, int jobDetailId) throws RemoteException;

 /**
  * Returns the jobDetailData for a jobDetailId.
  *
  * @return     the data for the jobDetailId for the current status
  */
    public String getJobDetailData(int jobId, int jobDetailId) throws RemoteException;

 /**
  * Returns true if the job's detail records have been archived.
  *
  * @return     Returns true if the job's detail records have been archived.
  *             Returns false if the job does not have archived records.
  */
    public boolean isJobDetailArchived(int jobId) throws RemoteException;

 /**
  * Converts a jobDetailStatusId into a status string.
  *
  * @return     the status string for the jobDetailStatusId
  */
    public String getDetailStatusIdText(int jobDetailStatusId) throws RemoteException;

 /**
  * Changes the information about the job.
  *
  * @throws     RemoteException if the job is already active or the job does not exist.
  */
    public void setTemplateId(int jobId, int templateId) throws RemoteException;

 /**
  * Changes the information about the job.
  *
  * @throws     RemoteException if the job is already active or the job does not exist.
  */
    public void setListId(int jobId, int listId) throws RemoteException;
    
 /**
  * Changes the information about the job.
  *
  * @throws     RemoteException if the job is already active or the job does not exist.
  */
    public void setCommandId(int jobId, int commandId) throws RemoteException;
    
 /**
  * Changes the information about the job.
  *
  * @throws     RemoteException if the job is already active or the job does not exist.
  */
    public void setStartAfterDate(int jobId, Date startAfterDate) throws RemoteException;
    
 /**
  * Changes the information about the job.
  *
  * @throws     RemoteException if the job is already active or the job does not exist.
  */
    public void setStopBeforeDate(int jobId, Date stopBeforeDate) throws RemoteException;
    
 /**
  * Changes the information about the job.
  *
  * @throws     RemoteException if the job is already active or the job does not exist.
  */
    public void setFromAddress(int jobId, String fromAddress) throws RemoteException;
    
 /**
  * Changes the information about the job.
  *
  * @throws     RemoteException if the job is already active or the job does not exist.
  */
    public void setFromPersonal(int jobId, String fromPersonal) throws RemoteException;
    
 /**
  * Changes the information about the job.
  *
  * @throws     RemoteException if the job is already active or the job does not exist.
  */
    public void setSubject(int jobId, String subject) throws RemoteException;

 /**
  * Creates or updates command parameters for a job that has a commandId as its data source.
  *
  * @throws     RemoteException if the parameter can not be set.
  */
    public void setCommandParam(int jobId, int inputId, String param) throws RemoteException;

 /**
  * Returns a Map of the command parameters for a job.
  *
  * @return     A Map of the command parameters with the map keys being the inputId (Integer)
  *             and the map values being the param (String) for the jobId.
  */
    public Map getCommandParams(int jobId) throws RemoteException;

 /**
  * Returns the inputName for the inputId.
  *
  * @return     The name of the input.  This can be fed to the Statistics bean.
  */
    public String getCommandParamName(int inputId) throws RemoteException;

}

