<%--
 * Copyright (C) 2004 - 2009 TopCoder Inc., All Rights Reserved.  
 *
 * This JSP is responsible for rendering bottom of the leaderboard page. 
 * It simply closes all open tags and includes "sponsors.jsp" and "footer.jsp".
 *
 * Author TCSDEVELOPER
 * Version 1.0
 * Since 2009 TopCoder Open Site Integration
--%>
<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>   
                                                                <jsp:include page="sponsors.jsp"/>
                                                            </div> <!-- End .pageContent -->
                                                        </div>
                                                    </div> <!-- End #mainContentInner -->
                                                </div> <!-- End #mainContent -->                                        
                                            </div><!-- End .bottomAreaContent -->
                                        </div><!-- .bottomRight --></div> <!-- .bottomLeft --> 
                                    </div><!-- End .bottomArea -->
                                </div><!-- End #contentInnerInner -->
                            </div><!-- End #contentInner -->
                            <div class="contentBottomLeft"><div class="contentBottomRight">
                                <div class="contentTopInner"></div>
                            </div> <!-- contentBottomRight --> </div> <!-- contentBottomLeft -->                    
                        </div><!-- End #content -->
                    </div><!-- End #wrapperContentInner -->
                </div><!-- #wrapperContent -->
            </div><!-- End #wrapperInner -->
        </div><!-- End #wrapper -->    
        <jsp:include page="footer.jsp" />
    </body>
</html>