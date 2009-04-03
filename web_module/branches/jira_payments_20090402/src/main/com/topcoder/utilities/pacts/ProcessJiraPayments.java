/**
 * 
 */
package com.topcoder.utilities.pacts;

import java.rmi.RemoteException;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.Map;

import javax.naming.InitialContext;
import javax.rmi.PortableRemoteObject;
import javax.xml.rpc.ServiceException;

import com.atlassian.jira.rpc.soap.beans.RemoteCustomFieldValue;
import com.atlassian.jira.rpc.soap.beans.RemoteFieldValue;
import com.atlassian.jira.rpc.soap.beans.RemoteIssue;
import com.topcoder.shared.util.TCContext;
import com.topcoder.shared.util.sql.DBUtility;
import com.topcoder.web.ejb.pacts.BasePayment;
import com.topcoder.web.ejb.pacts.BugFixesPayment;
import com.topcoder.web.ejb.pacts.ComponentEnhancementsPayment;
import com.topcoder.web.ejb.pacts.PactsClientServices;
import com.topcoder.web.ejb.pacts.PactsClientServicesHome;
import com.topcoder.www.bugs.rpc.soap.jirasoapservice_v2.JiraSoapService;
import com.topcoder.www.bugs.rpc.soap.jirasoapservice_v2.JiraSoapServiceServiceLocator;

/**
 * @author ivern
 *
 */
public class ProcessJiraPayments extends DBUtility {
    /**
     * This variable tells if only an analysis is wanted.
     */
    private String onlyAnalyze = null;
    
	private static final String JIRA_PAYMENTS_USER = "jira_payments";
	private static final String JIRA_PAYMENTS_PASSWORD = "t0pc0der76";
	private static final String JIRA_PAYMENTS_FILTER = "10634";
	
	private static final String JIRA_PAYMENT_AMOUNT_FIELD_KEY = "customfield_10012";
	private static final String JIRA_PAYEE_FIELD_KEY = "customfield_10040";
	private static final String JIRA_CLIENT_NICKNAME_FIELD_KEY = "customfield_10074";
	private static final String JIRA_PROJECT_ID_FIELD_KEY = "customfield_10090";
	private static final String JIRA_STUDIO_ID_FIELD_KEY = "customfield_10091";
	
	private static final String QUERY_USER_ID_BY_HANDLE = "SELECT user_id FROM user WHERE handle = ?";
	
	private Map<String, String> clients = null;
	
	public ProcessJiraPayments() {
		clients = new HashMap<String, String>();
		
		// TODO: Load this from XML
		clients.put("cronos", "TopCoder");
		clients.put("hera", "Lending Tree");
	}
	
	@Override
	protected void runUtility() throws Exception {
		try {
			System.out.println("XXX - STARTING runUtility()");
			
			PactsClientServices ejb = (PactsClientServices) createEJB();
			JiraSoapService jira = new JiraSoapServiceServiceLocator().getJirasoapserviceV2();
			
			String token = jira.login(JIRA_PAYMENTS_USER, JIRA_PAYMENTS_PASSWORD);
			System.out.println("XXX - LOGIN SUCCESSFUL: " + token);
			
			RemoteIssue[] issuesToPay = jira.getIssuesFromFilter(token, JIRA_PAYMENTS_FILTER);
			System.out.println("XXX - getIssuesFromFilter returned: " + issuesToPay.length + " issues");
			
			PreparedStatement userIdByHandle = prepareStatement("informixoltp", QUERY_USER_ID_BY_HANDLE);
			System.out.println("XXX - PreparedStatement created");
			
			for (RemoteIssue issue : issuesToPay) {
				try {
					boolean dubious = false;
					
					String type = getIssueType(issue);
					String amountStr = getCustomFieldValueByKey(issue, JIRA_PAYMENT_AMOUNT_FIELD_KEY);
					// PAYEE HAS TO BE RIGHT
					String payee = getCustomFieldValueByKey(issue, JIRA_PAYEE_FIELD_KEY);
					String clientNickname = getCustomFieldValueByKey(issue, JIRA_CLIENT_NICKNAME_FIELD_KEY);
					String projectId = getCustomFieldValueByKey(issue, JIRA_PROJECT_ID_FIELD_KEY);
					String studioId = getCustomFieldValueByKey(issue, JIRA_STUDIO_ID_FIELD_KEY);
					
					System.out.println("XXX - type + "," + amountStr + "," + payee + "," + clientNickname + "," + projectId
							+ "," + studioId);
				
					if (isNullOrEmpty(type) || isNullOrEmpty(amountStr) || isNullOrEmpty(payee)
							|| isNullOrEmpty(clientNickname) || isNullOrEmpty(projectId)
							|| isNullOrEmpty(studioId)) {
						// TODO: Nice error message here.
						continue;
					}
					
					String projectType = null;
					long referenceId;
					if (!(isNullOrEmpty(projectId) ^ isNullOrEmpty(studioId))) {
						// TODO: Nice error message here.
						continue;
					} else if (!isNullOrEmpty(projectId)) {
						projectType = "TopCoder";
						referenceId = Long.parseLong(projectId);
					} else {
						projectType = "Studio";
						referenceId = Long.parseLong(studioId);
					}
					
					// Check for null, etc.
					String client = getClientName(clientNickname);
					if (client == null) {
						dubious = true;
						client = clientNickname;
					}
					
					userIdByHandle.setString(1, payee);
					ResultSet rs = null;
					long userId;
					try {
						rs = userIdByHandle.executeQuery();
						userId = rs.getLong("user_id");
					} finally {
						close(rs);
					}
					
					double amount = Double.parseDouble(amountStr);
					
					String summary = "[" + issue.getKey() + "]"; // TODO: Add project name.
					
					System.out.println("XXX - [" + (dubious ? "DUBIOUS" : "GOOD") + "] - (payment type: " + type + ", project type: "
							+ projectType + ", reference id: " + referenceId + ", user id: " + userId + ", client: "
							+ client + ", amount: " + amount + ", description: " + summary + ")");
					
					if (onlyAnalyze.equalsIgnoreCase("false")) {
						// TODO: FOR NOW IGNORE STUDIO.
/*						if ("Studio".equals(projectType)) {
							// TODO: Nice error message here.
							continue;
						}
						
						// Insert the payment into PACTS
						BasePayment payment = null;
						
						if ("Bug Fix".equals(type)) {
							payment = new BugFixesPayment(userId, amount, client, referenceId);
						} else {
							payment = new ComponentEnhancementsPayment(userId, amount, client, referenceId);
						}
						payment.setNetAmount(amount);
						payment.setDescription(description);
						// TODO: Set status according to dubiousness?
						
						ejb.addPayment(payment);
						
						// Update Jira.
						jira.updateIssue(token, issue.getId(), new RemoteFieldValue[] {
							new RemoteFieldValue(JIRA_PAYMENT_STATUS_FIELD_KEY, new String[] { "Paid" })
						});*/
					}
				} catch (Exception e) {
					// FIXME: MAKE SURE I HANDLE FAILURES CORRECTLY.
				}
			}
		} catch (RemoteException re) {
			// FIXME: MAKE SURE I HANDLE FAILURES CORRECTLY.
		} catch (ServiceException se) {
			// FIXME: MAKE SURE I HANDLE FAILURES CORRECTLY.
		}
	}

	/**
	 * @param issue
	 * @return
	 */
	private String getIssueType(RemoteIssue issue) {
		// FIXME: Handle Specification Review, Copilot, etc.
		return issue.getType().equals("Bug") ? "Bug Fix" : "Enhancement";
	}
	
	/**
	 * Checks whether its parameter is a null or empty <code>String</code>.
	 * 
	 * @param s the <code>String</code> to check.
	 * @return <code>true</code> if the string is <code>null</code> or empty, <code>false</code> otherwise.
	 */
	private boolean isNullOrEmpty(String s) {
		return (s == null) || s.equals("");
	}
	
	/**
	 * Retrieves the value of an issue's custom field by key.  Assumes the field has only one value, so it
	 * trims and then returns the first element of the value array.
	 *  
	 * @param issue the issue to retrieve the value from.
	 * @param key the custom field's key.
	 * @return the trimmed first value in the custom field, or <code>null</code> if it doesn't exist.
	 */
	private String getCustomFieldValueByKey(RemoteIssue issue, String key) {
		for (RemoteCustomFieldValue field : issue.getCustomFieldValues()) {
			if (field.getKey().equals(key)) {
				return field.getValues()[0].trim();
			}
		}
		return null;
	}
	
	/**
	 * Retrieves a client's real name by their Greek nickname.  The comparison is not case sensitive.
	 * 
	 * @param nickname the client's Greek nickname.
	 * @return the client's real name.
	 */
	private String getClientName(String nickname) {
		String canonicalNickname = nickname.trim().toLowerCase();
		
		if (clients.containsKey(canonicalNickname)) {
			return clients.get(canonicalNickname);
		}
		
		return null;
	}
	
    public static Object createEJB() throws Exception {
        InitialContext initial = TCContext.getInitial();

        Object objref = initial.lookup(PactsClientServicesHome.class.getName());
        PactsClientServicesHome home =
        		(PactsClientServicesHome) PortableRemoteObject.narrow(objref, PactsClientServicesHome.class);

        return home.create();
    }
    
    private void close(ResultSet rs) {
    	try {
    		if (rs != null) {
    			rs.close();
    		}
    	} catch (SQLException e) {
    		// Ignore
    	}
    }
    
    /**
     * Process and validate the parameters.
     */
    protected void processParams() {
        super.processParams();

        onlyAnalyze = (String) params.get("onlyAnalyze");
        if (onlyAnalyze == null) {
        	onlyAnalyze = "false";
        }
        params.remove("onlyAnalyze");

        // "jiraPaymentsFilename" is more useful than "CONF_FILENAME"
        String jiraPaymentsFilename = (String) params.get("jiraPaymentsFilename");
/*        try {
            if (jiraPaymentsFilename == null || jiraPaymentsFilename.trim().length() == 0) {
                throw new Exception("Invalid or non-existent parameter [jiraPaymentsFilename].");
            }
            parseReliabilityDetails(reliabilityFilename);
        } catch (Exception ex) {
            ex.printStackTrace();
            sErrorMsg.setLength(0);
            sErrorMsg.append("Load of Jira payments XML file failed:\n");
            sErrorMsg.append(ex.getMessage());
            fatal_error(ex);
        }*/
        params.remove("jiraPaymentsFilename");

        log.debug("onlyAnalyze: " + onlyAnalyze);
    }

	/**
	 * Show usage of the ProcessJiraPayments utility.
	 * 
	 * @param msg the error message
	 */
	@Override
	protected void setUsageError(String msg) {
        sErrorMsg.setLength(0);
        sErrorMsg.append(msg + "\n");
        sErrorMsg.append("ProcessJiraPayments:\n");
        sErrorMsg.append("   The following parameters should be included in the XML or the command line");
        sErrorMsg.append("   -onlyAnalyze : whether to just analyze without updates.\n");
        fatal_error();
	}

}
