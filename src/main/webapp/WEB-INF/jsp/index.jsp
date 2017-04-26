<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%------Header khi chưa đăng nhập--%>
<html>

    <jsp:include page='partial_view/head.jsp'/>
    <body>
        <%--Include trang Header--%>
        <jsp:include page="/WEB-INF/jsp/header.jsp"/>
        <jsp:include page='partial_view/snackbar.jsp'/>
        <jsp:include page='partial_view/dialog.jsp'/>
        <div class="container-fuild main-container ">
            <row class="row-fluid">
                <div class="col-md-2" style="background-color: #adadad;">
                    <div style ="background-color: #5bc0de; height: 200px;" >
                    </div>     
                </div>
                <div class="col-md-7" style="background-color: #fafafa;">
                     
                </div>
                <div class="col-md-3 right-container">

                </div>
            </row>
        </div>
    </body>
</html>
