package com.topcoder.web.admin.task;

import com.topcoder.common.web.data.Navigation;
import com.topcoder.common.web.data.Round;
import com.topcoder.common.web.error.NavigationException;
import com.topcoder.common.web.util.Conversion;
import com.topcoder.common.web.xml.HTMLRenderer;
import com.topcoder.ejb.ContestAdminServices.ContestAdminServices;
import com.topcoder.ejb.ContestAdminServices.ContestAdminServicesHome;
import com.topcoder.shared.docGen.xml.RecordTag;
import com.topcoder.shared.docGen.xml.ValueTag;
import com.topcoder.shared.docGen.xml.XMLDocument;
import com.topcoder.shared.util.ApplicationServer;
import com.topcoder.shared.util.TCContext;
import com.topcoder.shared.util.logging.Logger;
import com.topcoder.web.admin.XSLConstants;
import com.topcoder.web.common.BaseProcessor;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.HashMap;

public final class Compilation {


    private static final String DIR = XSLConstants.DIR + "compilation/";
    private static Logger log = Logger.getLogger(Compilation.class);

    public static String process(HttpServletRequest request, HttpServletResponse response,
                                 HTMLRenderer renderer, Navigation nav, XMLDocument document)
            throws NavigationException {

        String result = null;
        RecordTag compilationTag = new RecordTag("COMPILATION");
        HashMap sessionObjects = nav.getSessionObjects();

        try {
            String command = Conversion.checkNull(request.getParameter("Command"));
            if (command.equals("get_rounds")) {
                result = getRounds(renderer, request, document, nav, compilationTag);
            } else if (command.equals("get_coders")) {
                result = getCoders(renderer, request, document, nav, compilationTag);
            } else if (command.equals("get_problems")) {
                result = getCompilations(renderer, request, document, nav, compilationTag);
            }
        } catch (Exception e) {
            e.printStackTrace();
            throw new NavigationException("admin.task.coder.Compilation: ERROR:\n " + e, XSLConstants.NAVIGATION_ERROR_URL);

        }
        return result;
    }

    private static String getRounds(HTMLRenderer HTMLmaker, HttpServletRequest request,
                                    XMLDocument document, Navigation nav, RecordTag compilationTag)
            throws NavigationException {
        String result = null;
        ContestAdminServices contestAdminServicesEJB = null;
        ArrayList rounds = null;

        try {
            InitialContext ctx = TCContext.getInitial();
            try {
                contestAdminServicesEJB = (ContestAdminServices)BaseProcessor.createEJB(ctx, ContestAdminServices.class);
                rounds = contestAdminServicesEJB.getRounds();
            } catch (Exception e) {
                e.printStackTrace();
                throw new NavigationException("DB ERROR", XSLConstants.NAVIGATION_ERROR_URL);
            } finally {
                try {
                    if (ctx != null) ctx.close();
                    ctx = null;
                } catch (Exception ignore) {
                }
                ctx = null;
            }

            for (int i = 0; i < rounds.size(); i++) {
                compilationTag.addTag(((Round) rounds.get(i)).getXML());
            }

            document.addTag(compilationTag);
            log.debug(document.getXML(2));
            String xsldocURLString = DIR + "get_rounds.xsl";
            result = HTMLmaker.render(document, xsldocURLString);
        } catch (NavigationException ne) {
            throw ne;
        } catch (Exception e) {
            throw new NavigationException("admin.task.coder.Compilation.getRounds: ERROR:\n " + e,
                    XSLConstants.NAVIGATION_ERROR_URL);

        }
        return result;
    }

    private static String getCoders(HTMLRenderer HTMLmaker, HttpServletRequest request,
                                    XMLDocument document, Navigation nav, RecordTag compilationTag)
            throws NavigationException {
        String result = null;
        ContestAdminServices contestAdminServicesEJB = null;
        ArrayList coders = null;

        try {
            InitialContext ctx = TCContext.getInitial();
            try {
                contestAdminServicesEJB = (ContestAdminServices)BaseProcessor.createEJB(ctx, ContestAdminServices.class);
                coders = contestAdminServicesEJB.getCodersByRound(Integer.parseInt(request.getParameter("RoundId")));
            } catch (Exception e) {
                e.printStackTrace();
                throw new NavigationException("DB ERROR", XSLConstants.NAVIGATION_ERROR_URL);
            } finally {
                try {
                    if (ctx != null) ctx.close();
                    ctx = null;
                } catch (Exception ignore) {
                }
                ctx = null;
            }

            compilationTag.addTag(new ValueTag("RoundId", request.getParameter("RoundId")));
            for (int i = 0; i < coders.size(); i++) {
                compilationTag.addTag(((com.topcoder.common.web.data.admin.Coder) coders.get(i)).getXML());

            }

            document.addTag(compilationTag);
            log.debug(document.getXML(2));
            String xsldocURLString = DIR + "get_coders.xsl";
            result = HTMLmaker.render(document, xsldocURLString);
        } catch (NavigationException ne) {
            throw ne;
        } catch (Exception e) {
            throw new NavigationException("admin.task.coder.Compilation.getCoders: ERROR:\n " + e,
                    XSLConstants.NAVIGATION_ERROR_URL);

        }
        return result;
    }


    private static String getCompilations(HTMLRenderer HTMLmaker, HttpServletRequest request,
                                          XMLDocument document, Navigation nav, RecordTag compilationTag)
            throws NavigationException {
        String result = null;
        ContestAdminServices contestAdminServicesEJB = null;
        ArrayList compilations = null;

        try {
            InitialContext ctx = TCContext.getInitial();
            try {
                contestAdminServicesEJB = (ContestAdminServices)BaseProcessor.createEJB(ctx, ContestAdminServices.class);
                compilations = contestAdminServicesEJB.getCoderCompilations(Integer.parseInt(request.getParameter("RoundId")), Integer.parseInt(request.getParameter("CoderId")));
            } catch (Exception e) {
                e.printStackTrace();
                throw new NavigationException("DB ERROR", XSLConstants.NAVIGATION_ERROR_URL);
            } finally {
                try {
                    if (ctx != null) ctx.close();
                    ctx = null;
                } catch (Exception ignore) {
                }
                ctx = null;
            }
            String temp = request.getParameter("ProblemId");
            if (temp != null) compilationTag.addTag(new ValueTag("ProblemId", temp));
            compilationTag.addTag(new ValueTag("RoundId", request.getParameter("RoundId")));
            for (int i = 0; i < compilations.size(); i++) {
                compilationTag.addTag(((com.topcoder.common.web.data.admin.Compilation) compilations.get(i)).getXML());
            }

            document.addTag(compilationTag);
            log.debug(document.getXML(2));
            String xsldocURLString = DIR + "get_compilations.xsl";
            result = HTMLmaker.render(document, xsldocURLString);
        } catch (NavigationException ne) {
            throw ne;
        } catch (Exception e) {
            throw new NavigationException("admin.task.coder.Compilation.getCompilations : ERROR:\n " + e,
                    XSLConstants.NAVIGATION_ERROR_URL);

        }
        return result;
    }


}
