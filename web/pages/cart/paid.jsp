<%--
  Created by IntelliJ IDEA.
  Author : luowenhao221
  Date: 2024/5/4
  Time: 19:36
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>支付</title>
    <%@include file="/pages/common/header.jsp"%>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #e6e9ea;
        }

        #header {
            background-color: #82cb2d;
            color: #fefeff;
            padding: 10px 0;
            text-align: center;
        }

        #logo_img {
            width: 150px;
            float: left;
        }

        #main {
            margin: 20px auto;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            max-width: 600px;
        }

        #paymentCode {
            max-width: 100%;
            max-height: 400px;
            margin: 0 auto; /* 居中对齐 */
        }

        footer {
            text-align: center;
            margin-top: 20px;
            color: #6c757d;
        }
        .order-info {
            background-color: #ff8400;
            border: 1px solid #82cb2d;
            border-radius: 5px;
            padding: 15px;
            text-align: center;
            font-size: 1.5em;
            color: #f7ebeb;
        }
        button.btn.btn-primary {
            margin: 0 auto;
            display: block;
            font-weight: bold;
        }
        #paymentAmount{
            font-size: 1.5em;
            color: #ff6f00;
        }
    </style>
</head>
<body>
<div id="header">
    <img id="logo_img" alt="Logo" src="static/img/logo.jpg">
    <%@include file="/pages/common/login_success_menu.jsp"%>
</div>
<div class="order-info">
    你的订单号为 <strong>${sessionScope.orderId}</strong>，付款时请备注订单号！
</div><div id="main">
    <form action="<c:url value="index.jsp"/>" onsubmit="return checkPaymentMethod()">
        <input type="hidden">
        <div class="mb-3">
            <label for="paymentAmount" class="form-label">支付金额：</label>
            <span id="paymentAmount"></span>元
        </div>
        <div class="mb-3 d-flex justify-content-center">
            <div class="form-check me-3">
                <input class="form-check-input" type="radio" name="pd_FrpId" value="wechat-pay" onchange="showPaymentCode('wechat-pay')" checked>
                <label class="form-check-label">微信支付</label>
            </div>
            <div class="form-check">
                <input class="form-check-input" type="radio" name="pd_FrpId" value="ali-pay" onchange="showPaymentCode('ali-pay')">
                <label class="form-check-label">支付宝支付</label>
            </div>
        </div>
        <div class="mb-3 text-center"> <!-- 使用text-center使收款码图片水平居中 -->
            <div id="paymentCodeRow" style="display: none;">
                <img id="paymentCode" src="" alt="收款码" class="img-fluid">
            </div>
        </div>
        <button type="submit" class="btn btn-primary">确认已支付</button>
    </form>

    <script>
        // 获取存储的支付金额
        var paymentAmount = sessionStorage.getItem('paymentAmount');

        // 将支付金额显示在页面上
        document.getElementById('paymentAmount').innerText = paymentAmount;
    </script>

    <script>

        document.addEventListener("DOMContentLoaded", function() {
            showPaymentCode('wechat-pay');
        });

        function showPaymentCode(paymentMethod) {
            var paymentCodeRow = document.getElementById("paymentCodeRow");
            var paymentCodeImg = document.getElementById("paymentCode");

            // 根据支付方式显示对应的收款码图片
            if (paymentMethod === 'wechat-pay') {
                paymentCodeImg.src = 'static/img/Wechatpay.jpg'; // 微信收款码图片路径
            } else if (paymentMethod === 'ali-pay') {
                paymentCodeImg.src = 'static/img/Alipay.jpg'; // 支付宝收款码图片路径
            }

            // 显示收款码图片
            paymentCodeRow.style.display = "block";
        }
    </script>

    <%--//新加入--%>
    <script>
        function checkPaymentMethod() {
            var wechatPayRadio = document.querySelector('input[name="pd_FrpId"][value="wechat-pay"]');
            var aliPayRadio = document.querySelector('input[name="pd_FrpId"][value="ali-pay"]');

            if (!wechatPayRadio.checked && !aliPayRadio.checked) {
                alert("请选择支付方式并支付。");
                return false; // 阻止表单提交
            }
            return true; // 允许表单提交
        }
    </script>
</div>
<footer>
    <%@include file="/pages/common/footer.jsp"%>
</footer>
</body>
</html>
