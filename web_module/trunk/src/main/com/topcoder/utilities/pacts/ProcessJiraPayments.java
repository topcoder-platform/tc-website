/**
 * Copyright (c) 2009 TopCoder, Inc.  All rights reserved.
 */
package com.topcoder.utilities.pacts;

import java.io.File;
import java.rmi.RemoteException;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.naming.InitialContext;
import javax.rmi.PortableRemoteObject;
import javax.xml.parsers.DocumentBuilderFactory;

import org.w3c.dom.Document;
import org.w3c.dom.NamedNodeMap;
import org.w3c.dom.NodeList;

import com.atlassian.jira.rpc.soap.beans.RemoteComment;
import com.atlassian.jira.rpc.soap.beans.RemoteCustomFieldValue;
import com.atlassian.jira.rpc.soap.beans.RemoteFieldValue;
import com.atlassian.jira.rpc.soap.beans.RemoteIssue;
import com.atlassian.jira.rpc.soap.beans.RemoteIssueType;
import com.topcoder.shared.util.TCContext;
import com.topcoder.shared.util.sql.DBUtility;
import com.topcoder.web.ejb.pacts.BasePayment;
import com.topcoder.web.ejb.pacts.BugFixesPayment;
import com.topcoder.web.ejb.pacts.ComponentBuildPayment;
import com.topcoder.web.ejb.pacts.ComponentEnhancementsPayment;
import com.topcoder.web.ejb.pacts.CopilotPayment;
import com.topcoder.web.ejb.pacts.PactsClientServices;
import com.topcoder.web.ejb.pacts.PactsClientServicesHome;
import com.topcoder.web.ejb.pacts.SpecificationReviewPayment;
import com.topcoder.web.ejb.pacts.StudioBugFixesPayment;
import com.topcoder.web.ejb.pacts.StudioEnhancementsPayment;
import com.topcoder.web.ejb.pacts.StudioSpecificationReviewPayment;
import com.topcoder.www.bugs.rpc.soap.jirasoapservice_v2.JiraSoapService;
import com.topcoder.www.bugs.rpc.soap.jirasoapservice_v2.JiraSoapServiceServiceLocator;

/**
 * <p>Processes any pending payments from Jira (resolved issues marked as Payment Owed), and inserts the resulting
 * member payments into PACTS.</p>
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
	
	/** The date format to be used when inserting timestamps into Jira comments. */
	private DateFormat dateFormat = null;
	
	/**
	 * Class constructor.  Initializes the date format.
	 */
	public ProcessJiraPayments() {
		super();
		dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	}
	
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
						addJiraComment(jira, token, remoteIssue, sb.toString());
					} else {
						BasePayment payment = createPactsPayment(issue.getReferenceType(), issue.getPaymentType(),
								issue.getReferenceId(),	issue.getClient(), issue.getPayeeUserId(),
								issue.getPaymentAmount(), issue.getDescription());
						
						payment = pactsService.addPayment(payment);
						
						updateJiraPaymentStatus(jira, token, remoteIssue, "Paid");
						addJiraComment(jira, token, remoteIssue,
								"Payment processed on " + dateFormat.format(new Date()));
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
	 * Updates a Jira issue's Payment Status custom field.
	 * 
	 * @param jira an instance of JiraSoapService.
	 * @param token the user's login token.
	 * @param issue the remote issue to modify.
	 * @param status a String containing the new status to set.
	 * @throws RemoteException if there was an error changing the field's value.
	 */
	private void updateJiraPaymentStatus(JiraSoapService jira, String token, RemoteIssue issue, String status)
			throws RemoteException {

		jira.updateIssue(token, issue.getKey(), new RemoteFieldValue[] {
			new RemoteFieldValue(JIRA_PAYMENT_STATUS_FIELD_KEY, new String[] { status })
		});
	}
	
	/**
	 * Inserts a comment into a Jira issue.
	 * 
	 * @param jira an instance of JiraSoapService
	 * @param token the user's login token.
	 * @param issue the remote issue to add the comment to.
	 * @param body the comment body.
	 * @throws RemoteException if there was an error inserting the comment.
	 */
	private void addJiraComment(JiraSoapService jira, String token,	RemoteIssue issue, String body)
			throws RemoteException {
	
		final RemoteComment comment = new RemoteComment(); 
		comment.setBody(body);
		jira.addComment(token, issue.getKey(), comment);
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
			} else if ("Copilot".equals(paymentType)) {
				payment = new CopilotPayment(userId, amount, client, referenceId);
			} else if ("Build".equals(paymentType) || "Re-Build".equals(paymentType) || "Build QC".equals(paymentType)) {
				payment = new ComponentBuildPayment(userId, amount, client, referenceId);
				description += " (" + paymentType + ")";
			} else {
				throw new IllegalArgumentException("Unknown TopCoder payment type: " + paymentType);
			}
		} else if ("Studio".equals(referenceType)) {
			if ("Bug Fix".equals(paymentType)) {
				payment = new StudioBugFixesPayment(userId, amount, client, referenceId);
			} else if ("Enhancement".equals(paymentType)){
				payment = new StudioEnhancementsPayment(userId, amount, client, referenceId);
			} else if ("Specification Review".equals(paymentType)) {
				payment = new StudioSpecificationReviewPayment(userId, amount, client, referenceId);
			} else {
				throw new IllegalArgumentException("Unknown Studio payment type: " + paymentType);
			}
		} else {
			throw new IllegalArgumentException("Unknown reference type: " + referenceType);
		}
		payment.setNetAmount(amount);
		payment.setDescription(description);
		
		return payment;
	}

	/**
	 * Loads all the existing issue types from Jira.
	 * 
	 * @param jira the Jira service.
	 * @param token the user's login token.
	 * @throws Exception if there is an error.
	 */
	private void initializeJiraIssueTypes(JiraSoapService jira, String token) throws Exception {
		jiraIssueTypes = new HashMap<String, String>();
		
		// FIXME: This doesn't seem to be retrieving subtask types.
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
	 * A data object holding all relevant information about a payable Jira issue.
	 * 
	 * @author ivern
	 * @version 1.0.0
	 */
	private class JiraIssue {
		/** The Jira id for the First Place Payment $ custom field. */
		private static final String JIRA_PAYMENT_AMOUNT_FIELD_ID = "customfield_10012";
		
		/** The Jira id for the Payee custom field. */
		private static final String JIRA_PAYEE_FIELD_ID = "customfield_10040";
		
		/** The Jira id for the Client Nickname custom field. */
		private static final String JIRA_CLIENT_NICKNAME_FIELD_ID = "customfield_10074";
		
		/** The Jira id for the ProjectID custom field. */
		private static final String JIRA_PROJECT_ID_FIELD_ID = "customfield_10093";
		
		/** The Jira id for the StudioID custom field. */
		private static final String JIRA_STUDIO_ID_FIELD_ID = "customfield_10094";
		
		/** The PACTS payment type for this issue. */
		private String paymentType;
		
		/** The reference type (TopCoder or Studio) for this issue. */
		private String referenceType;
		
		/** The reference information for this issue (project name for TopCoder, contest name for Studio). */
		private String referenceInfo;
		
		/** The reference id for this issue (project id for TopCoder, contest id for Studio). */
		private long referenceId;
		
		/** The payee's TopCoder user id. */
		private long payeeUserId;
		
		/** The client's real name. */
		private String client;
		
		/** The payment amount. */
		private double paymentAmount;
		
		/** A description of the issue to be used for payment purposes.  Typically this is the issue key followed by
		    the reference information. */
		private String description;
		
		/** Whether this issue is being rejected for payment or not. */
		private boolean rejected;
		
		/** A list of errors explaining why the issue has been rejected for payment, if applicable. */
		private List<String> errors;
		
		/**
		 * Constructs a new JiraIssue instance from the provided RemoteIssue.
		 * 
		 * @param remoteIssue the RemoteIssue to obtain data from.
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
		 * Populates the description field from the provided RemoteIssue.
		 * 
		 * @param remoteIssue the RemoteIssue to obtain data from.
		 */
		private void populateDescription(RemoteIssue remoteIssue) {	
			description = "[" + remoteIssue.getKey() + "] - " + referenceInfo;
		}

		/**
		 * Populates the payment amount field from the provided RemoteIssue.
		 * 
		 * @param remoteIssue the RemoteIssue to obtain data from.
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
		 * Populates the client field from the provided RemoteIssue.
		 * 
		 * @param remoteIssue the RemoteIssue to obtain data from.
		 */
		private void populateClient(RemoteIssue remoteIssue) {
			String clientNickname = getCustomFieldValueById(remoteIssue, JIRA_CLIENT_NICKNAME_FIELD_ID);
			if (clientNickname != null) {
				client = getClientName(clientNickname);
				if (client == null) {
					client = clientNickname;
					rejectIssue("Unknown client " + clientNickname + ".");
				}
			} else {
				client = "N/A";
				rejectIssue("The Client Nickname field must not be null.");
			}
		}

		/**
		 * Populates the payee user id field from the provided RemoteIssue.
		 * 
		 * @param remoteIssue the RemoteIssue to obtain data from.
		 */
		private void populatePayeeUserId(RemoteIssue remoteIssue) {
			String payeeHandle = getCustomFieldValueById(remoteIssue, JIRA_PAYEE_FIELD_ID);
			payeeUserId = getUserIdByHandle(payeeHandle);
			if (payeeUserId == 0L) {
				rejectIssue("Payee (" + payeeHandle + ") must be a valid TopCoder handle.");
			}
		}

		/**
		 * Populates the reference id, type, and info fields from the provided RemoteIssue.
		 * 
		 * @param remoteIssue the RemoteIssue to obtain data from.
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
		 * Populates the payment type field from the provided RemoteIssue.
		 * 
		 * @param remoteIssue the RemoteIssue to obtain data from.
		 */
		private void populatePaymentType(RemoteIssue remoteIssue) {
			// TODO: Unify the treatment of Jira issue types...id or name?
			paymentType = getIssueType(remoteIssue);
			if (paymentType == null) {
				paymentType = jiraIssueTypes.get(remoteIssue.getType());
				rejectIssue("Unknown issue type " + paymentType + ".");
			}
		}

		/**
		 * Marks the issue as rejected for payment, and adds the provided error message to the error list.
		 * 
		 * @param message the error message to add.
		 */
		public void rejectIssue(String message) {
			rejected = true;
			errors.add(message);
		}
		
		/**
		 * Checks whether the issue has been rejected for payment.
		 * 
		 * @return <code>true</code> if the issue has been rejected, <code>false</code> otherwise.
		 */
		public boolean isRejected() {
			return rejected;
		}

		/**
		 * Returns the list of errors that caused the issue to be rejected for payment.  If none exist, an empty
		 * list is returned.
		 * 
		 * @return the errors as a list of <code>String</code>.
		 */
		public List<String> getErrors() {
			return errors;
		}

		/**
		 * Returns the PACTS payment type for this issue.
		 * 
		 * @return the payment type.
		 */
		public String getPaymentType() {
			return paymentType;
		}

		/**
		 * Returns the issue's reference type (currently "TopCoder" or "Studio").
		 * 
		 * @return the reference type.
		 */
		public String getReferenceType() {
			return referenceType;
		}

		/**
		 * Returns the issue's reference id (currently a TopCoder project or Studio contest id).
		 * 
		 * @return the reference id.
		 */
		public long getReferenceId() {
			return referenceId;
		}

		/**
		 * Returns the TopCoder user id for the issue's payee.
		 * 
		 * @return the user id.
		 */
		public long getPayeeUserId() {
			return payeeUserId;
		}

		/**
		 * Returns the name of the client this issue was resolved for.
		 * 
		 * @return the client name.
		 */
		public String getClient() {
			return client;
		}

		/**
		 * Returns the amount owed to the payee.
		 * 
		 * @return the amount.
		 */
		public double getPaymentAmount() {
			return paymentAmount;
		}

		/**
		 * Returns a description of the issue.
		 * 
		 * @return the description.
		 */
		public String getDescription() {
			return description;
		}
	}
	
	/** A query that finds a member by handle and returns their user id. */
	private static final String QUERY_USER_ID_BY_HANDLE =
		"SELECT user_id FROM user WHERE handle = ?";

	/** A query that finds a TopCoder project by id and returns its name and version. */
	private static final String QUERY_TOPCODER_PROJECT_INFO_BY_ID =
		"SELECT pi_name.value || ' ' || pi_version.value AS info" +
		"  FROM tcs_catalog:project_info pi_name" +
		"     , tcs_catalog:project_info pi_version" +
		" WHERE pi_name.project_id = ?" +
		"   AND pi_name.project_info_type_id = 6" +
		"   AND pi_version.project_id = pi_name.project_id" +
		"   AND pi_version.project_info_type_id = 7";

	/** A query that finds a Studio contest by id and returns its name. */
	private static final String QUERY_STUDIO_CONTEST_INFO_BY_ID =
		"SELECT name AS info FROM studio_oltp:contest WHERE contest_id = ?";

	/** A prepared statement that finds a member by handle and returns their user id. */
	private PreparedStatement queryUserIdByHandle = null;
	
	/** A prepared statement that finds a TopCoder project by id and returns its name and version. */
	private PreparedStatement queryTopCoderProjectInfoById = null;
	
	/** A prepared statement that finds a Studio contest by id and returns its name. */
	private PreparedStatement queryStudioContestInfoById = null;

	/**
	 * Initializes all of the prepared statements used by the application.
	 * 
	 * @throws SQLException if an error occurs.
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
			e.printStackTrace();
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
	private String getTopCoderProjectInfoById(long projectId) {
		return getReferenceInfoById(queryTopCoderProjectInfoById, projectId);
	}

	/**
	 * Looks up a Studio contest's name by contest id.
	 * 
	 * @param contestId the id of the contest to look up.
	 * @return a <code>String</code> containing the name of the contest, or <code>null</code> if it doesn't exist.
	 */
	private String getStudioContestInfoById(long contestId) {
		return getReferenceInfoById(queryStudioContestInfoById, contestId);
	}

	/**
	 * Looks up a contest or project by id and returns the reference information.
	 * 
	 * @param referenceId the id of the project or contest to look up.
	 * @return the reference information (project name and version, or contest name).
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
			e.printStackTrace();
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
