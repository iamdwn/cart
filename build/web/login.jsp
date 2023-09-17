<%-- 
    Document   : login
    Created on : Jun 25, 2023, 11:32:55 PM
    Author     : truon
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    </head>
    <style>
        .thongbao{
            color: red;
        }
    </style>
    <body>
        <form action="MainController" method="post">
            <label>UserID:</label><input type="text" name="userID" required=" "> </br>
            <label>Password:</label><input type="password" name="password" required=""></br>
            <input type="submit" name="myBtn" value="Login"/> </br>
            <div class="thongbao">
                <c:out value = "${alert}"/>
            </div>
        </form>
    </body>
</html>
