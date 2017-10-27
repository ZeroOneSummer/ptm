// 基于jquery的特效及兼容处理
// 使用前先引用jquery.min.js
// Author：Mr. Aquarius

// 兼容placeholder
function replacePlaceholder(){
    if( !('placeholder' in document.createElement('input')) || !('placeholder' in document.createElement('textarea')) ){
        $('input[placeholder],textarea[placeholder]').each(function(){
            var _that = $(this);
            var _text = _that.attr('placeholder');
            var _type = _that.attr('type');
            var _class = _that.attr('class');
            var _style = _that.attr('style') ? _that.attr('style') : '';
            var _ID = _that.attr('id');
            var _name = _that.attr('name');
            var _maxlength = _that.attr('maxlength') ? _that.attr('maxlength') : '';
            if( _that.val() === '' ){
                _that.after('<input maxlength="'+_maxlength+'" style="'+_style+'" class="_placeholder '+_class+'" id="'+_ID+'" name="'+_name+'" value="'+_text+'" placeholder="'+_text+'"/>');
                _that.remove();
            }
            $('input[placeholder],textarea[placeholder]').each(function(){
                var _that = $(this);
                _that.focus(function(){
                    if(_that.val()=== _text){
                        _that.val("").removeClass('_placeholder');
                    }
                });
                _that.blur(function(){
                    if(_that.val()=== ""){
                        _that.val(_text).addClass('_placeholder');
                    }
                });
                _that.change(function(){
                    _that.after('<input type="'+_type+'" maxlength="'+_maxlength+'" style="'+_style+'" class="'+_class+'" id="'+_ID+'" name="'+_name+'" value="'+_that.val()+'" placeholder="'+_text+'"/>');
                    _that.remove();
                });
            });
        });
    }
}