// 日期格式化
Handlebars.registerHelper('formatDate', function (date, format) {
    return moment(date).format(format);
});

// 金额格式化 ###,###.##
Handlebars.registerHelper('formatMoney', function (number, n) {
    return formatMoney(number, n);
});

function formatMoney(s, n)
{
    n = n > 0 && n <= 20 ? n : 2;
    s = parseFloat((s + "").replace(/[^\d\.-]/g, "")).toFixed(n) + "";
    var l = s.split(".")[0].split("").reverse(),
        r = s.split(".")[1];
    t = "";
    for(i = 0; i < l.length; i ++ )
    {
        t += l[i] + ((i + 1) % 3 == 0 && (i + 1) != l.length ? "," : "");
    }
    return t.split("").reverse().join("") + "." + r;
}
// 费率格式化 #.## * 100
Handlebars.registerHelper('formatRate', function (number) {
    return number * 100;
});