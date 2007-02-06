package com.topcoder.web.tc.controller.request.development.assembly;

import com.topcoder.dde.catalog.ComponentManager;
import com.topcoder.dde.catalog.ComponentManagerHome;
import com.topcoder.dde.catalog.Forum;
import com.topcoder.dde.user.UserManagerRemote;
import com.topcoder.dde.user.UserManagerRemoteHome;
import com.topcoder.shared.dataAccess.Request;
import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;
import com.topcoder.shared.security.ClassResource;
import com.topcoder.shared.util.*;
import com.topcoder.util.format.ObjectFormatter;
import com.topcoder.util.format.ObjectFormatterFactory;
import com.topcoder.web.common.PermissionException;
import com.topcoder.web.common.SecurityHelper;
import com.topcoder.web.common.TCWebException;
import com.topcoder.web.common.tag.CalendarDateFormatMethod;
import com.topcoder.web.ejb.email.Email;
import com.topcoder.web.ejb.project.Project;
import com.topcoder.web.ejb.project.ProjectLocal;
import com.topcoder.web.tc.Constants;

import javax.ejb.CreateException;
import javax.naming.InitialContext;
import javax.rmi.PortableRemoteObject;
import javax.transaction.Status;
import javax.transaction.TransactionManager;
import java.rmi.RemoteException;
import java.sql.Timestamp;
import java.util.*;

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: Jan 6, 2006
 */
public class Register extends ViewRegistration {
    protected void developmentProcessing() throws TCWebException {

        try {
            if (!SecurityHelper.hasPermission(getLoggedInUser(), new ClassResource(this.getClass()))) {
                throw new PermissionException(getLoggedInUser(), new ClassResource(this.getClass()));
            }

            validation();

            getRequest().setAttribute(Constants.PROJECT_ID, getRequest().getParameter(Constants.PROJECT_ID));

            boolean agreed = "on".equals(getRequest().getParameter(Constants.TERMS_AGREE));
            if (agreed) {
                if (log.isDebugEnabled()) {
                    log.debug("they agree to terms");
                }
                boolean isEligible = getRequest().getAttribute(Constants.MESSAGE) == null;
                if (isEligible) {
                    if (log.isDebugEnabled()) {
                        log.debug("they are eligible");
                    }
                    register();
                    setNextPage("/dev/regSuccess.jsp");
                    setIsNextPageInContext(true);
                } else {
                    setNextPage("/dev/message.jsp");
                    setIsNextPageInContext(true);
                }
            } else {
                if (!agreed) {
                    addError(Constants.TERMS_AGREE, "You must agree to the terms in order to proceed.");
                }
                setDefault(Constants.TERMS, getTerms());
                //we're assuming if we got here, we had a valid project id
                setDefault(Constants.PROJECT_ID, getRequest().getParameter(Constants.PROJECT_ID));
                setNextPage("/dev/regTerms.jsp");
                setIsNextPageInContext(true);
            }

        } catch (TCWebException e) {
            throw e;
        } catch (Throwable e) {
            throw new TCWebException(e);
        }
    }

    
    private void register() throws Exception, RemoteException, CreateException {
        InitialContext ctx = null;
        try {
            long projectId = Long.parseLong(getRequest().getParameter(Constants.PROJECT_ID));
            ProjectLocal pl = (ProjectLocal) createLocalEJB(getInitialContext(), Project.class);
            long componentId = pl.getComponentId(projectId, DBMS.TCS_OLTP_DATASOURCE_NAME);

            ctx = TCContext.getContext(ApplicationServer.JNDI_FACTORY, ApplicationServer.TCS_APP_SERVER_URL);
            if (log.isDebugEnabled()) {
                log.debug("context: " + ctx.getEnvironment().toString());
            }

            Object objComponentManager = ctx.lookup(ComponentManagerHome.EJB_REF_NAME);
            ComponentManagerHome componentManagerHome =
                    (ComponentManagerHome) PortableRemoteObject.narrow(objComponentManager, ComponentManagerHome.class);
            ComponentManager componentManager = componentManagerHome.create(componentId);
            String project = componentManager.getComponentInfo().getName() + " Assembly Project";
            long activeForumId = componentManager.getActiveForum(Forum.SPECIFICATION).getId();

            if (log.isDebugEnabled()) {
                log.debug("creating user: " + UserManagerRemoteHome.EJB_REF_NAME);
            }
            Object objUserManager = ctx.lookup(UserManagerRemoteHome.EJB_REF_NAME);
            UserManagerRemoteHome userManagerHome =
                    (UserManagerRemoteHome) PortableRemoteObject.narrow(objUserManager, UserManagerRemoteHome.class);
            UserManagerRemote userManager = userManagerHome.create();

            TransactionManager tm = (TransactionManager) getInitialContext().lookup(ApplicationServer.TRANS_MANAGER);

            try {
                tm.begin();
                userManager.registerForProject(getUser().getId(), getRequest().getParameter("Comment"), projectId);
                tm.commit();
            } catch (Exception e) {
                if (tm != null && (tm.getStatus() == Status.STATUS_ACTIVE || tm.getStatus() == Status.STATUS_MARKED_ROLLBACK)) {
                    tm.rollback();
                }
                throw e;
            }

            TCSEmailMessage mail = new TCSEmailMessage();
            Email e = (Email) createEJB(getInitialContext(), Email.class);
            mail.addToAddress(e.getAddress(e.getPrimaryEmailId(getUser().getId(), DBMS.OLTP_DATASOURCE_NAME),
                    DBMS.OLTP_DATASOURCE_NAME), TCSEmailMessage.TO);
            mail.setFromAddress("service@topcodersoftware.com");
            mail.setSubject(project);

            Request r = new Request();
            r.setContentHandle("project_detail");
            r.setProperty(Constants.PROJECT_ID, String.valueOf(projectId));
            Map resultMap = getDataAccess().getData(r);
            ResultSetContainer details = (ResultSetContainer) resultMap.get("project_detail");
            Timestamp submitDeadline = (Timestamp) details.getItem(0, "initial_submission_date").getResultData();
            Calendar cal = Calendar.getInstance();
            cal.setTime(submitDeadline);
            cal.setTimeZone(TimeZone.getDefault());

            ObjectFormatter formatter = ObjectFormatterFactory.getEmptyFormatter();
            formatter.setFormatMethodForClass(Calendar.class,
                    new CalendarDateFormatMethod("MM.dd.yyyy HH:mm a z"), true);
            String date = formatter.format(cal);
          
            mail.setBody(getUser().getUserName() + ", \n\nRegistration Complete. \n\n" +
                    "Thank you, for your interest in the " + project + ". You now have access to the Discussion Forum ( http://" + ApplicationServer.SOFTWARE_SERVER_NAME + "/forum/c_forum.jsp?f=" + activeForumId + " ) which can be used to obtain documentation, as well as to ask questions regarding the project. Please post your questions at any time and a product manager will respond within 24 hours. Any questions asked within 6 hours of the submission due date/time may not be answered in time, so get your questions in early!\n\n" +
                    "The deadline for submitting a solution is " + date + ". Please upload your submission using the project page found here: http://" + ApplicationServer.SOFTWARE_SERVER_NAME + "/review.  If you encounter any problems, please contact us at service@topcodersoftware.com.  All late submissions will be ignored.\n\n" +
                    "If you have any questions please contact service@topcodersoftware.com\n\n" +
                    "TopCoder Software Team");

            EmailEngine.send(mail);

        } finally {
            close(ctx);
        }
    }
}