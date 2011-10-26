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
import com.topcoder.web.common.model.SoftwareComponent;
import com.topcoder.web.common.render.DataTypeRenderer;
import com.topcoder.web.common.render.NodeElementRenderer;
import com.topcoder.web.common.render.UserConstraintRenderer;
import com.topcoder.web.ejb.coderskill.CoderSkill;
import com.topcoder.web.ejb.fileconversion.FileConversion;
import com.topcoder.web.ejb.resume.ResumeServices;
import com.topcoder.web.ejb.user.User;
import com.topcoder.web.tc.Constants;
import com.topcoder.web.tc.model.*;

import javax.naming.InitialContext;
import java.awt.*;
import java.io.ByteArrayOutputStream;
import java.io.InputStream;
import java.net.URL;
import java.rmi.RemoteException;
import java.text.DecimalFormat;
import java.util.Arrays;
import java.util.Collections;
import java.util.Map;
import java.util.StringTokenizer;

/**
 * @author rfairfax
 */
public class PDFGenerator extends BaseProcessor {

    PlacementConfig info;
    private boolean includeHeader = true;
    private boolean inResume = false;

    private static HeaderFooter header = new HeaderFooter(new Phrase("  "), false);
    private static HeaderFooter footer = new HeaderFooter(new Phrase("  "), false);

    static {
        header.setBackgroundColor(new Color(0, 51, 102)); //#cc0000
        header.setBorder(Rectangle.NO_BORDER);

        footer.setAlignment(Element.ALIGN_RIGHT);
        footer.setBorder(Rectangle.NO_BORDER);
        footer.setBackgroundColor(new Color(0, 0, 0)); //#cccccc
    }


    protected void businessProcessing() throws TCWebException {
        if (!((SessionInfo) getRequest().getAttribute(BaseServlet.SESSION_INFO_KEY)).isAdmin())
            throw new PermissionException(getUser(), new ClassResource(this.getClass()));

        try {
            //load config values
            info = getConfig();

            //create document
            Document doc = new Document(PageSize.A4, 35, 35, 35, 35);

            getResponse().setContentType("application/pdf");
            getResponse().addHeader("content-disposition", "inline; filename=\"" + info.getHandle() + ".pdf\"");

            PdfWriter writer = PdfWriter.getInstance(doc, getResponse().getOutputStream());

            //atach events class
            MyPageEvents events = new MyPageEvents();
            writer.setPageEvent(events);

            doc.setFooter(footer);
            doc.open();
            drawPageOne(doc, info);
            drawInstructions(doc, writer);
            doc.setHeader(header);
            drawPageTwo(doc, info);
            drawPageThree(doc, info);
            drawPageFour(doc, info);

            ComponentCompetitionStats design = info.getDesign();
            if (design != null) {
                drawDesignOrDevelopmentPage(doc, design, "Design", "rating_distribution_graph_design_profile");

                ComponentContestDetails example = info.getDesignExample();
                if (example != null) {
                    drawExampleComponentPage(doc, example, info.getUserID(), true);
                }
            }

            ComponentCompetitionStats development = info.getDevelopment();
            if (development != null) {
                drawDesignOrDevelopmentPage(doc, development, "Development", "rating_distribution_graph_dev_profile");

                ComponentContestDetails example = info.getDevelopmentExample();
                if (example != null) {
                    drawExampleComponentPage(doc, example, info.getUserID(), false);
                }
            }

            doc.resetHeader();
            doc.resetFooter();
            drawResume(doc, info, writer);

            doc.close();

            //write out the document
            getResponse().getOutputStream().flush();
            getResponse().getOutputStream().close();

            getResponse().flushBuffer();

            if (log.isDebugEnabled()) {
                log.debug("DONE PDFING");
            }
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
        t.setWidths(new int[]{35, 65});

        t.getDefaultCell().setPadding(3);
        t.getDefaultCell().setBorderWidth(0);
        t.getDefaultCell().setHorizontalAlignment(Element.ALIGN_LEFT);
        t.addCell(new Phrase("Presented to:", FontFactory.getFont(FontFactory.HELVETICA, 14, Font.NORMAL, Color.black)));

        if (info.getCompanyLogo() != null && info.getCompanyLogo().getSize()>0) {
            if (log.isDebugEnabled()) {
                log.debug("logo size is " + info.getCompanyLogo().getSize());
            }
            byte[] b = new byte[(int) info.getCompanyLogo().getSize()];
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

        //don't start a new page here, we'll start it in the next piece so that it can control the headers/footers correctly
        //doc.newPage();
    }

    private void drawInstructions(Document doc, PdfWriter writer) throws Exception {

        includeHeader = false;
        doc.newPage();

        URL u = new URL("http://" + ApplicationServer.SERVER_NAME + "/i/profiles/instructions.doc");


        InputStream is = u.openStream();
        ByteArrayOutputStream baos = new ByteArrayOutputStream();
        int ch;
        while ((ch = is.read()) >= 0) {
            baos.write(ch);
        }

        byte[] result;
        InitialContext ctx = TCContext.getContext(ApplicationServer.SECURITY_CONTEXT_FACTORY, ApplicationServer.FILE_CONVERSION_PROVIDER_URL);
        FileConversion filebean = (FileConversion) createEJB(ctx, FileConversion.class);
        result = filebean.convertDoc(baos.toByteArray(), "doc");

        PdfReader reader = new PdfReader(result);

        int n = reader.getNumberOfPages();

        PdfImportedPage page;
        PdfContentByte cb = writer.getDirectContent();

        for (int i = 1; i <= n; i++) {
            page = writer.getImportedPage(reader, i);
            cb.addTemplate(page, 0, 0);
            if (i == n) {
                includeHeader = true;
            } else {
                doc.newPage();
            }

        }

    }


    private void drawPageTwo(Document doc, PlacementConfig info) throws Exception {
        doc.newPage();
        GeneralStats gen = info.getAlgorithm();

        PdfPTable t = new PdfPTable(2);
        t.setWidthPercentage(100);
        t.setWidths(new int[]{35, 65});

        t.getDefaultCell().setPadding(3);
        t.getDefaultCell().setBorderWidth(0);
        t.getDefaultCell().setHorizontalAlignment(Element.ALIGN_LEFT);
        t.getDefaultCell().setVerticalAlignment(Element.ALIGN_TOP);

        PdfPCell header = new PdfPCell(new Phrase("Algorithm Competition Statistics\n(Based on " + info.getNumContests() + " Events)", FontFactory.getFont(FontFactory.HELVETICA, 12, Font.BOLD, Color.black)));
        header.setBorderWidth(0);
        header.setHorizontalAlignment(Element.ALIGN_CENTER);
        header.setColspan(2);
        t.addCell(header);

        header.setPhrase(new Phrase(" "));
        t.addCell(header);

        PdfPTable skills = new PdfPTable(2);
        skills.setWidthPercentage(100);
        skills.setWidths(new int[]{25, 75});
        skills.getDefaultCell().setPadding(2);
        skills.getDefaultCell().setBorderWidth(0);
        skills.getDefaultCell().setHorizontalAlignment(Element.ALIGN_LEFT);

        PdfPCell cell = new PdfPCell(new Phrase("\nSkills", FontFactory.getFont(FontFactory.HELVETICA, 12, Font.BOLD, Color.black)));
        cell.setColspan(2);
        cell.setBorderWidth(0);
        skills.addCell(cell);

        java.util.List groups = info.getSkillGroups();

        for (int i = 0; i < groups.size(); i++) {
            cell = new PdfPCell(new Phrase((String) groups.get(i), FontFactory.getFont(FontFactory.HELVETICA, 12, Font.BOLD, Color.black)));
            cell.setBorderWidth(1);
            skills.addCell(cell);

            java.util.List skillsList = info.getSkills((String) groups.get(i));

            Collections.sort(skillsList);

            StringBuffer b = new StringBuffer();
            for (int j = 0; j < skillsList.size(); j++) {
                String s = ((Skill) skillsList.get(j)).getText();
                if (j != 0) b.append(", ");
                b.append(s);
            }

            cell = new PdfPCell(new Phrase(b.toString(), FontFactory.getFont(FontFactory.HELVETICA, 12, Font.NORMAL, Color.black)));
            cell.setBorderWidth(1);
            skills.addCell(cell);
        }

//        t.addCell(skills);

        PdfPTable ranking = new PdfPTable(1);
        ranking.setWidthPercentage(100);
        ranking.getDefaultCell().setPadding(2);
        ranking.getDefaultCell().setBorderWidth(0);
        ranking.getDefaultCell().setHorizontalAlignment(Element.ALIGN_CENTER);

//        ranking.addCell(new Phrase("Rating Position Among Members", FontFactory.getFont(FontFactory.HELVETICA, 14, Font.BOLD, Color.black)));

        //coder ranking table
        PdfPTable inner = new PdfPTable(2);
        inner.setWidthPercentage(100);
        inner.getDefaultCell().setPadding(2);
        inner.getDefaultCell().setBorderWidth(1);
        inner.getDefaultCell().setHorizontalAlignment(Element.ALIGN_LEFT);

        cell = new PdfPCell(new Phrase("Overall Statistics", FontFactory.getFont(FontFactory.HELVETICA, 12, Font.BOLD, Color.black)));
        cell.setBackgroundColor(new Color(0xCC, 0xCC, 0xCC));
        cell.setHorizontalAlignment(Element.ALIGN_CENTER);
        cell.setBorderWidth(1);
        cell.setColspan(2);

        inner.addCell(cell);

        cell = new PdfPCell(new Phrase("Rating", FontFactory.getFont(FontFactory.HELVETICA, 12, Font.BOLD, Color.black)));
        cell.setHorizontalAlignment(Element.ALIGN_CENTER);
        cell.setBorderWidth(1);
        inner.addCell(cell);

        inner.addCell(new Phrase("" + info.getRating(), FontFactory.getFont(FontFactory.HELVETICA, 12, Font.NORMAL, Color.black)));

        cell = new PdfPCell(new Phrase("Max Rating", FontFactory.getFont(FontFactory.HELVETICA, 12, Font.BOLD, Color.black)));
        cell.setHorizontalAlignment(Element.ALIGN_CENTER);
        cell.setBorderWidth(1);
        inner.addCell(cell);

        inner.addCell(new Phrase(gen.getMaxRating(), FontFactory.getFont(FontFactory.HELVETICA, 12, Font.NORMAL, Color.black)));

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

        cell = new PdfPCell(new Phrase("Country Rank", FontFactory.getFont(FontFactory.HELVETICA, 12, Font.BOLD, Color.black)));
        cell.setHorizontalAlignment(Element.ALIGN_CENTER);
        cell.setBorderWidth(1);
        inner.addCell(cell);

        inner.addCell(new Phrase(gen.getCountryRank(), FontFactory.getFont(FontFactory.HELVETICA, 12, Font.NORMAL, Color.black)));

        cell = new PdfPCell(new Phrase("School Rank", FontFactory.getFont(FontFactory.HELVETICA, 12, Font.BOLD, Color.black)));
        cell.setHorizontalAlignment(Element.ALIGN_CENTER);
        cell.setBorderWidth(1);
        inner.addCell(cell);

        inner.addCell(new Phrase(gen.getSchoolRank(), FontFactory.getFont(FontFactory.HELVETICA, 12, Font.NORMAL, Color.black)));

        cell = new PdfPCell(new Phrase("Division", FontFactory.getFont(FontFactory.HELVETICA, 12, Font.BOLD, Color.black)));
        cell.setHorizontalAlignment(Element.ALIGN_CENTER);
        cell.setBorderWidth(1);
        inner.addCell(cell);

        inner.addCell(new Phrase(info.getRating() >= 1200 ? "1" : "2", FontFactory.getFont(FontFactory.HELVETICA, 12, Font.NORMAL, Color.black)));

        ranking.addCell(inner);
        ranking.addCell(" ");

        Image chart = Image.getInstance("http://" + ApplicationServer.SERVER_NAME + "/graph?c=rating_distribution_graph_profile&width=600&height=400&rt=" + info.getRating() + "&hn=" + info.getHandle());
//        ranking.addCell(chart);
        //ranking.addCell(new Phrase("* line indicates " + info.getHandle() + "'s rating", FontFactory.getFont(FontFactory.HELVETICA, 12, Font.NORMAL, Color.black)));

        t.addCell(ranking);
        t.addCell(chart);

        //lifetime stats

        PdfPTable lifetime = new PdfPTable(2);
        lifetime.setWidthPercentage(100);
        lifetime.getDefaultCell().setPadding(2);
        lifetime.getDefaultCell().setBorderWidth(0);
        lifetime.getDefaultCell().setHorizontalAlignment(Element.ALIGN_CENTER);

        cell = new PdfPCell(new Phrase("\nLifetime Competition Statistics", FontFactory.getFont(FontFactory.HELVETICA, 12, Font.BOLD, Color.black)));
        cell.setColspan(2);
        cell.setBorderWidth(0);
        lifetime.addCell(cell);

        PdfPTable competitors = new PdfPTable(2);
        competitors.setWidthPercentage(100);
        competitors.getDefaultCell().setPadding(2);
        competitors.getDefaultCell().setBorderWidth(1);
        competitors.getDefaultCell().setHorizontalAlignment(Element.ALIGN_LEFT);

        cell = new PdfPCell(new Phrase("Challenges Against Competitors", FontFactory.getFont(FontFactory.HELVETICA, 12, Font.BOLD, Color.black)));
        cell.setBackgroundColor(new Color(0xCC, 0xCC, 0xCC));
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
        cell.setBackgroundColor(new Color(0xCC, 0xCC, 0xCC));
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

        doc.add(skills);

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
        cell.setBackgroundColor(new Color(0xCC, 0xCC, 0xCC));
        problemStats.addCell(cell);

        cell = new PdfPCell(new Phrase("[" + info.getHandle() + "]'s Statistics", FontFactory.getFont(FontFactory.HELVETICA, 12, Font.BOLD, Color.black)));
        cell.setBorderWidth(1);
        cell.setHorizontalAlignment(Element.ALIGN_CENTER);
        cell.setBackgroundColor(new Color(0xCC, 0xCC, 0xCC));
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
        cell.setBackgroundColor(new Color(0xCC, 0xCC, 0xCC));
        problem.addCell(cell);

        NodeElementRenderer nr = new NodeElementRenderer((NodeElement) info.getProblem().getComponent(0).getIntro());

        StringTokenizer parts = new StringTokenizer(nr.toPlainText(info.getLanguage()), "\n");

        while (parts.hasMoreTokens()) {
            String s = parts.nextToken();

            Phrase statement = new Phrase();
            if (s.equals(""))
                s = " ";

            statement.add(new Paragraph(s, FontFactory.getFont(FontFactory.HELVETICA, 12, Font.NORMAL, Color.black)));

            problem.addCell(statement);
        }

        if (info.getProblem().getComponent(0).getTestCases().length != 0) {

            cell = new PdfPCell(new Phrase("Definition", FontFactory.getFont(FontFactory.HELVETICA, 14, Font.BOLD, Color.black)));
            cell.setBorderWidth(0);
            cell.setBackgroundColor(new Color(0xCC, 0xCC, 0xCC));
            problem.addCell(cell);

            PdfPTable def = new PdfPTable(3);
            def.setWidthPercentage(100);
            def.getDefaultCell().setPadding(2);
            def.getDefaultCell().setBorderWidth(0);
            def.getDefaultCell().setHorizontalAlignment(Element.ALIGN_LEFT);
            def.setWidths(new int[]{5, 20, 75});

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
            cell.setBackgroundColor(new Color(0xCC, 0xCC, 0xCC));
            problem.addCell(cell);

            PdfPTable notes = new PdfPTable(2);
            notes.setWidthPercentage(100);
            notes.getDefaultCell().setPadding(2);
            notes.getDefaultCell().setBorderWidth(0);
            notes.getDefaultCell().setHorizontalAlignment(Element.ALIGN_LEFT);
            notes.setWidths(new int[]{5, 95});

            com.topcoder.shared.problem.Element[] notesElements = info.getProblem().getComponent(0).getNotes();

            for (int i = 0; i < notesElements.length; i++) {
                notes.addCell(new Phrase("-", FontFactory.getFont(FontFactory.HELVETICA, 12, Font.NORMAL, Color.black)));
                notes.addCell(new Phrase(new NodeElementRenderer((NodeElement) notesElements[i]).toPlainText(info.getLanguage()), FontFactory.getFont(FontFactory.HELVETICA, 12, Font.NORMAL, Color.black)));
            }

            notes.addCell(new Phrase(" ", FontFactory.getFont(FontFactory.HELVETICA, 12, Font.NORMAL, Color.black)));
            notes.addCell(new Phrase(" ", FontFactory.getFont(FontFactory.HELVETICA, 12, Font.NORMAL, Color.black)));

            problem.addCell(notes);

            cell = new PdfPCell(new Phrase("Constraints", FontFactory.getFont(FontFactory.HELVETICA, 14, Font.BOLD, Color.black)));
            cell.setBorderWidth(0);
            cell.setBackgroundColor(new Color(0xCC, 0xCC, 0xCC));
            problem.addCell(cell);

            PdfPTable constraints = new PdfPTable(2);
            constraints.setWidthPercentage(100);
            constraints.getDefaultCell().setPadding(2);
            constraints.getDefaultCell().setBorderWidth(0);
            constraints.getDefaultCell().setHorizontalAlignment(Element.ALIGN_LEFT);
            constraints.setWidths(new int[]{5, 95});

            com.topcoder.shared.problem.Constraint[] constraintsElements = info.getProblem().getComponent(0).getConstraints();

            for (int i = 0; i < constraintsElements.length; i++) {
                constraints.addCell(new Phrase("-", FontFactory.getFont(FontFactory.HELVETICA, 12, Font.NORMAL, Color.black)));
                constraints.addCell(new Phrase(new UserConstraintRenderer((UserConstraint) constraintsElements[i]).toPlainText(info.getLanguage()), FontFactory.getFont(FontFactory.HELVETICA, 12, Font.NORMAL, Color.black)));
            }

            constraints.addCell(new Phrase(" ", FontFactory.getFont(FontFactory.HELVETICA, 12, Font.NORMAL, Color.black)));
            constraints.addCell(new Phrase(" ", FontFactory.getFont(FontFactory.HELVETICA, 12, Font.NORMAL, Color.black)));

            problem.addCell(constraints);

            cell = new PdfPCell(new Phrase("Examples", FontFactory.getFont(FontFactory.HELVETICA, 14, Font.BOLD, Color.black)));
            cell.setBorderWidth(0);
            cell.setBackgroundColor(new Color(0xCC, 0xCC, 0xCC));
            problem.addCell(cell);

            TestCase[] testCases = info.getProblem().getComponent(0).getTestCases();

            int j = 0;

            for (int i = 0; i < testCases.length; i++) {
                if (testCases[i].isExample()) {
                    cell = new PdfPCell(new Phrase(j + ")", FontFactory.getFont(FontFactory.HELVETICA, 12, Font.NORMAL, Color.black)));
                    j++;
                    cell.setBorderWidth(0);
                    problem.addCell(cell);

                    PdfPTable example = new PdfPTable(2);
                    example.setWidthPercentage(100);
                    example.getDefaultCell().setPadding(2);
                    example.getDefaultCell().setBorderWidth(0);
                    example.getDefaultCell().setHorizontalAlignment(Element.ALIGN_LEFT);
                    example.setWidths(new int[]{5, 95});

                    for (int k = 0; k < testCases[i].getInput().length; k++) {
                        example.addCell(new Phrase(" ", FontFactory.getFont(FontFactory.COURIER, 12, Font.NORMAL, Color.black)));
                        example.addCell(new Phrase(testCases[i].getInput()[k], FontFactory.getFont(FontFactory.COURIER, 12, Font.NORMAL, Color.black)));
                    }


                    example.addCell(new Phrase(" ", FontFactory.getFont(FontFactory.COURIER, 12, Font.NORMAL, Color.black)));
                    example.addCell(new Phrase(testCases[i].getOutput(), FontFactory.getFont(FontFactory.COURIER, 12, Font.NORMAL, Color.black)));

                    if (testCases[i].getAnnotation() != null) {
                        example.addCell(new Phrase(" ", FontFactory.getFont(FontFactory.HELVETICA, 12, Font.NORMAL, Color.black)));
                        example.addCell(new Phrase(new NodeElementRenderer((NodeElement) testCases[i].getAnnotation()).toPlainText(info.getLanguage()), FontFactory.getFont(FontFactory.HELVETICA, 12, Font.NORMAL, Color.black)));
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
        cell.setBackgroundColor(new Color(0xCC, 0xCC, 0xCC));
        submission.addCell(cell);

        doc.add(submission);
        doc.add(new Phrase(info.getSubmissionText(), FontFactory.getFont(FontFactory.COURIER, 8, Font.NORMAL, Color.black)));
    }

    public void drawResume(Document doc, PlacementConfig info, PdfWriter writer) throws Exception {
        InitialContext ctx = TCContext.getInitial();
        ResumeServices resumebean = (ResumeServices) createEJB(ctx, ResumeServices.class);

        if (resumebean.hasResume(info.getUserID(), DBMS.OLTP_DATASOURCE_NAME)) {
            includeHeader = false;
            inResume = true;
            doc.newPage();
            String ext = resumebean.getResume(info.getUserID(), DBMS.OLTP_DATASOURCE_NAME).getFileName().substring(resumebean.getResume(info.getUserID(), DBMS.OLTP_DATASOURCE_NAME).getFileName().lastIndexOf('.') + 1);
            if (log.isDebugEnabled()) {
                log.debug(ext);
            }
            byte[] rawBytes = resumebean.getResume(info.getUserID(), DBMS.OLTP_DATASOURCE_NAME).getFile();
            //pass through the converter
            byte[] result;
            if (ext.equals("pdf")) {
                result = rawBytes;
            } else {
                ctx = TCContext.getContext(ApplicationServer.SECURITY_CONTEXT_FACTORY, ApplicationServer.FILE_CONVERSION_PROVIDER_URL);

                FileConversion filebean = (FileConversion) createEJB(ctx, FileConversion.class);
                result = filebean.convertDoc(rawBytes, ext);
            }

            PdfReader reader = new PdfReader(result);

            int n = reader.getNumberOfPages();

            PdfImportedPage page;
            PdfContentByte cb = writer.getDirectContent();

            for (int i = 1; i <= n; i++) {
                page = writer.getImportedPage(reader, i);
                cb.addTemplate(page, 0, 0);
                if (i == n) {
                    includeHeader = true;
                } else {
                    doc.newPage();
                }
            }

        }
    }


    private void drawExampleComponentPage(Document doc, ComponentContestDetails contest, int uid, boolean design) throws Exception {
        PdfPTable page = new PdfPTable(1);
        page.setWidthPercentage(100);
        page.getDefaultCell().setBorderWidth(0);
        page.getDefaultCell().setPadding(0);

        PdfPCell header = new PdfPCell(new Phrase("Sample " + contest.getPhaseDescription() + " Project", FontFactory.getFont(FontFactory.HELVETICA, 12, Font.BOLD, Color.black)));
        header.setBorderWidth(0);
        header.setHorizontalAlignment(Element.ALIGN_CENTER);
        page.addCell(header);

        String text = contest.getComponent() + " Component";
        String ref = "http://software.topcoder.com/catalog/c_component.jsp?comp=" + contest.getComponentId() + "&ver=" + contest.getComponentVersion();
        Anchor anchor = new Anchor(text, FontFactory.getFont(FontFactory.HELVETICA, 12, Font.UNDERLINE, new Color(0, 0, 255)));
        anchor.setReference(ref);
        anchor.setName("LINK");
        header.setPhrase(anchor);

        page.addCell(header);
        page.addCell(" ");

        PdfPCell cell = null;

        PdfPTable overview = new PdfPTable(1);
        overview.getDefaultCell().setPadding(2);
        overview.getDefaultCell().setBorderWidth(0);
        overview.getDefaultCell().setHorizontalAlignment(Element.ALIGN_LEFT);

        cell = new PdfPCell(new Phrase("Component Overview", FontFactory.getFont(FontFactory.HELVETICA, 12, Font.BOLD, Color.black)));
        cell.setBorderWidth(0);
        overview.addCell(cell);

        cell = new PdfPCell(new Phrase(contest.getComponentOverview(), FontFactory.getFont(FontFactory.HELVETICA, 10, Font.NORMAL, Color.black)));
        cell.setBorderWidth(0);
        overview.addCell(cell);

        cell = new PdfPCell(new Phrase(" ", FontFactory.getFont(FontFactory.HELVETICA, 10, Font.NORMAL, Color.black)));
        cell.setBorderWidth(0);
        overview.addCell(cell);

        cell = new PdfPCell(new Phrase("Component Functionality", FontFactory.getFont(FontFactory.HELVETICA, 12, Font.BOLD, Color.black)));
        cell.setBorderWidth(0);
        overview.addCell(cell);

        cell = new PdfPCell(new Phrase(contest.getComponentFunctionality(), FontFactory.getFont(FontFactory.HELVETICA, 10, Font.NORMAL, Color.black)));
        cell.setBorderWidth(0);
        overview.addCell(cell);

        page.addCell(overview);
        page.addCell(" ");

        PdfPTable stats = new PdfPTable(4);
        stats.getDefaultCell().setPadding(2);
        stats.getDefaultCell().setBorderWidth(1);
        stats.getDefaultCell().setHorizontalAlignment(Element.ALIGN_LEFT);

        cell = new PdfPCell(new Phrase(contest.getPhaseDescription() + " Contest Details", FontFactory.getFont(FontFactory.HELVETICA, 12, Font.BOLD, Color.black)));
        cell.setBorderWidth(0);
        cell.setColspan(4);
        stats.addCell(cell);

        cell = new PdfPCell(new Phrase("Catalog", FontFactory.getFont(FontFactory.HELVETICA, 12, Font.BOLD, Color.black)));
        cell.setHorizontalAlignment(Element.ALIGN_CENTER);
        cell.setBorderWidth(1);
        stats.addCell(cell);
        cell.setPhrase(new Phrase(contest.getCatalog(), FontFactory.getFont(FontFactory.HELVETICA, 12, Font.NORMAL, Color.black)));
        stats.addCell(cell);
        cell.setPhrase(new Phrase("Registrants", FontFactory.getFont(FontFactory.HELVETICA, 12, Font.BOLD, Color.black)));
        stats.addCell(cell);
        cell.setPhrase(new Phrase(contest.getRegistrants(), FontFactory.getFont(FontFactory.HELVETICA, 12, Font.NORMAL, Color.black)));
        stats.addCell(cell);
//        cell.setPhrase(new Phrase("Submissions", FontFactory.getFont(FontFactory.HELVETICA, 12, Font.BOLD, Color.black)));
//        stats.addCell(cell);
//        cell.setPhrase(new Phrase(contest.getSubmissions(), FontFactory.getFont(FontFactory.HELVETICA, 12, Font.NORMAL, Color.black)));
//        stats.addCell(cell);
        cell.setPhrase(new Phrase("Submission %", FontFactory.getFont(FontFactory.HELVETICA, 12, Font.BOLD, Color.black)));
        stats.addCell(cell);
        cell.setPhrase(new Phrase(contest.getSubmissionPercentage(), FontFactory.getFont(FontFactory.HELVETICA, 12, Font.NORMAL, Color.black)));
        stats.addCell(cell);
//        cell.setPhrase(new Phrase("Passed Screening", FontFactory.getFont(FontFactory.HELVETICA, 12, Font.BOLD, Color.black)));
//        stats.addCell(cell);
//        cell.setPhrase(new Phrase(contest.getPassedScreening(), FontFactory.getFont(FontFactory.HELVETICA, 12, Font.NORMAL, Color.black)));
//        stats.addCell(cell);
        cell.setPhrase(new Phrase("Passed %", FontFactory.getFont(FontFactory.HELVETICA, 12, Font.BOLD, Color.black)));
        stats.addCell(cell);
        cell.setPhrase(new Phrase(contest.getPassedPercentage(), FontFactory.getFont(FontFactory.HELVETICA, 12, Font.NORMAL, Color.black)));
        stats.addCell(cell);
        cell.setPhrase(new Phrase("Avg Initial Score", FontFactory.getFont(FontFactory.HELVETICA, 12, Font.BOLD, Color.black)));
        stats.addCell(cell);
        cell.setPhrase(new Phrase(contest.getAvgInitialScore(), FontFactory.getFont(FontFactory.HELVETICA, 12, Font.NORMAL, Color.black)));
        stats.addCell(cell);
        cell.setPhrase(new Phrase("Avg Final Score", FontFactory.getFont(FontFactory.HELVETICA, 12, Font.BOLD, Color.black)));
        stats.addCell(cell);
        cell.setPhrase(new Phrase(contest.getAvgFinalScore(), FontFactory.getFont(FontFactory.HELVETICA, 12, Font.NORMAL, Color.black)));
        stats.addCell(cell);

        ComponentCompetitorDetails[] details = contest.getCompetitorDetails();
        for (int i = 0; i < details.length; i++) {
            ComponentCompetitorDetails detail = details[i];
            if (detail.getUid() != uid) continue;
            cell.setPhrase(new Phrase(detail.getHandle() + "'s Initial Score", FontFactory.getFont(FontFactory.HELVETICA, 12, Font.BOLD, Color.black)));
            stats.addCell(cell);
            cell.setPhrase(new Phrase(detail.getInitialScore(), FontFactory.getFont(FontFactory.HELVETICA, 12, Font.NORMAL, Color.black)));
            stats.addCell(cell);
            cell.setPhrase(new Phrase(detail.getHandle() + "'s Final Score", FontFactory.getFont(FontFactory.HELVETICA, 12, Font.BOLD, Color.black)));
            stats.addCell(cell);
            cell.setPhrase(new Phrase(detail.getFinalScore(), FontFactory.getFont(FontFactory.HELVETICA, 12, Font.NORMAL, Color.black)));
            stats.addCell(cell);
            break;
        }

        page.addCell(stats);
        page.addCell(" ");

/*
        PdfPTable coders = new PdfPTable(7);
        coders.setWidthPercentage(100);
        coders.setWidths(new int[] {16,12,12,12,16,16,16});
        coders.getDefaultCell().setPadding(2);
        coders.getDefaultCell().setBorderWidth(1);
        coders.getDefaultCell().setHorizontalAlignment(Element.ALIGN_LEFT);

        cell = new PdfPCell(new Phrase(contest.getPhaseDescription() + " Contest Competitors", FontFactory.getFont(FontFactory.HELVETICA, 12, Font.BOLD, Color.black)));
        cell.setBorderWidth(0);
        cell.setColspan(7);
        coders.addCell(cell);

        cell = new PdfPCell(new Phrase("Handle", FontFactory.getFont(FontFactory.HELVETICA, 10, Font.BOLD, Color.black)));
        cell.setBackgroundColor(new Color(0xCC,0xCC,0xCC));
        cell.setHorizontalAlignment(Element.ALIGN_CENTER);
        cell.setBorderWidth(1);
        coders.addCell(cell);
//        cell.setPhrase(new Phrase("Date Inquired", FontFactory.getFont(FontFactory.HELVETICA, 10, Font.BOLD, Color.black)));
//        coders.addCell(cell);
//        cell.setPhrase(new Phrase("Date Submitted", FontFactory.getFont(FontFactory.HELVETICA, 10, Font.BOLD, Color.black)));
//        coders.addCell(cell);
        cell.setPhrase(new Phrase("Screening Score", FontFactory.getFont(FontFactory.HELVETICA, 10, Font.BOLD, Color.black)));
        coders.addCell(cell);
        cell.setPhrase(new Phrase("Initial Score", FontFactory.getFont(FontFactory.HELVETICA, 10, Font.BOLD, Color.black)));
        coders.addCell(cell);
        cell.setPhrase(new Phrase("Final Score", FontFactory.getFont(FontFactory.HELVETICA, 10, Font.BOLD, Color.black)));
        coders.addCell(cell);
        cell.setPhrase(new Phrase("Reviewer #1 (" + contest.getReviewer1() + ")", FontFactory.getFont(FontFactory.HELVETICA, 10, Font.BOLD, Color.black)));
        coders.addCell(cell);
        cell.setPhrase(new Phrase("Reviewer #2 (" + contest.getReviewer2() + ")", FontFactory.getFont(FontFactory.HELVETICA, 10, Font.BOLD, Color.black)));
        coders.addCell(cell);
        cell.setPhrase(new Phrase("Reviewer #3 (" + contest.getReviewer3() + ")", FontFactory.getFont(FontFactory.HELVETICA, 10, Font.BOLD, Color.black)));
        coders.addCell(cell);

        ComponentCompetitorDetails[] details = contest.getCompetitorDetails();
        for (int i = 0; i < details.length; i++) {
            ComponentCompetitorDetails detail = details[i];

            if (detail.getUid() == uid) {
                cell.setBackgroundColor(new Color(0xFF, 0xFF, 0x00));
            }
            else {
                cell.setBackgroundColor(new Color(0xFF, 0xFF, 0xFF));
            }

            cell.setPhrase(new Phrase(detail.getHandle(), FontFactory.getFont(FontFactory.HELVETICA, 10, Font.NORMAL, Color.black)));
            coders.addCell(cell);
//          cell.setPhrase(new Phrase(detail.getDateInquired(), FontFactory.getFont(FontFactory.HELVETICA, 10, Font.NORMAL, Color.black)));
//          coders.addCell(cell);
//          cell.setPhrase(new Phrase(detail.getDateSubmitted(), FontFactory.getFont(FontFactory.HELVETICA, 10, Font.NORMAL, Color.black)));
//          coders.addCell(cell);
            cell.setPhrase(new Phrase(detail.getScreeningScore(), FontFactory.getFont(FontFactory.HELVETICA, 10, Font.NORMAL, Color.black)));
            coders.addCell(cell);
            cell.setPhrase(new Phrase(detail.getInitialScore(), FontFactory.getFont(FontFactory.HELVETICA, 10, Font.NORMAL, Color.black)));
            coders.addCell(cell);
            cell.setPhrase(new Phrase(detail.getFinalScore(), FontFactory.getFont(FontFactory.HELVETICA, 10, Font.BOLD, Color.black)));
            coders.addCell(cell);
            cell.setPhrase(new Phrase(detail.getScore1(), FontFactory.getFont(FontFactory.HELVETICA, 10, Font.NORMAL, Color.black)));
            coders.addCell(cell);
            cell.setPhrase(new Phrase(detail.getScore2(), FontFactory.getFont(FontFactory.HELVETICA, 10, Font.NORMAL, Color.black)));
            coders.addCell(cell);
            cell.setPhrase(new Phrase(detail.getScore3(), FontFactory.getFont(FontFactory.HELVETICA, 10, Font.NORMAL, Color.black)));
            coders.addCell(cell);
        }

        page.addCell(coders);
        page.addCell(" ");
*/

        // sample diagram, for design only
        if (design) {
//            String documentUrl = contest.getDocumentUrl();
//            if (contest.getWinnerId() == uid && documentUrl != null) {
//                cell = new PdfPCell(new Phrase(info.getHandle() + "'s Class Diagram", FontFactory.getFont(FontFactory.HELVETICA, 12, Font.BOLD, Color.black)));
//                cell.setBorderWidth(0);
//                cell.setHorizontalAlignment(Element.ALIGN_LEFT);
//                page.addCell(cell);
//
//                cell = new PdfPCell(Image.getInstance(contest.getDocumentUrl()));
////                cell = new PdfPCell(Image.getInstance("http://www.dev.topcoder.com/i/home/TC_homeLogo.gif"));
//                cell.setBorderWidth(0);
//                page.addCell(cell);
//            }
        } else {
            // sample test case counts, for development only
            PdfPTable table = new PdfPTable(3);
            table.setWidthPercentage(100);
            table.getDefaultCell().setPadding(2);
            table.getDefaultCell().setBorderWidth(1);
            table.getDefaultCell().setHorizontalAlignment(Element.ALIGN_LEFT);

            cell = new PdfPCell(new Phrase("Test Case Results", FontFactory.getFont(FontFactory.HELVETICA, 12, Font.BOLD, Color.black)));
            cell.setColspan(3);
            cell.setBorderWidth(0);
            table.addCell(cell);

            cell = new PdfPCell(new Phrase("Test Case Type", FontFactory.getFont(FontFactory.HELVETICA, 12, Font.BOLD, Color.black)));
            cell.setBackgroundColor(new Color(0xCC, 0xCC, 0xCC));
            table.addCell(cell);
            cell.setPhrase(new Phrase("Tests Passed after Submission", FontFactory.getFont(FontFactory.HELVETICA, 12, Font.BOLD, Color.black)));
            table.addCell(cell);
            cell.setPhrase(new Phrase("Tests Passed after Completion", FontFactory.getFont(FontFactory.HELVETICA, 12, Font.BOLD, Color.black)));
            table.addCell(cell);
            cell.setBackgroundColor(new Color(0xFF, 0xFF, 0xFF));

            String unitBefore = contest.getUnitTestPassed() + " of " + contest.getUnitTestCount();
            String unitAfter = contest.getUnitTestCount() + " of " + contest.getUnitTestCount();
            String reviewBefore = contest.getReviewTestPassed() + " of " + contest.getReviewTestCount();
            String reviewAfter = contest.getReviewTestCount() + " of " + contest.getReviewTestCount();

            cell.setPhrase(new Phrase("Unit Tests", FontFactory.getFont(FontFactory.HELVETICA, 12, Font.NORMAL, Color.black)));
            table.addCell(cell);
            cell.setPhrase(new Phrase(unitBefore, FontFactory.getFont(FontFactory.HELVETICA, 12, Font.NORMAL, Color.black)));
            table.addCell(cell);
            cell.setPhrase(new Phrase(unitAfter, FontFactory.getFont(FontFactory.HELVETICA, 12, Font.NORMAL, Color.black)));
            table.addCell(cell);

            cell.setPhrase(new Phrase("Review Board Tests", FontFactory.getFont(FontFactory.HELVETICA, 12, Font.NORMAL, Color.black)));
            table.addCell(cell);
            cell.setPhrase(new Phrase(reviewBefore, FontFactory.getFont(FontFactory.HELVETICA, 12, Font.NORMAL, Color.black)));
            table.addCell(cell);
            cell.setPhrase(new Phrase(reviewAfter, FontFactory.getFont(FontFactory.HELVETICA, 12, Font.NORMAL, Color.black)));
            table.addCell(cell);

            page.addCell(table);
        }

        doc.add(page);
    }

    private void drawDesignOrDevelopmentPage(Document doc, ComponentCompetitionStats stats, String name, String command) throws Exception {
        GeneralStats gen = stats.getGeneral();

        PdfPTable page = new PdfPTable(1);
        page.setWidthPercentage(100);
        page.getDefaultCell().setBorderWidth(0);
        page.getDefaultCell().setPadding(0);

        PdfPCell header = new PdfPCell(new Phrase(name + " Competition Statistics\n(Based on " + gen.getCompetitions() + " Events)", FontFactory.getFont(FontFactory.HELVETICA, 12, Font.BOLD, Color.black)));
        header.setBorderWidth(0);
        header.setHorizontalAlignment(Element.ALIGN_CENTER);
        page.addCell(header);
        page.addCell(" ");

        PdfPTable top = new PdfPTable(2);
        top.setWidthPercentage(100);
        top.setWidths(new int[]{35, 65});

        top.getDefaultCell().setPadding(3);
        top.getDefaultCell().setBorderWidth(0);
        top.getDefaultCell().setHorizontalAlignment(Element.ALIGN_LEFT);
        top.getDefaultCell().setVerticalAlignment(Element.ALIGN_TOP);

        PdfPTable general = new PdfPTable(1);
        general.setWidthPercentage(100);
        general.getDefaultCell().setPadding(0);
        general.getDefaultCell().setBorderWidth(0);
        general.getDefaultCell().setHorizontalAlignment(Element.ALIGN_CENTER);

        PdfPTable inner = new PdfPTable(2);
        inner.setWidthPercentage(100);
        inner.getDefaultCell().setPadding(2);
        inner.getDefaultCell().setBorderWidth(1);
        inner.getDefaultCell().setHorizontalAlignment(Element.ALIGN_LEFT);

        PdfPCell cell = new PdfPCell(new Phrase("Overall Statistics", FontFactory.getFont(FontFactory.HELVETICA, 12, Font.BOLD, Color.black)));
        cell.setBackgroundColor(new Color(0xCC, 0xCC, 0xCC));
        cell.setHorizontalAlignment(Element.ALIGN_CENTER);
        cell.setBorderWidth(1);
        cell.setColspan(2);

        inner.addCell(cell);

        cell = new PdfPCell(new Phrase("Rating", FontFactory.getFont(FontFactory.HELVETICA, 12, Font.BOLD, Color.black)));
        cell.setHorizontalAlignment(Element.ALIGN_CENTER);
        cell.setBorderWidth(1);
        inner.addCell(cell);
        inner.addCell(new Phrase(gen.getRating(), FontFactory.getFont(FontFactory.HELVETICA, 12, Font.NORMAL, Color.black)));

//        cell = new PdfPCell(new Phrase("Volatility", FontFactory.getFont(FontFactory.HELVETICA, 12, Font.BOLD, Color.black)));
//        cell.setHorizontalAlignment(Element.ALIGN_CENTER);
//        cell.setBorderWidth(1);
//        inner.addCell(cell);
//        inner.addCell(new Phrase(gen.getVolatility(), FontFactory.getFont(FontFactory.HELVETICA, 12, Font.NORMAL, Color.black)));

//        cell = new PdfPCell(new Phrase("Competitions", FontFactory.getFont(FontFactory.HELVETICA, 12, Font.BOLD, Color.black)));
//        cell.setHorizontalAlignment(Element.ALIGN_CENTER);
//        cell.setBorderWidth(1);
//        inner.addCell(cell);
//        inner.addCell(new Phrase(gen.getCompetitions(), FontFactory.getFont(FontFactory.HELVETICA, 12, Font.NORMAL, Color.black)));

        cell = new PdfPCell(new Phrase("Max Rating", FontFactory.getFont(FontFactory.HELVETICA, 12, Font.BOLD, Color.black)));
        cell.setHorizontalAlignment(Element.ALIGN_CENTER);
        cell.setBorderWidth(1);
        inner.addCell(cell);
        inner.addCell(new Phrase(gen.getMaxRating(), FontFactory.getFont(FontFactory.HELVETICA, 12, Font.NORMAL, Color.black)));

//        cell = new PdfPCell(new Phrase("Min Rating", FontFactory.getFont(FontFactory.HELVETICA, 12, Font.BOLD, Color.black)));
//        cell.setHorizontalAlignment(Element.ALIGN_CENTER);
//        cell.setBorderWidth(1);
//        inner.addCell(cell);
//        inner.addCell(new Phrase(gen.getMinRating(), FontFactory.getFont(FontFactory.HELVETICA, 12, Font.NORMAL, Color.black)));

        cell = new PdfPCell(new Phrase("Rank", FontFactory.getFont(FontFactory.HELVETICA, 12, Font.BOLD, Color.black)));
        cell.setHorizontalAlignment(Element.ALIGN_CENTER);
        cell.setBorderWidth(1);
        inner.addCell(cell);
        inner.addCell(new Phrase(gen.getRank(), FontFactory.getFont(FontFactory.HELVETICA, 12, Font.NORMAL, Color.black)));

        cell = new PdfPCell(new Phrase("Rank %", FontFactory.getFont(FontFactory.HELVETICA, 12, Font.BOLD, Color.black)));
        cell.setHorizontalAlignment(Element.ALIGN_CENTER);
        cell.setBorderWidth(1);
        inner.addCell(cell);
        inner.addCell(new Phrase(gen.getPercentile(), FontFactory.getFont(FontFactory.HELVETICA, 12, Font.NORMAL, Color.black)));

        cell = new PdfPCell(new Phrase("Country Rank", FontFactory.getFont(FontFactory.HELVETICA, 12, Font.BOLD, Color.black)));
        cell.setHorizontalAlignment(Element.ALIGN_CENTER);
        cell.setBorderWidth(1);
        inner.addCell(cell);
        inner.addCell(new Phrase(gen.getCountryRank(), FontFactory.getFont(FontFactory.HELVETICA, 12, Font.NORMAL, Color.black)));

        cell = new PdfPCell(new Phrase("School Rank", FontFactory.getFont(FontFactory.HELVETICA, 12, Font.BOLD, Color.black)));
        cell.setHorizontalAlignment(Element.ALIGN_CENTER);
        cell.setBorderWidth(1);
        inner.addCell(cell);
        inner.addCell(new Phrase(gen.getSchoolRank(), FontFactory.getFont(FontFactory.HELVETICA, 12, Font.NORMAL, Color.black)));

        cell = new PdfPCell(new Phrase("Reliability", FontFactory.getFont(FontFactory.HELVETICA, 12, Font.BOLD, Color.black)));
        cell.setHorizontalAlignment(Element.ALIGN_CENTER);
        cell.setBorderWidth(1);
        inner.addCell(cell);
        inner.addCell(new Phrase(gen.getReliability(), FontFactory.getFont(FontFactory.HELVETICA, 12, Font.NORMAL, Color.black)));

//        cell = new PdfPCell(new Phrase("Earnings", FontFactory.getFont(FontFactory.HELVETICA, 12, Font.BOLD, Color.black)));
//        cell.setHorizontalAlignment(Element.ALIGN_CENTER);
//        cell.setBorderWidth(1);
//        inner.addCell(cell);
//        inner.addCell(new Phrase(gen.getEarnings(), FontFactory.getFont(FontFactory.HELVETICA, 12, Font.NORMAL, Color.black)));

        general.addCell(inner);
        general.addCell(" ");
        top.addCell(general);

        Image chart = Image.getInstance("http://" + ApplicationServer.SERVER_NAME + "/graph?c=" + command + "&width=600&height=400&rt=" + gen.getRating() + "&hn=" + info.getHandle());
        top.addCell(chart);

        page.addCell(top);
        page.addCell(" ");

        PdfPTable bottom = new PdfPTable(4);
        bottom.setWidthPercentage(100);
        bottom.setWidths(new int[]{34, 22, 22, 22});
        bottom.getDefaultCell().setPadding(2);
        bottom.getDefaultCell().setBorderWidth(1);
        bottom.getDefaultCell().setHorizontalAlignment(Element.ALIGN_LEFT);

        cell = new PdfPCell(new Phrase("Lifetime Competition Statistics", FontFactory.getFont(FontFactory.HELVETICA, 12, Font.BOLD, Color.black)));
        cell.setBorderWidth(0);
        cell.setColspan(4);
        bottom.addCell(cell);

        cell = new PdfPCell(new Phrase(" ", FontFactory.getFont(FontFactory.HELVETICA, 12, Font.BOLD, Color.black)));
        cell.setBackgroundColor(new Color(0xCC, 0xCC, 0xCC));
        cell.setHorizontalAlignment(Element.ALIGN_CENTER);
        cell.setBorderWidth(1);
        bottom.addCell(cell);
        cell.setPhrase(new Phrase("Java", FontFactory.getFont(FontFactory.HELVETICA, 12, Font.BOLD, Color.black)));
        bottom.addCell(cell);
        cell.setPhrase(new Phrase(".NET", FontFactory.getFont(FontFactory.HELVETICA, 12, Font.BOLD, Color.black)));
        bottom.addCell(cell);
        cell.setPhrase(new Phrase("Total", FontFactory.getFont(FontFactory.HELVETICA, 12, Font.BOLD, Color.black)));
        bottom.addCell(cell);

        SubmissionDetails java = stats.getJava();
        SubmissionDetails net = stats.getDotNet();
        SubmissionDetails total = stats.getTotal();

        // Inquiries
//        cell = new PdfPCell(new Phrase("Inquiries", FontFactory.getFont(FontFactory.HELVETICA, 12, Font.BOLD, Color.black)));
//        cell.setHorizontalAlignment(Element.ALIGN_CENTER);
//        cell.setBorderWidth(1);
//        bottom.addCell(cell);
//        bottom.addCell(new Phrase(java.getInquiries(), FontFactory.getFont(FontFactory.HELVETICA, 12, Font.NORMAL, Color.black)));
//        bottom.addCell(new Phrase(net.getInquiries(), FontFactory.getFont(FontFactory.HELVETICA, 12, Font.NORMAL, Color.black)));
//        bottom.addCell(new Phrase(total.getInquiries(), FontFactory.getFont(FontFactory.HELVETICA, 12, Font.NORMAL, Color.black)));

        // Submissions
        cell = new PdfPCell(new Phrase("Submissions", FontFactory.getFont(FontFactory.HELVETICA, 12, Font.BOLD, Color.black)));
        cell.setHorizontalAlignment(Element.ALIGN_CENTER);
        cell.setBorderWidth(1);
        bottom.addCell(cell);
        bottom.addCell(new Phrase(java.getSubmissions(), FontFactory.getFont(FontFactory.HELVETICA, 12, Font.NORMAL, Color.black)));
        bottom.addCell(new Phrase(net.getSubmissions(), FontFactory.getFont(FontFactory.HELVETICA, 12, Font.NORMAL, Color.black)));
        bottom.addCell(new Phrase(total.getSubmissions(), FontFactory.getFont(FontFactory.HELVETICA, 12, Font.NORMAL, Color.black)));

        // Submission Rate
        cell = new PdfPCell(new Phrase("Submission Rate", FontFactory.getFont(FontFactory.HELVETICA, 12, Font.BOLD, Color.black)));
        cell.setHorizontalAlignment(Element.ALIGN_CENTER);
        cell.setBorderWidth(1);
        bottom.addCell(cell);
        bottom.addCell(new Phrase(java.getSubmissionRate(), FontFactory.getFont(FontFactory.HELVETICA, 12, Font.NORMAL, Color.black)));
        bottom.addCell(new Phrase(net.getSubmissionRate(), FontFactory.getFont(FontFactory.HELVETICA, 12, Font.NORMAL, Color.black)));
        bottom.addCell(new Phrase(total.getSubmissionRate(), FontFactory.getFont(FontFactory.HELVETICA, 12, Font.NORMAL, Color.black)));

        // Passed Screening
//        cell = new PdfPCell(new Phrase("Passed Screening", FontFactory.getFont(FontFactory.HELVETICA, 12, Font.BOLD, Color.black)));
//        cell.setHorizontalAlignment(Element.ALIGN_CENTER);
//        cell.setBorderWidth(1);
//        bottom.addCell(cell);
//        bottom.addCell(new Phrase(java.getPassedScreening(), FontFactory.getFont(FontFactory.HELVETICA, 12, Font.NORMAL, Color.black)));
//        bottom.addCell(new Phrase(net.getPassedScreening(), FontFactory.getFont(FontFactory.HELVETICA, 12, Font.NORMAL, Color.black)));
//        bottom.addCell(new Phrase(total.getPassedScreening(), FontFactory.getFont(FontFactory.HELVETICA, 12, Font.NORMAL, Color.black)));

        // Screening Success Rate
        cell = new PdfPCell(new Phrase("Screening Success Rate", FontFactory.getFont(FontFactory.HELVETICA, 12, Font.BOLD, Color.black)));
        cell.setHorizontalAlignment(Element.ALIGN_CENTER);
        cell.setBorderWidth(1);
        bottom.addCell(cell);
        bottom.addCell(new Phrase(java.getScreeningSuccessRate(), FontFactory.getFont(FontFactory.HELVETICA, 12, Font.NORMAL, Color.black)));
        bottom.addCell(new Phrase(net.getScreeningSuccessRate(), FontFactory.getFont(FontFactory.HELVETICA, 12, Font.NORMAL, Color.black)));
        bottom.addCell(new Phrase(total.getScreeningSuccessRate(), FontFactory.getFont(FontFactory.HELVETICA, 12, Font.NORMAL, Color.black)));

        // Passed Review
//        cell = new PdfPCell(new Phrase("Passed Review", FontFactory.getFont(FontFactory.HELVETICA, 12, Font.BOLD, Color.black)));
//        cell.setHorizontalAlignment(Element.ALIGN_CENTER);
//        cell.setBorderWidth(1);
//        bottom.addCell(cell);
//        bottom.addCell(new Phrase(java.getPassedReview(), FontFactory.getFont(FontFactory.HELVETICA, 12, Font.NORMAL, Color.black)));
//        bottom.addCell(new Phrase(net.getPassedReview(), FontFactory.getFont(FontFactory.HELVETICA, 12, Font.NORMAL, Color.black)));
//        bottom.addCell(new Phrase(total.getPassedReview(), FontFactory.getFont(FontFactory.HELVETICA, 12, Font.NORMAL, Color.black)));

        // Review Success Rate
        cell = new PdfPCell(new Phrase("Review Success Rate", FontFactory.getFont(FontFactory.HELVETICA, 12, Font.BOLD, Color.black)));
        cell.setHorizontalAlignment(Element.ALIGN_CENTER);
        cell.setBorderWidth(1);
        bottom.addCell(cell);
        bottom.addCell(new Phrase(java.getReviewSuccessRate(), FontFactory.getFont(FontFactory.HELVETICA, 12, Font.NORMAL, Color.black)));
        bottom.addCell(new Phrase(net.getReviewSuccessRate(), FontFactory.getFont(FontFactory.HELVETICA, 12, Font.NORMAL, Color.black)));
        bottom.addCell(new Phrase(total.getReviewSuccessRate(), FontFactory.getFont(FontFactory.HELVETICA, 12, Font.NORMAL, Color.black)));

        // Maximum Score
//        cell = new PdfPCell(new Phrase("Maximum Score", FontFactory.getFont(FontFactory.HELVETICA, 12, Font.BOLD, Color.black)));
//        cell.setHorizontalAlignment(Element.ALIGN_CENTER);
//        cell.setBorderWidth(1);
//        bottom.addCell(cell);
//        bottom.addCell(new Phrase(java.getMaximumScore(), FontFactory.getFont(FontFactory.HELVETICA, 12, Font.NORMAL, Color.black)));
//        bottom.addCell(new Phrase(net.getMaximumScore(), FontFactory.getFont(FontFactory.HELVETICA, 12, Font.NORMAL, Color.black)));
//        bottom.addCell(new Phrase(total.getMaximumScore(), FontFactory.getFont(FontFactory.HELVETICA, 12, Font.NORMAL, Color.black)));

        // Minimum Score
//        cell = new PdfPCell(new Phrase("Minimum Score", FontFactory.getFont(FontFactory.HELVETICA, 12, Font.BOLD, Color.black)));
//        cell.setHorizontalAlignment(Element.ALIGN_CENTER);
//        cell.setBorderWidth(1);
//        bottom.addCell(cell);
//        bottom.addCell(new Phrase(java.getMinimumScore(), FontFactory.getFont(FontFactory.HELVETICA, 12, Font.NORMAL, Color.black)));
//        bottom.addCell(new Phrase(net.getMinimumScore(), FontFactory.getFont(FontFactory.HELVETICA, 12, Font.NORMAL, Color.black)));
//        bottom.addCell(new Phrase(total.getMinimumScore(), FontFactory.getFont(FontFactory.HELVETICA, 12, Font.NORMAL, Color.black)));

        // Average Score
        cell = new PdfPCell(new Phrase("Average Score", FontFactory.getFont(FontFactory.HELVETICA, 12, Font.BOLD, Color.black)));
        cell.setHorizontalAlignment(Element.ALIGN_CENTER);
        cell.setBorderWidth(1);
        bottom.addCell(cell);
        bottom.addCell(new Phrase(java.getAverageScore(), FontFactory.getFont(FontFactory.HELVETICA, 12, Font.NORMAL, Color.black)));
        bottom.addCell(new Phrase(net.getAverageScore(), FontFactory.getFont(FontFactory.HELVETICA, 12, Font.NORMAL, Color.black)));
        bottom.addCell(new Phrase(total.getAverageScore(), FontFactory.getFont(FontFactory.HELVETICA, 12, Font.NORMAL, Color.black)));

        // Average Placement
        cell = new PdfPCell(new Phrase("Average Placement", FontFactory.getFont(FontFactory.HELVETICA, 12, Font.BOLD, Color.black)));
        cell.setHorizontalAlignment(Element.ALIGN_CENTER);
        cell.setBorderWidth(1);
        bottom.addCell(cell);
        bottom.addCell(new Phrase(java.getAveragePlacement(), FontFactory.getFont(FontFactory.HELVETICA, 12, Font.NORMAL, Color.black)));
        bottom.addCell(new Phrase(net.getAveragePlacement(), FontFactory.getFont(FontFactory.HELVETICA, 12, Font.NORMAL, Color.black)));
        bottom.addCell(new Phrase(total.getAveragePlacement(), FontFactory.getFont(FontFactory.HELVETICA, 12, Font.NORMAL, Color.black)));

        // Wins
//        cell = new PdfPCell(new Phrase("Wins", FontFactory.getFont(FontFactory.HELVETICA, 12, Font.BOLD, Color.black)));
//        cell.setHorizontalAlignment(Element.ALIGN_CENTER);
//        cell.setBorderWidth(1);
//        bottom.addCell(cell);
//        bottom.addCell(new Phrase(java.getWins(), FontFactory.getFont(FontFactory.HELVETICA, 12, Font.NORMAL, Color.black)));
//        bottom.addCell(new Phrase(net.getWins(), FontFactory.getFont(FontFactory.HELVETICA, 12, Font.NORMAL, Color.black)));
//        bottom.addCell(new Phrase(total.getWins(), FontFactory.getFont(FontFactory.HELVETICA, 12, Font.NORMAL, Color.black)));

        // Win Percentage
        cell = new PdfPCell(new Phrase("Win Percentage", FontFactory.getFont(FontFactory.HELVETICA, 12, Font.BOLD, Color.black)));
        cell.setHorizontalAlignment(Element.ALIGN_CENTER);
        cell.setBorderWidth(1);
        bottom.addCell(cell);
        bottom.addCell(new Phrase(java.getWinPercentage(), FontFactory.getFont(FontFactory.HELVETICA, 12, Font.NORMAL, Color.black)));
        bottom.addCell(new Phrase(net.getWinPercentage(), FontFactory.getFont(FontFactory.HELVETICA, 12, Font.NORMAL, Color.black)));
        bottom.addCell(new Phrase(total.getWinPercentage(), FontFactory.getFont(FontFactory.HELVETICA, 12, Font.NORMAL, Color.black)));

        page.addCell(bottom);

        doc.add(page);
    }

    private PlacementConfig getConfig() throws Exception {
        int uid = Integer.parseInt(StringUtils.checkNull(getRequest().getParameter("uid")));

        PlacementConfig config = new PlacementConfig();

        config.setUserID(uid);

        InitialContext ctx = TCContext.getInitial();
        User userbean = (User) createEJB(ctx, User.class);

        config.setHandle(userbean.getHandle(uid, DBMS.COMMON_OLTP_DATASOURCE_NAME));
        config.setName(userbean.getFirstName(uid, DBMS.COMMON_OLTP_DATASOURCE_NAME) + " " + userbean.getLastName(uid, DBMS.COMMON_OLTP_DATASOURCE_NAME));

        config.setPresentedBy(StringUtils.checkNull(getRequest().getParameter("presentedBy")));
        config.setPresentedByEmail(StringUtils.checkNull(getRequest().getParameter("presentedByEmail")));

        if (getRequest() instanceof MultipartRequest) {
            MultipartRequest request = (MultipartRequest) getRequest();
            config.setCompanyLogo(request.getUploadedFile("logo"));
            if (log.isDebugEnabled()) {
                if (config.getCompanyLogo()==null) {
                    log.debug("company logo is null");
                } else {
                    log.debug("company logo is not null");
                }
            }
        }

        //load skills
        CoderSkill skillbean = (CoderSkill) createEJB(ctx, CoderSkill.class);

        Request r = new Request();
        r.setContentHandle("skill_types");

        ResultSetContainer rsc = (ResultSetContainer) getDataAccess().getData(r).get("skill_types");
        for (int i = 0; i < rsc.size(); i++) {
            ResultSetContainer rscSkills = skillbean.getSkillsByType(config.getUserID(), rsc.getIntItem(i, "skill_type_id"), DBMS.OLTP_DATASOURCE_NAME);
            for (int j = 0; j < rscSkills.size(); j++) {
                int sid = rscSkills.getIntItem(j, "skill_id");

                if (Arrays.asList(getRequest().getParameterValues("skills")).contains(String.valueOf(sid))) {
                    Skill s = new Skill();
                    s.setID(sid);
                    s.setText(rscSkills.getStringItem(j, "skill_desc"));

                    config.createSkill(rsc.getStringItem(i, "skill_type_desc"), s, rscSkills.getIntItem(j, "ranking"));
                }
            }
        }


        Map data = null;
        GeneralStats general = null;
        ComponentContestDetails example = null;

        // load algorithm competition stats
        r = new Request();
        r.setContentHandle("Coder_Alg_Data");
        r.setProperty("cr", Integer.toString(uid));
        data = getDWDataAccess().getData(r);

        general = getGeneralStats((ResultSetContainer) data.get("Coder_Alg_Data"), true);
        if (general != null) {
            config.setAlgorithm(general);
        }

        // load design competition stats
        String component = getRequest().getParameter("design_component");
        if (component != null && component.trim().length() > 0) {
            r = new Request();
            r.setContentHandle("Coder_Des_Data");
            r.setProperty("cr", Integer.toString(uid));
            r.setProperty(Constants.PHASE_ID, String.valueOf(SoftwareComponent.DESIGN_PHASE));
            data = getDWDataAccess().getData(r);

            general = getGeneralStats((ResultSetContainer) data.get("Coder_Des_Data"), false);
            if (general != null) { // null if have not competed
                ComponentCompetitionStats design = new ComponentCompetitionStats();
                design.setGeneral(general);
                design.setJava(getSubmissionDetails((ResultSetContainer) data.get("Component_Submission_Details_Java")));
                design.setDotNet(getSubmissionDetails((ResultSetContainer) data.get("Component_Submission_Details_NET")));
                design.setTotal(getSubmissionDetails((ResultSetContainer) data.get("Component_Submission_Details_Total")));
                config.setDesign(design);

                // load design project info
                r = new Request();
                r.setContentHandle("comp_contest_details");
                r.setProperty("pj", StringUtils.checkNull(getRequest().getParameter("design_component")));
                data = getTCSDWDataAccess().getData(r);

                ResultSetContainer projectInfo = (ResultSetContainer) data.get("project_info");
                ResultSetContainer submissions = (ResultSetContainer) data.get("submissions");
                ResultSetContainer reviewers = (ResultSetContainer) data.get("reviewers_for_project");

                r = new Request();
                r.setContentHandle("example_component_info");
                r.setProperty("pj", StringUtils.checkNull(getRequest().getParameter("design_component")));
                data = getTCSCatalogDataAccess().getData(r);

                ResultSetContainer documentation = (ResultSetContainer) data.get("example_component_info");

                example = getComponentContestDetails(uid, userbean, projectInfo, submissions, reviewers, documentation);
                config.setDesignExample(example);
            }
        }

        // load development competition stats
        component = getRequest().getParameter("development_component");
        if (component != null && component.trim().length() > 0) {
            r = new Request();
            r.setContentHandle("Coder_Dev_Data");
            r.setProperty("cr", Integer.toString(uid));
            r.setProperty(Constants.PHASE_ID, String.valueOf(SoftwareComponent.DEV_PHASE));
            data = getDWDataAccess().getData(r);

            general = getGeneralStats((ResultSetContainer) data.get("Coder_Dev_Data"), false);
            if (general != null) { // null if have not competed
                ComponentCompetitionStats development = new ComponentCompetitionStats();
                development.setGeneral(general);
                development.setJava(getSubmissionDetails((ResultSetContainer) data.get("Component_Submission_Details_Java")));
                development.setDotNet(getSubmissionDetails((ResultSetContainer) data.get("Component_Submission_Details_NET")));
                development.setTotal(getSubmissionDetails((ResultSetContainer) data.get("Component_Submission_Details_Total")));
                config.setDevelopment(development);

                // load development project info
                r = new Request();
                r.setContentHandle("comp_contest_details");
                r.setProperty("pj", StringUtils.checkNull(getRequest().getParameter("development_component")));
                data = getTCSDWDataAccess().getData(r);

                ResultSetContainer projectInfo = (ResultSetContainer) data.get("project_info");
                ResultSetContainer submissions = (ResultSetContainer) data.get("submissions");
                ResultSetContainer reviewers = (ResultSetContainer) data.get("reviewers_for_project");

                r = new Request();
                r.setContentHandle("example_component_info");
                r.setProperty("pj", StringUtils.checkNull(getRequest().getParameter("development_component")));
                data = getTCSCatalogDataAccess().getData(r);

                ResultSetContainer documentation = (ResultSetContainer) data.get("example_component_info");

                example = getComponentContestDetails(uid, userbean, projectInfo, submissions, reviewers, documentation);

                r = new Request();
                r.setContentHandle("testcase_results");
                r.setProperty("pj", StringUtils.checkNull(getRequest().getParameter("development_component")));
                r.setProperty("cr", Integer.toString(example.getWinnerId()));
                data = getTCSDWDataAccess().getData(r);

                ResultSetContainer reviewTests = (ResultSetContainer) data.get("review_board_tests");
                ResultSetContainer unitTests = (ResultSetContainer) data.get("unit_tests");

                if (reviewTests.getRowCount() > 0) {
                    if (reviewTests.getItem(0, "num_tests").getResultData() != null) {
                        example.setReviewTestCount(reviewTests.getIntItem(0, "num_tests"));
                    }
                    if (reviewTests.getItem(0, "num_passed").getResultData() != null) {
                        example.setReviewTestPassed(reviewTests.getIntItem(0, "num_passed"));
                    }
                }

                if (unitTests.getRowCount() > 0) {
                    if (unitTests.getItem(0, "num_tests").getResultData() != null) {
                        example.setUnitTestCount(unitTests.getIntItem(0, "num_tests"));
                    }
                    if (unitTests.getItem(0, "num_passed").getResultData() != null) {
                        example.setUnitTestPassed(unitTests.getIntItem(0, "num_passed"));
                    }
                }

                config.setDevelopmentExample(example);
            }
        }

        //load competition stats
        r = new Request();
        r.setContentHandle("placement_profile_stats");
        r.setProperty("cr", String.valueOf(uid));

        DecimalFormat formatter = new DecimalFormat("#.##");

        rsc = (ResultSetContainer) getDWDataAccess().getData(r).get("placement_profile_stats");

        config.setNumContests(rsc.getStringItem(0, "num_ratings"));
        config.setRating(rsc.getIntItem(0, "rating"));
        config.setRank(rsc.getStringItem(0, "rank") + " of " + rsc.getStringItem(0, "lowest_rank"));
        config.setRankPercentile(formatter.format(rsc.getDoubleItem(0, "percentile")) + "%");

        config.setTotalChallenged(rsc.getStringItem(0, "challenge_attempts_made"));

        if (rsc.getIntItem(0, "challenge_attempts_made") == 0) {
            config.setChallengeSuccessRatio("N/A");
        } else {
            config.setChallengeSuccessRatio(formatter.format(rsc.getDoubleItem(0, "challenges_made_successful") / rsc.getDoubleItem(0, "challenge_attempts_made") * 100.0) + "%");
        }

        config.setSubmissionRatio(rsc.getStringItem(0, "problems_submitted") + " of " + rsc.getStringItem(0, "problems_presented") + " (" + formatter.format(rsc.getDoubleItem(0, "problems_submitted") / rsc.getDoubleItem(0, "problems_presented") * 100.0) + "%)");
        config.setSubmissionSuccessRatio(rsc.getStringItem(0, "problems_correct") + " of " + rsc.getStringItem(0, "problems_submitted") + " (" + formatter.format(rsc.getDoubleItem(0, "problems_correct") / rsc.getDoubleItem(0, "problems_submitted") * 100.0) + "%)");

        //load problem stats
        int cid = Integer.parseInt(StringUtils.checkNull(getRequest().getParameter("component")));

        //load solution?
        r = new Request();
        r.setContentHandle("placement_problem_details");
        r.setProperty("cr", String.valueOf(uid));
        r.setProperty("pm", String.valueOf(cid));

        rsc = (ResultSetContainer) getDWDataAccess().getData(r).get("placement_problem_details");
        config.setProblemName(rsc.getStringItem(0, "desc"));
        config.setAvgTimeToSubmit(formatTime(rsc.getIntItem(0, "avg_time")));
        config.setSubmissionPercent(formatter.format(rsc.getDoubleItem(0, "problems_submitted") / rsc.getDoubleItem(0, "coder_count") * 100.0) + "%");
        config.setSuccessfulSubmissionPercent(formatter.format(rsc.getDoubleItem(0, "problems_correct") * 100.0) + "%");
        config.setSubmissionTime(formatTime(rsc.getIntItem(0, "time_elapsed")));
        config.setSubmissionText(rsc.getStringItem(0, "submission_text"));

        ProblemComponent[] arrProblemComponent = new ProblemComponent[1];
        arrProblemComponent[0] = new ProblemComponentFactory().build(rsc.getStringItem(0, "problem_text"), true);
        Problem problem = new Problem();
        problem.setProblemComponents(arrProblemComponent);

        config.setProblem(problem);

        if (rsc.getIntItem(0, "language_id") == 1) {
            config.setLanguage(JavaLanguage.JAVA_LANGUAGE);
        } else if (rsc.getIntItem(0, "language_id") == 3) {
            config.setLanguage(CPPLanguage.CPP_LANGUAGE);
        } else if (rsc.getIntItem(0, "language_id") == 4) {
            config.setLanguage(CSharpLanguage.CSHARP_LANGUAGE);
        } else if (rsc.getIntItem(0, "language_id") == 5) {
            config.setLanguage(VBLanguage.VB_LANGUAGE);
        }

        return config;
    }

    private ComponentContestDetails getComponentContestDetails(int uid, User user, ResultSetContainer info, ResultSetContainer submissions, ResultSetContainer reviewers, ResultSetContainer documentation) {
        if (info.getRowCount() > 0) {
            ComponentContestDetails result = new ComponentContestDetails();
            DecimalFormat formatter = new DecimalFormat("#.##");

            if (documentation.getRowCount() > 0) {
                if (documentation.getItem(0, "component_id").getResultData() != null) {
                    result.setComponentId(documentation.getIntItem(0, "component_id"));
                }
                if (documentation.getItem(0, "version").getResultData() != null) {
                    result.setComponentVersion(documentation.getIntItem(0, "version"));
                }
                if (documentation.getItem(0, "description").getResultData() != null) {
                    result.setComponentOverview(documentation.getStringItem(0, "description"));
                }
                if (documentation.getItem(0, "function_desc").getResultData() != null) {
                    result.setComponentFunctionality(documentation.getStringItem(0, "function_desc"));
                }
                if (documentation.getItem(0, "winner_id").getResultData() != null) {
                    result.setWinnerId(documentation.getIntItem(0, "winner_id"));
                }
                if (documentation.getItem(0, "document_id").getResultData() != null) {
                    int documentId = documentation.getIntItem(0, "document_id");
                    String documentUrl = "http://" + ApplicationServer.SOFTWARE_SERVER_NAME + "/catalog/document?id=" + documentId;
//                  String documentUrl = "http://software.topcoder.com/catalog/document?id=" + documentId;
                    result.setDocumentUrl(documentUrl);
                }
            }

            if (info.getItem(0, "phase_desc").getResultData() != null) {
                result.setPhaseDescription(info.getStringItem(0, "phase_desc"));
            }
            if (info.getItem(0, "component_name").getResultData() != null) {
                result.setComponent(info.getStringItem(0, "component_name"));
            }
            if (info.getItem(0, "category_desc").getResultData() != null) {
                result.setCatalog(info.getStringItem(0, "category_desc"));
            }
            if (info.getItem(0, "num_inquiries").getResultData() != null) {
                result.setRegistrants(Integer.toString(info.getIntItem(0, "num_inquiries")));
            }
            if (info.getItem(0, "num_submissions").getResultData() != null) {
                result.setSubmissions(Integer.toString(info.getIntItem(0, "num_submissions")));
            }
            if (info.getItem(0, "submission_percent").getResultData() != null) {
                result.setSubmissionPercentage(DecimalFormat.getPercentInstance().format(info.getDoubleItem(0, "submission_percent") / 100.0));
            }
            if (info.getItem(0, "passed").getResultData() != null) {
                result.setPassedScreening(Integer.toString(info.getIntItem(0, "passed")));
            }
            if (info.getItem(0, "passed_percent").getResultData() != null) {
                result.setPassedPercentage(DecimalFormat.getPercentInstance().format(info.getDoubleItem(0, "passed_percent") / 100.0));
            }
            if (info.getItem(0, "avg_raw_score").getResultData() != null) {
                result.setAvgInitialScore(formatter.format(info.getDoubleItem(0, "avg_raw_score")));
            }
            if (info.getItem(0, "avg_final_score").getResultData() != null) {
                result.setAvgFinalScore(formatter.format(info.getDoubleItem(0, "avg_final_score")));
            }

            if (reviewers.getRowCount() > 0 && reviewers.getItem(0, "reviewer_id").getResultData() != null) {
                int reviewer1 = reviewers.getIntItem(0, "reviewer_id");
                try {
                    result.setReviewer1(user.getHandle(reviewer1, DBMS.COMMON_OLTP_DATASOURCE_NAME));
                }
                catch (RemoteException e) {
                }
            }

            if (reviewers.getRowCount() > 1 && reviewers.getItem(1, "reviewer_id").getResultData() != null) {
                int reviewer2 = reviewers.getIntItem(1, "reviewer_id");
                try {
                    result.setReviewer2(user.getHandle(reviewer2, DBMS.COMMON_OLTP_DATASOURCE_NAME));
                }
                catch (RemoteException e) {
                }
            }

            if (reviewers.getRowCount() > 2 && reviewers.getItem(2, "reviewer_id").getResultData() != null) {
                int reviewer3 = reviewers.getIntItem(2, "reviewer_id");
                try {
                    result.setReviewer3(user.getHandle(reviewer3, DBMS.COMMON_OLTP_DATASOURCE_NAME));
                }
                catch (RemoteException e) {
                }
            }

            // get info for each submission
            int n = submissions.getRowCount();
            for (int i = 0; i < n; i++) {
                ComponentCompetitorDetails row = getComponentCompetitorDetails(user, submissions, i);
                result.addCompetitorDetails(row);
            }

            if (log.isDebugEnabled()) {
                log.debug(result);
            }

            return result;
        }
        return null;
    }

    private ComponentCompetitorDetails getComponentCompetitorDetails(User user, ResultSetContainer rsc, int index) {
        ComponentCompetitorDetails result = new ComponentCompetitorDetails();
        DecimalFormat formatter = new DecimalFormat("#.##");

        if (rsc.getItem(index, "user_id").getResultData() != null) {
            int uid = rsc.getIntItem(index, "user_id");
            result.setUid(uid);
            try {
                String handle = user.getHandle(uid, DBMS.COMMON_OLTP_DATASOURCE_NAME);
                result.setHandle(handle);
            }
            catch (RemoteException e) {
            }
        }
        if (rsc.getItem(index, "screening_score").getResultData() != null) {
            result.setScreeningScore(formatter.format(rsc.getDoubleItem(index, "screening_score")));
        }
        if (rsc.getItem(index, "initial_score").getResultData() != null) {
            result.setInitialScore(formatter.format(rsc.getDoubleItem(index, "initial_score")));
        }
        if (rsc.getItem(index, "final_score").getResultData() != null) {
            result.setFinalScore(formatter.format(rsc.getDoubleItem(index, "final_score")));
        }
        if (rsc.getItem(index, "score1").getResultData() != null) {
            result.setScore1(formatter.format(rsc.getDoubleItem(index, "score1")));
        }
        if (rsc.getItem(index, "score2").getResultData() != null) {
            result.setScore2(formatter.format(rsc.getDoubleItem(index, "score2")));
        }
        if (rsc.getItem(index, "score3").getResultData() != null) {
            result.setScore3(formatter.format(rsc.getDoubleItem(index, "score3")));
        }


        if (log.isDebugEnabled()) {
            log.debug(result);
        }
        return result;
    }

    private GeneralStats getGeneralStats(ResultSetContainer rsc, boolean algo) {
        if (rsc.getRowCount() > 0) {
            GeneralStats result = new GeneralStats();
            DecimalFormat formatter = new DecimalFormat("#.##");

            if (rsc.getItem(0, "rating").getResultData() != null) {
                result.setRating(Integer.toString(rsc.getIntItem(0, "rating")));
            }
            if (rsc.getItem(0, "num_ratings").getResultData() != null) {
                result.setCompetitions(rsc.getStringItem(0, "num_ratings"));
            }
            if (algo && rsc.getItem(0, "highest_rating").getResultData() != null) {
                result.setMaxRating(rsc.getStringItem(0, "highest_rating"));
            }
            if (algo && rsc.getItem(0, "lowest_rating").getResultData() != null) {
                result.setMinRating(rsc.getStringItem(0, "lowest_rating"));
            }
            if (!algo && rsc.getItem(0, "max_rating").getResultData() != null) {
                result.setMaxRating(rsc.getStringItem(0, "max_rating"));
            }
            if (!algo && rsc.getItem(0, "min_rating").getResultData() != null) {
                result.setMinRating(rsc.getStringItem(0, "min_rating"));
            }
            if (rsc.getItem(0, "vol").getResultData() != null) {
                result.setVolatility(Integer.toString(rsc.getIntItem(0, "vol")));
            }

            String rank = null;
            String numRanked = null;

            rank = rsc.getStringItem(0, "rank");
            numRanked = rsc.getStringItem(0, "num_ranked");
            if (rank != null && numRanked != null) {
                result.setRank(rank + " of " + numRanked);
            }

            rank = rsc.getStringItem(0, "country_rank");
            numRanked = rsc.getStringItem(0, "num_country_ranked");
            if (rank != null && numRanked != null) {
                result.setCountryRank(rank + " of " + numRanked);
            }

            rank = rsc.getStringItem(0, "school_rank");
            numRanked = rsc.getStringItem(0, "num_school_ranked");
            if (rank != null && numRanked != null) {
                result.setSchoolRank(rank + " of " + numRanked);
            }

            if (rsc.getItem(0, "percentile").getResultData() != null) {
                result.setPercentile(formatter.format(rsc.getDoubleItem(0, "percentile")));
            }
            if (rsc.getItem(0, "earnings").getResultData() != null) {
                result.setEarnings(DecimalFormat.getCurrencyInstance().format(rsc.getDoubleItem(0, "earnings")));
            }
            if (!algo && rsc.getItem(0, "reliability").getResultData() != null) {
                result.setReliability(DecimalFormat.getPercentInstance().format(rsc.getDoubleItem(0, "reliability")));
            }

            if (log.isDebugEnabled()) {
                log.debug(result);
            }

            return result;
        }

        return null; // no statistics available
    }

    private SubmissionDetails getSubmissionDetails(ResultSetContainer rsc) {
        SubmissionDetails result = new SubmissionDetails();
        DecimalFormat formatter = new DecimalFormat("#.##");

        if (rsc.getRowCount() > 0) {
            if (rsc.getItem(0, "inquiry_count").getResultData() != null) {
                result.setInquiries(Integer.toString(rsc.getIntItem(0, "inquiry_count")));
            }
            if (rsc.getItem(0, "submit_count").getResultData() != null) {
                result.setSubmissions(Integer.toString(rsc.getIntItem(0, "submit_count")));
            }
            if (rsc.getItem(0, "passed_screening_count").getResultData() != null) {
                result.setPassedScreening(Integer.toString(rsc.getIntItem(0, "passed_screening_count")));
            }
            if (rsc.getItem(0, "passed_review_count").getResultData() != null) {
                result.setPassedReview(Integer.toString(rsc.getIntItem(0, "passed_review_count")));
            }
            if (rsc.getItem(0, "wins").getResultData() != null) {
                result.setWins(Integer.toString(rsc.getIntItem(0, "wins")));
            }
            if (rsc.getItem(0, "submit_percent").getResultData() != null) {
                result.setSubmissionRate(DecimalFormat.getPercentInstance().format(rsc.getDoubleItem(0, "submit_percent")));
            }
            if (rsc.getItem(0, "passed_screening_percent").getResultData() != null) {
                result.setScreeningSuccessRate(DecimalFormat.getPercentInstance().format(rsc.getDoubleItem(0, "passed_screening_percent")));
            }
            if (rsc.getItem(0, "review_percent").getResultData() != null) {
                result.setReviewSuccessRate(DecimalFormat.getPercentInstance().format(rsc.getDoubleItem(0, "review_percent")));
            }
            if (rsc.getItem(0, "win_percent").getResultData() != null) {
                result.setWinPercentage(DecimalFormat.getPercentInstance().format(rsc.getDoubleItem(0, "win_percent")));
            }
            if (rsc.getItem(0, "max_score").getResultData() != null) {
                result.setMaximumScore(formatter.format(rsc.getDoubleItem(0, "max_score")));
            }
            if (rsc.getItem(0, "min_score").getResultData() != null) {
                result.setMinimumScore(formatter.format(rsc.getDoubleItem(0, "min_score")));
            }
            if (rsc.getItem(0, "avg_score").getResultData() != null) {
                result.setAverageScore(formatter.format(rsc.getDoubleItem(0, "avg_score")));
            }
            if (rsc.getItem(0, "avg_placement").getResultData() != null) {
                result.setAveragePlacement(formatter.format(rsc.getDoubleItem(0, "avg_placement")));
            }
        }

        if (log.isDebugEnabled()) {
            log.debug(result);
        }

        return result;
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

        if (t > 0) {
            ret = t + ":" + (mins < 10 ? "0" : "") + mins + ret;
        } else {
            ret = mins + ret;
        }

        return ret;
    }

    protected static DataAccessInt getTCSCatalogDataAccess() throws Exception {
        DataAccessInt dAccess = null;
        dAccess = new DataAccess(DBMS.TCS_OLTP_DATASOURCE_NAME);
        return dAccess;
    }

    protected static DataAccessInt getTCSDWDataAccess() throws Exception {
        DataAccessInt dAccess = null;
        dAccess = new DataAccess(DBMS.TCS_DW_DATASOURCE_NAME);
        return dAccess;
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


    final class MyPageEvents extends PdfPageEventHelper {
        // This is the contentbyte object of the writer
        PdfContentByte cb;

        boolean lastWasResume = false;

        public void onStartPage(PdfWriter writer, Document document) {
            try {
                log.debug("start page(" + writer.getPageNumber() + ") - includeHeader: " + includeHeader);
                lastWasResume = inResume;
                if (writer.getPageNumber() > 1 && includeHeader) {
                    cb = writer.getDirectContent();
                    cb.beginText();
                    cb.setColorFill(Color.white);
                    cb.setColorStroke(Color.white);
                    cb.setFontAndSize(BaseFont.createFont(BaseFont.HELVETICA_BOLD, BaseFont.CP1252, BaseFont.NOT_EMBEDDED), 14);
                    cb.setTextMatrix(200, 810);
                    cb.showText("Member Profile for [" + info.getHandle() + "]");
                    cb.endText();
                }
            }
            catch (Exception e) {
                e.printStackTrace();
                System.err.println(e.getMessage());
            }

        }

        // we override the onEndPage method
        public void onEndPage(PdfWriter writer, Document document) {

            try {

                if (!lastWasResume) {
                    //super.onEndPage(writer, document);
                    Image footerimg = Image.getInstance("http://" + ApplicationServer.SERVER_NAME + "/i/profiles/topcoder_logo_footer.jpg");
                    footerimg.setAlignment(Element.ALIGN_LEFT);
                    footerimg.scalePercent(70f);

                    footerimg.setAbsolutePosition(45, 30);

                    cb = writer.getDirectContent();
                    cb.beginText();
                    cb.setColorFill(Color.white);
                    cb.setColorStroke(Color.white);
                    cb.setFontAndSize(BaseFont.createFont(BaseFont.HELVETICA_BOLD, BaseFont.CP1252, BaseFont.NOT_EMBEDDED), 14);
                    cb.setTextMatrix(540, 33);
                    cb.showText("-" + writer.getPageNumber() + "-");
                    cb.endText();

                    cb.addImage(footerimg);
                }
            }
            catch (Exception e) {
                e.printStackTrace();
                System.err.println(e.getMessage());
            }
        }

    }


}
