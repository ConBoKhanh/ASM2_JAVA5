<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 04/04/2023
  Time: 9:13 SA
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
<html>
<head>
    <title>Title</title>
    <link
            href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css"
            rel="stylesheet"
    />
    <link
            href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.bundle.min.js"
            rel="stylesheet"
    />
    <link
            href="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"
            rel="stylesheet"
    />
    <link
            href="https://cdn.jsdelivr.net/npm/boxicons@latest/css/boxicons.min.css"
            rel="stylesheet"
    />
    <style>
        body {
            background-color: #ecedee
        }

        .card {
            border: none;
            overflow: hidden
        }

        .thumbnail_images ul {
            list-style: none;
            justify-content: center;
            display: flex;
            align-items: center;
            margin-top: 10px
        }

        .thumbnail_images ul li {
            margin: 5px;
            padding: 10px;
            border: 2px solid #eee;
            cursor: pointer;
            transition: all 0.5s
        }

        .thumbnail_images ul li:hover {
            border: 2px solid #000
        }

        .main_image {
            display: flex;
            justify-content: center;
            align-items: center;
            border-bottom: 1px solid #eee;
            height: 400px;
            width: 100%;
            overflow: hidden
        }

        .heart {
            height: 29px;
            width: 29px;
            background-color: #eaeaea;
            border-radius: 50%;
            display: flex;
            justify-content: center;
            align-items: center
        }

        .content p {
            font-size: 12px
        }

        .ratings span {
            font-size: 14px;
            margin-left: 12px
        }

        .colors {
            margin-top: 5px
        }

        .colors ul {
            list-style: none;
            display: flex;
            padding-left: 0px
        }

        .colors ul li {
            height: 20px;
            width: 20px;
            display: flex;
            border-radius: 50%;
            margin-right: 10px;
            cursor: pointer
        }

        .colors ul li:nth-child(1) {
            background-color: #6c704d
        }

        .colors ul li:nth-child(2) {
            background-color: #96918b
        }

        .colors ul li:nth-child(3) {
            background-color: #68778e
        }

        .colors ul li:nth-child(4) {
            background-color: #263f55
        }

        .colors ul li:nth-child(5) {
            background-color: black
        }

        .right-side {
            position: relative
        }

        .search-option {
            position: absolute;
            background-color: #000;
            overflow: hidden;
            align-items: center;
            color: #fff;
            width: 200px;
            height: 200px;
            border-radius: 49% 51% 50% 50% / 68% 69% 31% 32%;
            left: 30%;
            bottom: -250px;
            transition: all 0.5s;
            cursor: pointer
        }

        .search-option .first-search {
            position: absolute;
            top: 20px;
            left: 90px;
            font-size: 20px;
            opacity: 1000
        }

        .search-option .inputs {
            opacity: 0;
            transition: all 0.5s ease;
            transition-delay: 0.5s;
            position: relative
        }

        .search-option .inputs input {

            position: absolute;
            top: 200px;
            left: 30px;
            padding-left: 20px;
            background-color: transparent;
            width: 300px;
            border: none;
            color: #fff;
            border-bottom: 1px solid #eee;
            transition: all 0.5s;
            z-index: 10
        }

        .search-option .inputs input:focus {
            box-shadow: none;
            outline: none;
            z-index: 10
        }

        .search-option:hover {
            border-radius: 0px;
            width: 100%;
            left: 0px
        }

        .search-option:hover .inputs {
            opacity: 1
        }

        .search-option:hover .first-search {
            left: 27px;
            top: 25px;
            font-size: 15px
        }

        .search-option:hover .inputs input {
            top: 20px
        }

        .search-option .share {
            position: absolute;
            right: 20px;
            top: 22px
        }

        .buttons .btn {
            height: 50px;
            width: 150px;
            border-radius: 0px !important
        }
    </style>
</head>
<body>
<div style="margin-top: 120px">
    <sf:form action="/add-to-gio-hang/${ctsp.id}" method="post">
    <div class="container mt-5 mb-5" style="margin-top: 30px">
        <div class="card" style="height: 560px">
            <div class="row g-0">
                <div class="col-md-6 border-end">
                    <div class="d-flex flex-column justify-content-center">
                        <div class="main_image"><img src="https://tse2.mm.bing.net/th?id=OIP.bYRVZTJLfaqjOooK8QvIuQHaEj&pid=Api&P=0" id="main_product_image"
                                                     width="350"></div>
                        <div class="thumbnail_images">
                            <ul id="thumbnail">
                                <li><img onclick="changeImage(this)" src="https://i.ibb.co/0JKpmgd/blue.png" width="70"></li>
                                <li><img onclick="changeImage(this)" src="https://i.ibb.co/cNWqxGx/red.png" width="70"></li>
                                <li><img onclick="changeImage(this)" src="https://tse3.mm.bing.net/th?id=OIP.C9uZa4UO-XxFeew7NJnjywHaFj&pid=Api&P=0" width="70"></li>
                                <li><img onclick="changeImage(this)" src="https://tse3.mm.bing.net/th?id=OIP.Wr4T_fvY4USZXJI6_NkBUwAAAA&pid=Api&P=0" width="70"></li>
                            </ul>
                        </div>
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="p-3 right-side">
                        <div class="d-flex justify-content-between align-items-center"><h3>${ctsp.sp.ten}</h3>    <span
                                class="heart"><i class='bx bx-heart'></i></span></div>
                        <div class="mt-2 pr-3 content"><p>${sp.nsx.ten}</p></div>
                        <h3 name=> $ ${ctsp.giaBan}</h3>
                        <div class="ratings d-flex flex-row align-items-center">
                            <div class="d-flex flex-row"><i class='bx bxs-star'></i> <i class='bx bxs-star'></i> <i
                                    class='bx bxs-star'></i> <i class='bx bxs-star'></i> <i class='bx bx-star'></i></div>
                            <span>441 reviews</span></div>
                        <div class="mt-5"><span class="fw-bold">Color</span>
                            <div class="colors">
                                <ul id="marker">
                                    <li id="marker-1"></li>
                                    <li id="marker-2"></li>
                                    <li id="marker-3"></li>
                                    <li id="marker-4"></li>
                                    <li id="marker-5"></li>
                                </ul>
                            </div>
                        </div>

                        <div class="buttons d-flex flex-row mt-5 gap-3">
                            <c:if test="${user != null}">

                                <%--                            <button class="btn btn-outline-dark"></button>--%>
                                <a href="" class="btn btn-outline-dark">
                                    <label style="margin-top: 4px">Buy Now</label>

                                </a>

<%--                                <a href="" class="btn btn-dark">--%>
<%--                                    <label style="margin-top: 4px"></label>--%>

<%--                                </a>--%>
                                <button type="submit" class="btn btn-dark">Add to Basket</button>

                                <%--                            <button class="btn btn-dark">Add to Basket</button>--%>
                            </c:if>


                            <c:if test="${user == null}">
                                <h6 style="color: red">Bạn Cần Đăng Nhập Để Mua Hàng</h6>
                                <a href="" style="text-decoration: none"><h6>Đăng Nhập Tại</h6> </a>
                            </c:if>

                        </div>
                        <div class="search-option">
                            <i class='bx bx-search-alt-2 first-search'></i>
                            <div class="inputs"><input type="text" name=""></div>
                            <i class='bx bx-share-alt share'></i></div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
</sf:form>
</body>
</html>
