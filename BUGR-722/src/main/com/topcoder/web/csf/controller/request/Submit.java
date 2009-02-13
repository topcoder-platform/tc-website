package com.topcoder.web.csf.controller.request;

import com.topcoder.servlet.request.UploadedFile;
import com.topcoder.shared.security.ClassResource;
import com.topcoder.shared.util.ApplicationServer;
import com.topcoder.web.common.MultipartRequest;
import com.topcoder.web.common.NavigationException;
import com.topcoder.web.common.PermissionException;
import com.topcoder.web.common.ShortHibernateProcessor;
import com.topcoder.web.common.dao.DAOFactory;
import com.topcoder.web.common.dao.DAOUtil;
import com.topcoder.web.common.dao.UserDAO;
import com.topcoder.web.common.model.Email;
import com.topcoder.web.common.model.User;
import com.topcoder.web.common.validation.IntegerValidator;
import com.topcoder.web.common.validation.ObjectInput;
import com.topcoder.web.common.validation.StringInput;
import com.topcoder.web.common.validation.ValidationResult;
import com.topcoder.web.csf.Constants;
import com.topcoder.web.csf.dao.CSFDAOFactory;
import com.topcoder.web.csf.dao.CSFDAOUtil;
import com.topcoder.web.csf.dao.SubmissionDAO;
import com.topcoder.web.csf.model.*;
import com.topcoder.web.csf.validation.SubmissionValidator;
import org.apache.axis.client.Call;
import org.apache.axis.client.Service;
import org.apache.axis.encoding.ser.JAFDataHandlerDeserializerFactory;
import org.apache.axis.encoding.ser.JAFDataHandlerSerializerFactory;

import javax.activation.DataHandler;
import javax.activation.FileDataSource;
import javax.xml.namespace.QName;
import javax.xml.rpc.ParameterMode;
import javax.xml.rpc.ServiceException;
import java.io.File;
import java.io.FileOutputStream;
import java.net.MalformedURLException;
import java.net.URL;
import java.rmi.RemoteException;
import java.sql.Timestamp;
import java.util.Date;

/**
 * @author dok
 * @version $Revision: 57926 $ Date: 2005/01/01 00:00:00
 *          Create Date: Jul 20, 2006
 */
public class Submit extends BaseSubmissionDataProcessor {
    private File f = null;

    protected void dbProcessing() throws Exception {
        if (userLoggedIn()) {
            Long contestId;

            try {
                contestId = new Long(getRequest().getParameter(Constants.CONTEST_ID));
            } catch (NumberFormatException e) {
                throw new NavigationException("Invalid contest specified.");
            }

            String rank = getRequest().getParameter(Constants.SUBMISSION_RANK);

            CSFDAOFactory cFactory = CSFDAOUtil.getFactory();
            DAOFactory factory = DAOUtil.getFactory();
            SubmissionDAO dao = cFactory.getSubmissionDAO();

            Contest c = cFactory.getContestDAO().find(contestId);
            Date now = new Date();
            if (now.before(c.getStartTime()) ||
                    now.after(c.getEndTime()) ||
                    !ContestStatus.ACTIVE.equals(c.getStatus().getId())) {
                throw new NavigationException("Inactive contest specified.");
            }
            User u = factory.getUserDAO().find(new Long(getUser().getId()));

            if (cFactory.getContestRegistrationDAO().find(c, u) == null) {
                //not registered
                StringBuffer buf = new StringBuffer(50);
                buf.append(getSessionInfo().getServletPath());
                buf.append("?" + Constants.MODULE_KEY + "=ViewRegistration&");
                buf.append(Constants.CONTEST_ID + "=").append(contestId);
                setNextPage(buf.toString());
                setIsNextPageInContext(false);
            } else {
                //registered

                MultipartRequest r = (MultipartRequest) getRequest();

                UploadedFile submissionFile = r.getUploadedFile(Constants.SUBMISSION);

                //do validation
                ValidationResult submissionResult = new SubmissionValidator(c).validate(new ObjectInput(submissionFile));
                if (!submissionResult.isValid()) {
                    addError(Constants.SUBMISSION, submissionResult.getMessage());
                }

                ValidationResult rankResult = new IntegerValidator("Please input a valid integer for rank.").validate(new StringInput(rank));
                if (!rankResult.isValid()) {
                    addError(Constants.SUBMISSION_RANK, rankResult.getMessage());
                }

                if (hasErrors()) {
                    setDefault(Constants.CONTEST_ID, contestId.toString());
                    setDefault(Constants.SUBMISSION_RANK, rank);
                    loadSubmissionData(u, c, dao);
                    getRequest().setAttribute("contest", c);
                    setNextPage("/submit.jsp");
                    setIsNextPageInContext(true);
                } else {
                    MimeType mt = cFactory.getMimeTypeDAO().find(submissionFile.getContentType());
                    Submission s = new Submission();
                    s.setContest(c);
                    s.setOriginalFileName(submissionFile.getRemoteFileName());
                    s.setSubmitter(u);
                    s.setMimeType(mt);

                    StringBuffer buf = new StringBuffer(80);
                    buf.append(Constants.ROOT_STORAGE_PATH);
                    buf.append(System.getProperty("file.separator"));
                    buf.append(Constants.SUBMISSIONS_DIRECTORY_NAME);
                    buf.append(System.getProperty("file.separator"));
                    buf.append(c.getId());
                    buf.append(System.getProperty("file.separator"));
                    buf.append(u.getHandle().toLowerCase());
                    buf.append("_");
                    buf.append(u.getId());
                    buf.append(System.getProperty("file.separator"));

                    FilePath p = new FilePath();
                    p.setPath(buf.toString());

                    File directory = new File(buf.toString());
                    if (!directory.exists()) {
                        directory.mkdirs();
                    }

                    String ext = submissionFile.getRemoteFileName().substring(submissionFile.getRemoteFileName().lastIndexOf('.'));

                    //root/submissions/contest_id/user_id/time.pdf
                    s.setPath(p);
                    s.setSystemFileName(System.currentTimeMillis() + ext);
                    s.setType(cFactory.getSubmissionTypeDAO().find(SubmissionType.INITIAL_CONTEST_SUBMISSION_TYPE));
                    s.setSubmissionDate(new Timestamp(System.currentTimeMillis()));

                    if (ShortHibernateProcessor.log.isDebugEnabled()) {
                        ShortHibernateProcessor.log.debug("creating file: " + p.getPath() + s.getSystemFileName());
                    }
                    f = new File(p.getPath() + s.getSystemFileName());

                    FileOutputStream fos = new FileOutputStream(f);
                    byte[] fileBytes = new byte[(int) submissionFile.getSize()];
                    submissionFile.getInputStream().read(fileBytes);
                    fos.write(fileBytes);
                    fos.close();

                    log.debug(f.getAbsolutePath());
                    uploadToOR(f.getAbsolutePath(), c);

                    //we have to rebuild the dao because we are into a new session after the call to uploadToOR
                    dao = cFactory.getSubmissionDAO();
                    Integer maxRank = dao.getMaxRank(c, u);
                    Integer one = new Integer(1);
                    getRequest().setAttribute("maxRank", maxRank);
                    if (maxRank == null) {
                        s.setRank(one);
                        dao.saveOrUpdate(s);
                    } else {
                        Integer newRank = new Integer(rank);
                        if (newRank.compareTo(maxRank) > 0) {
                            s.setRank(new Integer(maxRank.intValue() + 1));
                            dao.saveOrUpdate(s);
                        } else if (newRank.compareTo(one) < 0) {
                            dao.changeRank(one, s);
                        } else {
                            dao.changeRank(newRank, s);
                        }
                    }

                    markForCommit();

                    StringBuffer nextPage = new StringBuffer(50);
                    nextPage.append(getSessionInfo().getServletPath());
                    nextPage.append("?" + Constants.MODULE_KEY + "=ViewSubmissionSuccess&");
                    nextPage.append(Constants.SUBMISSION_ID + "=").append(s.getId());
                    setNextPage(nextPage.toString());
                    setIsNextPageInContext(false);


                }

            }

        } else {
            throw new PermissionException(getUser(), new ClassResource(this.getClass()));
        }
    }


    protected void uploadToOR(String fileName, Contest contest) throws RemoteException, ServiceException, MalformedURLException {

        DataHandler dhSource = new DataHandler(new FileDataSource(fileName));

        Service service = new Service();
        Call call = (Call) service.createCall();

        StringBuffer endPoint = new StringBuffer(100);
        if (ApplicationServer.ENVIRONMENT == ApplicationServer.PROD) {
            endPoint.append(Base.PROD_END_POINT);
        } else {
            endPoint.append(DEV_END_POINT);
        }
        endPoint.append("UploadService");
        call.setTargetEndpointAddress(new URL(endPoint.toString()));
        QName qnameAttachment = new QName("urn:EchoAttachmentsService", "DataHandler");

        call.registerTypeMapping(dhSource.getClass(), // Add serializer for attachment.
                qnameAttachment, JAFDataHandlerSerializerFactory.class, JAFDataHandlerDeserializerFactory.class);

        call.setOperationName(new QName("urn:UploadService", "uploadSubmission"));
        call.addParameter("projectId", org.apache.axis.Constants.XSD_LONG, javax.xml.rpc.ParameterMode.IN);
        call.addParameter("ownerId", org.apache.axis.Constants.XSD_LONG, javax.xml.rpc.ParameterMode.IN);
        call.addParameter("filename", org.apache.axis.Constants.XSD_STRING, javax.xml.rpc.ParameterMode.IN);
        call.addParameter("submissionDH", qnameAttachment, ParameterMode.IN); // Add the file.
        call.setReturnType(org.apache.axis.Constants.XSD_INT);
        String projectId = contest.getConfig(CSFDAOUtil.getFactory().getContestPropertyDAO().find(ContestProperty.PROJECT_ID)).getValue();
        User u = addSubmitterToOR(projectId, contest);
        call.invoke(new Object[]{new Long(projectId), u.getId(), fileName, dhSource});

    }

    private User addSubmitterToOR(String projectId, Contest contest) throws RemoteException, MalformedURLException, ServiceException {

        Service service = new Service();
        Call call = (Call) service.createCall();

        StringBuffer endPoint = new StringBuffer(100);
        if (ApplicationServer.ENVIRONMENT == ApplicationServer.PROD) {
            endPoint.append(Base.PROD_END_POINT);
        } else {
            endPoint.append(DEV_END_POINT);
        }
        endPoint.append("UsersService");
        call.setTargetEndpointAddress(new URL(endPoint.toString()));

        call.setOperationName(new QName("urn:UsersService", "addSubmitter"));
        call.addParameter("projectId", org.apache.axis.Constants.XSD_LONG, javax.xml.rpc.ParameterMode.IN);
        call.addParameter("ownerId", org.apache.axis.Constants.XSD_LONG, javax.xml.rpc.ParameterMode.IN);
        User ret = createNewSubmitter(contest);
        call.invoke(new Object[]{new Long(projectId), ret.getId()});
        return ret;
    }


    private User createNewSubmitter(Contest c) {

        CSFDAOFactory cFactory = CSFDAOUtil.getFactory();


        UserDAO dao = DAOUtil.getFactory().getUserDAO();
        User curr = dao.find(new Long(getUser().getId()));
        User u = new User();
        u.setHandle(curr.getHandle() + "_" + (cFactory.getSubmissionDAO().getSubmissions(curr, c).size() + 1) + "_" + System.currentTimeMillis());

        u.setPassword("");
        u.setFirstName(curr.getFirstName());
        u.setLastName(curr.getLastName());
        Email a = new Email();
        a.setPrimary(Boolean.TRUE);
        a.setEmailTypeId(Email.TYPE_ID_PRIMARY);
        a.setStatusId(Email.STATUS_ID_UNACTIVE);
        a.setAddress(curr.getPrimaryEmailAddress().getAddress());
        a.setUser(u);
        u.addEmailAddress(a);
        dao.saveOrUpdate(u);
        markForCommit();

        closeConversation();
        beginCommunication();

        return u;


    }


    protected void exceptionCallBack() {
        if (f != null) {
            try {
                f.delete();
            } catch (Throwable e) {
                ShortHibernateProcessor.log.error("Error attempting to remove file (" + f.getPath() + f.getName() + ") after exception: " + e.getMessage());
            }
        }
    }
}
