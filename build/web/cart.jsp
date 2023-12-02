<%@page import="entities.cars_cart"%>
<%@page import="java.util.List"%>
<%@page import="entities.cars"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Your Cart</title>
        <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" rel="stylesheet">
        <style>
            .container {
                margin-top: 50px;
            }

            table {
                margin-top: 20px;
            }

            .btn-back {
                margin-top: 20px;
            }

            .total-info {
                margin-top: 20px;
            }
        </style>
    </head>
    <body>
        <div class="container">
            <c:choose>
                <c:when test="${cart.size()>0}">   
                    <h3>Your Cart:</h3>
                    <table class="table table-bordered">
                        <thead class="thead-dark">
                            <tr>
                                <th scope="col">ID</th>
                                <th scope="col">Name</th>
                                <th scope="col">Description</th>
                                <th scope="col">Price</th>
                                <th scope="col">Speed</th>
                                <th scope="col">Status</th>
                                <th scope="col">Quantity</th>
                                <th scope="col">Action</th>
                            </tr>
                        </thead>
                        <c:forEach var="item" items="${cart}">
                            <tr>
                                <td>${item.id}</td>
                                <td>${item.name}</td>
                                <td>${item.description}</td>
                                <td>${item.price}</td>
                                <td>${item.speed}</td>
                                <td>${item.status}</td>
                                <td>${item.quantity} chiếc</td>
                                <td>             
                                    <form action="MainController">
                                        <input type="hidden" name="id" value="${item.id}">
                                        <input type="submit" name="myBtn" value="Remove" class="btn btn-danger btn-sm">
                                    </form>         
                                </td>
                            </tr>
                        </c:forEach>
                    </table>
                    <form action="MainController">
                        <input type="submit" name="myBtn" value="Remove All" class="btn btn-danger">
                    </form>
                </c:when>
                <c:otherwise>
                    <h2>Your Cart is Empty !!</h2>
                </c:otherwise>
            </c:choose>
            <div class="total-info">
                <c:if test = "${total_cars <= 1 }">
                    Total cars: ${total_cars} car<br>
                    Total money paid: ${total_money} USD
                </c:if>

                <c:if test = "${total_cars > 1}">
                    Total cars: ${total_cars} cars<br>
                    Total money paid: ${total_money} USD
                </c:if>
            </div>
            <div class="btn-back">
                <form>
                    <br><input type="button" value="Back" onclick="back()" class="btn btn-primary">
                </form>
            </div>
        </div>

        <!-- Bootstrap JS and dependencies (optional) -->
        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>

        <script>
                        function back() {
                            document.location.assign("index.jsp");
                        }
        </script>
    </body>
</html>
