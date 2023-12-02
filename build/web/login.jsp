<%-- 
    Document   : login
    Created on : Jun 25, 2023, 11:32:55 PM
    Author     : truon
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Login</title>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <!-- Bootstrap CSS -->
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" rel="stylesheet">
    <!-- Font Awesome for icons -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.2/css/all.min.css">
</head>
<style>
    .thongbao {
        color: red;
    }

    body {
        background-color: #f8f9fa; /* Bootstrap default background color */
    }

    .container {
        max-width: 400px;
        margin-top: 100px;
    }

    .form-group {
        margin-bottom: 20px;
    }

    .eye-icon {
        cursor: pointer;
    }
</style>
<body>
    <div class="container">
        <h2 class="text-center mb-4">Login</h2>
        <form action="MainController" method="post">
            <div class="form-group">
                <label for="userID">UserID:</label>
                <input type="text" class="form-control" name="userID" required>
            </div>
            <div class="form-group">
                <label for="password">Password:</label>
                <div class="input-group">
                    <input type="password" class="form-control" id="password" name="password" required>
                    <div class="input-group-append">
                        <span class="input-group-text eye-icon" id="togglePassword">
                            <i class="fas fa-eye"></i>
                        </span>
                    </div>
                </div>
            </div>
            <button type="submit" class="btn btn-primary btn-block" name="myBtn" value="Login">Login</button>
            <div class="thongbao mt-3 text-center">
                <c:out value="${alert}"/>
            </div>
        </form>
    </div>

    <!-- Bootstrap JS and dependencies (optional) -->
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
    <!-- Font Awesome JS -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.2/js/all.min.js"></script>
    <!-- Password toggle script -->
    <script>
        document.getElementById("togglePassword").addEventListener("click", function () {
            var passwordInput = document.getElementById("password");
            if (passwordInput.type === "password") {
                passwordInput.type = "text";
                this.querySelector("i").classList.remove("fa-eye");
                this.querySelector("i").classList.add("fa-eye-slash");
            } else {
                passwordInput.type = "password";
                this.querySelector("i").classList.remove("fa-eye-slash");
                this.querySelector("i").classList.add("fa-eye");
            }
        });
    </script>
</body>
</html>
