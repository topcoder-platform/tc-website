package com.topcoder.web.privatelabel.controller.request;

import com.topcoder.security.TCSubject;
import com.topcoder.shared.dataAccess.DataAccess;
import com.topcoder.shared.dataAccess.DataAccessInt;
import com.topcoder.shared.dataAccess.Request;
import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;
import com.topcoder.shared.security.Persistor;
import com.topcoder.shared.util.DBMS;
import com.topcoder.shared.util.TCResourceBundle;
import com.topcoder.web.common.BaseProcessor;
import com.topcoder.web.common.CachedDataAccess;
import com.topcoder.web.common.StringUtils;
import com.topcoder.web.common.TCWebException;
import com.topcoder.web.common.security.SessionPersistor;
import com.topcoder.web.privatelabel.Constants;
import com.topcoder.web.privatelabel.model.DemographicAnswer;
import com.topcoder.web.privatelabel.model.DemographicQuestion;
import com.topcoder.web.privatelabel.model.FullRegInfo;
import com.topcoder.web.privatelabel.model.SimpleRegInfo;

import java.util.*;

/**
 * Provides some functionality that is basic to all registration
 * processors.
 *
 * @author gpaul 06.26.2003
 */
public abstract class RegistrationBase extends BaseProcessor {

    protected String transDb;
    protected String db;
    protected SimpleRegInfo regInfo;
    protected Persistor p;
    protected static final TCSubject CREATE_USER = new TCSubject(100000);
    private TCResourceBundle bundle = null;
    private Locale locale = null;
    protected Map questions;

    protected void businessProcessing() throws TCWebException {
        try {
            p = new SessionPersistor(getRequest().getSession(true));
            if (getRequestParameter(Constants.COMPANY_ID) == null) {
                throw new TCWebException("company id missing");
            }
            //gotta do first just in case makeRegInfo() needs the database
            long companyId = Long.parseLong(getRequestParameter(Constants.COMPANY_ID));
            transDb = getCompanyDb(companyId, Constants.JTS_TRANSACTIONAL);
            db = getCompanyDb(companyId, Constants.TRANSACTIONAL);
            log.debug("trans database set to: " + transDb);
            log.debug("database set to: " + db);

            regInfo = makeRegInfo();
            p.setObject(Constants.REGISTRATION_INFO, regInfo);
            registrationProcessing();
        } catch (TCWebException e) {
            throw e;
        } catch (Exception e) {
            throw new TCWebException(e);
        }
    }

    protected TCResourceBundle getBundle() {
        if (bundle == null) {
            bundle = new TCResourceBundle("PrivateLabel", getLocale());
            String loc = StringUtils.checkNull(getRequest().getParameter(Constants.LOCALE));
            log.debug("create bundle for language " + loc);
            if ("".equals(loc)) {
                bundle = new TCResourceBundle("PrivateLabel");
            } else {
                bundle = new TCResourceBundle("PrivateLabel", getLocale());
            }
        }
        return bundle;
    }

    protected Locale getLocale() {
        if (locale == null) {
            String loc = StringUtils.checkNull(getRequest().getParameter(Constants.LOCALE));
            log.debug("create locale for language " + loc);
            if ("".equals(loc)) {
                locale = Locale.US;
            } else {
                locale = new Locale(loc);
            }
        }
        return locale;
    }

    protected void clearRegInfo() {
        //we'll let this object live for the life of the request at least.
        //perhaps it is still necessary.  it'll die when the request processor dies
//        regInfo = null;
        //p.removeObject(Constants.REGISTRATION_INFO);

        //we'll jus wipe the whole session out.
        getRequest().getSession().invalidate();
    }

    /**
     * makeRegInfo() will be called before registrationProcessing()
     * is called in child classes.
     *
     * @return SimpleRegInfo
     */
    protected abstract SimpleRegInfo makeRegInfo() throws Exception;

    /**
     * subclasses must implement this method to do their
     * request processing.  this is where the meat goes.
     *
     * @throws TCWebException
     */
    protected abstract void registrationProcessing() throws TCWebException;

    public static String getCompanyDb(long companyId, int type) throws Exception {
        Request r = new Request();
        r.setContentHandle("company_datasource");
        r.setProperty("cm", String.valueOf(companyId));
        r.setProperty("dstid", String.valueOf(type));
        //not sure if this db is ok...we'll see
        Map m = getDataAccess(DBMS.OLTP_DATASOURCE_NAME, true).getData(r);
        ResultSetContainer rsc = (ResultSetContainer) m.get("company_datasource");
        if (rsc == null || rsc.isEmpty()) {
            throw new Exception("Could not find datasource for company: " + companyId);
        } else {
            return rsc.getStringItem(0, "datasource_name");
        }
    }

    protected static DataAccessInt getDataAccess(String db) throws Exception {
        return getDataAccess(db, false);
    }

    protected static DataAccessInt getDataAccess(String datasource, boolean cached) throws Exception {
        if (datasource == null)
            throw new IllegalArgumentException("datasource name is null.");
        DataAccessInt dAccess = null;
        if (cached)
            dAccess = new CachedDataAccess(datasource);
        else
            dAccess = new DataAccess(datasource);
        return dAccess;
    }

    protected String findState(String stateCode) throws TCWebException {
        ResultSetContainer list = getStateList();
        ResultSetContainer.ResultSetRow row = null;
        for (Iterator it = list.iterator(); it.hasNext();) {
            row = (ResultSetContainer.ResultSetRow) it.next();
            if (row.getItem("state_code").toString().equals(stateCode))
                return row.getItem("state_name").toString();
        }
        return null;
    }

    protected String findCountry(String countryCode) throws TCWebException {
        ResultSetContainer list = getCountryList();
        ResultSetContainer.ResultSetRow row = null;
        for (Iterator it = list.iterator(); it.hasNext();) {
            row = (ResultSetContainer.ResultSetRow) it.next();
            if (row.getItem("country_code").toString().equals(countryCode))
                return row.getItem("country_name").toString();
        }
        return null;
    }

    protected String findFullCountry(String countryCode) throws TCWebException {
        ResultSetContainer list = getFullCountryList();
        ResultSetContainer.ResultSetRow row = null;
        for (Iterator it = list.iterator(); it.hasNext();) {
            row = (ResultSetContainer.ResultSetRow) it.next();
            if (row.getItem("country_code").toString().equals(countryCode))
                return row.getItem("country_name").toString();
        }
        return null;
    }

    protected ResultSetContainer getCountryList() throws TCWebException {
        try {
            Request request = new Request();
            request.setContentHandle("country_list");
            request.setProperty(Constants.EVENT_ID, String.valueOf(regInfo.getEventId()));
            Map map = getDataAccess(transDb, true).getData(request);
            if (map == null)
                throw new Exception("error getting country list from db");
            else
                return (ResultSetContainer) map.get("country_list");
        } catch (Exception e) {
            throw new TCWebException(e);
        }
    }


    protected ResultSetContainer getFullCountryList() throws TCWebException {
        try {
            Request request = new Request();
            request.setContentHandle("country_list");
            Map map = getDataAccess(DBMS.OLTP_DATASOURCE_NAME, true).getData(request);
            if (map == null)
                throw new Exception("error getting country list from db");
            else
                return (ResultSetContainer) map.get("country_list");
        } catch (Exception e) {
            throw new TCWebException(e);
        }
    }


    protected ResultSetContainer getStateList() throws TCWebException {
        try {
            Request request = new Request();
            request.setContentHandle("state_list");
            Map map = getDataAccess(transDb, true).getData(request);
            if (map == null)
                throw new Exception("error getting state list from db");
            else
                return (ResultSetContainer) map.get("state_list");
        } catch (Exception e) {
            throw new TCWebException(e);
        }
    }

/*  we're not going to create security user's anymore (at least for now, we'll just create the user in the
    company specific db
    protected final PrincipalMgrRemote getPrincipalManager() throws Exception {
        InitialContext ctx = null;
        try {
            ctx = (InitialContext) TCContext.getContext(
                    ApplicationServer.SECURITY_CONTEXT_FACTORY,
                    ApplicationServer.SECURITY_PROVIDER_URL);
            PrincipalMgrRemoteHome rHome = (PrincipalMgrRemoteHome)
                    ctx.lookup(PrincipalMgrRemoteHome.EJB_REF_NAME);

            PrincipalMgrRemote mgr = rHome.create();
            return mgr;
        } finally {
            close(ctx);
        }

    }
*/

    protected String getRequestParameter(String name) throws Exception {
        String ret = null;
        ret = getRequest().getParameter(name);
        return ret;
    }

    protected boolean hasRequestParameter(String name) throws Exception {
        return getRequest().getParameter(name) != null;
    }

    protected SimpleRegInfo getRegInfoFromPersistor() {
        //TODO return a clone
        SimpleRegInfo info = null;
        Persistor p = new SessionPersistor(getRequest().getSession(true));
        info = (SimpleRegInfo) p.getObject(Constants.REGISTRATION_INFO);
        return info;
    }


    protected Map getFileTypes(String db) throws Exception {
        Request r = new Request();
        r.setContentHandle("file_types");
        Map qMap = getDataAccess(db, true).getData(r);
        ResultSetContainer questions = (ResultSetContainer) qMap.get("file_types");
        ResultSetContainer.ResultSetRow row = null;

        Map ret = new HashMap();
        for (Iterator it = questions.iterator(); it.hasNext();) {
            row = (ResultSetContainer.ResultSetRow) it.next();
            ret.put(row.getStringItem("mime_type"), new Long(row.getLongItem("file_type_id")));
        }
        return ret;
    }

    protected static DemographicQuestion findQuestion(long questionId, Map questions) {
        DemographicQuestion ret = null;
        Long id = new Long(questionId);
        if (questions.containsKey(id)) {
            ret = (DemographicQuestion) ((DemographicQuestion) questions.get(id)).clone();
        }
        return ret;
    }


    /**
     * get a map of questions.  key is a Long containing the question id.  value is the
     * DemographicQuestion object.
     *
     * @param db
     * @return
     * @throws Exception
     */
    protected static Map getQuestions(String db, int coderTypeId, int companyId, Locale locale) throws Exception {
        Request r = new Request();
        if (locale.getLanguage().equals(Locale.US.getLanguage())) {
            r.setContentHandle("demographic_question_list");
        } else {
            r.setContentHandle(locale.getLanguage() + "_demographic_question_list");
        }
        r.setProperty("ct", String.valueOf(coderTypeId));
        r.setProperty("cm", String.valueOf(companyId));
        Map qMap = getDataAccess(db, true).getData(r);
        ResultSetContainer questions = (ResultSetContainer) qMap.get("demographic_question_list");
        ResultSetContainer.ResultSetRow row = null;

        Map ret = new HashMap();
        DemographicQuestion q = null;
        for (Iterator it = questions.iterator(); it.hasNext();) {
            row = (ResultSetContainer.ResultSetRow) it.next();
            q = makeQuestion(row, db, locale);
            ret.put(new Long(q.getId()), q);
        }
        return ret;
    }

    protected Map getQuestions() {
        try {
            if (questions == null)
                questions = getQuestions(transDb, ((FullRegInfo) regInfo).getCoderType(),
                        Integer.parseInt(getRequestParameter(Constants.COMPANY_ID)), getLocale());
        } catch (Exception e) {

            throw new RuntimeException("failed to get the questions \n" + e.getMessage());
        }
        return questions;
    }


    private static DemographicQuestion makeQuestion(ResultSetContainer.ResultSetRow row, String db, Locale locale) throws Exception {
        DemographicQuestion ret = new DemographicQuestion();
        ret.setId(row.getLongItem("demographic_question_id"));
        ret.setDesc(row.getStringItem("demographic_question_desc"));
        ret.setText(row.getStringItem("demographic_question_text"));
        ret.setSelectable(row.getStringItem("selectable"));
        ret.setRequired(row.getItem("is_required").getResultData() != null && row.getIntItem("is_required") == 1);
        ret.setSort(row.getIntItem("sort"));

        DataAccessInt dataAccess = getDataAccess(db, true);
        Request r = new Request();
        if (locale.getLanguage().equals(Locale.US.getLanguage())) {
            r.setContentHandle("demographic_answer_list");
        } else {
            r.setContentHandle(locale.getLanguage() + "_demographic_answer_list");
        }
        r.setProperty("dq", String.valueOf(ret.getId()));
        r.setProperty("db", String.valueOf(db));
        Map aMap = dataAccess.getData(r);
        ResultSetContainer answers = (ResultSetContainer) aMap.get("demographic_answer_list");

        ResultSetContainer.ResultSetRow aRow = null;
        List answerList = new ArrayList(answers.size());
        for (Iterator it = answers.iterator(); it.hasNext();) {
            aRow = (ResultSetContainer.ResultSetRow) it.next();
            answerList.add(makeAnswer(aRow));
        }
        ret.setAnswers(answerList);
        return ret;
    }

    private static DemographicAnswer makeAnswer(ResultSetContainer.ResultSetRow row) {
        DemographicAnswer ret = new DemographicAnswer();
        ret.setAnswerId(row.getLongItem("demographic_answer_id"));
        ret.setText(row.getStringItem("demographic_answer_text"));
        ret.setQuestionId(row.getLongItem("demographic_question_id"));
        ret.setSort(row.getIntItem("sort"));
        return ret;
    }

    protected final List getQuestionList(int coderTypeId, Locale locale) throws Exception {
        //in case we need the list before we've populated it.  this is most
        //likely to happen in makeRegInfo()
        if (questions == null)
            questions = getQuestions(transDb, coderTypeId, Integer.parseInt(getRequestParameter(Constants.COMPANY_ID)),
                    locale);
        List ret = new ArrayList(questions.size());
        DemographicQuestion q = null;
        for (Iterator it = questions.values().iterator(); it.hasNext();) {
            q = (DemographicQuestion) it.next();
            ret.add(q.clone());
        }
        return ret;
    }


}
