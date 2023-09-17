<%-- 
    Document   : index
    Created on : Jun 28, 2023, 10:45:36 AM
    Author     : truon
--%>

<%@page import="java.util.List"%>
<%@page import="entities.cars"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <style>
        .thongbao{
            color: green;
        }

        table, th, td {
            border: 1px solid black;
        }

        th, td {
            padding: 10px;
        }

    </style>
    <body>
        <c:set var = "user" scope = "session" value = "${login_user}"/>
        <h3>Welcome, <c:out value = "${login_user}"/></h3>
        </br></br>
        <form action="MainController">
            <input type="submit" name="myBtn" value="Logout">
        </form
        </br></br>
        <div>
            <form action="MainController">
                Search: <input type="text" name="nameofcar" value="${name_car}" placeholder="Enter car’s name" required="">  <input type="submit" name="myBtn" value="Search">
            </form>
        </div>
        <c:set var = "show" scope = "session" value = "${show_list}"/>
        <c:if test = "${show == 1}">
            <h3>Cars List</h3>
            <table>
                <thead>
                <th>id</th>
                <th>name</th> 
                <th>description</th>
                <th>price</th>
                <th>speed</th>
                <th>status</th>
                    <c:forEach var="item" items="${list_car}" >
                    <tbody>
                    <td id="id" name="id">${item.id}</td>
                    <td id="name" name="name">${item.name}</td>
                    <td id="desp" name="desp">${item.description}</td>
                    <td id="price" name="price">${item.price}</td>
                    <td id="speed" name="speed">${item.speed}</td>
                    <td id="status" name="status">${item.status}</td>
                    <td>
                        <div>
                            <form class="form" action="MainController">
                                <input type="number" name="quantity" min="0" max="100" step="1" value="0">
                                <input type="hidden" name="id" value="${item.id}">
                                <input type="hidden" name="name" value="${item.name}">
                                <input type="hidden" name="desp" value="${item.description}">
                                <input type="hidden" name="price" value="${item.price}">
                                <input type="hidden" name="speed" value="${item.speed}">
                                <input type="hidden"  name="status" value="${item.status}">
                                <input type="submit" name="myBtn" value="Add to cart" >
                            </form>
                        </div>
                    </td>
                </tbody>
            </c:forEach>
        </table>
    </c:if>
    <br>
    <div>
        <form action="MainController">
            <input type="submit" name="myBtn" value="View cart">
        </form>
    </div>
    </br>
    <div class="thongbao">
        <c:out value = "${alert}"/>
    </div>
</body>
</html>
