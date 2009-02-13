package com.topcoder.web.winformula.controller.request.algorithm;

import java.rmi.RemoteException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import javax.ejb.CreateException;
import javax.naming.NamingException;

import com.topcoder.server.ejb.TestServices.LongContestServicesException;
import com.topcoder.server.ejb.TestServices.LongContestServicesLocator;
import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;
import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer.ResultSetRow;
import com.topcoder.shared.i18n.MessageProvider;
import com.topcoder.shared.language.BaseLanguage;
import com.topcoder.shared.language.JavaLanguage;
import com.topcoder.shared.language.Language;
import com.topcoder.shared.messaging.messages.LongCompileRequest;
import com.topcoder.shared.messaging.messages.LongCompileResponse;
import com.topcoder.shared.problem.DataType;
import com.topcoder.shared.problem.ProblemComponent;
import com.topcoder.web.codinginterface.ServerBusyException;
import com.topcoder.web.common.NavigationException;
import com.topcoder.web.common.TCRequest;
import com.topcoder.web.common.TCWebException;
import com.topcoder.web.common.render.DataTypeRenderer;
import com.topcoder.web.winformula.algorithm.CodingConstants;
import com.topcoder.web.winformula.algorithm.services.LastCompilationInfo;
import com.topcoder.web.winformula.controller.request.AlgorithmBase;

/**
 * Allows a coder to submit code for a round.
 *
 * @author farsight
 * @version 1.0
 */
public class Submit extends AlgorithmBase {

    private static final String ACTION_SHOW_ERROR = "error";
    private static final String ACTION_SAVE = "save";
    private static final String ACTION_SUBMIT = "submit";
    
    private static final String NEAR_END =
            "Note: There are less than " + CodingConstants.SUBMISSION_RATE / 60 + " hours remaining in this mini-season.  " +
                    "If you make\na submission at any point between now and the end of the it\nyou will " +
                    "not be able to make any further subimssions for\nthe duration of the mini-season.";

    protected void longContestProcessing() throws TCWebException {
        TCRequest request = getRequest();
        try {
            // Get the user's id on which we will operate
            int coderId = getUserID();
            int contestId = getContestID();
            int componentId = getComponentID();

            if (!isUserRegisteredInContest(getContestID(), coderId)) {
                registrationNeeded("You need to be registered in order to make a submission.");
                return;
            }
            
            // Get the query parameters
            String action = request.getParameter(CodingConstants.ACTION_KEY);
            String code;
            Integer languageID = null;
            String message = null;
            if (ACTION_SHOW_ERROR.equals(action)) {
                code = (String) getRequest().getSession().getAttribute(CodingConstants.CODE);
                languageID = ((Integer) getRequest().getSession().getAttribute(CodingConstants.LANGUAGE_ID));
                message = (String) request.getSession().getAttribute(CodingConstants.MESSAGE);
            } else {
                code = getRequest().getParameter(CodingConstants.CODE);
                String languageStr = getRequest().getParameter(CodingConstants.LANGUAGE_ID);
                if (languageStr != null) {
                    languageID = new Integer(Integer.parseInt(languageStr));
                }
            }
            getRequest().getSession().removeAttribute(CodingConstants.CODE);
            getRequest().getSession().removeAttribute(CodingConstants.LANGUAGE_ID);
            getRequest().getSession().removeAttribute(CodingConstants.MESSAGE);
            
            generateRounds();
            int roundId = verifySeasonStatus(request, coderId);
            List allowedLanguages = getLanguages(roundId);
            
            if (ACTION_SUBMIT.equals(action) || ACTION_SAVE.equals(action)) {
                //We have a submission
                int language = languageID.intValue();
                if (!checkLanguages(language, allowedLanguages)) {
                    forwardToSelf("Please select a valid language.", language, code, contestId, roundId, componentId, coderId);
                    return;
                }
                if (code == null || code.trim().length() == 0) {
                    forwardToSelf("Please include some code.", language, code, contestId, roundId, componentId, coderId);
                    return;
                }
                if (ACTION_SAVE.equals(action)) {
                    try {
                        saveCode(code, language, coderId, contestId, roundId, componentId);
                        // save complete
                        // go back to coding!
                        log.debug("set message in request to successful save");
                        forwardToSelf("Your code has been saved.", language, code, contestId, roundId, componentId, coderId);
                        return;
                    } catch (LongContestServicesException e) {
                        forwardToSelf("Save failed: "+MessageProvider.getText(e.getLocalizableMessage()), language, code, contestId, roundId, componentId, coderId);
                    } catch (Exception e) {
                        log.error("Could not save the code:", e);
                        throw new NavigationException("Your code cannot be saved at this time.");
                    }
                } else {
                    LongCompileRequest lcr = new LongCompileRequest(coderId, componentId, roundId, contestId,
                            language, com.topcoder.shared.util.ApplicationServer.WEB_SERVER_ID, code, false);
                    try {
                        lock();
                        LongCompileResponse res = null;
                        try {
                            //Tell the user that the code is compiling...
                            showProcessingPage();
                            res = LongContestServicesLocator.getService().submit(lcr);
                        } finally {
                            unlock();
                        }
                        if (res.getCompileStatus()) {
                            closeProcessingPage(buildProcessorRequestString("SubmitSuccess"));
                        } else {
                            reportError(request, contestId, roundId, componentId, res.getCompileError(), code, language);
                        }
                    } catch (LongContestServicesException e) {
                        reportError(request, contestId, roundId, componentId, "Submit failed: "+MessageProvider.getText(e.getLocalizableMessage()), code, language);
                    } catch (ServerBusyException sbe) {
                        throw new NavigationException("A submit request is already being processed.");
                    }                    
                }
            } else if (ACTION_SHOW_ERROR.equals(action)) {
                forwardToSelf(message, languageID.intValue(), code, contestId, roundId, componentId, coderId);
            } else {
                int language = JavaLanguage.ID; 
                
                LastCompilationInfo info = getService().getLastCompilation(contestId, coderId);
                if (info != null) {
                    language = info.getLanguageId();
                    code = info.getCode();
                } else {
                    //load up their default language
                    Integer lang = getService().getLanguageIdForCoder(coderId);
                    if (lang != null) {
                        language = lang.intValue();
                    }
                    code = "";
                }
                forwardToSelf(null, language, code, contestId, roundId, componentId, coderId);
            }
        } catch (TCWebException e) {
            log.error("Unexpected error in code submit module.", e);
            throw e;
        } catch (Exception e) {
            log.error("Unexpected error in code submit module.", e);
            throw new TCWebException("An error occurred while compiling your code", e);
        }
    }

    private void forwardToSelf(String message, int language, String code, int contestId, int roundId, int componentId,
            int coderId) throws Exception {

        if (language == 0) {
            language = JavaLanguage.ID;
        }
        resolveProblem(roundId, componentId, coderId, language);
        getRequest().setAttribute(CodingConstants.MESSAGE, resolveMessage(message));
        getRequest().setAttribute(CodingConstants.CODE, code);
        getRequest().setAttribute(CodingConstants.LANGUAGE_ID, new Integer(language));
        setNextPage(CodingConstants.PAGE_SUBMIT);
        setIsNextPageInContext(true);
    }

    private int verifySeasonStatus(TCRequest request, int coderId) throws NavigationException, Exception,
            LongContestServicesException, RemoteException, NamingException, CreateException {
        
        ResultSetContainer.ResultSetRow round = (ResultSetRow) request.getAttribute("currentRound");
        if (round == null){
            round = (ResultSetRow) request.getAttribute("nextRound");
            if (round == null) {
                throw new NavigationException("Submission period is finished.");
            }
            throw new NavigationException("The submission period for "+round.getStringItem("name")+" has not started.");
        }
            
        int roundId = round.getIntItem("round_id");
        // If the user is not registered s/he cannot submit code, unless this is a practice round.
        if (!isUserRegistered(coderId, roundId)) {
            log.info("Autoregistering user Id: "+coderId+" in roundId: "+roundId);
            LongContestServicesLocator.getService().register((int) roundId, (int) coderId, new ArrayList());
        }
        return roundId;
    }
    
    private void resolveProblem(int roundId, int componentId, int coderId, int language) throws RemoteException, LongContestServicesException, NamingException, CreateException {
        if (getRequest().getAttribute(CodingConstants.CLASS_NAME) == null) {
            ProblemComponent pc = LongContestServicesLocator.getService().getProblemComponent(roundId, componentId, coderId);
            // The class name for this problem
            String className = pc.getClassName();
            int methodCount = pc.getAllMethodNames().length;
            ArrayList methodNames = new ArrayList(methodCount);
            ArrayList returnTypes = new ArrayList(methodCount);
            ArrayList paramTypes = new ArrayList(methodCount);
            log.debug("there are " + methodCount + " methods in this problem");
            for (int i = (methodCount > 1 ? 1 : 0); i < methodCount; i++) {
                methodNames.add(pc.getAllMethodNames()[i]);
                log.debug("adding return type : " + pc.getAllReturnTypes()[i].getDescriptor(language));
                returnTypes.add(pc.getAllReturnTypes()[i].getDescriptor(language));
                DataType args[] = pc.getAllParamTypes()[i];
                StringBuffer argTypes = new StringBuffer();
                for (int j = 0; j < args.length; j++) {
                    if (j > 0) {
                        argTypes.append(", ");
                    }
                    argTypes.append(new DataTypeRenderer(args[j]).toPlainText(BaseLanguage.getLanguage(language > 0 ? language : JavaLanguage.ID)));
                }
                paramTypes.add(argTypes.toString());
    
            }
            log.debug("there are " + returnTypes.size() + " return types in this problem");
            // Put these objects into request scope
            getRequest().setAttribute(CodingConstants.CLASS_NAME, className);
            getRequest().setAttribute(CodingConstants.METHOD_NAME, methodNames);
            getRequest().setAttribute(CodingConstants.RETURN_TYPE, returnTypes);
            getRequest().setAttribute(CodingConstants.ARG_TYPES, paramTypes);
        }
    }
        
    private boolean checkLanguages(int language, List allowedLanguages) {
        Language lang = null;
        try {
            lang = BaseLanguage.getLanguage(language);
        } catch (Exception e) {
        }
        // Language specified?
        return lang != null && allowedLanguages.contains(lang);
    }
    
    public String resolveMessage(String message) throws Exception {
        if (isNearEnd()) {
            return (message != null ? message + "\n\n" : "") + NEAR_END;
        } else {
            return message;
        }
    }

    private void reportError(TCRequest request, long cd, long rid, long cid, String message, String code, int language) throws Exception {
        request.getSession().setAttribute(CodingConstants.MESSAGE, message);
        request.getSession().setAttribute(CodingConstants.CODE, code);
        request.getSession().setAttribute(CodingConstants.LANGUAGE_ID, new Integer(language));
        // Go back to coding.
        closeProcessingPage(buildProcessorRequestString("Submit", new String[] {"action"}, new String[] {ACTION_SHOW_ERROR}));
    }

    private boolean isNearEnd() throws Exception {
        ResultSetContainer.ResultSetRow currentRound = (ResultSetRow) getRequest().getAttribute("currentRound");
        if (currentRound != null) {
            long end = currentRound.getTimestampItem("end_time").getTime();
            long curr = System.currentTimeMillis();
            long diff = CodingConstants.SUBMISSION_RATE * 60 * 1000;
            log.debug("end: " + end + " curr: " + curr + " diff: " + diff);
            return (end - curr) < diff;
        }
        return false;
    }

    // Save the user's code into the database
    private void saveCode(String code, int lang, long uid, long cd, long rid, long cid) throws Exception {
        log.debug("saveCode called... lang=" + lang + " uid=" + uid + " cd=" + cd + " rid=" + rid + " cid=" + cid);

        // Find the TestServices bean so we could save the code.
        LongContestServicesLocator.getService().save((int) cd, (int) rid, (int) cid, (int) uid, code, (int) lang);
    }

    // Checks to see if the user is registered for this round contest.
    protected boolean isUserRegistered(int userID, int roundID) throws Exception {
        return getService().isUserRegisteredInRound(roundID, userID);
    }

    protected List getLanguages(long roundId) throws LongContestServicesException, RemoteException, NamingException, CreateException {
        List<Language> list = (List<Language>) getRequest().getAttribute(CodingConstants.LANGUAGES);
        if (list == null) {
            list = Arrays.asList(LongContestServicesLocator.getService().getAllowedLanguagesForRound((int) roundId));
            getRequest().setAttribute(CodingConstants.LANGUAGES, list);
        }
        return list;
    }
}