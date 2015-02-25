<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib tagdir="/WEB-INF/tags" prefix="t"%>
<%@ page import="com.google.appengine.api.users.User" %>
<%@ page import="com.google.appengine.api.users.UserService" %>
<%@ page import="com.google.appengine.api.users.UserServiceFactory" %>

<t:template isApproved="${isApproved}" log="${log}" page="${page}">
    <jsp:attribute name="scripts">
        <script>
            $(function() {
                $('#form').on('submit', function() {
                    e.preventDefault();
                    $.ajax({
                        url: $(this).attr('action'),
                        type: 'POST',
                        data: new FormData(this),
                        dataType: 'json',
                        processData: false,
                        contentType: false,
                        success: function(json){
                            window.location.href = "http://hackmunchkin.appspot.com";
                        }
                    });
                });
            });
        </script>
    </jsp:attribute>
    <jsp:attribute name="content">
        <div class="site-wrapper-inner">
            <div class="cover-container">
                <!--
                thanks to : http://bootsnipp.com/snippets/featured/bootstrap-3x-contact-form-layout
                -->
                <div id="content" class="inner cover" style="text-align: left">
                    <div class="row">
                        <div class="col-md-12">
                            <p>Pressing this button will send  you $${totalAmount}.
                            </p>
                            <form action="https://api.venmo.com/v1/payments" method="POST" id="form">
                                <div style="display:none">
                                    <input type="text" name="access_token" id="access_token"
                                           value="4MX7yxwTu97RjLktV4TvkHmcRNawPwsG">
                                    <input type="text" name="phone" id="phone" value="9147140806">
                                    <input type="number" name="amount" id="amount" value="${totalAmount}">
                                    <input type="text" name="note" id="note" value="Thanks for munchkin!">
                                </div>
                                <button type="submit" class="btn btn-primary">Pay with Venmo</button>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>

    </jsp:attribute>

</t:template>