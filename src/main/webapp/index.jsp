<%@ page import="models.Player" %>
<%@ page import="java.util.ArrayList" %>
<%@ page contentType="text/html;charset=UTF-8" %>
    <%@ page isELIgnored="false" %>
    <%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
    <!DOCTYPE html>
    <jsp:useBean id="numguess" class="models.Game" scope="session"/>
    <jsp:setProperty name="numguess" property="*"/>
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
        <c:choose>
            <c:when test="${numguess.getNumGuesses() == 0}">
                <%!
                    ArrayList<String[]> userList = new ArrayList<>();
                %>
                <%
                    String email = request.getParameter("email");
                    session.setAttribute("email", email);
                    numguess.reset();
                %>
            </c:when>
            <c:when test="${numguess.getSuccess()}">
                <%
                    String count = Integer.toString(numguess.getNumGuesses()) ;
                    System.out.println("NUM GUESS " + count);
                    System.out.println("Count " + count);
                    String[] user = {(String) session.getAttribute("email"), count};
                    userList.add(user);
                    session.setAttribute("userList", userList);
                %>
            </c:when>
        </c:choose>
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
                            <c:forEach items="${userList}" var="user" varStatus="status">
                                <tr>
                                    <td>${status.index + 1}</td>
                                    <td>${user[0]}</td>
                                    <td>${user[1]}</td>
                                </tr>
                            </c:forEach>
                            </tbody>
                        </table>
                    </div>
                    <div class="col-7">
                        <div class="play">
                            <c:choose>
                                <c:when test="${numguess.getSuccess()}">
                                    Chúc mừng! Bạn đã đoán đúng chỉ sau <span class="text-danger">${numguess.getNumGuesses()}</span>  lần thử.
                                    Muốn thử lại?.<br>
                                    <% numguess.reset(); %>
                                    <a href="<c:url value="/player" />">Chơi lại</a>?
                                </c:when>
                                <c:when test="${numguess.getNumGuesses() == 0}">
                                    <form action='#' method='post' style='text-align:center'>
                                        <h2>Nhập số dự đoán từ 1-1000</h2>
                                        <label>Này là số bí mật nha mentor: </label>
                                        <input class="py-2 my-2" type='text' name='randomNumber' disabled value="${numguess.getAnswer()}">

                                        <input class="d-none" type='text' name='username' disabled />
                                        <div style="display: flex; align-items: center; justify-content: center; margin-bottom: 10px">
                                            <p style="margin-bottom: 0; margin-right: 5px; font-size: 1.5rem">Số lần đoán: <span class="text-danger" style="font-size: 20px">${numguess.getNumGuesses() }</span></p>
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
