package com.topcoder.web.screening.model;

import java.text.SimpleDateFormat;
import java.util.Map;

import javax.naming.InitialContext;
import javax.rmi.PortableRemoteObject;
import javax.sql.DataSource;

import com.topcoder.shared.dataAccess.DataAccess;
import com.topcoder.shared.dataAccess.DataAccessConstants;
import com.topcoder.shared.dataAccess.Request;
import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;
import com.topcoder.shared.security.User;
import com.topcoder.shared.util.EmailEngine;
import com.topcoder.shared.util.TCSEmailMessage;

import com.topcoder.web.common.security.PrincipalMgr;
import com.topcoder.web.screening.common.Constants;
import com.topcoder.web.screening.common.ScreeningException;

public class EmailInfo extends BaseModel {
    private static DataAccess access;

    private SessionInfo sessionInfo;
    private String subject;
    private String candidateAddress;
    private String candidatePassword;
    private String candidateHandle;
    private long   companyId;
    private String companyName;
    private String repName;
    private String repAddress;

    public EmailInfo() {
        subject = "Example Email";
        candidateAddress = "somecandidate@candidateaddress.com";
        candidateHandle = "candidate";
        candidatePassword = "password";
        repName = "Rep Name";
        companyName ="Rep's Company";
        repAddress = "rep@somecompany.com";
    }

    /**
     * Sets the value of <code>sessionInfo</code>.
     *
     * @param val
     */
    public void setSessionInfo( SessionInfo val ) {
        sessionInfo = val;
    }

    /**
     * Gets the value of <code>sessionInfo</code>.
     *
     * @return 
     */
    public SessionInfo getSessionInfo() {
        return sessionInfo;
    }

    /**
     * Sets the value of <code>subject</code>.
     *
     * @param val
     */
    public void setSubject( String val ) {
        subject = val;
    }

    /**
     * Gets the value of <code>subject</code>.
     *
     * @return 
     */
    public String getSubject() {
        return subject;
    }

    /**
     * Gets the value of <code>msgText</code>.
     *
     * @return 
     */
    public String getMsgText() {
        if(sessionInfo == null) return null;
        SimpleDateFormat sdf = new SimpleDateFormat("MMM dd yyyy haa");
        StringBuffer msgText = new StringBuffer(1000);
        msgText.append("Dear Candidate:\n");
        msgText.append("Thank you for your interest in working at ");
        msgText.append(companyName);
        msgText.append(".  We would like you to participate in the next stage of our screening ");
        msgText.append("process - the Private Candidate Testing Application powered by TopCoder.  ");
        msgText.append("Through this Testing Application, you will be asked to solve algorithmic ");
        msgText.append("problems as an objective measure of your programming ability, then compared ");
        msgText.append("to other candidates being evaluated for the same position.\n");
        msgText.append("\n");
        msgText.append("Please review the Help Manual before getting started: ");
        msgText.append("******<URL to online help manual>******* OR attached Word document\n");
        msgText.append("\n");
        msgText.append("The following session has been scheduled for you:\n");
        msgText.append("Begin: ");
        msgText.append(sdf.format(sessionInfo.getBeginDate()));
        msgText.append("\n");
        msgText.append("End: ");
        msgText.append(sdf.format(sessionInfo.getEndDate()));
        msgText.append("\n");
        msgText.append("Login:  ");
        msgText.append(candidateHandle);
        msgText.append("\n");
        msgText.append("Password:  ");
        msgText.append(candidatePassword);
        msgText.append("\n\n");
        msgText.append("On average, you should expect to spend 3 hours using the Testing Application.  ");
        msgText.append("You can access the Testing Application here: ******<URL>*******\n");
        msgText.append("\n");
        msgText.append("Best of luck!\n");
        msgText.append(repName);
        msgText.append("\n");
        msgText.append(companyName);



        return msgText.toString();
    }

    /**
     * Sets the value of <code>candidateAddress</code>.
     *
     * @param val
     */
    public void setCandidateAddress( String val ) {
        candidateAddress = val;
    }

    /**
     * Gets the value of <code>candidateAddress</code>.
     *
     * @return 
     */
    public String getCandidateAddress() {
        return candidateAddress;
    }

    /**
     * Sets the value of <code>candidatePassword</code>.
     *
     * @param val
     */
    public void setCandidatePassword( String val ) {
        candidatePassword = val;
    }

    /**
     * Gets the value of <code>candidatePassword</code>.
     *
     * @return 
     */
    public String getCandidatePassword() {
        return candidatePassword;
    }

    /**
     * Sets the value of <code>candidateHandle</code>.
     *
     * @param val
     */
    public void setCandidateHandle( String val ) {
        candidateHandle = val;
    }

    /**
     * Gets the value of <code>candidateHandle</code>.
     *
     * @return 
     */
    public String getCandidateHandle() {
        return candidateHandle;
    }

    /**
     * Sets the value of <code>companyId</code>.
     *
     * @param val
     */
    public void setCompanyId( long val ) {
        companyId = val;
    }

    /**
     * Gets the value of <code>companyId</code>.
     *
     * @return 
     */
    public long getCompanyId() {
        return companyId;
    }

    /**
     * Sets the value of <code>companyName</code>.
     *
     * @param val
     */
    public void setCompanyName( String val ) {
        companyName = val;
    }

    /**
     * Gets the value of <code>companyName</code>.
     *
     * @return 
     */
    public String getCompanyName() {
        return companyName;
    }

    /**
     * Sets the value of <code>repName</code>.
     *
     * @param val
     */
    public void setRepName( String val ) {
        repName = val;
    }

    /**
     * Gets the value of <code>repName</code>.
     *
     * @return 
     */
    public String getRepName() {
        return repName;
    }

    /**
     * Sets the value of <code>repAddress</code>.
     *
     * @param val
     */
    public void setRepAddress( String val ) {
        repAddress = val;
    }

    /**
     * Gets the value of <code>repAddress</code>.
     *
     * @return 
     */
    public String getRepAddress() {
        return repAddress;
    }

    public void sendEmail() throws Exception {
        String subject = getSubject();
        String text = getMsgText();
        if(sessionInfo.useCandidateEmail()) {
            TCSEmailMessage mail = new TCSEmailMessage();
            mail.setSubject(subject);
            mail.setBody(text);
            mail.addToAddress(candidateAddress, TCSEmailMessage.TO);
            mail.setFromAddress(repAddress);
            EmailEngine.send(mail);
        }

        if(sessionInfo.useRepEmail()) {
            TCSEmailMessage mail = new TCSEmailMessage();
            mail.setSubject(subject);
            mail.setBody(text);
            mail.addToAddress(repAddress, TCSEmailMessage.TO);
            mail.setFromAddress(repAddress);
            EmailEngine.send(mail);
        }

    }

    public static EmailInfo createEmailInfo(SessionInfo info, User repInfo) 
        throws Exception {
        EmailInfo emailInfo = new EmailInfo();
        emailInfo.setSessionInfo(info);
        PrincipalMgr mgr = new PrincipalMgr();
        long candidateId = Long.parseLong(info.getCandidateId());
        emailInfo.setCandidatePassword(mgr.getPassword(candidateId));

        if(access == null) {
            InitialContext context = new InitialContext();
            DataSource ds = (DataSource)
                PortableRemoteObject.narrow(
                        context.lookup(Constants.DATA_SOURCE),
                                            DataSource.class);

            access = new DataAccess(ds);
        }

        Request emailLookup = new Request();
        emailLookup.setProperty(DataAccessConstants.COMMAND,
                Constants.EMAIL_LOOKUP_COMMAND);

        emailLookup.setProperty("uid", String.valueOf(repInfo.getId()));
        emailLookup.setProperty("cid", info.getCandidateId());
        Map map = access.getData(emailLookup);
        ResultSetContainer rsc = (ResultSetContainer)
                    map.get(Constants.REP_EMAIL_INFO_QUERY_KEY);
        if(rsc.size() == 0) {
            throw new ScreeningException(
                    "Data Error, Rep Email info not found - uid " + 
                    repInfo.getId());
        }
        if(rsc.size() > 1) {
            throw new ScreeningException(
                    "Data Error, Rep Email info returned too many results (" +
                    rsc.size() + ") - uid " + repInfo.getId());
        }

        ResultSetContainer.ResultSetRow row = 
            (ResultSetContainer.ResultSetRow)rsc.get(0);
        emailInfo.setCompanyId(
                Long.parseLong(row.getItem("company_id").toString()));
        emailInfo.setCompanyName(row.getItem("company_name").toString());
        emailInfo.setRepName(row.getItem("rep_name").toString());
        emailInfo.setRepAddress(row.getItem("email_address").toString());

        rsc = (ResultSetContainer)
            map.get(Constants.CANDIDATE_EMAIL_INFO_QUERY_KEY);
        if(rsc.size() == 0) {
            throw new ScreeningException(
                    "Data Error, Candidate Email info not found - cid " + 
                    info.getCandidateId());
        }
        if(rsc.size() > 1) {
            throw new ScreeningException(
                    "Data Error, Candidate Email info returned too many results (" +
                    rsc.size() + ") - cid " + info.getCandidateId());
        }

        row = (ResultSetContainer.ResultSetRow)rsc.get(0);
        emailInfo.setCandidateAddress(row.getItem("email_address").toString());
        emailInfo.setCandidateHandle(row.getItem("handle").toString());

        emailInfo.setSubject("Invitation to Private Candidate Testing Application");

        return emailInfo;
    }
}
