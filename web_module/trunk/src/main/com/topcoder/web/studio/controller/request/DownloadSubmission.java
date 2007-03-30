package com.topcoder.web.studio.controller.request;

import com.topcoder.web.common.NavigationException;
import com.topcoder.web.common.StringUtils;
import com.topcoder.web.common.TCResponse;
import com.topcoder.web.studio.Constants;
import com.topcoder.web.studio.controller.request.admin.Base;
import com.topcoder.web.studio.dao.StudioDAOUtil;
import com.topcoder.web.studio.model.ContestResult;
import com.topcoder.web.studio.model.Submission;

import javax.imageio.ImageIO;
import javax.imageio.ImageTypeSpecifier;
import javax.imageio.stream.ImageInputStream;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletResponse;
import java.awt.*;
import java.awt.image.BufferedImage;
import java.awt.image.ImageObserver;
import java.awt.image.RenderedImage;
import java.io.FileInputStream;
import java.io.IOException;
import java.util.Date;
import java.util.Iterator;

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: Aug 29, 2006
 */
public class DownloadSubmission extends Base {

    protected void dbProcessing() throws Exception {
        Long submissionId;

        try {
            submissionId = new Long(getRequest().getParameter(Constants.SUBMISSION_ID));
        } catch (NumberFormatException e) {
            throw new NavigationException("Invalid Submission Specified");
        }

        Submission s = StudioDAOUtil.getFactory().getSubmissionDAO().find(submissionId);

        boolean isOwner = s.getSubmitter().getId().longValue() == getUser().getId();

        boolean isWinner = false;
        ContestResult curr;
        for (Iterator it = s.getContest().getResults().iterator(); it.hasNext() && !isWinner;) {
            curr = (ContestResult) it.next();
            isWinner = s.equals(curr.getSubmission()) && curr.getPrize().getPlace().intValue() == 1;
        }

        boolean isOver = new Date().after(s.getContest().getEndTime());

        if (!isOver && !isOwner) {
            throw new NavigationException("Submissions are not available until the contest is over.");
        }

        if (isWinner || "true".equals(s.getContest().getViewableSubmissions().getValue()) || isOwner) {
            //create the file input stream first so that if there is a problem, we'll get the error and be able to go
            //to an error page.  if we work with the output stream, we won't be able to do that.

            String width = StringUtils.checkNull(getRequest().getParameter(Constants.WIDTH));
            String height = StringUtils.checkNull(getRequest().getParameter(Constants.HEIGHT));

            FileInputStream fis = new FileInputStream(s.getPath().getPath() + s.getSystemFileName());

            boolean done = false;
            if (!"".equals(width) || !"".equals(height)) {
                log.debug("1");
                int w = "".equals(width) ? -1 : Integer.parseInt(width);
                int h = "".equals(height) ? -1 : Integer.parseInt(height);
                ImageInputStream iis = ImageIO.createImageInputStream(fis);
                log.debug("2");
                if (iis != null) {
                    Iterator it = ImageIO.getImageReaders(iis);
                    log.debug("2");
                    if (it.hasNext()) {
                        BufferedImage image = ImageIO.read(iis);
                        log.debug("3");


                        if (w<0) {
                            w = image.getWidth()/(image.getHeight()/h);
                        }
                        if (h<0) {
                            h = image.getHeight()/(image.getWidth()/w);
                        }


                        log.debug("7");


                        ImageTypeSpecifier type = new ImageTypeSpecifier(image);
                        log.debug("4");

                        BufferedImage scaled = type.createBufferedImage(w, h);
                        log.debug("5");

                        Graphics2D scaledGraphics = scaled.createGraphics();
                        log.debug("6");
                        scaledGraphics.drawImage(image, 0, 0, w, h, new MyObserver(getResponse(), s));


                    }
                }

            }

            if (!done) {
                log.debug("not done");
                getResponse().addHeader("content-disposition", "inline; filename=\"" + s.getOriginalFileName() + "\"");
                getResponse().setContentType(s.getMimeType().getDescription());
                ServletOutputStream sos = getResponse().getOutputStream();
                int b;
                while ((b = fis.read()) >= 0) {
                    sos.write(b);
                }
            }
            getResponse().setStatus(HttpServletResponse.SC_OK);
            getResponse().flushBuffer();


        } else {
            throw new NavigationException("Sorry, you can not download submissions for this contest.");
        }


    }

    private class MyObserver implements ImageObserver {
        private TCResponse myResponse;
        private Submission s;
        private MyObserver(TCResponse r, Submission s) {
            myResponse = r;
            this.s = s;
        }

        public boolean imageUpdate(Image img, int infoflags, int x, int y, int width, int height) {

            String format=null;
            Integer fileType = s.getMimeType().getFileType().getId();

            switch (fileType) {
                case 10: format = "gif"; break;
                case 9: format="jpeg"; break;
                case 11: format="png"; break;
                case 12: format="bmp"; break;
            }

            getResponse().addHeader("content-disposition", "inline; filename=\"" + s.getOriginalFileName() + "\"");
            getResponse().setContentType(s.getMimeType().getDescription());
            log.debug("7");
            try {
                boolean ret = ImageIO.write((RenderedImage) img, format, myResponse.getOutputStream());
                log.debug("8");
                return ret;
            } catch (IOException e) {
                throw new RuntimeException(e);
            }

        }
    }
}
