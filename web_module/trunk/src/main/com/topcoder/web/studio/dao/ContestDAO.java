/*
 * Copyright (C) 2001 - 2009 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.web.studio.dao;


import java.util.List;
import java.util.Set;

import com.topcoder.web.common.model.TermsOfUse;
import com.topcoder.web.studio.model.Contest;

/**
 * <p>An interface for the contest DAO.</p>
 *
 * <p>
 *   Version 1.1 (Configurable Contest Terms-Studio Release Assembly v1.0) Change notes:
 *   <ol>
 *     <li>Added method to find necessary terms for a given contest and resource roles ids.</li>
 *   </ol>
 * </p>
 *
 * @author dok, pulky
 * @version 1.1
 */
public interface ContestDAO {

    List getContests();

    Contest find(Long id);

    /**
     * <p>This method will track all necessary terms of use for a particular contest and role ids and return
     * a <code>Set</code> with the terms of use collection.</p>
     *
     * @param contestId the contest id being queried
     * @param roleIds the resource role ids to filter
     * @return a <code>Set</code> with the necessary terms of use collection.
     * @throws IllegalArgumentException if contestId is null or roleIds is null or empty
     *
     * @since 1.1
     */
    Set<TermsOfUse> findNecessaryTerms(Long contestId, Integer[] roleIds);

    void saveOrUpdate(Contest c);

}
