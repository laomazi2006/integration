<link rel="stylesheet" href="/styles/common/bootstrap.min.css"/>
<script src="/js/lib/jquery/jquery.min.js"></script>
<script src="/js/common/bootstrap.min.js"></script>
<nav class="navbar navbar-default navbar-fixed-top" role="navigation">
    <div class="container-fluid">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" <#--data-target="#ID_menuList"-->>
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>

            <a class="navbar-brand" href="javascript:void(0)">${title!'包将军 金品质'}</a>
        </div>

        <!-- Collect the nav links, forms, and other content for toggling -->
        <div class="collapse navbar-collapse" id="ID_menuList">
            <ul class="nav navbar-nav navbar-right">
                <li><a href="/goods/index.html">我要选购</a></li>
                <li><a href="/order/myOrders.html">订单</a></li>
                <li><a href="/cart/listGoods.html">购物车</a></li>
                <li><a href="javascript:void(0)">我的评论</a></li>
                <li><a href="javascript:void(0)">地址</a></li>
            </ul>
        </div><!-- /.navbar-collapse -->
    </div><!-- /.container-fluid -->
</nav>
<script>
    $('.navbar').click(function() {
        $(this).find('.navbar-collapse').slideDown();
    });
    $('.navbar').mouseleave(function () {
        $(this).find('.navbar-collapse').slideUp();
    });
</script>