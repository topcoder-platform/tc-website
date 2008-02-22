/*
 * MyUserRole.java 1.0 7/2/2003
 *
 * Copyright � 2003, TopCoder, Inc. All rights reserved
 */
package com.topcoder.apps.review.failuretests.mockups;

import com.topcoder.apps.review.projecttracker.User;
import com.topcoder.apps.review.projecttracker.Role;
import com.topcoder.apps.review.projecttracker.Project;
import com.topcoder.apps.review.projecttracker.UserRole;
import com.topcoder.apps.review.projecttracker.PaymentInfo;
import com.topcoder.apps.review.projecttracker.ReviewerResponsibility;

/**
 * <p>An implementation of MyUserRole used for testing.</p>
 *
 * @author kolanovic
 * @version 1.0
 */
public class MyUserRole extends UserRole {
    private Role role;
    private User user;

    public MyUserRole(User user, Role role) {
        super(0, role, user, (PaymentInfo) null,
                (ReviewerResponsibility) null, 0);
        this.user = user;
        this.role = role;
    }

    public long getId() {
        return (role.getId());
    }

    public Role getRole() {
        return (role);
    }

    public void setRole(Role role) {
        this.role = role;
    }

    public User getUser() {
        return (user);
    }

    public void setUser(User user) {
        this.user = user;
    }

    public PaymentInfo getPaymentInfo() {
        return (null);
    }

    public void setPaymentInfo(PaymentInfo info) {
    }

    public ReviewerResponsibility getReviewerResponsibility() {
        return (null);
    }

    public void setReviewerResponsibility(ReviewerResponsibility reviewerResponsibility) {
    }
}
