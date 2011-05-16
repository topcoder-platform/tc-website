/*
 * Copyright (C) 2007 - 2011 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.web.tc.controller.request.myhome;

import com.topcoder.shared.security.ClassResource;
import com.topcoder.web.common.HSRegistrationHelper;
import com.topcoder.web.common.PermissionException;
import com.topcoder.web.common.ShortHibernateProcessor;
import com.topcoder.web.common.dao.DAOUtil;
import com.topcoder.web.common.model.User;
import com.topcoder.web.common.model.Path;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

import com.topcoder.web.memberphoto.manager.MemberPhotoDAO;
import com.topcoder.web.memberphoto.manager.persistence.JPAMemberPhotoDAO;
import com.topcoder.web.memberphoto.manager.MemberPhotoManager;
import com.topcoder.web.memberphoto.manager.MemberPhotoManagerImpl;
import com.topcoder.web.memberphoto.entities.Image;

/**
 * <p>
 * This class is used to process visit home request.
 * </p>
 * 
 * <p>
 * <strong>Thread safety:</strong> This class is thread-safe.
 * </p>
 *
 * <p>
 * Version 1.1 (Assembly - Upload Avatar to TC) Change notes:
 *   <ol>
 *     <li>Add MemberPhotoManager field.</li>
 *     <li>Add constructor to initiate memberPhotoManager field.</li>
 *     <li>Update dbProcessing method to retrieve image info.</li>
 *     <li>Update dbProcessing method to retrieve image path info.</li>
 *   </ol>
 * </p>
 * 
 * @author Pablo Wolfus (pulky), pvmagacho
 * @version 1.1
 */
public class Home extends ShortHibernateProcessor {
    /**
     * A member photo manager instance.
     * 
     * @since 1.1
     */
    private MemberPhotoManager memberPhotoManager;

    /**
     * <p>
     * The factory to create EntityManager objects.
     * </p>
     */
    private final EntityManagerFactory emf;

    /**
     * The default ctor. Added to initiate memberPhotoManager field.
     * 
     * @since 1.1
     */
    public Home() {
        super();
        
        emf = Persistence.createEntityManagerFactory("memberPhotoManager");
    }

    /**
     * Handle http request.
     * 
     * @throws Exception if any exception occurs.
     */
    protected void dbProcessing() throws Exception {
        if (!userIdentified()) {
            throw new PermissionException(getUser(), new ClassResource(this.getClass()));
        }

        // configure the EntityManager
        EntityManager entityManager = emf.createEntityManager();        
        MemberPhotoDAO memberPhotoDAO = new JPAMemberPhotoDAO(entityManager);
        memberPhotoManager = new MemberPhotoManagerImpl(memberPhotoDAO);

        User u = DAOUtil.getFactory().getUserDAO().find(getUser().getId());
        Image image = null;
        try {
            // get image
            entityManager.getTransaction().begin();
            image = memberPhotoManager.getMemberPhoto(getUser().getId());
            entityManager.getTransaction().commit();
        } catch (Exception eEmf){
            try {
                entityManager.getTransaction().rollback();
            } catch (Exception eTx) {}                 
        } finally {
            entityManager.close();
        }
        
        getRequest().setAttribute("isInHS",
                DAOUtil.getFactory().getSecurityGroupDAO().hasGroup(u.getId(), HSRegistrationHelper.HS_GROUP_ID));
        getRequest().setAttribute("regUser", u);
        getRequest().setAttribute("userImage", image);

        if (image != null) {
        	Path path = DAOUtil.getFactory().getPathDAO().find(image.getPathId());
        	getRequest().setAttribute("pathImage", path.getPath() + image.getFileName());
        }

        setNextPage("/my_home/index.jsp");
        setIsNextPageInContext(true);
    }
}
