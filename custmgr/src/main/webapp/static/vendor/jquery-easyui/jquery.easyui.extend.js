(function(){
    //combobox可编辑，自定义模糊查询
    $.fn.combobox.defaults.editable = true;
    $.fn.combobox.defaults.filter = function(q, row){
        var opts = $(this).combobox('options');
        return row[opts.textField].indexOf(q) >= 0;
    };
    //combotree可编辑，自定义模糊查询
    $.fn.combotree.defaults.editable = true;
    $.extend($.fn.combotree.defaults.keyHandler,{
        up:function(){
            console.log('up');
        },
        down:function(){
            console.log('down');
        },
        enter:function(){
            console.log('enter');
        },
        query:function(q){
            var t = $(this).combotree('tree');
            var nodes = t.tree('getChildren');
            for(var i=0; i<nodes.length; i++){
                var node = nodes[i];
                if (node.text.indexOf(q) >= 0){
                    $(node.target).show();
                } else {
                    $(node.target).hide();
                }
            }
            var opts = $(this).combotree('options');
            if (!opts.hasSetEvents){
                opts.hasSetEvents = true;
                var onShowPanel = opts.onShowPanel;
                opts.onShowPanel = function(){
                    var nodes = t.tree('getChildren');
                    for(var i=0; i<nodes.length; i++){
                        $(nodes[i].target).show();
                    }
                    onShowPanel.call(this);
                };
                $(this).combo('options').onShowPanel = opts.onShowPanel;
            }
        }
    });

    $.fn.combotree.defaults.loadFilter = function(data, parent) {
        var opt = $(this).data().tree.options;
        var idFiled, textFiled, parentField;
        if (opt.parentField) {
            idFiled = opt.idFiled || 'id';
            textFiled = opt.textFiled || 'text';
            parentField = opt.parentField;

            var i, l, treeData = [], tmpMap = [];

            for (i = 0, l = data.length; i < l; i++) {
                tmpMap[data[i][idFiled]] = data[i];
            }

            for (i = 0, l = data.length; i < l; i++) {
                if (tmpMap[data[i][parentField]] && data[i][idFiled] != data[i][parentField]) {
                    if (!tmpMap[data[i][parentField]]['children'])
                        tmpMap[data[i][parentField]]['children'] = [];
                    data[i]['text'] = data[i][textFiled];
                    tmpMap[data[i][parentField]]['children'].push(data[i]);
                } else {
                    data[i]['text'] = data[i][textFiled];
                    treeData.push(data[i]);
                }
            }
            return treeData;
        }
        return data;
    };


    $.fn.tree.defaults.loadFilter = function (data, parent) {
        var opt = $(this).data().tree.options;
        var idFiled,
            textFiled,
            parentField;
        if (opt.parentField) {
            idFiled = opt.idFiled || 'id';
            textFiled = opt.textFiled || 'text';
            parentField = opt.parentField;

            var i,
                l,
                treeData = [],
                tmpMap = [];

            for (i = 0, l = data.length; i < l; i++) {
                tmpMap[data[i][idFiled]] = data[i];
            }

            for (i = 0, l = data.length; i < l; i++) {
                if (tmpMap[data[i][parentField]] && data[i][idFiled] != data[i][parentField]) {
                    if (!tmpMap[data[i][parentField]]['children'])
                        tmpMap[data[i][parentField]]['children'] = [];
                    data[i]['text'] = data[i][textFiled];
                    tmpMap[data[i][parentField]]['children'].push(data[i]);
                } else {
                    data[i]['text'] = data[i][textFiled];
                    treeData.push(data[i]);
                }
            }
            return treeData;
        }
        return data;
    };
})(jQuery);