<#include "freemarker/base/mallBase.ftl">
<section class="contain">
    <header class="header">
        <a href="javascript:history.go(-1);"><i class="fa fa-chevron-left fa-1x return"></i></a>
        <p>${title!'收货人'}</p>
    </header>
    <!-- address-details -->
    <main class="address-details">
        <form id="ID_addressForm">
            <input name="id" type="hidden" value="${data.id!''}"/>
        <div class="address-details-main">
            <ul>
                <li>
                    <label>收货人：</label>
                    <input type="text" name="cName" value="${data.contactsName!''}"/>
                </li>
                <li>
                    <label>联系方式：</label>
                    <input type="text" name="cPhone" value="${data.contactsPhone!''}"/>
                </li>
                <li>
                    <label>学校：</label>
                    <select name="school">
                        <option value="广州大学">广州大学</option>
                    </select>
                </li>
                <li>
                    <label>楼栋：</label>
                    <select name="build">
                        <#list build as item>
                            <option value="${item.id}"
                                ${(item.id == data.build.val)?string('selected=selected', '')}>${item.info}</option>
                        </#list>
                    </select>
                </li>
                <li>
                    <label>楼层：</label>
                    <select name="flow" >
                    <#list flow as item>
                        <option value="${item.id}"
                        ${(item.id == data.flow.val)?string('selected=selected', '')}>${item.info}</option>
                    </#list>
                    </select>
                </li>
                <li>
                    <label>门牌号：</label>
                    <input name="houseNum" type="text" value="${data.houseNumber.val!''}"/>
                </li>
                <li>
                    <textarea name="detail" placeholder="详细地址：可不填">${data.detailAddress.val!''}</textarea>
                </li>
            </ul>
        </div>

        <div class="address-details-foot">
            <div class="address-details-footLeft">
                <div class="address-details-choose">
                    <div class="address-details-choosebox ${data.default?string('carts-chooseboxBg', '')}"></div>
                    <input type="checkbox" name="isDefault" ${data.default?string('checked', '')}"/>
                    <label>默认收货地址</label>
                </div>
            </div>
            <div class="address-details-footRight">
                <button type="button" value="" class="save">保存</button>
            </div>
        </div>
        </form>
    </main>
    <!-- address-details -->
    <#if data??>
        <script src="/js/~/user/addressEdit.js"></script>
    <#else>
        <script src="/js/~/user/addressAdd.js"></script>
    </#if>

</section>

<#include "freemarker/base/mallEnd.ftl">