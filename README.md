## RuOST 1.2

Класс LaTeX и XeLaTeX для подготовки стандартов организации в соответствии с ГОСТ Р 1.4-2004.

### Параметры класса

При использовании класса можно использовать следующие опции:

* **10pt**, **12pt**, **14pt** - размер основного шрифта документа.
* **twoside** - двухсторонняя печать.
* **final** - выводит на титульный лист и первый лист стандарта надпись "Издание официальное" вместо "Проект стандарта"/"Проект".
* **figuresection**, **tablesection**, **equationsection** - включает нумерацию изображений, таблиц, уравнений в пределах раздела. По умолчанию нумерация сквозная для всего документа.
* **arabicappendixes** - включает цифровую нумерацию приложений.
* **arabicfootnotes** - включает цифровую нумерацию сносок. По умолчанию используется нумерация звездочками.

### Дополнительные команды класса

* **\OSTPresection** - раздел располагающийся до начала текста стандарта (Предисловие, Введение, Содержание и т.п.).
* **\OSTAppendix** - приложение, должно быть использовано после всех разделов документа.
* **\begin{OST} ... \end{OST}** - окружение для основного текста стандарта. Переключает нумерацию страниц, формирует первую и последнюю страницы стандарта.
* **\point**, **\subpoint** - пункт и подпункт соответственно.
* **\begin{stdquote} ... \end{stdquote}** - окружение для повторения положений других стандартов.
* **\note{Текст}** - одиночное примечание.
* **\begin{notes} ... \end{notes}** - для списка примечаний.

### Пример использования и документация

Файлы ruost.tex и ruost.pdf являются документацией на класс ruost.cls и примером оформления документа с использованием данного класса.

### Загружаемые пакеты

* indentfirst
* titlesec
* caption
* calc
* enumitem
* perpage
* ifxetex