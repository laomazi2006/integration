/**
 *管理端首页
 * @author Carl
 * @date 2016/11/28
 * © 2016 - 2020 , all rights reserved .卡尔工作室
 */
(function () {
    'use strict';
    angular.module('FileApp', ['App', 'ngMaterial', 'angularFileUpload', 'ngMessages'])
        .controller('FileManagerCtrl', ['$scope', 'FileUploader', '$toast', '$request', function ($scope, FileUploader, $toast, $request) {


            var uploader = $scope.uploader = new FileUploader({
                url: '/sys/file/upload'
            });

            // FILTERS

            uploader.filters.push({
                name: 'customFilter',
                fn: function (item /*{File|FileLikeObject}*/, options) {
                    return this.queue.length < 20;
                }
            });

            // CALLBACKS

            uploader.onWhenAddingFileFailed = function (item /*{File|FileLikeObject}*/, filter, options) {
                console.info('onWhenAddingFileFailed', item, filter, options);
            };
            uploader.onAfterAddingFile = function (fileItem) {
                if (fileItem.file.size >= 800 * 1024) {
                    $toast.showActionToast("文件过大");
                    fileItem.remove();
                }
                console.info('onAfterAddingFile', fileItem);
            };
            uploader.onAfterAddingAll = function (addedFileItems) {
                console.info('onAfterAddingAll', addedFileItems);
            };
            uploader.onBeforeUploadItem = function (item) {
                console.info('onBeforeUploadItem', item);
            };
            uploader.onProgressItem = function (fileItem, progress) {
                console.info('onProgressItem', fileItem, progress);
            };
            uploader.onProgressAll = function (progress) {
                console.info('onProgressAll', progress);
            };
            uploader.onSuccessItem = function (fileItem, response, status, headers) {
                fileItem['data'] = response.body;
                console.info('onSuccessItem', fileItem, response, status, headers);
            };
            uploader.onErrorItem = function (fileItem, response, status, headers) {
                console.info('onErrorItem', fileItem, response, status, headers);
            };
            uploader.onCancelItem = function (fileItem, response, status, headers) {
                console.info('onCancelItem', fileItem, response, status, headers);
            };
            uploader.onCompleteItem = function (fileItem, response, status, headers) {
                console.info(this.item);
                console.info('onCompleteItem', fileItem, response, status, headers);
            };
            uploader.onCompleteAll = function () {
                console.info('onCompleteAll');
            };

            $scope.delete = function(item, id) {
                if(item.data) {
                    $request.get("/sys/file/deleteById?id=" + item.data.id, function(d) {
                        item.remove();
                    });
                } else {
                    item.remove();
                }
            };
        }]);


    angular.bootstrap(document.getElementById("ID_file"),
        ['FileApp']);
})();