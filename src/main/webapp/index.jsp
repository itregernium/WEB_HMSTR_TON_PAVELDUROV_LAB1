<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.ResourceBundle" %>
<%@ page import="java.util.Locale" %>
<%
    Locale locale = new Locale("en", "US");
    ResourceBundle bundle = ResourceBundle.getBundle("messages", locale);
%>
<!DOCTYPE html>
<html lang="<%= locale.getLanguage() %>">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title><%= bundle.getString("title") %></title>
    <link rel="stylesheet" href="<%= request.getContextPath() %>/resources/css/style.css">
    <link rel="stylesheet" href="<%= request.getContextPath() %>/resources/css/normalize.css">
    <script src="<%= request.getContextPath() %>/resources/js/jquery-3.7.1.min.js"></script>
    <script>
        function validateR() {
            const rInput = document.getElementById('r');
            rInput.addEventListener('input', function() {
                const rValue = parseFloat(rInput.value);
                if (rValue > 4) {
                    alert('R must not be greater than 4');
                    rInput.value = '';
                    rInput.focus();
                }
            });
        }
        window.onload = validateR;
    </script>
</head>
<body>
<div class="container">
    <header>
        <a href="#" class="header-image-link">
            <img src="<%= request.getContextPath() %>/resources/img/kombat.webp" alt="Kombat" class="header-image">
        </a>
        <div class="header-text">
            <h1><%= bundle.getString("header") %></h1>
            <div class="credentials">
                <ul>
                    <li><%= bundle.getString("name") %></li>
                    <li><%= bundle.getString("group") %></li>
                    <li><%= bundle.getString("studentId") %></li>
                </ul>
            </div>
        </div>
        <form action="localize" method="get">
            <label for="lang">Language:</label>
            <select name="lang" id="lang" onchange="this.form.submit()">
                <option value="en" <%= "en".equals(locale.getLanguage()) ? "selected" : "" %>>English</option>
                <option value="ru" <%= "ru".equals(locale.getLanguage()) ? "selected" : "" %>>Русский</option>
                <option value="de" <%= "de".equals(locale.getLanguage()) ? "selected" : "" %>>Deutsch</option>
            </select>
        </form>
    </header>
    <main>
        <div class="plotData" id="draggableTable">
            <h1 style="color: lightblue"><%= bundle.getString("miningMachine") %></h1>
            <jsp:include page="form.jsp" />
            <canvas id="canvas" width="500" height="500"></canvas>
        </div>

        <table class="requestData">
            <thead>
            <tr>
                <th>X</th>
                <th>Y</th>
                <th>R</th>
                <th><%= bundle.getString("result") %></th>
                <th><%= bundle.getString("sendTime") %></th>
                <th><%= bundle.getString("scriptTime") %></th>
                <th><%= bundle.getString("serverTime") %></th>
            </tr>
            </thead>
            <tbody>
            </tbody>
            <template>
                <tr>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                </tr>
            </template>
        </table>

        <div class="toncoin">
            <h1 class="ton-price"><%= bundle.getString("tonPrice") %></h1>
            <img src="<%= request.getContextPath() %>/resources/img/price.jpeg" alt="TON Coin" class="ton-coin-img">
        </div>
    </main>
</div>

<video id="background-video" loop style="display:none; position: fixed; top: 0; left: 0; width: 100%; height: 100%; z-index: -1;">
    <source src="<%= request.getContextPath() %>/resources/vid/nazar.mp4" type="video/mp4">
    Your browser does not support the video tag.
</video>

<div class="tg-logo" id="tg-logo">
    <img src="<%= request.getContextPath() %>/resources/img/tg-logo.webp" alt="TG Logo">
</div>

<footer>
    <img src="<%= request.getContextPath() %>/resources/img/vt.png" alt="IFMO LOGO" style="width: 100px; height: 100px" id="ifmo">
    <p><%= bundle.getString("footerText")%></p>
    <div class="nyan-cat">
        <img src="<%= request.getContextPath() %>/resources/img/nyan.gif" alt="Nyan Cat">
    </div>
</footer>

<script type="text/javascript" src="<%= request.getContextPath() %>/resources/js/draw-plot.js"></script>
<script type="text/javascript" src="<%= request.getContextPath() %>/resources/js/fetch-canvas-click.js"></script>
<script type="text/javascript" src="<%= request.getContextPath() %>/resources/js/table-drag.js"></script>
<script type="text/javascript" src="<%= request.getContextPath() %>/resources/js/secret-video.js"></script>
<script type="text/javascript" src="<%= request.getContextPath() %>/resources/js/fetch-submit-button.js"></script>
</body>
</html>
