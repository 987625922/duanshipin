let tabsFrist = document.getElementById('tabs-frist');
let tabsSecond = document.getElementById('tabs-second');
let tableOne = document.getElementById('table-one');
let tableTwo = document.getElementById('table-two');

tabsFrist.style.borderBottom = '1px solid #fff';
tabsSecond.style.borderBottom = '1px solid #E4E7ED';

tableOne.style.display = 'table';
tableTwo.style.display = 'none';

tabsFrist.onclick = function () {
    tabsFrist.style.borderBottom = '1px solid #fff';
    tabsSecond.style.borderBottom = '1px solid #E4E7ED';
    tableOne.style.display = 'table';
    tableTwo.style.display = 'none';
}
tabsSecond.onclick = function () {
    tabsFrist.style.borderBottom = '1px solid #E4E7ED';
    tabsSecond.style.borderBottom = '1px solid #fff';
    tableOne.style.display = 'none';
    tableTwo.style.display = 'table';
}