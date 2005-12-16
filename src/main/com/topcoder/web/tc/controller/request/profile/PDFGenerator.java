/*
 * PDFGenerator.java
 *
 * Created on January 3, 2005, 1:27 PM
 */

package com.topcoder.web.tc.controller.request.profile;

import com.lowagie.text.*;
import com.lowagie.text.Element;
import com.lowagie.text.Font;
import com.lowagie.text.Image;
import com.lowagie.text.Rectangle;
import com.lowagie.text.pdf.*;
import com.topcoder.shared.dataAccess.DataAccess;
import com.topcoder.shared.dataAccess.DataAccessInt;
import com.topcoder.shared.dataAccess.Request;
import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;
import com.topcoder.shared.language.CPPLanguage;
import com.topcoder.shared.language.CSharpLanguage;
import com.topcoder.shared.language.JavaLanguage;
import com.topcoder.shared.language.VBLanguage;
import com.topcoder.shared.problem.*;
import com.topcoder.shared.problemParser.ProblemComponentFactory;
import com.topcoder.shared.security.ClassResource;
import com.topcoder.shared.util.ApplicationServer;
import com.topcoder.shared.util.DBMS;
import com.topcoder.shared.util.TCContext;
import com.topcoder.web.common.*;
import com.topcoder.web.common.render.DataTypeRenderer;
import com.topcoder.web.common.render.NodeElementRenderer;
import com.topcoder.web.common.render.UserConstraintRenderer;
import com.topcoder.web.ejb.coderskill.CoderSkill;
import com.topcoder.web.ejb.fileconversion.FileConversion;
import com.topcoder.web.ejb.resume.ResumeServices;
import com.topcoder.web.ejb.user.User;
import com.topcoder.web.tc.model.PlacementConfig;
import com.topcoder.web.tc.model.Skill;

import javax.naming.InitialContext;
import java.awt.*;
import java.text.DecimalFormat;
import java.util.Arrays;
import java.util.Collections;
import java.util.StringTokenizer;

/**
 *
 * @author rfairfax
 */
public class PDFGenerator extends BaseProcessor {

    PlacementConfig info;
    private boolean inResume = false;

    private PlacementConfig getConfig() throws Exception {
        int uid = Integer.parseInt(StringUtils.checkNull(getRequest().getParameter("uid")));

        PlacementConfig config = new PlacementConfig();

        config.setUserID(uid);

        InitialContext ctx = getInitialContext();
        User userbean = (User)createEJB(ctx, User.class);

        config.setHandle(userbean.getHandle(uid, DBMS.COMMON_OLTP_DATASOURCE_NAME));
        config.setName(userbean.getFirstName(uid, DBMS.COMMON_OLTP_DATASOURCE_NAME) + " " + userbean.getLastName(uid, DBMS.COMMON_OLTP_DATASOURCE_NAME));

        config.setPresentedBy(StringUtils.checkNull(getRequest().getParameter("presentedBy")));
        config.setPresentedByEmail(StringUtils.checkNull(getRequest().getParameter("presentedByEmail")));

        if(getRequest() instanceof MultipartRequest) {
            MultipartRequest request = (MultipartRequest)getRequest();
            config.setCompanyLogo(request.getUploadedFile("logo"));
        }

        //load skills
        CoderSkill skillbean = (CoderSkill)createEJB(ctx, CoderSkill.class);

        Request r = new Request();
        r.setContentHandle("skill_types");

        ResultSetContainer rsc = (ResultSetContainer)getDataAccess().getData(r).get("skill_types");
        for(int i = 0; i < rsc.size(); i++) {
            ResultSetContainer rscSkills = skillbean.getSkillsByType(config.getUserID(), rsc.getIntItem(i, "skill_type_id"),DBMS.OLTP_DATASOURCE_NAME);
            for(int j = 0; j < rscSkills.size(); j++) {
                int sid = rscSkills.getIntItem(j, "skill_id");

                if(Arrays.asList(getRequest().getParameterValues("skills")).contains(String.valueOf(sid))) {
                    Skill s = new Skill();
                    s.setID(sid);
                    s.setText(rscSkills.getStringItem(j, "skill_desc"));

                    config.createSkill(rsc.getStringItem(i, "skill_type_desc"), s, rscSkills.getIntItem(j, "ranking"));
                }
            }
        }

        //load competition stats
        r = new Request();
        r.setContentHandle("placement_profile_stats");
        r.setProperty("cr", String.valueOf(uid));

        DecimalFormat formater = new DecimalFormat("#.##");

        rsc = (ResultSetContainer)getDWDataAccess().getData(r).get("placement_profile_stats");

        config.setNumContests(rsc.getStringItem(0, "num_ratings"));
        config.setRating(rsc.getIntItem(0, "rating"));
        config.setRank(rsc.getStringItem(0, "rank") + " out of " + rsc.getStringItem(0, "lowest_rank"));
        config.setRankPercentile(formater.format(rsc.getDoubleItem(0, "percentile")) + "%" );

        config.setTotalChallenged(rsc.getStringItem(0, "challenge_attempts_made"));

        if(rsc.getIntItem(0, "challenge_attempts_made") == 0) {
            config.setChallengeSuccessRatio("N/A");
        } else {
            config.setChallengeSuccessRatio(formater.format(rsc.getDoubleItem(0, "challenges_made_successful")/rsc.getDoubleItem(0, "challenge_attempts_made")*100.0) + "%" );
        }

        config.setSubmissionRatio(rsc.getStringItem(0, "problems_submitted") + " out of " + rsc.getStringItem(0, "problems_presented") + " (" + formater.format(rsc.getDoubleItem(0, "problems_submitted")/rsc.getDoubleItem(0, "problems_presented")*100.0) + "%)" );
        config.setSubmissionSuccessRatio(rsc.getStringItem(0, "problems_correct") + " out of " + rsc.getStringItem(0, "problems_submitted") + " (" + formater.format(rsc.getDoubleItem(0, "problems_correct")/rsc.getDoubleItem(0, "problems_submitted")*100.0) + "%)" );

        //load problem stats
        int cid = Integer.parseInt(StringUtils.checkNull(getRequest().getParameter("component")));

        //load solution?
        r = new Request();
        r.setContentHandle("placement_problem_details");
        r.setProperty("cr", String.valueOf(uid));
        r.setProperty("pm", String.valueOf(cid));

        rsc = (ResultSetContainer)getDWDataAccess().getData(r).get("placement_problem_details");
        config.setProblemName(rsc.getStringItem(0, "desc"));
        config.setAvgTimeToSubmit(formatTime(rsc.getIntItem(0, "avg_time")));
        config.setSubmissionPercent(formater.format(rsc.getDoubleItem(0, "problems_submitted")/rsc.getDoubleItem(0, "coder_count")*100.0) + "%");
        config.setSuccessfulSubmissionPercent(formater.format(rsc.getDoubleItem(0, "problems_correct")*100.0) + "%");
        config.setSubmissionTime(formatTime(rsc.getIntItem(0, "time_elapsed")));
        config.setSubmissionText(rsc.getStringItem(0, "submission_text"));

        ProblemComponent[] arrProblemComponent = new ProblemComponent[1];
        arrProblemComponent[0] = new ProblemComponentFactory().build(rsc.getStringItem(0, "problem_text"), true);
        Problem problem = new Problem();
        problem.setProblemComponents(arrProblemComponent);

        config.setProblem(problem);

        if(rsc.getIntItem(0, "language_id") == 1) {
            config.setLanguage(JavaLanguage.JAVA_LANGUAGE);
        } else if(rsc.getIntItem(0, "language_id") == 3) {
            config.setLanguage(CPPLanguage.CPP_LANGUAGE);
        } else if(rsc.getIntItem(0, "language_id") == 4) {
            config.setLanguage(CSharpLanguage.CSHARP_LANGUAGE);
        } else if(rsc.getIntItem(0, "language_id") == 5) {
            config.setLanguage(VBLanguage.VB_LANGUAGE);
        }

        return config;
    }

    private String formatTime(int t) {
        String ret = "";

        t /= 1000;

        int secs = t % 60;
        t -= secs;
        t /= 60;

        ret = ":" + (secs < 10 ? "0" : "") + secs + ret;

        int mins = t % 60;
        t -= mins;
        t /= 60;

        if(t > 0) {
            ret = t + ":" + (mins < 10 ? "0" : "") + mins + ret;
        } else {
            ret = mins + ret;
        }

        return ret;
    }

    protected static DataAccessInt getDWDataAccess() throws Exception {
       DataAccessInt dAccess = null;
       dAccess = new DataAccess(DBMS.DW_DATASOURCE_NAME);
       return dAccess;
    }

    protected static DataAccessInt getDataAccess() throws Exception {
       DataAccessInt dAccess = null;
       dAccess = new DataAccess(DBMS.OLTP_DATASOURCE_NAME);
       return dAccess;
    }

    protected void businessProcessing() throws TCWebException {
        if (!((SessionInfo)getRequest().getAttribute(BaseServlet.SESSION_INFO_KEY)).isAdmin())
            throw new PermissionException(getUser(), new ClassResource(this.getClass()));

        try {
            //load config values
            info = getConfig();

            //create document
            Document doc = new Document(PageSize.A4, 35,35,35,35);

            getResponse().setContentType("application/pdf");
            getResponse().addHeader("content-disposition", "inline; filename=" + info.getHandle() + ".pdf");

            PdfWriter writer = PdfWriter.getInstance(doc,  getResponse().getOutputStream());

            //atach events class
            MyPageEvents events = new MyPageEvents();
            writer.setPageEvent(events);

            Phrase hp = new Phrase("-", FontFactory.getFont(FontFactory.HELVETICA, 14, Font.NORMAL, Color.black));

            HeaderFooter header = new HeaderFooter(new Phrase("  "), false);
            header.setBackgroundColor(new Color(0,51,102)); //#cc0000
            header.setBorder(Rectangle.NO_BORDER);

            HeaderFooter footer = new HeaderFooter(new Phrase("  "), false);
            footer.setAlignment(Element.ALIGN_RIGHT);
            footer.setBorder(Rectangle.NO_BORDER);
            footer.setBackgroundColor(new Color(0,0,0)); //#cccccc
            doc.setHeader(header);
            doc.setFooter(footer);

            doc.open();

            drawPageOne(doc, info);
            drawPageTwo(doc, info);
            drawPageThree(doc, info);
            drawPageFour(doc, info);

            drawResume(doc, info, writer);

            doc.close();

            //write out the document
            getResponse().getOutputStream().flush();
            getResponse().getOutputStream().close();

            getResponse().flushBuffer();

            log.debug("DONE PDFING");
        } catch (Exception e) {
            throw new TCWebException(e);
        }
    }

    private void drawPageOne(Document doc, PlacementConfig info) throws Exception {
        Image logo = Image.getInstance("http://" + ApplicationServer.SERVER_NAME + "/i/profiles/topcoder_logo_tagline.jpg");
        logo.setAlignment(Element.ALIGN_CENTER);
        logo.scalePercent(60f);
        Paragraph p = new Paragraph(" ");
        doc.add(logo);
        doc.add(p);
        doc.add(p);

        //draw out table
        PdfPTable t = new PdfPTable(2);
        t.setWidthPercentage(90);
        t.setWidths(new int[] {35, 65});

        t.getDefaultCell().setPadding(3);
        t.getDefaultCell().setBorderWidth(0);
        t.getDefaultCell().setHorizontalAlignment(Element.ALIGN_LEFT);
        t.addCell(new Phrase("Presented to:", FontFactory.getFont(FontFactory.HELVETICA, 14, Font.NORMAL, Color.black)));

        if(info.getCompanyLogo() != null) {
            byte[] b = new byte[(int)info.getCompanyLogo().getSize()];
            info.getCompanyLogo().getInputStream().read(b);
            Image companyLogo = Image.getInstance(b);
            float scale = 150.0f / companyLogo.plainWidth();
            companyLogo.scaleAbsoluteWidth(150);
            companyLogo.scaleAbsoluteHeight(companyLogo.plainHeight() * scale);

            PdfPCell cell = new PdfPCell(companyLogo, false);
            cell.setBorder(0);

            t.addCell(cell);
        } else {
            t.addCell(new Phrase(" ", FontFactory.getFont(FontFactory.HELVETICA, 14, Font.NORMAL, Color.black)));
        }

        t.addCell(new Phrase(" ", FontFactory.getFont(FontFactory.HELVETICA, 14, Font.NORMAL, Color.black)));
        t.addCell(new Phrase(" ", FontFactory.getFont(FontFactory.HELVETICA, 14, Font.NORMAL, Color.black)));

        t.addCell(new Phrase("Presented By:", FontFactory.getFont(FontFactory.HELVETICA, 14, Font.NORMAL, Color.black)));

        Phrase email = new Phrase();
        email.add(new Chunk(info.getPresentedBy(), FontFactory.getFont(FontFactory.HELVETICA, 14, Font.BOLD, Color.black)));
        t.addCell(email);

        t.addCell(new Phrase(" ", FontFactory.getFont(FontFactory.HELVETICA, 14, Font.NORMAL, Color.black)));

        email = new Phrase();

        Anchor anchor = new Anchor(info.getPresentedByEmail(), FontFactory.getFont(FontFactory.HELVETICA, 12, Font.UNDERLINE, new Color(0, 0, 255)));
        anchor.setReference("mailto:" + info.getPresentedByEmail());
        anchor.setName(info.getPresentedByEmail());

        email.add(anchor);
        t.addCell(email);


        t.addCell(new Phrase(" ", FontFactory.getFont(FontFactory.HELVETICA, 14, Font.NORMAL, Color.black)));
        t.addCell(new Phrase(" ", FontFactory.getFont(FontFactory.HELVETICA, 14, Font.NORMAL, Color.black)));

        //removed 4-21 per request
        //t.addCell(new Phrase("Member Name:", FontFactory.getFont(FontFactory.HELVETICA, 14, Font.NORMAL, Color.black)));
        //t.addCell(new Phrase(info.getName(), FontFactory.getFont(FontFactory.HELVETICA, 14, Font.BOLD, Color.black)));

        t.addCell(new Phrase("Handle:", FontFactory.getFont(FontFactory.HELVETICA, 14, Font.NORMAL, Color.black)));
        t.addCell(new Phrase("[" + info.getHandle() + "]", FontFactory.getFont(FontFactory.HELVETICA, 14, Font.BOLD, Color.black)));

        doc.add(t);

        doc.newPage();
    }

    private void drawPageTwo(Document doc, PlacementConfig info) throws Exception {
        Paragraph p = new Paragraph(" ");

        doc.add(p);

        PdfPTable t = new PdfPTable(2);
        t.setWidthPercentage(100);
        t.setWidths(new int[] {35, 65});

        t.getDefaultCell().setPadding(3);
        t.getDefaultCell().setBorderWidth(0);
        t.getDefaultCell().setHorizontalAlignment(Element.ALIGN_LEFT);
        t.getDefaultCell().setVerticalAlignment(Element.ALIGN_TOP);

        PdfPTable skills = new PdfPTable(1);
        skills.setWidthPercentage(100);
        skills.getDefaultCell().setPadding(2);
        skills.getDefaultCell().setBorderWidth(0);
        skills.getDefaultCell().setHorizontalAlignment(Element.ALIGN_CENTER);

        skills.addCell(new Phrase("Skills", FontFactory.getFont(FontFactory.HELVETICA, 14, Font.BOLD, Color.black)));

        java.util.List groups = info.getSkillGroups();

        for(int i = 0; i < groups.size(); i++) {
            PdfPTable inner = new PdfPTable(1);
            inner.setWidthPercentage(100);
            inner.getDefaultCell().setPadding(2);
            inner.getDefaultCell().setBorderWidth(1);
            inner.getDefaultCell().setHorizontalAlignment(Element.ALIGN_LEFT);

            PdfPCell cell = new PdfPCell(new Phrase((String)groups.get(i), FontFactory.getFont(FontFactory.HELVETICA, 12, Font.BOLD, Color.black)));
            cell.setBackgroundColor(new Color(0xCC,0xCC,0xCC));
            cell.setBorderWidth(1);
            inner.addCell(cell);

            java.util.List skillsList = info.getSkills((String)groups.get(i));

            Collections.sort(skillsList);

            for(int j = 0 ; j < skillsList.size(); j++) {
                inner.addCell(new Phrase(((Skill)skillsList.get(j)).getText(), FontFactory.getFont(FontFactory.HELVETICA, 12, Font.NORMAL, Color.black)));
            }

            skills.addCell(inner);
        }

        skills.addCell(" ");

        t.addCell(skills);

        PdfPTable ranking = new PdfPTable(1);
        ranking.setWidthPercentage(100);
        ranking.getDefaultCell().setPadding(2);
        ranking.getDefaultCell().setBorderWidth(0);
        ranking.getDefaultCell().setHorizontalAlignment(Element.ALIGN_CENTER);

        ranking.addCell(new Phrase("Rating Position Among Members", FontFactory.getFont(FontFactory.HELVETICA, 14, Font.BOLD, Color.black)));

        //coder ranking table
        PdfPTable inner = new PdfPTable(4);
        inner.setWidthPercentage(100);
        inner.getDefaultCell().setPadding(2);
        inner.getDefaultCell().setBorderWidth(1);
        inner.getDefaultCell().setHorizontalAlignment(Element.ALIGN_LEFT);

        PdfPCell cell = new PdfPCell(new Phrase("Coder Ranking (Based on " + info.getNumContests() + " Events)", FontFactory.getFont(FontFactory.HELVETICA, 12, Font.BOLD, Color.black)));
        cell.setBackgroundColor(new Color(0xCC,0xCC,0xCC));
        cell.setHorizontalAlignment(Element.ALIGN_CENTER);
        cell.setBorderWidth(1);
        cell.setColspan(4);

        inner.addCell(cell);

        cell = new PdfPCell(new Phrase("Rating", FontFactory.getFont(FontFactory.HELVETICA, 12, Font.BOLD, Color.black)));
        cell.setHorizontalAlignment(Element.ALIGN_CENTER);
        inner.addCell(cell);

        inner.addCell(new Phrase("" + info.getRating(), FontFactory.getFont(FontFactory.HELVETICA, 12, Font.NORMAL, Color.black)));

        cell = new PdfPCell(new Phrase("Division", FontFactory.getFont(FontFactory.HELVETICA, 12, Font.BOLD, Color.black)));
        cell.setHorizontalAlignment(Element.ALIGN_CENTER);
        cell.setBorderWidth(1);
        inner.addCell(cell);

        inner.addCell(new Phrase(info.getRating() >= 1200 ? "1" : "2", FontFactory.getFont(FontFactory.HELVETICA, 12, Font.NORMAL, Color.black)));

        cell = new PdfPCell(new Phrase("Rank", FontFactory.getFont(FontFactory.HELVETICA, 12, Font.BOLD, Color.black)));
        cell.setHorizontalAlignment(Element.ALIGN_CENTER);
        cell.setBorderWidth(1);
        inner.addCell(cell);

        inner.addCell(new Phrase(info.getRank(), FontFactory.getFont(FontFactory.HELVETICA, 12, Font.NORMAL, Color.black)));

        cell = new PdfPCell(new Phrase("Rank %", FontFactory.getFont(FontFactory.HELVETICA, 12, Font.BOLD, Color.black)));
        cell.setHorizontalAlignment(Element.ALIGN_CENTER);
        cell.setBorderWidth(1);
        inner.addCell(cell);

        inner.addCell(new Phrase("" + info.getRankPercentile(), FontFactory.getFont(FontFactory.HELVETICA, 12, Font.NORMAL, Color.black)));

        ranking.addCell(inner);
        ranking.addCell(" ");

        Image chart = Image.getInstance("http://" + ApplicationServer.SERVER_NAME + "/graph?c=rating_distribution_graph_profile&width=600&height=400&rt=" + info.getRating() + "&hn=" + info.getHandle());
        ranking.addCell(chart);
        //ranking.addCell(new Phrase("* line indicates " + info.getHandle() + "'s rating", FontFactory.getFont(FontFactory.HELVETICA, 12, Font.NORMAL, Color.black)));

        t.addCell(ranking);

        //lifetime stats

        PdfPTable lifetime = new PdfPTable(2);
        lifetime.setWidthPercentage(100);
        lifetime.getDefaultCell().setPadding(2);
        lifetime.getDefaultCell().setBorderWidth(0);
        lifetime.getDefaultCell().setHorizontalAlignment(Element.ALIGN_CENTER);

        cell = new PdfPCell(new Phrase("Lifetime Competition Statistics", FontFactory.getFont(FontFactory.HELVETICA, 14, Font.BOLD, Color.black)));
        cell.setColspan(2);
        cell.setBorderWidth(0);
        lifetime.addCell(cell);

        PdfPTable competitors = new PdfPTable(2);
        competitors.setWidthPercentage(100);
        competitors.getDefaultCell().setPadding(2);
        competitors.getDefaultCell().setBorderWidth(1);
        competitors.getDefaultCell().setHorizontalAlignment(Element.ALIGN_LEFT);

        cell = new PdfPCell(new Phrase("Challenges Against Competitors", FontFactory.getFont(FontFactory.HELVETICA, 12, Font.BOLD, Color.black)));
        cell.setBackgroundColor(new Color(0xCC,0xCC,0xCC));
        cell.setHorizontalAlignment(Element.ALIGN_CENTER);
        cell.setBorderWidth(1);
        cell.setColspan(2);

        competitors.addCell(cell);

        cell = new PdfPCell(new Phrase("Total Challenged", FontFactory.getFont(FontFactory.HELVETICA, 12, Font.BOLD, Color.black)));
        cell.setBorderWidth(1);
        competitors.addCell(cell);

        competitors.addCell(new Phrase(info.getTotalChallenged(), FontFactory.getFont(FontFactory.HELVETICA, 12, Font.NORMAL, Color.black)));

        cell = new PdfPCell(new Phrase("Challenge Success Ratio", FontFactory.getFont(FontFactory.HELVETICA, 12, Font.BOLD, Color.black)));
        cell.setBorderWidth(1);
        competitors.addCell(cell);

        competitors.addCell(new Phrase(info.getChallengeSuccessRatio(), FontFactory.getFont(FontFactory.HELVETICA, 12, Font.NORMAL, Color.black)));

        lifetime.addCell(competitors);

        PdfPTable solutions = new PdfPTable(2);
        solutions.setWidthPercentage(100);
        solutions.getDefaultCell().setPadding(2);
        solutions.getDefaultCell().setBorderWidth(1);
        solutions.getDefaultCell().setHorizontalAlignment(Element.ALIGN_LEFT);

        cell = new PdfPCell(new Phrase("Solutions Submitted", FontFactory.getFont(FontFactory.HELVETICA, 12, Font.BOLD, Color.black)));
        cell.setBackgroundColor(new Color(0xCC,0xCC,0xCC));
        cell.setHorizontalAlignment(Element.ALIGN_CENTER);
        cell.setBorderWidth(1);
        cell.setColspan(2);

        solutions.addCell(cell);

        cell = new PdfPCell(new Phrase("Submission Ratio", FontFactory.getFont(FontFactory.HELVETICA, 12, Font.BOLD, Color.black)));
        cell.setBorderWidth(1);
        solutions.addCell(cell);

        solutions.addCell(new Phrase(info.getSubmissionRatio(), FontFactory.getFont(FontFactory.HELVETICA, 12, Font.NORMAL, Color.black)));

        cell = new PdfPCell(new Phrase("Submission Success Ratio", FontFactory.getFont(FontFactory.HELVETICA, 12, Font.BOLD, Color.black)));
        cell.setBorderWidth(1);
        solutions.addCell(cell);

        solutions.addCell(new Phrase(info.getSubmissionSuccessRatio(), FontFactory.getFont(FontFactory.HELVETICA, 12, Font.NORMAL, Color.black)));

        lifetime.addCell(solutions);

        cell = new PdfPCell(lifetime);
        cell.setColspan(2);
        cell.setBorderWidth(0);
        t.addCell(cell);

        doc.add(t);

        doc.newPage();
    }

    public void drawPageThree(Document doc, PlacementConfig info) throws Exception {
        //selected problem
        Paragraph p = new Paragraph(" ");

        PdfPTable problemStats = new PdfPTable(3);
        problemStats.setWidthPercentage(100);
        problemStats.getDefaultCell().setPadding(2);
        problemStats.getDefaultCell().setBorderWidth(1);
        problemStats.getDefaultCell().setHorizontalAlignment(Element.ALIGN_LEFT);

        PdfPCell cell = new PdfPCell(new Phrase("Code Sample For:", FontFactory.getFont(FontFactory.HELVETICA, 14, Font.BOLD, Color.black)));
        cell.setBorderWidth(1);
        problemStats.addCell(cell);

        cell = new PdfPCell(new Phrase(info.getProblemName(), FontFactory.getFont(FontFactory.HELVETICA, 14, Font.BOLD, Color.black)));
        cell.setBorderWidth(1);
        cell.setColspan(2);
        problemStats.addCell(cell);

        cell = new PdfPCell(new Phrase("Division Statistics", FontFactory.getFont(FontFactory.HELVETICA, 12, Font.BOLD, Color.black)));
        cell.setBorderWidth(1);
        cell.setColspan(2);
        cell.setHorizontalAlignment(Element.ALIGN_CENTER);
        cell.setBackgroundColor(new Color(0xCC,0xCC,0xCC));
        problemStats.addCell(cell);

        cell = new PdfPCell(new Phrase("[" + info.getHandle() + "]'s Statistics", FontFactory.getFont(FontFactory.HELVETICA, 12, Font.BOLD, Color.black)));
        cell.setBorderWidth(1);
        cell.setHorizontalAlignment(Element.ALIGN_CENTER);
        cell.setBackgroundColor(new Color(0xCC,0xCC,0xCC));
        problemStats.addCell(cell);

        problemStats.addCell(new Phrase("Average Elapsed Time to Submit", FontFactory.getFont(FontFactory.HELVETICA, 12, Font.BOLD, Color.black)));

        cell = new PdfPCell(new Phrase(info.getAvgTimeToSubmit(), FontFactory.getFont(FontFactory.HELVETICA, 12, Font.NORMAL, Color.black)));
        cell.setBorderWidth(1);
        cell.setHorizontalAlignment(Element.ALIGN_CENTER);
        problemStats.addCell(cell);

        cell = new PdfPCell(new Phrase(info.getSubmissionTime(), FontFactory.getFont(FontFactory.HELVETICA, 12, Font.NORMAL, Color.black)));
        cell.setBorderWidth(1);
        cell.setHorizontalAlignment(Element.ALIGN_CENTER);
        problemStats.addCell(cell);

        problemStats.addCell(new Phrase("Total Submission %", FontFactory.getFont(FontFactory.HELVETICA, 12, Font.BOLD, Color.black)));

        cell = new PdfPCell(new Phrase(info.getSubmissionPercent(), FontFactory.getFont(FontFactory.HELVETICA, 12, Font.NORMAL, Color.black)));
        cell.setBorderWidth(1);
        cell.setHorizontalAlignment(Element.ALIGN_CENTER);
        problemStats.addCell(cell);

        cell = new PdfPCell(new Phrase("Submitted", FontFactory.getFont(FontFactory.HELVETICA, 12, Font.NORMAL, Color.black)));
        cell.setBorderWidth(1);
        cell.setHorizontalAlignment(Element.ALIGN_CENTER);
        problemStats.addCell(cell);

        problemStats.addCell(new Phrase("Successful Submission %", FontFactory.getFont(FontFactory.HELVETICA, 12, Font.BOLD, Color.black)));

        cell = new PdfPCell(new Phrase(info.getSuccessfulSubmissionPercent(), FontFactory.getFont(FontFactory.HELVETICA, 12, Font.NORMAL, Color.black)));
        cell.setBorderWidth(1);
        cell.setHorizontalAlignment(Element.ALIGN_CENTER);
        problemStats.addCell(cell);

        cell = new PdfPCell(new Phrase("Successful", FontFactory.getFont(FontFactory.HELVETICA, 12, Font.NORMAL, Color.black)));
        cell.setBorderWidth(1);
        cell.setHorizontalAlignment(Element.ALIGN_CENTER);
        problemStats.addCell(cell);

        doc.add(problemStats);

        doc.add(p);

        PdfPTable problem = new PdfPTable(1);
        problem.setWidthPercentage(100);
        problem.getDefaultCell().setPadding(2);
        problem.getDefaultCell().setBorderWidth(0);
        problem.getDefaultCell().setHorizontalAlignment(Element.ALIGN_LEFT);

        cell = new PdfPCell(new Phrase("Problem Statement", FontFactory.getFont(FontFactory.HELVETICA, 14, Font.BOLD, Color.black)));
        cell.setBorderWidth(0);
        cell.setBackgroundColor(new Color(0xCC,0xCC,0xCC));
        problem.addCell(cell);

        NodeElementRenderer nr = new NodeElementRenderer((NodeElement)info.getProblem().getComponent(0).getIntro());

        StringTokenizer parts = new StringTokenizer(nr.toPlainText(info.getLanguage()), "\n");

        while(parts.hasMoreTokens()) {
            String s = parts.nextToken();

            Phrase statement = new Phrase();
            if(s.equals(""))
                s = " ";

            statement.add(new Paragraph(s, FontFactory.getFont(FontFactory.HELVETICA, 12, Font.NORMAL, Color.black)));

            problem.addCell(statement);
        }

        if(info.getProblem().getComponent(0).getTestCases().length != 0) {

            cell = new PdfPCell(new Phrase("Definition", FontFactory.getFont(FontFactory.HELVETICA, 14, Font.BOLD, Color.black)));
            cell.setBorderWidth(0);
            cell.setBackgroundColor(new Color(0xCC,0xCC,0xCC));
            problem.addCell(cell);

            PdfPTable def = new PdfPTable(3);
            def.setWidthPercentage(100);
            def.getDefaultCell().setPadding(2);
            def.getDefaultCell().setBorderWidth(0);
            def.getDefaultCell().setHorizontalAlignment(Element.ALIGN_LEFT);
            def.setWidths(new int[] {5, 20, 75});

            def.addCell(new Phrase(" ", FontFactory.getFont(FontFactory.HELVETICA, 12, Font.NORMAL, Color.black)));
            def.addCell(new Phrase("Class:", FontFactory.getFont(FontFactory.HELVETICA, 12, Font.NORMAL, Color.black)));
            def.addCell(new Phrase(info.getProblem().getComponent(0).getClassName(), FontFactory.getFont(FontFactory.HELVETICA, 12, Font.NORMAL, Color.black)));

            def.addCell(new Phrase(" ", FontFactory.getFont(FontFactory.HELVETICA, 12, Font.NORMAL, Color.black)));
            def.addCell(new Phrase("Method:", FontFactory.getFont(FontFactory.HELVETICA, 12, Font.NORMAL, Color.black)));
            def.addCell(new Phrase(info.getProblem().getComponent(0).getMethodName(), FontFactory.getFont(FontFactory.HELVETICA, 12, Font.NORMAL, Color.black)));

            String params = "";
            DataType[] paramTypes = info.getProblem().getComponent(0).getParamTypes();
            for (int i = 0; i < paramTypes.length; i++) {
                if (i > 0)
                    params += ", ";
                params += new DataTypeRenderer(paramTypes[i]).toPlainText(info.getLanguage());
            }

            def.addCell(new Phrase(" ", FontFactory.getFont(FontFactory.HELVETICA, 12, Font.NORMAL, Color.black)));
            def.addCell(new Phrase("Parameters:", FontFactory.getFont(FontFactory.HELVETICA, 12, Font.NORMAL, Color.black)));
            def.addCell(new Phrase(params, FontFactory.getFont(FontFactory.HELVETICA, 12, Font.NORMAL, Color.black)));

            def.addCell(new Phrase(" ", FontFactory.getFont(FontFactory.HELVETICA, 12, Font.NORMAL, Color.black)));
            def.addCell(new Phrase("Returns:", FontFactory.getFont(FontFactory.HELVETICA, 12, Font.NORMAL, Color.black)));
            def.addCell(new Phrase(new DataTypeRenderer(info.getProblem().getComponent(0).getReturnType()).toPlainText(info.getLanguage()), FontFactory.getFont(FontFactory.HELVETICA, 12, Font.NORMAL, Color.black)));

            def.addCell(new Phrase(" ", FontFactory.getFont(FontFactory.HELVETICA, 12, Font.NORMAL, Color.black)));
            def.addCell(new Phrase("Method Signature:", FontFactory.getFont(FontFactory.HELVETICA, 12, Font.NORMAL, Color.black)));
            def.addCell(new Phrase(info.getLanguage().getMethodSignature(info.getProblem().getComponent(0).getMethodName(),
                    info.getProblem().getComponent(0).getReturnType(),
                    info.getProblem().getComponent(0).getParamTypes(),
                    info.getProblem().getComponent(0).getParamNames()), FontFactory.getFont(FontFactory.HELVETICA, 12, Font.NORMAL, Color.black)));

            def.addCell(new Phrase(" ", FontFactory.getFont(FontFactory.HELVETICA, 12, Font.NORMAL, Color.black)));
            def.addCell(new Phrase(" ", FontFactory.getFont(FontFactory.HELVETICA, 12, Font.NORMAL, Color.black)));
            def.addCell(new Phrase(" ", FontFactory.getFont(FontFactory.HELVETICA, 12, Font.NORMAL, Color.black)));

            problem.addCell(def);

            cell = new PdfPCell(new Phrase("Notes", FontFactory.getFont(FontFactory.HELVETICA, 14, Font.BOLD, Color.black)));
            cell.setBorderWidth(0);
            cell.setBackgroundColor(new Color(0xCC,0xCC,0xCC));
            problem.addCell(cell);

            PdfPTable notes = new PdfPTable(2);
            notes.setWidthPercentage(100);
            notes.getDefaultCell().setPadding(2);
            notes.getDefaultCell().setBorderWidth(0);
            notes.getDefaultCell().setHorizontalAlignment(Element.ALIGN_LEFT);
            notes.setWidths(new int[] {5, 95});

            com.topcoder.shared.problem.Element[] notesElements = info.getProblem().getComponent(0).getNotes();

            for(int i = 0; i < notesElements.length; i++) {
                notes.addCell(new Phrase("-", FontFactory.getFont(FontFactory.HELVETICA, 12, Font.NORMAL, Color.black)));
                notes.addCell(new Phrase(new NodeElementRenderer((NodeElement)notesElements[i]).toPlainText(info.getLanguage()), FontFactory.getFont(FontFactory.HELVETICA, 12, Font.NORMAL, Color.black)));
            }

            notes.addCell(new Phrase(" ", FontFactory.getFont(FontFactory.HELVETICA, 12, Font.NORMAL, Color.black)));
            notes.addCell(new Phrase(" ", FontFactory.getFont(FontFactory.HELVETICA, 12, Font.NORMAL, Color.black)));

            problem.addCell(notes);

            cell = new PdfPCell(new Phrase("Constraints", FontFactory.getFont(FontFactory.HELVETICA, 14, Font.BOLD, Color.black)));
            cell.setBorderWidth(0);
            cell.setBackgroundColor(new Color(0xCC,0xCC,0xCC));
            problem.addCell(cell);

            PdfPTable constraints = new PdfPTable(2);
            constraints.setWidthPercentage(100);
            constraints.getDefaultCell().setPadding(2);
            constraints.getDefaultCell().setBorderWidth(0);
            constraints.getDefaultCell().setHorizontalAlignment(Element.ALIGN_LEFT);
            constraints.setWidths(new int[] {5, 95});

            com.topcoder.shared.problem.Constraint[] constraintsElements = info.getProblem().getComponent(0).getConstraints();

            for(int i = 0; i < constraintsElements.length; i++) {
                constraints.addCell(new Phrase("-", FontFactory.getFont(FontFactory.HELVETICA, 12, Font.NORMAL, Color.black)));
                constraints.addCell(new Phrase(new UserConstraintRenderer((UserConstraint)constraintsElements[i]).toPlainText(info.getLanguage()), FontFactory.getFont(FontFactory.HELVETICA, 12, Font.NORMAL, Color.black)));
            }

            constraints.addCell(new Phrase(" ", FontFactory.getFont(FontFactory.HELVETICA, 12, Font.NORMAL, Color.black)));
            constraints.addCell(new Phrase(" ", FontFactory.getFont(FontFactory.HELVETICA, 12, Font.NORMAL, Color.black)));

            problem.addCell(constraints);

            cell = new PdfPCell(new Phrase("Examples", FontFactory.getFont(FontFactory.HELVETICA, 14, Font.BOLD, Color.black)));
            cell.setBorderWidth(0);
            cell.setBackgroundColor(new Color(0xCC,0xCC,0xCC));
            problem.addCell(cell);

            TestCase[] testCases = info.getProblem().getComponent(0).getTestCases();

            int j = 0;

            for(int i =0; i < testCases.length; i++) {
                if(testCases[i].isExample()) {
                    cell = new PdfPCell(new Phrase(j + ")", FontFactory.getFont(FontFactory.HELVETICA, 12, Font.NORMAL, Color.black)));
                    j++;
                    cell.setBorderWidth(0);
                    problem.addCell(cell);

                    PdfPTable example = new PdfPTable(2);
                    example.setWidthPercentage(100);
                    example.getDefaultCell().setPadding(2);
                    example.getDefaultCell().setBorderWidth(0);
                    example.getDefaultCell().setHorizontalAlignment(Element.ALIGN_LEFT);
                    example.setWidths(new int[] {5, 95});

                    for(int k = 0; k < testCases[i].getInput().length; k++) {
                        example.addCell(new Phrase(" ", FontFactory.getFont(FontFactory.COURIER, 12, Font.NORMAL, Color.black)));
                        example.addCell(new Phrase(testCases[i].getInput()[k], FontFactory.getFont(FontFactory.COURIER, 12, Font.NORMAL, Color.black)));
                    }


                    example.addCell(new Phrase(" ", FontFactory.getFont(FontFactory.COURIER, 12, Font.NORMAL, Color.black)));
                    example.addCell(new Phrase(testCases[i].getOutput(), FontFactory.getFont(FontFactory.COURIER, 12, Font.NORMAL, Color.black)));

                    if(testCases[i].getAnnotation() != null) {
                        example.addCell(new Phrase(" ", FontFactory.getFont(FontFactory.HELVETICA, 12, Font.NORMAL, Color.black)));
                        example.addCell(new Phrase(new NodeElementRenderer((NodeElement)testCases[i].getAnnotation()).toPlainText(info.getLanguage()), FontFactory.getFont(FontFactory.HELVETICA, 12, Font.NORMAL, Color.black)));
                    }

                    problem.addCell(example);
                }
            }

        }
        problem.addCell(new Phrase(" ", FontFactory.getFont(FontFactory.HELVETICA, 12, Font.NORMAL, Color.black)));
        problem.addCell(new Phrase("This problem statement is the exclusive and proprietary property of TopCoder, Inc.  Any unauthorized use or reproduction of this information without prior written consent of TopCoder, Inc. is strictly prohibited.  (c) 2004 TopCoder, Inc.  All rights reserved.", FontFactory.getFont(FontFactory.HELVETICA, 12, Font.NORMAL, Color.black)));

        doc.add(problem);

        doc.newPage();
    }

    public void drawPageFour(Document doc, PlacementConfig info) throws Exception {
        PdfPTable submission = new PdfPTable(1);
        submission.setWidthPercentage(100);
        submission.getDefaultCell().setPadding(2);
        submission.getDefaultCell().setBorderWidth(0);
        submission.getDefaultCell().setHorizontalAlignment(Element.ALIGN_LEFT);

        PdfPCell cell = new PdfPCell(new Phrase("[" + info.getHandle() + "]'s Submission", FontFactory.getFont(FontFactory.HELVETICA, 14, Font.BOLD, Color.black)));
        cell.setBorderWidth(0);
        cell.setBackgroundColor(new Color(0xCC,0xCC,0xCC));
        submission.addCell(cell);

        doc.add(submission);
        doc.add(new Phrase(info.getSubmissionText(), FontFactory.getFont(FontFactory.COURIER, 8, Font.NORMAL, Color.black)));

    }

    public void drawResume(Document doc, PlacementConfig info, PdfWriter writer) throws Exception {
        InitialContext ctx = TCContext.getInitial();
        ResumeServices resumebean = (ResumeServices)createEJB(ctx, ResumeServices.class);

        if(resumebean.hasResume(info.getUserID(), DBMS.OLTP_DATASOURCE_NAME)) {
            String ext = resumebean.getResume(info.getUserID(), DBMS.OLTP_DATASOURCE_NAME).getFileName().substring(resumebean.getResume(info.getUserID(), DBMS.OLTP_DATASOURCE_NAME).getFileName().lastIndexOf('.')+1);
            log.debug(ext);

            doc.resetFooter();
            doc.resetHeader();
            inResume = true;

            byte[] rawBytes = resumebean.getResume(info.getUserID(), DBMS.OLTP_DATASOURCE_NAME).getFile();
            //pass through the converter
            byte[] result;
            if(ext.equals("pdf")) {
                result = rawBytes;
            } else {
                ctx = TCContext.getContext(ApplicationServer.SECURITY_CONTEXT_FACTORY, ApplicationServer.FILE_CONVERSION_PROVIDER_URL);

                FileConversion filebean = (FileConversion)createEJB(ctx, FileConversion.class);
                result = filebean.convertDoc(rawBytes,ext);
            }

            PdfReader reader = new PdfReader(result);

            int n = reader.getNumberOfPages();

            PdfImportedPage page;
            PdfContentByte cb = writer.getDirectContent();

            for (int i = 0; i < n; ) {
                ++i;
                doc.newPage();

                page = writer.getImportedPage(reader, i);

                cb.addTemplate(page, 0,0);

            }

        }
    }

    final class MyPageEvents extends PdfPageEventHelper {
        // This is the contentbyte object of the writer
        PdfContentByte cb;

        boolean bFirstFooter = true;

        public void onStartPage(PdfWriter writer, Document document) {
            try {
                if(writer.getPageNumber() > 1 && (!inResume)) {
                    cb = writer.getDirectContent();
                    cb.beginText();
                    cb.setColorFill(Color.white);
                    cb.setColorStroke(Color.white);
                    cb.setFontAndSize(BaseFont.createFont(BaseFont.HELVETICA_BOLD, BaseFont.CP1252, BaseFont.NOT_EMBEDDED ), 14);
                    cb.setTextMatrix(200, 810);
                    cb.showText("Member Profile for [" + info.getHandle() + "]");
                    cb.endText();
                }
            }
            catch(Exception e) {
                e.printStackTrace();
                System.err.println(e.getMessage());
            }

        }

        // we override the onEndPage method
        public void onEndPage(PdfWriter writer, Document document) {

            try {
                if(!inResume) {
                    //super.onEndPage(writer, document);
                    Image footerimg = Image.getInstance("http://" + ApplicationServer.SERVER_NAME + "/i/profiles/topcoder_logo_footer.jpg");
                    footerimg.setAlignment(Element.ALIGN_LEFT);
                    footerimg.scalePercent(70f);

                    footerimg.setAbsolutePosition(45,30);

                    cb = writer.getDirectContent();
                    cb.beginText();
                    cb.setColorFill(Color.white);
                    cb.setColorStroke(Color.white);
                    cb.setFontAndSize(BaseFont.createFont(BaseFont.HELVETICA_BOLD, BaseFont.CP1252, BaseFont.NOT_EMBEDDED ), 14);
                    cb.setTextMatrix(540, 33);
                    cb.showText("-" + writer.getPageNumber() + "-");
                    cb.endText();

                    cb.addImage(footerimg);
                } else if(bFirstFooter) {
                    bFirstFooter = false;

                    Image footerimg = Image.getInstance("http://" + ApplicationServer.SERVER_NAME + "/i/profiles/topcoder_logo_footer.jpg");
                    footerimg.setAlignment(Element.ALIGN_LEFT);
                    footerimg.scalePercent(70f);

                    footerimg.setAbsolutePosition(45,30);

                    cb = writer.getDirectContent();
                    cb.beginText();
                    cb.setColorFill(Color.white);
                    cb.setColorStroke(Color.white);
                    cb.setFontAndSize(BaseFont.createFont(BaseFont.HELVETICA_BOLD, BaseFont.CP1252, BaseFont.NOT_EMBEDDED ), 14);
                    cb.setTextMatrix(540, 33);
                    cb.showText("-" + writer.getPageNumber() + "-");
                    cb.endText();

                    cb.addImage(footerimg);
                }

            }
            catch(Exception e) {
                e.printStackTrace();
                System.err.println(e.getMessage());
            }
        }

    }


}
