<%@ page import="models.Player" %>
<%@ page contentType="text/html;charset=UTF-8" %>
    <%@ page isELIgnored="false" %>
    <%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
    <!DOCTYPE html>
    <jsp:useBean id="numguess" class="models.Game" scope="session"/>
    <jsp:setProperty name="numguess" property="*"/>
    <c:set var="player" scope="session" value="${sessionScope.player}" />
    <html>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <!-- Tell the browser to be responsive to screen width -->
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta name="description" content="">
        <meta name="author" content="">
        <title>Home</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        <!-- Custom CSS -->
        <link href="<c:url value="/css/home.css" />"  rel="stylesheet"/>
    </head>

    <%
        String email = request.getParameter("email");
        Player player = new Player();
        player.setEmail(email);
        session.setAttribute("player", player);
        System.out.println("tao la email " + player.getEmail());
    %>
    <body>
        <div class="bg-game">
            <h3 class='text-center display-4 pt-3'>ĐOÁN SỐ MENTOR NHÉ :))</h3>
            <div class="content mt-5">
                <div class="row">
                    <div class="col-5">
                        <table class="table">
                            <thead class="bg-dark">
                            <tr class="text-light">
                                <th scope="col">#</th>
                                <th scope="col">Email</th>
                                <th scope="col">Num Guesses</th>
                            </tr>
                            </thead>
                            <tbody>
                            <tr>
                                <th scope="row">1</th>
                                <td>ltqhuy.th0112@gmail.com</td>
                                <td>4</td>
                            </tr>
                            </tbody>
                        </table>
                    </div>
                    <div class="col-7">
                        <div class="play">
                            <c:choose>
                                <c:when test="${numguess.getSuccess()}">
                                    Chúc mừng! Bạn đã đoán đúng chỉ sau ${numguess.getNumGuesses()} lần thử.
                                    Muốn thử lại?.<br>
                                    <% numguess.reset(); %>
                                    <a href="index.jsp">Chơi lại</a>?
                                </c:when>
                                <c:when test="${numguess.getNumGuesses() == 0}">
                                    <form action='#' method='post' style='text-align:center'>
                                        <h2>Nhập số dự đoán từ 1-1000</h2>
                                        <input class="py-2 my-2" type='text' name='randomNumber' disabled value="${numguess.getAnswer()}">
                                        <input class="d-none" type='text' name='username' disabled />
                                        <div style="display: flex; align-items: center; justify-content: center; margin-bottom: 10px">
                                            <p style="margin-bottom: 0; margin-right: 5px; font-size: 1.5rem">Số lần đoán: <span class="text-danger" style="font-size: 20px">${numguess.getNumGuesses() }</span></p>
                                            <input type='text' name='count' disabled style="width: 20px; height: 20px; border-radius: 100rem; font-size: 12px; text-align: center; color: red; font-weight: bold">
                                        </div>
                                        <input type='text' name='guess' required pattern='[0-9]+' />
                                        <button type='submit'>Đoán</button>
                                    </form>
                                </c:when>
                                <c:otherwise>
                                    <form action='#' method='post' style='text-align:center'>
                                        Đoán tốt lắm! nhưng chưa đúng. ${numguess.getHint()}.<br>
                                        <h2>Nhập số dự đoán từ 1-1000</h2>
                                        <input class="py-2 my-2" type='text' name='randomNumber' disabled value="${numguess.getAnswer()}">
                                        <input class="d-none" type='text' name='username' disabled />
                                        <div style="display: flex; align-items: center; justify-content: center; margin-bottom: 10px">
                                            <p style="margin-bottom: 0; margin-right: 5px; font-size: 1.5rem">Số lần đoán: <span class="text-danger" style="font-size: 20px">${numguess.getNumGuesses() }</span></p>
                                            <input type='text' name='count' disabled style="width: 20px; height: 20px; border-radius: 100rem; font-size: 12px; text-align: center; color: red; font-weight: bold">
                                        </div>
                                        <input type='text' name='guess' required pattern='[0-9]+' />
                                        <button type='submit'>Đoán</button>
                                    </form>
                                </c:otherwise>
                            </c:choose>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
    </body>
    </html>
