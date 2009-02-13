package com.topcoder.web.truveo.validation;

import com.topcoder.servlet.request.FileDoesNotExistException;
import com.topcoder.servlet.request.PersistenceException;
import com.topcoder.servlet.request.UploadedFile;
import com.topcoder.shared.util.logging.Logger;
import com.topcoder.web.common.validation.BasicResult;
import com.topcoder.web.common.validation.ValidationInput;
import com.topcoder.web.common.validation.ValidationResult;
import com.topcoder.web.common.validation.Validator;
import com.topcoder.web.truveo.dao.ContestPropertyDAO;
import com.topcoder.web.truveo.dao.TruveoDAOUtil;
import com.topcoder.web.truveo.model.Contest;
import com.topcoder.web.truveo.model.ContestProperty;
import com.topcoder.web.truveo.model.MimeType;
import com.topcoder.web.truveo.model.TruveoFileType;

import javax.imageio.ImageIO;
import javax.imageio.stream.ImageInputStream;
import java.awt.image.BufferedImage;
import java.io.ByteArrayInputStream;
import java.io.IOException;
import java.util.Iterator;

/**
 * @author dok
 * @version $Revision: 70119 $ Date: 2005/01/01 00:00:00
 *          Create Date: Aug 29, 2006
 */
public class SubmissionValidator implements Validator {
    protected static final Logger log = Logger.getLogger(SubmissionValidator.class);

    private Contest contest;

    public SubmissionValidator(Contest contest) {
        this.contest = contest;
    }


    public ValidationResult validate(ValidationInput input) {
        UploadedFile submission = (UploadedFile) input.getInput();

        byte[] arr = null;
        if (submission == null) {
            return new BasicResult(false, "Submission was empty");
        } else if (submission.getContentType() == null) {
            return new BasicResult(false, "File type not included in submission.");
        }

        int ret = 0;
        MimeType mt = null;
        try {
            arr = new byte[(int) submission.getSize()];
            ret = submission.getInputStream().read(arr);
            mt = getMimeType(submission);
        } catch (FileDoesNotExistException e) {
            log.warn("Communication error when receiving submission.", e);
            return new BasicResult(false, "Communication error when receiving submission.");
        } catch (PersistenceException e) {
            log.warn("Communication error when receiving submission.", e);
            return new BasicResult(false, "Communication error when receiving submission.");
        } catch (IOException e) {
            log.warn("Communication error when receiving submission.", e);
        }

        if (ret == 0) {
            return new BasicResult(false, "Submission was empty");
        } else if (mt == null) {
            return new BasicResult(false, "Unknown file type submitted: " + submission.getContentType());
        } else if (!contest.getFileTypes().contains(mt.getFileType())) {
            return new BasicResult(false, "Invalid file type submitted: " + submission.getContentType());
        } else {
            //at this point we have an actual submission file that's not empty and it's a file type we know

            if (mt.getFileType().isImageFile()) {
                ContestPropertyDAO dao = TruveoDAOUtil.getFactory().getContestPropertyDAO();
                String minWidth = contest.getConfig(dao.find(ContestProperty.MIN_WIDTH)).getValue();
                String maxWidth = contest.getConfig(dao.find(ContestProperty.MAX_WIDTH)).getValue();
                String minHeight = contest.getConfig(dao.find(ContestProperty.MIN_HEIGHT)).getValue();
                String maxHeight = contest.getConfig(dao.find(ContestProperty.MAX_HEIGHT)).getValue();
                try {

                    ImageInputStream iis = ImageIO.createImageInputStream(new ByteArrayInputStream(arr));
                    if (iis == null) {
                        throw new RuntimeException("Could not find an appropriate reader for the file");
                    } else {
                        Iterator it = ImageIO.getImageReaders(iis);
                        if (it.hasNext()) {
                            BufferedImage image = ImageIO.read(iis);
                            if (minWidth != null && image.getWidth() < Integer.parseInt(minWidth)) {
                                if (minWidth.equals(maxWidth)) {
                                    return new BasicResult(false, "Submission width is too small, it must be " + minWidth + " pixels wide.");
                                } else {
                                    return new BasicResult(false, "Submission width is too small, it must be at least " + minWidth + " pixels wide.");
                                }
                            }
                            if (maxWidth != null && image.getWidth() > Integer.parseInt(maxWidth)) {
                                if (maxWidth.equals(minWidth)) {
                                    return new BasicResult(false, "Submission width is too large, it must be " + maxWidth + " pixels wide.");
                                } else {
                                    return new BasicResult(false, "Submission width is too large, it must be at most " + maxWidth + " pixels wide.");
                                }
                            }
                            if (minHeight != null && image.getHeight() < Integer.parseInt(minHeight)) {
                                if (minHeight.equals(maxHeight)) {
                                    return new BasicResult(false, "Submission height is too small, it must be " + minHeight + " pixels high.");
                                } else {
                                    return new BasicResult(false, "Submission height is too small, it must be at least " + minHeight + " pixels high.");
                                }
                            }
                            if (maxHeight != null && image.getHeight() > Integer.parseInt(maxHeight)) {
                                if (maxHeight.equals(minHeight)) {
                                    return new BasicResult(false, "Submission height is too large, it must be " + maxHeight + " pixels high.");
                                } else {
                                    return new BasicResult(false, "Submission height is too large, it must be at most " + maxHeight + " pixels high.");
                                }
                            }
                        } else {
                            return new BasicResult(false, "Unrecognized file type.");
                        }
                    }
                } catch (IOException e) {
                    e.printStackTrace();
                    return new BasicResult(false, "Communication error when receiving submission.");
                }
            }


        }

        return ValidationResult.SUCCESS;
    }

    /**
     * Figure out the mime type for the given submission.
     * also do a second level of checking because some client machines don't identify the mime type correctly.  so
     * we'll be a bit lenient.  if they get the extension right, return the first mime type associated with the file
     * type identified by the extension.
     *
     * @param submission the submission file
     * @return the mime type of the submission
     * @throws FileDoesNotExistException when the uploaded file doesn't exist
     * @throws PersistenceException      not sure when, see FileUpload component docs
     */
    public static MimeType getMimeType(UploadedFile submission) throws FileDoesNotExistException, PersistenceException {
        MimeType mt = TruveoDAOUtil.getFactory().getMimeTypeDAO().find(submission.getContentType());
        if (mt == null) {
            log.info("didn't find mime type " + submission.getContentType());
            String ext = submission.getRemoteFileName().substring(submission.getRemoteFileName().lastIndexOf('.') + 1);
            for (TruveoFileType ft : TruveoDAOUtil.getFactory().getFileTypeDAO().getFileTypes()) {
                if (ft.getExtension().equals(ext)) {
                    mt = ft.getMimeTypes().iterator().next();
                }
            }
        }
        return mt;
    }
}
