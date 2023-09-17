<%-- 
    Document   : cart
    Created on : Jul 1, 2023, 11:09:15 AM
    Author     : truon
--%>

<%@page import="entities.cars_cart"%>
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
        table, th, td {
            border: 1px solid black;
        }

        th, td {
            padding: 10px;
        }
    </style>
    <body>
        <c:choose>
            <c:when test="${cart.size()>0}">   
                </br></br>
                <h3>Your Cart :</h3>
                <table>
                    <thead>
                    <th>id</th>
                    <th>name</th> 
                    <th>description</th>
                    <th>price</th>
                    <th>speed</th>
                    <th>status</th>
                    <c:forEach var="item" items="${cart}" >
                        <tbody>
                            <td id="id" name="id">${item.id}</td>
                            <td id="name" name="name">${item.name}</td>
                            <td id="desp" name="desp">${item.description}</td>
                            <td id="price" name="price">${item.price}</td>
                            <td id="speed" name="speed">${item.speed}</td>
                            <td id="status" name="status">${item.status}</td>
                            <td id="quantity" name="quantity">${item.quantity}&nbspchiec</td>
                            <td>             
                                <form action="MainController">
                                    <input type="hidden" name="id" value="${item.id}">
                                    <input type="submit" name="myBtn" value="Remove" >
                                </form>         
                            </td>
                        </tbody>
                    </c:forEach>
                        <form action="MainController">
                            <input type="submit" name="myBtn" value="Remove All" >
                        </form>   
                </br></br>
                </table>
            </c:when>
            <c:otherwise>
                <h2>Your Cart is Empty !!</h2>
            </c:otherwise>
        </c:choose>
        </br>
        Total cars: ${total_cars} chiec</br>
        Total money paid: ${total_money} usd
        <div>
            <form>
                </br></br><input type="button" value="Back" onclick="back()">
            </form>
        </div>
    </body>
<script>
    function back() {
        document.location.assign("index.jsp");
    }
</script>
</html>
