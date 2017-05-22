/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
    var pagingData = {
    };

function loadPaging(tracker, _url, handleEachItem, onLoading, onFinish){
    
    window.onscroll = function () {
        if (tracker.isInViewport()){
            if (pagingData.hasNext === false)
                return;
            if (pagingData.isLoading === false){
                onLoading();
                loadNextPage(_url, handleEachItem, onFinish );
                
            }else {
                
            }
        }
    };
}

function loadNextPage(_url, handleEachItem, onFinish ){
    pagingData.isLoading = true;
    var rs = $.ajax({
        url : _url,
        data: {
            page: (pagingData.currentPage+1),
            size: pagingData.pageSize
        },
        method: 'get',
        success: function(data){
            onFinish();
            pagingData.isLoading = false;
            var json = $.parseJSON(rs.responseText);
            pagingData.currentPage = json.number;
            pagingData.hasNext = !json.last ;
            pagingData.numberOfElement = json.numberOfElements;
            pagingData.totalPage = json.totalPages;
            pagingData.totalElements = json.totalElements;
            pagingData.pageSize = json.size;
            
            json.content.forEach(function (item, index){
                handleEachItem(item);
            });
        },
        error: function (data) {
            isLoading = false;
        }
    });
}
    

$.fn.isInViewport = function() {
    var elementTop = $(this).offset().top;
    var elementBottom = elementTop + $(this).outerHeight();

    var viewportTop = $(window).scrollTop();
    var viewportBottom = viewportTop + $(window).height();

    return elementBottom > viewportTop && elementTop < viewportBottom;
};    