package com.topcoder.web.common.model;


import java.util.Collections;
import java.util.Set;

/**
 * @author dok, isv
 * @version $Revision: 70752 $ Date: 2005/01/01 00:00:00
 *          Create Date: May 21, 2006
 */
public class Image extends Base {

    public static final Integer MEMBER_PHOTO_TYPE = 1;
    public static final Integer INTRO_EVENT_TYPE = 15;

    /**
     * <p>An <code>Integer</code> referencing the file type corresponding to <code>Studio Submission Gallery Thumbnail
     * </code> image type.</p>
     *
     * @since Studio Submission Slideshow
     */
    public static final Integer GALLERY_THUMBNAIL_TYPE_ID = 25;

    /**
     * <p>An <code>Integer</code> referencing the file type corresponding to <code>Studio Submission Gallery Small
     * </code> image type.</p>
     *
     * @since Studio Submission Slideshow
     */
    public static final Integer GALLERY_SMALL_TYPE_ID = 26;

    /**
     * <p>An <code>Integer</code> referencing the file type corresponding to <code>Studio Submission Gallery Medium
     * </code> image type.</p>
     *
     * @since Studio Submission Slideshow
     */
    public static final Integer GALLERY_MEDIUM_TYPE_ID = 27;

    /**
     * <p>An <code>Integer</code> referencing the file type corresponding to <code>Studio Submission Gallery Full</code>
     * image type.</p>
     *
     * @since Studio Submission Slideshow
     */
    public static final Integer GALLERY_FULL_TYPE_ID = 28;

    /**
     * <p>An <code>Integer</code> referencing the file type corresponding to <code>Studio Submission Gallery Small
     * Watermarked</code> image type.</p>
     *
     * @since Studio Submission Slideshow
     */
    public static final Integer GALLERY_SMALL_WATERMARKED_TYPE_ID = 29;

    /**
     * <p>An <code>Integer</code> referencing the file type corresponding to <code>Studio Submission Gallery Medium
     * Watermarked</code> image type.</p>
     *
     * @since Studio Submission Slideshow
     */
    public static final Integer GALLERY_MEDIUM_WATERMARKED_TYPE_ID = 30;

    /**
     * <p>An <code>Integer</code> referencing the file type corresponding to <code>Studio Submission Gallery Full
     * Watermarked</code> image type.</p>
     *
     * @since Studio Submission Slideshow
     */
    public static final Integer GALLERY_FULL_WATERMARKED_TYPE_ID = 31;

    private Long id;
    private String fileName;
    private Integer imageTypeId;
    private Path path;
    private String link;
    private Integer height;
    private Integer width;
    private Set coders;

    /**
     * <p>A <code>String</code> holding the name of the original file on the server side which holds the content of the
     * image.</p>
     *
     * @since Studio Submission Slideshow
     */
    private String originalFileName = null;

    public Image() {
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getFileName() {
        return fileName;
    }

    public void setFileName(String fileName) {
        this.fileName = fileName;
    }

    public Integer getImageTypeId() {
        return imageTypeId;
    }

    public void setImageTypeId(Integer imageTypeId) {
        this.imageTypeId = imageTypeId;
    }

    public Path getPath() {
        return path;
    }

    public void setPath(Path path) {
        this.path = path;
    }

    public String getLink() {
        return link;
    }

    public void setLink(String link) {
        this.link = link;
    }

    public Integer getHeight() {
        return height;
    }

    public void setHeight(Integer height) {
        this.height = height;
    }

    public Integer getWidth() {
        return width;
    }

    public void setWidth(Integer width) {
        this.width = width;
    }

    public Set getCoders() {
        return Collections.unmodifiableSet(coders);
    }

    public void setCoders(Set coders) {
        this.coders = coders;
    }

    /**
     * <p>Gets the name of the file which provides the content of this image.</p>
     *
     * @return a <code>String</code> holding the name of the original file on the server side which holds the content of
     *         the image.
     * @since Studio Submission Slideshow
     */
    public String getOriginalFileName() {
        return this.originalFileName;
    }

    /**
     * <p>Sets the name of the file which provides the content of this image.</p>
     *
     * @param originalFileName a <code>String</code> holding the name of the original file on the server side which
     *        holds the content of the image.
     * @since Studio Submission Slideshow
     */
    public void setOriginalFileName(String originalFileName) {
        this.originalFileName = originalFileName;
    }
}
