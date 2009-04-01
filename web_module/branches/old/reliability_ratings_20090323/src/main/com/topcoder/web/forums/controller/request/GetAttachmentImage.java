/*
 * Created on May 2, 2006
 *
 * TODO To change the template for this generated file go to
 * Window - Preferences - Java - Code Style - Code Templates
 */
package com.topcoder.web.forums.controller.request;

import com.jivesoftware.forum.AttachmentManager;
import com.jivesoftware.forum.database.DbAttachmentManager;
import com.topcoder.web.forums.ForumConstants;

import javax.imageio.ImageIO;
import javax.servlet.ServletOutputStream;
import java.awt.geom.AffineTransform;
import java.awt.image.AffineTransformOp;
import java.awt.image.BufferedImage;
import java.awt.image.IndexColorModel;
import java.io.BufferedInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;

/**
 * @author mktong
 *         <p/>
 *         Handles an attachment image request. This allows for use of Jive's attachment settings (enabling/disabling
 *         previews, preserving aspect ratio, setting the maximum preview dimension, etc.). Currently, this code is not
 *         used for efficiency - attachment type images are simply retrieved from ForumsUtil.
 *         (Code is mostly modified from /com/jivesoftware/forum/util/JiveServlet.java.)
 */
public class GetAttachmentImage extends ForumsProcessor {
    protected void businessProcessing() throws Exception {
        super.businessProcessing();

        String attachmentID = getRequest().getParameter(ForumConstants.ATTACHMENT_ID);
        String contentType = getRequest().getParameter(ForumConstants.ATTACHMENT_CONTENT_TYPE);
        AttachmentManager attachManager = forumFactory.getAttachmentManager();
        boolean imagePreviewEnabled = attachManager.isImagePreviewEnabled();

        String imageName = DbAttachmentManager.getThumbnailImage(contentType);

        // Determine the image that we'll show next to the attachment. It will
        // either be a representation of the mime type or a thumbnail if it's
        // an image attachment and thumbnail support is turned on.
        File image = null;
        String outputType = null;

        // If thumbnails are enabled and this is an image, get the thumbnail.
        if (imagePreviewEnabled && contentType.indexOf("image") >= 0) {
            int maxSize = attachManager.getImagePreviewMaxSize();
            boolean preserveRatio = attachManager.isImagePreviewRatioEnabled();
            try {
                image = getThumbnail(attachmentID, maxSize, preserveRatio);
            }
            catch (Exception e) {
                log.error(e);
            }
            if (image != null) {
                outputType = "image/x-png";
            }
            // There was an error getting the thumbnail, so use the normal image.
            else {
                image = new File(DbAttachmentManager.getAttachmentDir(), "images" + File.separator + imageName);
                outputType = "image/gif";
            }
        }
        // Otherwise, use the normal image.
        else {
            image = new File(DbAttachmentManager.getAttachmentDir(), "images" + File.separator + imageName);
            outputType = "image/gif";
        }

        // Write the content of the attachment out
        getResponse().setHeader("Content-disposition", "filename=\"" + image + "\";");
        getResponse().setContentType(outputType);
        InputStream in = null;
        ServletOutputStream out = null;
        try {
            in = new BufferedInputStream(new FileInputStream(image));
            out = getResponse().getOutputStream();

            // Set the size of the file.
            getResponse().setContentLength((int) image.length());

            // Use a 128K buffer.
            byte[] buf = new byte[128 * 1024];
            int len;
            while ((len = in.read(buf)) != -1) {
                out.write(buf, 0, len);
            }
        }
        catch (IOException ioe) {
            log.error("Error displaying attachment image: " + ioe.getMessage(), ioe);
        }
        finally {
            try {
                in.close();
            } catch (Exception ignored) {
            }
            try {
                out.close();
            } catch (Exception ignored) {
            }
        }
    }

    /**
     * Returns the name of an image thumbnail that can be used.
     *
     * @param attachmentID  the ID of the attachment.
     * @param maxSize       the maximum dimension of the thumbnail (height or width)
     * @param preserveRatio true if the aspect ratio of the image should be preserved
     *                      when creating the thumbnail.
     * @return the thumbnail image file or <tt>null</tt> if a thumbnail can't be created.
     * @throws IOException if an error occurs creating the thumbnail.
     */
    public File getThumbnail(String attachmentID, int maxSize, boolean preserveRatio)
            throws IOException {
        File thumbFile = new File(DbAttachmentManager.getAttachmentDir(), "cache" + File.separator +
                attachmentID + "_cache.png");
        // If the file already exists, return it. Note, we don't have any
        // kind of built-in cache expiration so this has to be handled in
        // the admin tool. Minimally, the cache should be expired whenever
        // the aspect ratio flag is toggled or if the max dimension changes.
        if (thumbFile.exists()) {
            return thumbFile;
        }
        File attachmentFile = new File(DbAttachmentManager.getAttachmentDir() +
                File.separator + attachmentID + ".bin");
        if (!attachmentFile.exists()) {
            return null;
        }
        // Otherwise, we need to generate the image. First, load the source image that
        // we'll create the thumbnail from.
        BufferedImage image = ImageIO.read(attachmentFile);
        // If the image can't be found, it's impossible to generate a thumbFile.
        if (image == null) {
            return null;
        }
        // Some images have un unrecognized type (for example, certain PNG images
        // created in Photoshop. In that case, don't try to generate a thumbnail.
        if (image.getType() == BufferedImage.TYPE_CUSTOM) {
            return null;
        }

        // Figure out the amounts to scale the image by.
        float wScale = (float) maxSize / (float) image.getWidth();
        float hScale = (float) maxSize / (float) image.getHeight();
        // If we want to preserve the aspect ratio, pick the smaller scale.
        if (preserveRatio) {
            float scale = Math.min(wScale, hScale);
            // Don't make the image larger than it already is.
            if (scale > 1.0) {
                scale = 1.0F;
            }
            wScale = scale;
            hScale = scale;
        }
        // Create a scaling operation. We use bilinear filtering for higher image quality.
        AffineTransformOp op = new AffineTransformOp(AffineTransform.getScaleInstance(wScale, hScale),
                AffineTransformOp.TYPE_BILINEAR);
        // Create a new image of the correct size.
        BufferedImage thumb = null;

        if (image.getColorModel() instanceof IndexColorModel) {
            thumb = new BufferedImage((int) (image.getWidth() * wScale),
                    (int) (image.getHeight() * hScale), image.getType(),
                    (IndexColorModel) image.getColorModel());
        } else {
            thumb = new BufferedImage((int) (image.getWidth() * wScale),
                    (int) (image.getHeight() * hScale), image.getType());
        }

        // Apply the scaling operation.
        thumb = op.filter(image, thumb);
        // Write the thumbFile out at a PNG file.
        ImageIO.write(thumb, "png", thumbFile);

        return thumbFile;
    }
}
