package com.topcoder.web.studio.validation;

import com.topcoder.servlet.request.UploadedFile;
import com.topcoder.web.common.validation.BasicResult;
import com.topcoder.web.common.validation.ValidationInput;
import com.topcoder.web.common.validation.ValidationResult;
import com.topcoder.web.common.validation.Validator;
import com.topcoder.web.studio.dao.ContestPropertyDAO;
import com.topcoder.web.studio.dao.StudioDAOUtil;
import com.topcoder.web.studio.model.Contest;
import com.topcoder.web.studio.model.ContestProperty;
import com.topcoder.web.studio.model.MimeType;

import javax.imageio.ImageIO;
import javax.imageio.stream.ImageInputStream;
import java.awt.image.BufferedImage;
import java.io.ByteArrayInputStream;
import java.io.IOException;
import java.util.Iterator;

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: Aug 29, 2006
 */
public class SubmissionValidator implements Validator {

    private Contest contest;

    public SubmissionValidator(Contest contest) {
        this.contest = contest;
    }


    public ValidationResult validate(ValidationInput input) {
        UploadedFile submission = (UploadedFile) input.getInput();

        byte[] arr;
        if (submission == null) {
            return new BasicResult(false, "Submission was empty");
        } else if (submission.getContentType() == null) {
            return new BasicResult(false, "File type not included in submission.");
        }

        int ret = 0;
        arr = new byte[(int) submission.getSize()];
        try {
            ret = submission.getInputStream().read(arr);
        } catch (IOException e) {
            return new BasicResult(false, "Communication error when receiving submission.");
        }
        MimeType mt = StudioDAOUtil.getFactory().getMimeTypeDAO().find(submission.getContentType());

        if (ret == 0) {
            return new BasicResult(false, "Submission was empty");
        } else if (mt == null || !contest.getFileTypes().contains(mt.getFileType())) {
            return new BasicResult(false, "Unknown or invalid file type submitted: " + submission.getContentType());
        } else {
            //at this point we have an actual submission file that's not empty and it's a file type we know

            if (mt.getFileType().isImageFile()) {
                ContestPropertyDAO dao = StudioDAOUtil.getFactory().getContestPropertyDAO();
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
                    return new BasicResult(false, "Communication error when receiving submission.");
                }
            }


        }

        return ValidationResult.SUCCESS;
    }
}
