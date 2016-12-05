<style type="text/css">
    .chipsdemoContactChips md-content.autocomplete {
        min-height: 250px; }
    .chipsdemoContactChips md-content.autocomplete input {
        min-width: 400px; }

    .chipsdemoContactChips .md-item-text.compact {
        padding-top: 8px;
        padding-bottom: 8px; }

    .chipsdemoContactChips .contact-item {
        box-sizing: border-box; }
    .chipsdemoContactChips .contact-item.selected {
        opacity: 0.5; }
    .chipsdemoContactChips .contact-item.selected h3 {
        opacity: 0.5; }
    .chipsdemoContactChips .contact-item .md-list-item-text {
        padding: 14px 0;
        max-width: 190px; }
    .chipsdemoContactChips .contact-item .md-list-item-text h3 {
        margin: 0 !important;
        padding: 0;
        line-height: 1.2em !important; }
    .chipsdemoContactChips .contact-item .md-list-item-text h3, .chipsdemoContactChips .contact-item .md-list-item-text p {
        text-overflow: ellipsis;
        white-space: nowrap;
        overflow: hidden; }
    @media (min-width: 960px) {
        .chipsdemoContactChips .contact-item {
            float: left;
            width: 33%; } }

    .chipsdemoContactChips md-contact-chips {
        margin-bottom: 10px; }

    .chipsdemoContactChips .md-chips {
        padding: 5px 0 8px; }

    .chipsdemoContactChips .fixedRows {
        height: 250px;
        overflow: hidden; }
</style>
<div ng-controller="FileChipCtrl as ctrl" layout="column" ng-cloak>
    <md-content class="md-padding autocomplete" layout="column">
        <h2 class="md-title">查询图片</h2>
        <md-contact-chips
                ng-model="ctrl.asyncContacts"
                md-contacts="ctrl.delayedQuerySearch($query)"
                md-contact-name="uploadName"
                md-contact-image="tempVisitPath"
                md-require-match="true"
                md-highlight-flags="i"
                filter-selected="ctrl.filterSelected"
                placeholder="第一张为首页图">
        </md-contact-chips>
    </md-content>
</div>