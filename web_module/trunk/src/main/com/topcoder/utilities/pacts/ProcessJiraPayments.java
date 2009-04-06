/**
 * Copyright (c) 2009 TopCoder, Inc.  All rights reserved.
 */
package com.topcoder.utilities.pacts;

import java.io.File;
import java.rmi.RemoteException;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.naming.InitialContext;
import javax.rmi.PortableRemoteObject;
import javax.xml.parsers.DocumentBuilderFactory;

import org.w3c.dom.Document;
import org.w3c.dom.NamedNodeMap;
import org.w3c.dom.NodeList;

import com.atlassian.jira.rpc.soap.beans.RemoteCustomFieldValue;
import com.atlassian.jira.rpc.soap.beans.RemoteFieldValue;
import com.atlassian.jira.rpc.soap.beans.RemoteIssue;
import com.atlassian.jira.rpc.soap.beans.RemoteIssueType;
import com.topcoder.shared.util.TCContext;
import com.topcoder.shared.util.sql.DBUtility;
import com.topcoder.web.ejb.pacts.BasePayment;
import com.topcoder.web.ejb.pacts.BugFixesPayment;
import com.topcoder.web.ejb.pacts.ComponentEnhancementsPayment;
import com.topcoder.web.ejb.pacts.PactsClientServices;
import com.topcoder.web.ejb.pacts.PactsClientServicesHome;
import com.topcoder.web.ejb.pacts.SpecificationReviewPayment;
import com.topcoder.www.bugs.rpc.soap.jirasoapservice_v2.JiraSoapService;
import com.topcoder.www.bugs.rpc.soap.jirasoapservice_v2.JiraSoapServiceServiceLocator;

/**
 * <p>Processes any pending payments from Jira (resolved issues marked as Payment Owed), and inserts the resulting
 * member payments into PACTS.</p>
 * 
 * Wishlist:
 * <ul>
 *   <li>Email about rejected issues.</li>
 * </ul>
 *  
 * @author ivern
 * @version 1.0.0
 * @see com.topcoder.shared.util.sql.DBUtility
 */
public class ProcessJiraPayments extends DBUtility {
	/** The Jira key for the Payment Status custom field. */
	private static final String JIRA_PAYMENT_STATUS_FIELD_KEY = "customfield_10030";
	
    /** This variable tells if only an analysis is wanted. */
    private String onlyAnalyze = null;
	
    /** Jira login username for the application. */
	private String jiraPaymentsUser = null;
	
	/** Jira login password for the application. */
	private String jiraPaymentsPassword = null;
	
	/** Jira filter that returns the issues to be considered for payment. */
	private String jiraPaymentsFilterId = null;
	
	/** A translation mapping of client Greek nicknames to their real names. */
	private Map<String, String> clientNicknameTranslation = null;
	
	/** A translation mapping of Jira issue type ids to PACTS payment types. */
	private Map<String, String> issueTypeTranslation = null;
	
	/** A translation mapping of Jira issue type ids to issue type names. */
	private Map<String, String> jiraIssueTypes = null;
	
	/* (non-Javadoc)
	 * @see com.topcoder.shared.util.sql.DBUtility#runUtility()
	 */
	@Override
	protected void runUtility() throws Exception {
		initializeDatabase();
		
		PactsClientServices pactsService = (PactsClientServices) createEJB();

		JiraSoapService jira = new JiraSoapServiceServiceLocator().getJirasoapserviceV2();

		String token = jira.login(jiraPaymentsUser, jiraPaymentsPassword);

		initializeJiraIssueTypes(jira, token);

		// TODO: Stop filtering for resolved, instead handle it in here.
		RemoteIssue[] issuesToPay = jira.getIssuesFromFilter(token, jiraPaymentsFilterId);

		for (RemoteIssue remoteIssue : issuesToPay) {
			try {
				// Parse all the relevant data from the Jira issue and determine rejection status and errors.
				JiraIssue issue = new JiraIssue(remoteIssue);

				// Ignoring types we don't have for now.
				if ("Studio".equals(issue.getReferenceType())) {
					issue.rejectIssue("Studio reference types are not implemented yet.");
				}
				if ("Copilot".equals(issue.getPaymentType())) {
					issue.rejectIssue("Copilot payment type is not implemented yet.");
				}
				if (remoteIssue.getKey().length() > 10 && "COMPBUILDS".equals(remoteIssue.getKey().substring(0, 10))) {
					issue.rejectIssue("Component Build payment types are not implemented yet.");
				}

				log.info("[" + (issue.isRejected() ? "REJECTED" : "ACCEPTED") + "] - (payment type: "
						+ issue.getPaymentType() + ", project type: " + issue.getReferenceType()
						+ ", reference id: " + issue.getReferenceId() + ", user id: " + issue.getPayeeUserId()
						+ ", client: "	+ issue.getClient() + ", amount: " + issue.getPaymentAmount()
						+ ", description: " + issue.getDescription() + ")");

				for (String e : issue.getErrors()) {
					log.info("    Reason : " + e);
				}

				if (onlyAnalyze.equalsIgnoreCase("false")) {
					if (issue.isRejected()) {
						StringBuffer sb = new StringBuffer(200);
						
						sb.append("Payment placed on hold for the following reasons:\n\n");
						for (String e : issue.getErrors()) {
							sb.append(" * ");
							sb.append(e);
							sb.append("\n");
						}
						
						updateJiraPaymentStatus(jira, token, remoteIssue, "Payment On Hold");
						// Comment addition removed to avoid spamming members.
						//addJiraComment(jira, token, remoteIssue, sb.toString());
					} else {							
						BasePayment payment = createPactsPayment(issue.getReferenceType(), issue.getPaymentType(),
								issue.getReferenceId(),	issue.getClient(), issue.getPayeeUserId(),
								issue.getPaymentAmount(), issue.getDescription());
						
						payment = pactsService.addPayment(payment);
						
						updateJiraPaymentStatus(jira, token, remoteIssue, "Paid");
						// Comment addition removed to avoid spamming members.
						//addJiraComment(jira, token, remoteIssue,
						//		"Payment processed on " + dateFormat.format(new Date()));
					}
				}
			} catch (Exception e) {
				log.error("*******************************************");
				log.error("FAILURE: Processing issue " + remoteIssue.getKey());
				e.printStackTrace();
				log.error("*******************************************");
			}
		}
	}

	/**
	 * @param jira
	 * @param token
	 * @param issue
	 * @param status
	 * @throws RemoteException
	 * @throws RemoteException
	 */
	private void updateJiraPaymentStatus(JiraSoapService jira, String token, RemoteIssue issue, String status)
			throws RemoteException,	com.atlassian.jira.rpc.exception.RemoteException {

		jira.updateIssue(token, issue.getKey(), new RemoteFieldValue[] {
			new RemoteFieldValue(JIRA_PAYMENT_STATUS_FIELD_KEY, new String[] { status })
		});
	}

	/**
	 * Creates an instance of the right PACTS payment for a given reference and payment type, populated with
	 * the provided reference, payee, client, amount, and description information.
	 * 
	 * @param referenceType the type of reference, currently either "TopCoder" or "Studio".
	 * @param paymentType the type of payment, such as "Bug Fix", "Enhancement", "Specification Review", etc.
	 * @param referenceId a reference to the project or contest that this payment is related to.
	 * @param client the name of the client that the work was done for.
	 * @param userId the payee's user id.
	 * @param amount the payment amount.
	 * @param description a description of the payment.
	 * @return the created payment instance.
	 */
	private BasePayment createPactsPayment(String referenceType, String paymentType, long referenceId, String client,
			long userId, double amount, String description) {
		
		BasePayment payment = null;
		
		if ("TopCoder".equals(referenceType)) {
			if ("Bug Fix".equals(paymentType)) {
				payment = new BugFixesPayment(userId, amount, client, referenceId);
			} else if ("Enhancement".equals(paymentType)){
				payment = new ComponentEnhancementsPayment(userId, amount, client, referenceId);
			} else if ("Specification Review".equals(paymentType)) {
				payment = new SpecificationReviewPayment(userId, amount, client, referenceId);
			} else {
				throw new IllegalArgumentException("Unknown payment type: " + paymentType);
			}
		} else if ("Studio".equals(referenceType)) {
			// TODO: Add Studio payment types once they exist.
			throw new RuntimeException("Studio payment types have not been implemented yet");
		} else {
			throw new IllegalArgumentException("Unknown reference type: " + referenceType);
		}
		payment.setNetAmount(amount);
		payment.setDescription(description);
		
		return payment;
	}

	/**
	 * @param jira
	 * @param token
	 * @throws Exception
	 */
	private void initializeJiraIssueTypes(JiraSoapService jira, String token) throws Exception {
		jiraIssueTypes = new HashMap<String, String>();
		
		RemoteIssueType[] issueTypes = jira.getIssueTypes(token);
		for (RemoteIssueType issueType : issueTypes) {
			jiraIssueTypes.put(issueType.getId(), issueType.getName());
			log.debug("Found Jira issue type (id: " + issueType.getId() + ", name: " + issueType.getName() + ")");
		}
	}

	/**
	 * Returns the PACTS payment type for a Jira issue type.
	 * 
	 * @param issue the Jira issue.
	 * @return the PACTS payment type for the Jira issue.
	 */
	private String getIssueType(RemoteIssue issue) {
		// TODO: straighten out the mess with build payments.
		if (issueTypeTranslation.containsKey(issue.getType())) {
			return issueTypeTranslation.get(issue.getType());
		}
		
		return null;
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
	 * Retrieves the value of an issue's custom field by id.  Assumes the field has only one value, so it
	 * trims and then returns the first element of the value array.
	 *  
	 * @param issue the issue to retrieve the value from.
	 * @param id the custom field's id.
	 * @return the trimmed first value in the custom field, or <code>null</code> if it doesn't exist.
	 */
	private String getCustomFieldValueById(RemoteIssue issue, String id) {
		for (RemoteCustomFieldValue field : issue.getCustomFieldValues()) {
			if (field.getCustomfieldId().equals(id)) {
				return (field.getValues() != null) ? field.getValues()[0].trim() : null;
			}
		}
		return null;
	}
	
	/**
	 * Retrieves a client's real name by their Greek nickname.  The comparison is not case sensitive.  If the search
	 * fails, an attempt is made to get a match with the real name just in case that is what was entered.
	 * 
	 * @param nickname the client's Greek nickname.
	 * @return the client's real name.
	 */
	private String getClientName(String nickname) {
		String canonicalNickname = canonicalize(nickname);
		
		if (clientNicknameTranslation.containsKey(canonicalNickname)) {
			return clientNicknameTranslation.get(canonicalNickname);
		}
		
		for (String name : clientNicknameTranslation.values()) {
			if (canonicalNickname.equals(canonicalize(name))) {
				return name;
			}
		}
		
		return null;
	}
	
    /**
     * Returns a canonical representation of a string (trimmed, and lower case).
     * 
     * @param s the string to canonicalize.
     * @return the input string, trimmed and converted to lower case.
     */
    private String canonicalize(String s) {
    	return s.trim().toLowerCase();
	}

	/**
	 * Helper method to create a PACTS service EJB home object.
	 * 
	 * @return a configured PACTS service EJB home object.
	 * @throws Exception if errors occur while creating the EJB home object.
	 */
	public static Object createEJB() throws Exception {
        InitialContext initial = TCContext.getInitial();

        Object objref = initial.lookup(PactsClientServicesHome.class.getName());
        PactsClientServicesHome home =
        		(PactsClientServicesHome) PortableRemoteObject.narrow(objref, PactsClientServicesHome.class);

        return home.create();
    }
    
    /**
     * Process and validate the parameters.
	 *
     * @see com.topcoder.shared.util.sql.DBUtility#processParams()
     */
    protected void processParams() {
        super.processParams();

        onlyAnalyze = (String) params.get("onlyAnalyze");
        if (onlyAnalyze == null) {
        	onlyAnalyze = "false";
        }
        params.remove("onlyAnalyze");
        log.debug("onlyAnalyze: " + onlyAnalyze);
        
        jiraPaymentsUser = (String) params.get("jiraPaymentsUser");
        if (jiraPaymentsUser == null) {
        	setUsageError("Required parameter jiraPaymentsUser missing.");
        }
        params.remove("jiraPaymentsUser");
        
        jiraPaymentsPassword = (String) params.get("jiraPaymentsPassword");
        if (jiraPaymentsPassword == null) {
        	setUsageError("Required parameter jiraPaymentsPassword missing.");
        }
        params.remove("jiraPaymentsPassword");
        
        jiraPaymentsFilterId = (String) params.get("jiraPaymentsFilterId");
        if (jiraPaymentsFilterId == null) {
        	setUsageError("Required parameter jiraPaymentsFilterId missing.");
        }
        params.remove("jiraPaymentsFilterId");

        clientNicknameTranslation = initializeTranslationFromConfiguration("clientNamingFilename");
        issueTypeTranslation = initializeTranslationFromConfiguration("issueTypesFilename");
    }

    /**
     * Reads a translation mapping from a file specified by a configuration key.
     * 
     * @param configurationKey the configuration key specifying the file to be loaded.
     * @return a <code>Map</code> containing the translation mapping.
     */
    private Map<String, String> initializeTranslationFromConfiguration(String configurationKey) {
        Map<String, String> translationMap = null;
        
        String filename = (String) params.get(configurationKey);
        
        try {
            if (filename == null || filename.trim().length() == 0) {
                throw new IllegalArgumentException("Invalid or non-existent parameter [" + configurationKey + "].");
            }
            translationMap = loadTranslationMap(filename);
        } catch (Exception ex) {
            ex.printStackTrace();
            sErrorMsg.setLength(0);
            sErrorMsg.append("Load of XML file for " + configurationKey + " failed:\n");
            sErrorMsg.append(ex.getMessage());
            fatal_error(ex);
        }
        
        params.remove(configurationKey);

        return translationMap;
    }
    
	/**
	 * Reads a translation mapping from an XML configuration file.  The origin words are stored canonicalized, so
	 * the mapping is case insensitive and ignores leading and trailing whitespace.  When using a translation map,
	 * the keys must be canonicalized as well.
	 * 
	 * @param filename the name of the XML translation mapping file to read.
	 */
	private Map<String, String> loadTranslationMap(String filename) throws Exception {
		Map<String, String> translationMap = new HashMap<String, String>();
		
        Document doc = DocumentBuilderFactory.newInstance().newDocumentBuilder().parse(new File(filename));
        doc.getDocumentElement().normalize();
        
        NodeList translations = doc.getElementsByTagName("translate");
				
        for (int i = 0; i < translations.getLength(); ++i) {
        	NamedNodeMap attr = translations.item(i).getAttributes();
        	
        	String from = attr.getNamedItem("from").getNodeValue();
        	String to = attr.getNamedItem("to").getNodeValue();
        	
        	String canonicalFrom = canonicalize(from);
        	
        	if (translationMap.containsKey(canonicalFrom)) {
        		log.warn("WARNING: " + filename + " - more than one translation found for " + canonicalFrom
        				+ ", ignoring translation to " + to);
        	}
        	
            translationMap.put(canonicalFrom, to);
            
            log.debug(filename + ": loaded translation (" + from + " -> " + to + ")");
        }
        
        return translationMap;
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
        sErrorMsg.append("   -onlyAnalyze          : whether to just analyze without updates.\n");
        sErrorMsg.append("   -jiraPaymentsUser     : the Jira user name for the payments application.\n");
        sErrorMsg.append("   -jiraPaymentsPassword : the Jira password for the payments application.\n");
        sErrorMsg.append("   -jiraPaymentsFilterId : the id of a Jira filter that returns the issues to be paid.\n");
        sErrorMsg.append("   -clientNamingFilename : client Greek to real name mapping file.\n");
        sErrorMsg.append("   -issueTypesFilename   : Jira issue to PACTS payment type mapping file.\n");
        fatal_error();
	}

	/**
	 * @author ivern
	 *
	 */
	private class JiraIssue {
		/** */
		private static final String JIRA_PAYMENT_AMOUNT_FIELD_ID = "customfield_10012";
		
		/** */
		private static final String JIRA_PAYEE_FIELD_ID = "customfield_10040";
		
		/** */
		private static final String JIRA_CLIENT_NICKNAME_FIELD_ID = "customfield_10074";
		
		/** */
		private static final String JIRA_PROJECT_ID_FIELD_ID = "customfield_10093";
		
		/** */
		private static final String JIRA_STUDIO_ID_FIELD_ID = "customfield_10094";
		
		/** */
		private String paymentType;
		
		/** */
		private String referenceType;
		
		/** */
		private String referenceInfo;
		
		/** */
		private long referenceId;
		
		/** */
		private long payeeUserId;
		
		/** */
		private String client;
		
		/** */
		private double paymentAmount;
		
		/** */
		private String description;
		
		/** */
		private boolean rejected;
		
		/** */
		private List<String> errors;
		
		/**
		 * @param remoteIssue
		 */
		public JiraIssue(RemoteIssue remoteIssue) {
			rejected = false;
			errors = new ArrayList<String>();
			
			populatePaymentType(remoteIssue);
			populateReferenceData(remoteIssue);
			populateClient(remoteIssue);
			populatePayeeUserId(remoteIssue);
			populatePaymentAmount(remoteIssue);
			populateDescription(remoteIssue);
		}
		
		/**
		 * @param remoteIssue
		 */
		private void populateDescription(RemoteIssue remoteIssue) {	
			description = "[" + remoteIssue.getKey() + "] - " + referenceInfo;
		}

		/**
		 * @param remoteIssue
		 */
		private void populatePaymentAmount(RemoteIssue remoteIssue) {
			String amountString = getCustomFieldValueById(remoteIssue, JIRA_PAYMENT_AMOUNT_FIELD_ID);
			try {
				paymentAmount = Double.parseDouble(amountString);
			} catch (Exception e) {
				paymentAmount = 0.0;
				rejectIssue("First Place Payment $ (" + amountString + ") is not a valid Double number.");
			}
		}

		/**
		 * @param remoteIssue
		 */
		private void populateClient(RemoteIssue remoteIssue) {
			String clientNickname = getCustomFieldValueById(remoteIssue, JIRA_CLIENT_NICKNAME_FIELD_ID);
			if (clientNickname != null) {
				client = getClientName(clientNickname);
				if (client == null) {
					client = clientNickname;
					rejectIssue("Unknown client nickname " + clientNickname + ".");
				}
			} else {
				client = "N/A";
				rejectIssue("The Client Nickname field must not be null.");
			}
		}

		/**
		 * @param remoteIssue
		 */
		private void populatePayeeUserId(RemoteIssue remoteIssue) {
			String payeeHandle = getCustomFieldValueById(remoteIssue, JIRA_PAYEE_FIELD_ID);
			payeeUserId = getUserIdByHandle(payeeHandle);
			if (payeeUserId == 0L) {
				rejectIssue("Payee (" + payeeHandle + ") must be a valid TopCoder handle.");
			}
		}

		/**
		 * @param remoteIssue
		 */
		private void populateReferenceData(RemoteIssue remoteIssue) {
			String projectId = getCustomFieldValueById(remoteIssue, JIRA_PROJECT_ID_FIELD_ID);
			String studioId = getCustomFieldValueById(remoteIssue, JIRA_STUDIO_ID_FIELD_ID);
			
			referenceId = 0L;
			referenceType = "N/A";
			referenceInfo = "N/A";
			
			if (!(isNullOrEmpty(projectId) ^ isNullOrEmpty(studioId))) {
				rejectIssue("One exactly of either ProjectID or StudioID must be filled out.");
			} else if (!isNullOrEmpty(projectId)) {
				referenceType = "TopCoder";
				try {
					referenceId = Long.parseLong(projectId);
					referenceInfo = getTopCoderProjectInfoById(referenceId);
					if (referenceInfo == null) {
						rejectIssue("Could not find TopCoder project with id " + referenceId);
					}
				} catch (NumberFormatException e) {
					rejectIssue("ProjectID (" + projectId + ") is not a valid Long number.");
				}
			} else {
				referenceType = "Studio";
				try {
					referenceId = Long.parseLong(studioId);
					referenceInfo = getStudioContestInfoById(referenceId);
					if (referenceInfo == null) {
						rejectIssue("Could not find Studio project with id " + referenceId);
					}
				} catch (NumberFormatException e) {
					rejectIssue("StudioID (" + studioId + ") is not a valid Long number.");
				}
			}
		}

		/**
		 * @param remoteIssue
		 */
		private void populatePaymentType(RemoteIssue remoteIssue) {
			// TODO: Unify the treatment of Jira issue types...id or name?
			paymentType = getIssueType(remoteIssue);
			if (paymentType == null) {
				rejected = true;
				paymentType = jiraIssueTypes.get(remoteIssue.getType());
			}
		}

		/**
		 * @param message
		 */
		public void rejectIssue(String message) {
			rejected = true;
			errors.add(message);
		}
		
		/**
		 * @return the rejected
		 */
		public boolean isRejected() {
			return rejected;
		}

		/**
		 * @return the errors
		 */
		public List<String> getErrors() {
			return errors;
		}

		/**
		 * @return the paymentType
		 */
		public String getPaymentType() {
			return paymentType;
		}

		/**
		 * @return the referenceType
		 */
		public String getReferenceType() {
			return referenceType;
		}

		/**
		 * @return the referenceId
		 */
		public long getReferenceId() {
			return referenceId;
		}

		/**
		 * @return the userId
		 */
		public long getPayeeUserId() {
			return payeeUserId;
		}

		/**
		 * @return the client
		 */
		public String getClient() {
			return client;
		}

		/**
		 * @return the amount
		 */
		public double getPaymentAmount() {
			return paymentAmount;
		}

		/**
		 * @return the description
		 */
		public String getDescription() {
			return description;
		}
	}
	
	/** */
	private static final String QUERY_USER_ID_BY_HANDLE =
		"SELECT user_id FROM user WHERE handle = ?";

	/** */
	private static final String QUERY_TOPCODER_PROJECT_INFO_BY_ID =
		"SELECT pi_name.value || ' ' || pi_version.value AS info" +
		"  FROM tcs_catalog:project_info pi_name" +
		"     , tcs_catalog:project_info pi_version" +
		" WHERE pi_name.project_id = ?" +
		"   AND pi_name.project_info_type_id = 6" +
		"   AND pi_version.project_id = pi_name.project_id" +
		"   AND pi_version.project_info_type_id = 7";

	/** */
	private static final String QUERY_STUDIO_CONTEST_INFO_BY_ID =
		"SELECT name AS info FROM studio_oltp:contest WHERE contest_id = ?";

	/** */
	private PreparedStatement queryUserIdByHandle = null;
	
	/** */
	private PreparedStatement queryTopCoderProjectInfoById = null;
	
	/** */
	private PreparedStatement queryStudioContestInfoById = null;

	/**
	 * @throws SQLException
	 */
	private void initializeDatabase() throws SQLException {
		queryUserIdByHandle = prepareStatement("informixoltp", QUERY_USER_ID_BY_HANDLE);
		queryTopCoderProjectInfoById = prepareStatement("informixoltp", QUERY_TOPCODER_PROJECT_INFO_BY_ID);
		queryStudioContestInfoById = prepareStatement("informixoltp", QUERY_STUDIO_CONTEST_INFO_BY_ID);
	}

	/**
	 * Looks up a member's user id by handle.
	 * 
	 * @param handle the handle of the member to look up.
	 * @return the member's user id, or 0L if the member could not be found. 
	 */
	private long getUserIdByHandle(String handle) {
		ResultSet rs = null;
		long userId = 0L;

		try {
			queryUserIdByHandle.setString(1, handle);
			rs = queryUserIdByHandle.executeQuery();

			if (rs.next()) {
				userId = rs.getLong("user_id");
			}
		} catch (SQLException e) {
			log.error("*******************************************");
			log.error("FAILURE: " + e);
			log.error("*******************************************");
		} finally {
			close(rs);
		}

		return userId;
	}

	/**
	 * Looks up a TopCoder project's name and version by project id.
	 * 
	 * @param projectId the id of the project to look up.
	 * @return a <code>String</code> containing the name and version of the project, or <code>null</code> if it
	 * 		   doesn't exist.
	 */
	private String getTopCoderProjectInfoById(long referenceId) {
		return getReferenceInfoById(queryTopCoderProjectInfoById, referenceId);
	}

	/**
	 * @param referenceId
	 * @return
	 */
	private String getStudioContestInfoById(long referenceId) {
		return getReferenceInfoById(queryStudioContestInfoById, referenceId);
	}

	/**
	 * @param referenceId
	 * @return
	 */
	private String getReferenceInfoById(PreparedStatement query, long referenceId) {
		ResultSet rs = null;
		String info = null;

		try {
			query.setLong(1, referenceId);
			rs = query.executeQuery();

			if (rs.next()) {
				info = rs.getString("info");
			}
		} catch (SQLException e) {
			log.error("*******************************************");
			log.error("FAILURE: " + e);
			log.error("*******************************************");
		} finally {
			close(rs);
		}
		
		return info;
	}
	
    /**
     * Helper method to close a JDBC ResultSet.
     * 
     * @param rs the ResultSet to close.
     */
    private void close(ResultSet rs) {
    	try {
    		if (rs != null) {
    			rs.close();
    		}
    	} catch (SQLException e) {
    		// Ignore.
    	}
    }
}
