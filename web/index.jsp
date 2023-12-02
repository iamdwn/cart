<%@page import="java.util.List"%>
<%@page import="entities.cars"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Car Store</title>
    <!-- Bootstrap CSS -->
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" rel="stylesheet">
    <style>
        .thongbao {
            color: green;
            margin-top: 20px;
        }

        .container {
            margin-top: 50px;
        }

        .search-form {
            margin-top: 20px;
            margin-bottom: 20px
        }

        .logout-btn {
            margin-right: 10px;
        }

        .car-table {
            margin-top: 20px;
        }

        .quantity-form {
            display: flex;
            align-items: center;
        }

        .cart-button {
            margin-top: 10px;
        }
    </style>
</head>
<body>
    <div class="container">
        <c:set var="user" scope="session" value="${login_user}" />
        <h3>Welcome, <c:out value="${login_user}" /></h3>
        <form action="MainController" class="logout-btn">
            <input type="submit" name="myBtn" value="Logout" class="btn btn-danger">
        </form>
        <div class="search-form">
            <form action="MainController" class="form-inline">
                <input type="text" name="nameofcar" value="${name_car}" placeholder="Enter car’s name" class="form-control mr-sm-2" required="">
                <input type="submit" name="myBtn" value="Search" class="btn btn-primary">
            </form>
        </div>
        <c:if test="${show == 1}">
            <h3>Cars List</h3>
            <table class="table car-table">
                <thead>
                    <th>ID</th>
                    <th>Name</th>
                    <th>Description</th>
                    <th>Price</th>
                    <th>Speed</th>
                    <th>Status</th>
                    <th>Action</th>
                </thead>
                <c:forEach var="item" items="${list_car}">
                    <tr>
                        <td>${item.id}</td>
                        <td>${item.name}</td>
                        <td>${item.description}</td>
                        <td>${item.price}</td>
                        <td>${item.speed}</td>
                        <td>${item.status}</td>
                        <td>
                            <form class="quantity-form" action="MainController">
                                <input type="number" name="quantity" min="0" max="100" step="1" value="0" class="form-control mr-sm-2">
                                <input type="hidden" name="id" value="${item.id}">
                                <input type="hidden" name="name" value="${item.name}">
                                <input type="hidden" name="desp" value="${item.description}">
                                <input type="hidden" name="price" value="${item.price}">
                                <input type="hidden" name="speed" value="${item.speed}">
                                <input type="hidden" name="status" value="${item.status}">
                                <input type="submit" name="myBtn" value="Add to cart" class="btn btn-success">
                            </form>
                        </td>
                    </tr>
                </c:forEach>
            </table>
        </c:if>
        <div class="cart-button">
            <form action="MainController">
                <input type="submit" name="myBtn" value="View cart" class="btn btn-info">
            </form>
        </div>
        <div class="thongbao">
            <c:out value="${alert}" />
        </div>
    </div>

    <!-- Bootstrap JS and dependencies (optional) -->
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.2/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
</body>
</html>
