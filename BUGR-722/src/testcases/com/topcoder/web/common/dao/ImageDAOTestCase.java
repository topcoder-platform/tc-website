/*
 * Copyright (C) 2008 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.web.common.dao;

import com.topcoder.web.common.model.Image;
import com.topcoder.web.reg.TCHibernateTestCase;
import junit.framework.Assert;

/**
 * <p>A unit test case for {@link Image} class.</p>
 *
 * @author isv
 * @version 1.0
 * @since Studio Submission Slideshow
 */
public class ImageDAOTestCase extends TCHibernateTestCase {

    /**
     * <p>Accuracy test. Tests the {@link ImageDAO#saveOrUpdate(Image)} method for accurate behavior.</p>
     *
     * <p>Verifies that the details for passed images are saved to underlying persistent data store successfully.</p>
     */
    public void testSaveOrUpdate() {
        DAOFactory daoFactory = DAOUtil.getFactory();
        ImageDAO imageDAO = daoFactory.getImageDAO();

        Image image = new Image();
        image.setFileName("file.jpg");
        image.setHeight(200);
        image.setImageTypeId(Image.GALLERY_SMALL_TYPE_ID);
        image.setOriginalFileName("original.jpg");
        image.setWidth(100);
        imageDAO.saveOrUpdate(image);

        Image i1 = imageDAO.find(image.getId());

        Assert.assertTrue("new image does not exist", i1 != null);
        Assert.assertEquals("The filename is not correct", image.getFileName(), i1.getFileName());
        Assert.assertEquals("The height is not correct", image.getHeight(), i1.getHeight());
        Assert.assertEquals("The width is not correct", image.getWidth(), i1.getWidth());
        Assert.assertEquals("The image type ID is not correct", image.getImageTypeId(), i1.getImageTypeId());
        Assert.assertEquals("The link is not correct", image.getLink(), i1.getLink());
        Assert.assertEquals("The original file name is not correct",
                            image.getOriginalFileName(), i1.getOriginalFileName());
    }
}
